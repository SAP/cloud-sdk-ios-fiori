import Foundation

@available(watchOS, unavailable)
struct ColorCompatibilityMapV5: ColorStyleCompatibilityProvider {
    let uuid = UUID()
    
    static let `default` = ColorCompatibilityMap(ColorCompatibilityMapV5())
    
    let version: PaletteVersion = .v5
    
    private init() {}
    
    var compatibleColorDefinitions: [ColorStyle: ColorStyle] = [
        .separatorOpaque: .separatorOpaque,
        .contrastElement: .contrastElement,
        .tintColor2: .tintColor2,
        .cardShadow: .cardShadow,
        .mango3: .mango3,
        .mango4: .mango4,
        .red4: .red4,
        .red5: .red5,
        .pink5: .pink5,
        .pink6: .pink6,
        .indigo6: .indigo6,
        .blue6: .blue6,
        .blue7: .blue7,
        .teal4: .teal4,
        .teal5: .teal5,
        .green4: .green4,
        .indigo5: .indigo5,
        .grey5: .grey5,
        .grey4: .grey4
    ]
    
    func compatibleStyle(from style: ColorStyle) -> ColorStyle? {
        self.compatibleColorDefinitions[style]
    }
}
