import Foundation

struct ColorCompatibilityMapV5: ColorStyleCompatibilityProvider {
    let uuid = UUID()
    
    static let `default` = ColorCompatibilityMap(ColorCompatibilityMapV5())
    
    let version: PaletteVersion = .v5

    private init() {}
    
    var compatibleColorDefinitions: [ColorStyle: ColorStyle] = [
        .separatorOpaque: .line,
        .contrastElement: .primary10,
        .tintColor2: .tintColorDark,
        .cardShadow: .shadow,
        .mango3: .accent1,
        .mango4: .accent1b,
        .red4: .accent2,
        .red5: .accent2b,
        .pink5: .accent3,
        .pink6: .accent4,
        .indigo6: .accent5,
        .blue6: .accent6,
        .blue7: .accent6b,
        .teal4: .accent7,
        .teal5: .accent7b,
        .green4: .accent8,
        .indigo5: .accent9,
        .grey5: .accent10,
        .grey4: .accent10b
    ]
    
    func compatibleStyle(from style: ColorStyle) -> ColorStyle? {
        self.compatibleColorDefinitions[style]
    }
}
