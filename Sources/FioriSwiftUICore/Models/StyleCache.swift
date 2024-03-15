import SwiftUI

// public struct StyleSheet: Decodable {
//    let palette: [String: Color]
//
//    var styles: [String: AnyViewModifier]
//
//    private enum CodingKeys: CodingKey {
//        case palette, styles
//    }
//    public init(from decoder: Decoder) throws {
//        let container = try decoder.container(keyedBy: CodingKeys.self)
//        let keyPairMap = try container.decode([String: String].self, forKey: .palette)
//        self.palette = try keyPairMap.mapValues({ try Color(hexCode: $0) })
//
//        styles = []
//    }
//
//    @available(*, deprecated: "Temporary utility for testing")
//    public func addStyles([String: AnyViewModifier]) {
//
//    }
// }

public final class StyleCache: ObservableObject {
    static let shared = StyleCache()
    var styles: [String: AnyViewModifier] = [:]
    public static func upsertStyles(_ styles: [String: AnyViewModifier]) throws {
        self.shared.styles.merge(styles) { _, rhs -> AnyViewModifier in
            rhs
        }
    }

    public static func resetStyles() {
        self.shared.styles = [:]
    }

    private init() {}
    
    func resolveModifier(for path: [String]) -> Result<AnyViewModifier, Error> {
        var isDirty = false
        let modifier: AnyViewModifier = path.reduce(AnyViewModifier { $0 }) { prevMod, nextClass in
            guard let mod = styles[nextClass] else { return prevMod }
            isDirty = true
            return AnyViewModifier { $0.modifier(prevMod.concat(mod)) }
        }
        guard isDirty else { return .failure(.none) }
        return .success(modifier)
    }
    
    enum Error: Swift.Error {
        case none
    }
}
