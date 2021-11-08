import Foundation

/// A struct for providing color palette.
struct ColorCompatibilityMap: ColorStyleCompatibilityProvider {
    var obsoletedColorDefinitions: [ColorStyle: ColorStyle] {
        self._compatibilityMap.obsoletedColorDefinitions
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
