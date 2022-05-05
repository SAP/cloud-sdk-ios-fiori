import Foundation

struct ColorCompatibilityMapV6: ColorStyleCompatibilityProvider {
    let uuid = UUID()
    
    static let `default` = ColorCompatibilityMap(ColorCompatibilityMapV6())
    
    let version: PaletteVersion = .v6
    
    private init() {}
    
    var compatibleColorDefinitions: [ColorStyle: ColorStyle] = [
        :
    ]
    
    func compatibleStyle(from style: ColorStyle) -> ColorStyle? {
        self.compatibleColorDefinitions[style]
    }
}
