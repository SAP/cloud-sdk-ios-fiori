import Foundation

@available(*, deprecated, message: "Intentionally used for backward compatibility.")
@available(watchOS, unavailable)
struct PaletteV3: PaletteProvider {
    /// :nodoc:
    public let uuid = UUID()
    
    /// :nodoc:
    public static let `default` = Palette(PaletteV3())
    
    let version: PaletteVersion = .v3_2
    
    private init() {}
    
    public var colorDefinitions: [ColorStyle: HexColor] = [
        .primary1: HexColor(lightColor: "FFFFFF", darkColor: "32363A"),
        .primary2: HexColor(lightColor: "D9D9D9", darkColor: "515559"),
        .primary3: HexColor(lightColor: "6A6D70"),
        .primary4: HexColor(lightColor: "CCCCCC"),
        .primary5: HexColor(lightColor: "FAFAFA"),
        .primary6: HexColor(lightColor: "FFFFFF"),
        .primary7: HexColor(lightColor: "74777A"),
        .primary9: HexColor(lightColor: "EEEEEF"),
        .primary10: HexColor(lightColor: "89919A"),
        .tintColorLight: HexColor(lightColor: "0A6ED1"),
        .tintColorDark: HexColor(lightColor: "D1E8FF"),
        .tintColor: HexColor(lightColor: "D1E8FF", darkColor: "0A6ED1"),
        .tintColorTapStateLight: HexColor(lightColor: "0854A1"),
        .tintColorTapStateDark: HexColor(lightColor: "74A5D5"),
        .tintColorTapState: HexColor(lightColor: "74A5D5", darkColor: "0854A1"),
        .navigationBar: HexColor(lightColor: "354A5F"),
        .backgroundGradientTop: HexColor(lightColor: "354A5F"),
        .backgroundGradientBottom: HexColor(lightColor: "3F566B"),
        .backgroundBase: HexColor(lightColor: "F3F3F3"),
        .line: HexColor(lightColor: "F3F3F3"),
        .cellBackgroundTapState: HexColor(lightColor: "EEEEEF"),
        .chart1: HexColor(lightColor: "74B3F0", darkColor: "5899DA"),
        .chart2: HexColor(lightColor: "E8743B"),
        .chart3: HexColor(lightColor: "19A979"),
        .chart4: HexColor(lightColor: "ED4A7B"),
        .chart5: HexColor(lightColor: "945ECF"),
        .chart6: HexColor(lightColor: "13A4B4"),
        .chart7: HexColor(lightColor: "5C66F5", darkColor: "525DF4"),
        .chart8: HexColor(lightColor: "C63FA4", darkColor: "BF399E"),
        .chart9: HexColor(lightColor: "6C8893"),
        .chart10: HexColor(lightColor: "EE6868"),
        .chart11: HexColor(lightColor: "387BB7", darkColor: "2F6497"),
        .negative: HexColor(lightColor: "FF9B9B", darkColor: "BB0000"),
        .critical: HexColor(lightColor: "FFDB79", darkColor: "E9730C"),
        .positive: HexColor(lightColor: "8EF79F", darkColor: "107E3E"),
        .map1: HexColor(lightColor: "2E4A62"),
        .map2: HexColor(lightColor: "56840E"),
        .map3: HexColor(lightColor: "A63788"),
        .map4: HexColor(lightColor: "0079C6"),
        .map5: HexColor(lightColor: "6B4EA0"),
        .map6: HexColor(lightColor: "A16B00"),
        .map7: HexColor(lightColor: "0B6295"),
        .map8: HexColor(lightColor: "D0R774"),
        .map9: HexColor(lightColor: "1C857A"),
        .map10: HexColor(lightColor: "C45300"),
        .esriEdit: HexColor(lightColor: "FFF114", darkColor: "1B6DD2"),
        .negativeBackground: HexColor(lightColor: "FFEBEB"),
        .criticalBackground: HexColor(lightColor: "FEF7F1"),
        .positiveBackground: HexColor(lightColor: "F1FDF6"),
        .informationBackground: HexColor(lightColor: "F5FAFF"),
        .accent1: HexColor(lightColor: "E38B16"),
        .accent1b: HexColor(lightColor: "D17F15"),
        .accent2: HexColor(lightColor: "DC7474"),
        .accent2b: HexColor(lightColor: "D04343"),
        .accent3: HexColor(lightColor: "DB1F77"),
        .accent4: HexColor(lightColor: "C0399F"),
        .accent5: HexColor(lightColor: "6367DE"),
        .accent6: HexColor(lightColor: "5899DA"),
        .accent6b: HexColor(lightColor: "2B78C5"),
        .accent7: HexColor(lightColor: "13A4B4"),
        .accent7b: HexColor(lightColor: "0F828F"),
        .accent8: HexColor(lightColor: "7CA10C"),
        .accent9: HexColor(lightColor: "925ACE"),
        .accent10: HexColor(lightColor: "8497A4"),
        .accent10b: HexColor(lightColor: "647887")
    ]
    
    func hexColor(for colorStyle: ColorStyle) -> HexColor? {
        self.colorDefinitions[colorStyle]
    }
}
