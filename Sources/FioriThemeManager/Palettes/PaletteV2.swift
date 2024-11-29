import Foundation

@available(*, deprecated, message: "Intentionally used for backward compatibility.")
@available(watchOS, unavailable)
struct PaletteV2: PaletteProvider {
    /// :nodoc:
    public let uuid = UUID()
    
    /// :nodoc:
    public static let `default` = Palette(PaletteV2())
    
    let version: PaletteVersion = .v3_x
    
    private init() {}
    
    public var colorDefinitions: [ColorStyle: HexColor] = [
        .primary1: HexColor(lightColor: "FFFFFF", darkColor: "3F3A3A"),
        .primary2: HexColor(lightColor: "D3D3D3", darkColor: "4E4E52"),
        .primary3: HexColor(lightColor: "76767B"),
        .primary4: HexColor(lightColor: "CCCCCC"),
        .primary5: HexColor(lightColor: "F2F2F2"),
        .primary6: HexColor(lightColor: "FFFFFF"),
        .primary7: HexColor(lightColor: "5E6972"),
        .primary8: HexColor(lightColor: "192835"),
        .primary9: HexColor(lightColor: "F9F9F9"),
        .tintColor: HexColor(lightColor: "CAE4FB", darkColor: "3678AF"),
        .tintColorLight: HexColor(lightColor: "CAE4FB"),
        .tintColorDark: HexColor(lightColor: "3678AF"),
        .tintColorTapState: HexColor(lightColor: "6191BA", darkColor: "295171"),
        .tintColorTapStateLight: HexColor(lightColor: "6191BA"),
        .tintColorTapStateDark: HexColor(lightColor: "295171"),
        .navigationBar: HexColor(lightColor: "445E75"),
        .backgroundGradientTop: HexColor(lightColor: "445E75"),
        .backgroundGradientBottom: HexColor(lightColor: "3F566B"),
        .backgroundBase: HexColor(lightColor: "E8E8ED"),
        .cellBackgroundTapState: HexColor(lightColor: "F2F2F7"),
        .line: HexColor(lightColor: "E8E8ED"),
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
        .negative: HexColor(lightColor: "FF9B9B", darkColor: "D9364C"),
        .critical: HexColor(lightColor: "FFDB79", darkColor: "FFA325"),
        .positive: HexColor(lightColor: "8EF79F", darkColor: "3A835B"),
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
        .esriEdit: HexColor(lightColor: "FFF114", darkColor: "1B6DD2")
    ]
    
    func hexColor(for colorStyle: ColorStyle) -> HexColor? {
        self.colorDefinitions[colorStyle]
    }
}
