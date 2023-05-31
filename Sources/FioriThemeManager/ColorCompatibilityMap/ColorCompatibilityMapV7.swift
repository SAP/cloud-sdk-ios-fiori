import Foundation

@available(watchOS, unavailable)
struct ColorCompatibilityMapV7: ColorStyleCompatibilityProvider {
    let uuid = UUID()
    
    static let `default` = ColorCompatibilityMap(ColorCompatibilityMapV7())
    
    let version: PaletteVersion = .v7
    
    private init() {}
    
    var compatibleColorDefinitions: [ColorStyle: ColorStyle] = [:]
    
    func compatibleStyle(from style: ColorStyle) -> ColorStyle? {
        self.compatibleColorDefinitions[style]
    }
}
