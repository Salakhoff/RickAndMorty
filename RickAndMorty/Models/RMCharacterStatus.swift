import Foundation

enum RMCharacterStatus: String, Decodable {
    case alive = "Alive"
    case dead = "dead"
    case `unknown` = "unknown"
}
