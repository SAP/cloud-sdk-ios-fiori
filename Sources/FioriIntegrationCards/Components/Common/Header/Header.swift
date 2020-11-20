import Combine
import Foundation

public enum Header: Decodable, Hashable {
    case `default`(DefaultHeader)
    case numeric(NumericHeader)
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: HavingType.CodingKeys.self)
        let type = try? container.decodeIfPresent(String.self, forKey: .type)
        
        switch type {
        case .some(let value) where value == "Default":
            let value = try DefaultHeader(from: decoder)
            self = .default(value)
        case .some(let value) where value == "Numeric":
            let value = try NumericHeader(from: decoder)
            self = .numeric(value)
        default:
            let value = try DefaultHeader(from: decoder)
            self = .default(value)
        }
    }
}

extension Header: Placeholding {
    public func replacingPlaceholders(withValuesIn objects: Any...) -> Header {
        switch self {
        case .default(let header):
            return .default(header.replacingPlaceholders(withValuesIn: objects))
        case .numeric(let header):
            return .numeric(header.replacingPlaceholders(withValuesIn: objects))
        }
    }
}
