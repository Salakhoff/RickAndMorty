import Foundation

struct RMEpisode: Decodable {
    let id: Int
    let name: String
    let air_Date: String
    let episode: String
    let characters: [String]
    let url: String
    let created: String
}
