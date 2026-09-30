import Foundation

/// A struct for providing compatible styles in current palette for `future` styles in the next palette.
struct ColorCompatibilityMap: ColorStyleCompatibilityProvider, Sendable {
    var compatibleColorDefinitions: [ColorStyle: ColorStyle] {
        self._compatibilityMap.compatibleColorDefinitions
    }
    
    func compatibleStyle(from style: ColorStyle) -> ColorStyle? {
        self._compatibilityMap.compatibleStyle(from: style)
    }
    
    var uuid: UUID {
        self._compatibilityMap.uuid
    }
    
    init(_ compatibilityMap: ColorStyleCompatibilityProvider & Sendable) {
        self._compatibilityMap = compatibilityMap
    }
    
    private let _compatibilityMap: any ColorStyleCompatibilityProvider & Sendable
}

extension ColorCompatibilityMap: Equatable {
    static func == (lhs: ColorCompatibilityMap, rhs: ColorCompatibilityMap) -> Bool {
        lhs.uuid == rhs.uuid
    }
}
