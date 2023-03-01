import Foundation

@available(watchOS, introduced: 7.0)
@available(iOS, unavailable)
struct WatchPaletteV1: PaletteProvider {
    /// :nodoc:
    public let uuid = UUID()
    
    /// :nodoc:
    public static let `default` = Palette(WatchPaletteV1())
    
    let version: PaletteVersion = .v1
    
    private init() {}
    
    // TODO:
    // Finish palette definitions
    public var colorDefinitions: [ColorStyle: HexColor] = [
        .primaryLabel: HexColor(lightColor: "F5F6F7FF"),
        .secondaryLabel: HexColor(lightColor: "D5DADDFF"),
        .tertiaryLabel: HexColor(lightColor: "A9B4BEFF"),
        .quaternaryLabel: HexColor(lightColor: "8396A8FF"),
        .primaryBackground: HexColor(lightColor: "000000FF"),
        .secondaryBackground: HexColor(lightColor: "F2F4FC24"),
        .tertiaryBackground: HexColor(lightColor: "F2F4FC33"),
        .tintColor: HexColor(lightColor: "89D1FFFF"),
        .tintColorTapState: HexColor(lightColor: "4DB1FFFF"),
        .negativeLabel: HexColor(lightColor: "FF5C77FF"),
        .negativeLabelTapState: HexColor(lightColor: "EE3939FF"),
        .criticalLabel: HexColor(lightColor: "FFC933FF"),
        .criticalLabelTapState: HexColor(lightColor: "FFB300FF"),
        .positiveLabel: HexColor(lightColor: "BDE986FF"),
        .positiveLabelTapState: HexColor(lightColor: "5DC122FF"),
        .separator: HexColor(lightColor: "5B738B80"),
        .separatorOpaque: HexColor(lightColor: "8396A8FF"),
        .accent1: HexColor(lightColor: "FFC933FF"),
        .accent2: HexColor(lightColor: "FF5C77FF"),
        .accent3: HexColor(lightColor: "B894FFFF"),
        .accent4: HexColor(lightColor: "4DB1FFFF"),
        .accent5: HexColor(lightColor: "64EDD2FF"),
        .accent6: HexColor(lightColor: "BDE986FF"),
        .accent7: HexColor(lightColor: "FF8AF0FF"),
        .accent8: HexColor(lightColor: "FEADC8FF"),
        .accent9: HexColor(lightColor: "A9B4BEFF")
    ]
    
    func hexColor(for colorStyle: ColorStyle) -> HexColor? {
        self.colorDefinitions[colorStyle]
    }
}
