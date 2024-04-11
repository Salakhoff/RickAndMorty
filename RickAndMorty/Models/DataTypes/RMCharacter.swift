import Foundation

struct RMCharacter: Decodable {
    let id: Int
    let name: String
    let status: RMCharacterStatus
    let species: String
    let type: String
    let gender: RMCharacterGender
    let origin: RMOrigin
    let location: RMSingeLocation
    let image: String
    let episode: [String]
    let url: String
    let created: String
}
