import Foundation

/// Параметры запроса
final class RMRequest {
    /// Constants - то, что не меняется
    private struct Constants {
        static let baseUrl = "https://rickandmortyapi.com/api"
    }
    
    // MARK: Private properties
    
    private let endpoint: RMEndpoint
    
    /// Доп.компоненты
    private let pathComponents: Set<String>
    
    /// Параметры для фильрации
    private let queryParameters: [URLQueryItem]
    
    /// Computer Property для создания корректного URL
    private var urlString: String {
        var string = Constants.baseUrl
        string += "/"
        string += endpoint.rawValue
        
        if !pathComponents.isEmpty {
            string += "/"
            let argumentString = pathComponents.compactMap {
                "\($0)"
            }.joined(separator: ",")
            
            string += argumentString
        }
        
        if !queryParameters.isEmpty {
            string += "?"
            let argumentString = queryParameters.compactMap {
                guard let value = $0.value else { return nil }
                return "\($0.name)=\(value)"
            }.joined(separator: "&")
            
            string += argumentString
        }
        
        return string
    }
    
    // MARK: Public Properties
    
    /// Создание url
    public var url: URL? {
        return URL(string: urlString)
    }
    
    /// HTTP метод
    public let httpMethod = "GET"
    
    // MARK: Init
    
    public init(
        endpoint: RMEndpoint,
        pathComponents: Set<String> = [],
        queryParameters: [URLQueryItem] = []
    ) {
        self.endpoint = endpoint
        self.pathComponents = pathComponents
        self.queryParameters = queryParameters
    }
}

extension RMRequest {
    /// Для быстрого доступа к списку персонажей
    static let listCharacterRequest = RMRequest(endpoint: .character)
}
