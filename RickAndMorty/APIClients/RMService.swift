import Foundation

/// Сетевой сервис
final class RMService {
    
    static let shared = RMService()
    
    init() {}
    
    private let decoder = JSONDecoder()
    
    /// Конфигурация нашей сессии
    private var session: URLSession {
        let configuration = URLSessionConfiguration.default
        configuration.allowsCellularAccess = true
        configuration.waitsForConnectivity = true
        configuration.timeoutIntervalForRequest = 60
        configuration.timeoutIntervalForResource = 250
        return URLSession(configuration: configuration)
    }
    
    /// Вызов по API
    /// - Parameters:
    ///   - request: Указываются параметры запроса
    ///   - expecting: Тут мы указываем с каким типом мы хотим работать
    ///   - completion: Замыкание, который вернет data или error
    public func execute<T: Decodable>(
        _ request: RMRequest,
        expecting type: T.Type,
        completion: @escaping (Result<T, RMError>) -> Void
    ) {
        guard let urlRequest = self.request(from: request) else {
            completion(.failure(.badRequest))
            return
        }
        
        session.dataTask(with: urlRequest) { data, response, error in
            guard let data = data, error == nil else {
                completion(.failure(.badData))
                return
            }
            
            guard let response = response as? HTTPURLResponse else {
                completion(.failure(.badResponse))
                return
            }
            
            switch response.statusCode {
            case 200...299:
                do {
                    let decodedData = try self.decoder.decode(type.self, from: data)
                    completion(.success(decodedData))
                } catch let error {
                    print(error.localizedDescription)
                    completion(.failure(.badDecode))
                }
            default:
                completion(.failure(.unknown("Какая-то фигня. Не получилось распарсит.")))
            }
        }.resume()
    }
    
    // MARK: Private methods
    
    /// Установка настроек Request
    private func request(from request: RMRequest) -> URLRequest? {
        guard let urlRequest = request.url else { return nil}
        var request = URLRequest(url: urlRequest)
        request.httpMethod = request.httpMethod
        return request
    }
}
