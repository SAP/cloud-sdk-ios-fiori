import Foundation

public struct HavingHeader: Decodable {
    enum CodingKeys: CodingKey {
        case header
    }

    let header: Header
}
