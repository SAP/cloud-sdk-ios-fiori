import Foundation

/// A struct for providing compatible styles in current palette for `future` styles in the next palette.
struct ColorCompatibilityMap: ColorStyleCompatibilityProvider {
    var compatibleColorDefinitions: [ColorStyle: ColorStyle] {
        self._compatibilityMap.compatibleColorDefinitions
    }
    
    func compatibleStyle(from style: ColorStyle) -> ColorStyle? {
        self._compatibilityMap.compatibleStyle(from: style)
    }
    
    var uuid: UUID {
        self._compatibilityMap.uuid
    }
    
    init(_ compatibilityMap: ColorStyleCompatibilityProvider) {
        self._compatibilityMap = compatibilityMap
    }
    
    private let _compatibilityMap: ColorStyleCompatibilityProvider
}

extension ColorCompatibilityMap: Equatable {
    static func == (lhs: ColorCompatibilityMap, rhs: ColorCompatibilityMap) -> Bool {
        lhs.uuid == rhs.uuid
    }
}
