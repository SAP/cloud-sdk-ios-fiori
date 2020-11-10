import Foundation

struct HavingType: Decodable {
    let type: String?
    
    enum CodingKeys: CodingKey {
        case type
    }
}
