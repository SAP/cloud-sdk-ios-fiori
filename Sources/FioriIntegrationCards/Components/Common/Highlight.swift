import Foundation
import SwiftUI

public enum Highlight: Decodable, AnyBodyProducing, CaseIterable {
    case error
    case warn
    case success
    case info
    case none
    case placeholder(String)
    
    public static let allCases: [Highlight] = [.error, .warn, .success, .info, .none]
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let value = try container.decode(String.self)
        guard let c = Highlight(rawValue: value) else {
            self = .placeholder(value)
            return
        }
        self = c
    }
    
    init?(rawValue: String) {
        for c in Highlight.allCases {
            guard c.description != rawValue else { self = c; return }
        }
        return nil
    }

    var description: String {
        switch self {
        case .error: return "Error"
        case .warn: return "Warning"
        case .success: return "Success"
        case .info: return "Information"
        case .none: return "None"
        case .placeholder(let value): return value
        }
    }
    
    var color: Color {
        switch self {
        case .error: return .red
        case .warn: return .orange
        case .success: return .green
        case .info: return .blue
        default: return .clear
        }
    }
    
    func body() -> AnyView {
        AnyView(Rectangle()
            .fill(self.color)
            .fixedSize(horizontal: true, vertical: false)
            .frame(width: 12, height: 54, alignment: .leading))
    }
}

extension Highlight: Placeholding {
    public func replacingPlaceholders(withValuesIn object: Any) -> Highlight {
        switch self {
        case .placeholder(let placeholder):
            let value = placeholder.replacingPlaceholders(withValuesIn: object)
            return Highlight(rawValue: value) ?? .none
        default:
            return self
        }
    }
}

extension Highlight: Hashable {}
