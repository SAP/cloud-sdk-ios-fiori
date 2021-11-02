import Foundation

/// A struct for providing color palette.
struct ColorCompatibilityMap: ColorStyleCompatibilityProvider {
    func newColorStyle(for obsoletedStyle: ColorStyle) -> ColorStyle? {
        self._compatibilityMap.newColorStyle(for: obsoletedStyle)
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
