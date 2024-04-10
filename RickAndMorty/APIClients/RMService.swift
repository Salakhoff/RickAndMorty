import Foundation

/// Сетевой сервис
final class RMService {
    
    static let shared = RMService()
    
    init() { }
    
    /// Вызов по API
    /// - Parameters:
    ///   - request: Указываются параметры запроса
    ///   - completion: Замыкание, который вернет data или error
    public func execute(_ request: URLRequest, completion: @escaping () -> Void) {
        
    }
}
