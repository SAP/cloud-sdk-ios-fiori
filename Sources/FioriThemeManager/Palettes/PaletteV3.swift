import Foundation

@available(watchOS, unavailable)
struct PaletteV3: PaletteProvider {
    /// :nodoc:
    public let uuid = UUID()
    
    /// :nodoc:
    public static let `default` = Palette(PaletteV3())
    
    let version: PaletteVersion = .v3_2
    
    private init() {}
    
    public var colorDefinitions: [ColorStyle: HexColor] = [
        .primaryLabel: HexColor(lightColor: "FFFFFF", darkColor: "32363A"),
        .secondaryLabel: HexColor(lightColor: "D9D9D9", darkColor: "515559"),
        .tertiaryLabel: HexColor(lightColor: "6A6D70"),
        .secondaryFill: HexColor(lightColor: "CCCCCC"),
        .footer: HexColor(lightColor: "FAFAFA"),
        .secondaryGroupedBackground: HexColor(lightColor: "FFFFFF"),
        .quaternaryLabel: HexColor(lightColor: "74777A"),
        .separator: HexColor(lightColor: "EEEEEF"),
        .contrastElement: HexColor(lightColor: "89919A"),
        .tintColor2: HexColor(lightColor: "D1E8FF"),
        .tintColor: HexColor(lightColor: "D1E8FF", darkColor: "0A6ED1"),
        .tintColorTapStateLight: HexColor(lightColor: "0854A1"),
        .tintColorTapStateDark: HexColor(lightColor: "74A5D5"),
        .tintColorTapState: HexColor(lightColor: "74A5D5", darkColor: "0854A1"),
        .header: HexColor(lightColor: "354A5F"),
        .primaryBackground: HexColor(lightColor: "F3F3F3"),
        .separatorOpaque: HexColor(lightColor: "F3F3F3"),
        .quaternaryFill: HexColor(lightColor: "EEEEEF"),
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
        .negativeLabel: HexColor(lightColor: "FF9B9B", darkColor: "BB0000"),
        .criticalLabel: HexColor(lightColor: "FFDB79", darkColor: "E9730C"),
        .positiveLabel: HexColor(lightColor: "8EF79F", darkColor: "107E3E"),
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
        .mango3: HexColor(lightColor: "E38B16"),
        .mango4: HexColor(lightColor: "D17F15"),
        .red4: HexColor(lightColor: "DC7474"),
        .red5: HexColor(lightColor: "D04343"),
        .pink5: HexColor(lightColor: "DB1F77"),
        .pink6: HexColor(lightColor: "C0399F"),
        .indigo6: HexColor(lightColor: "6367DE"),
        .blue6: HexColor(lightColor: "5899DA"),
        .blue7: HexColor(lightColor: "2B78C5"),
        .teal4: HexColor(lightColor: "13A4B4"),
        .teal5: HexColor(lightColor: "0F828F"),
        .green4: HexColor(lightColor: "7CA10C"),
        .indigo5: HexColor(lightColor: "925ACE"),
        .grey5: HexColor(lightColor: "8497A4"),
        .grey4: HexColor(lightColor: "647887")
    ]
    
    func hexColor(for colorStyle: ColorStyle) -> HexColor? {
        self.colorDefinitions[colorStyle]
    }
}
