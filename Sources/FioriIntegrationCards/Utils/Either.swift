import Foundation

// From FlightSchool Guide to Swift Codable @mattt

enum Either<T, U> {
    case zero(T)
    case one(U)
}

extension Either: Decodable where T: Decodable, U: Decodable {
    init(from decoder: Decoder) throws {
        if let value = try? T(from: decoder) {
            self = .zero(value)
        } else if let value = try? U(from: decoder) {
            self = .one(value)
        } else {
            let context = DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Cannot decode \(T.self) or \(U.self)")
            throw DecodingError.dataCorrupted(context)
        }
    }
}
