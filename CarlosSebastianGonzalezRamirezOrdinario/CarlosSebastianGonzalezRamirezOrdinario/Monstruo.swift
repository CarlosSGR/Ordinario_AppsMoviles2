import Foundation

struct RespuestaMonstruos: Decodable {
    let data: [Monstruo]
}

struct Monstruo: Decodable, Identifiable {
    let id: Int
    let name: String
    let description: String
    let image: String
    let commonLocations: [String]?
    let drops: [String]?

    enum CodingKeys: String, CodingKey {
        case id
        case name
        case description
        case image
        case commonLocations = "common_locations"
        case drops
    }
}
