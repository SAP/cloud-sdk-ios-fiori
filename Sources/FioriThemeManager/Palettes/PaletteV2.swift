import Foundation

struct PaletteV2: PaletteProvider {
    /// :nodoc:
    public let uuid = UUID()

    /// :nodoc:
    public static let `default` = Palette(PaletteV2())

    let version: PaletteVersion = .v3_x

    private init() {}

    func hexColor(for colorStyle: ColorStyle) -> HexColor {
        switch colorStyle {
        case .primary1:
            return HexColor(lightColor: "FFFFFF", darkColor: "3F3A3A")
        case .primary2:
            return HexColor(lightColor: "D3D3D3", darkColor: "4E4E52")
        case .primary3:
            return HexColor(lightColor: "76767B")
        case .primary4:
            return HexColor(lightColor: "CCCCCC")
        case .primary5:
            return HexColor(lightColor: "F2F2F2")
        case .primary6:
            return HexColor(lightColor: "FFFFFF")
        case .primary7:
            return HexColor(lightColor: "5E6972")
        case .primary8:
            return HexColor(lightColor: "192835")
        case .primary9:
            return HexColor(lightColor: "F9F9F9")
        case .tintColor:
            return HexColor(lightColor: "CAE4FB", darkColor: "3678AF")
        case .tintColorLight:
            return HexColor(lightColor: "CAE4FB")
        case .tintColorDark:
            return HexColor(lightColor: "3678AF")
        case .tintColorTapState:
            return HexColor(lightColor: "6191BA", darkColor: "295171")
        case .tintColorTapStateLight:
            return HexColor(lightColor: "6191BA")
        case .tintColorTapStateDark:
            return HexColor(lightColor: "295171")
        case .navigationBar:
            return HexColor(lightColor: "445E75")
        case .backgroundGradientTop:
            return HexColor(lightColor: "445E75")
        case .backgroundGradientBottom:
            return HexColor(lightColor: "3F566B")
        case .backgroundBase:
            return HexColor(lightColor: "E8E8ED")
        case .cellBackgroundTapState:
            return HexColor(lightColor: "F2F2F7")
        case .line:
            return HexColor(lightColor: "E8E8ED")
        case .chart1:
            return HexColor(lightColor: "74B3F0", darkColor: "5899DA")
        case .chart2:
            return HexColor(lightColor: "E8743B")
        case .chart3:
            return HexColor(lightColor: "19A979")
        case .chart4:
            return HexColor(lightColor: "ED4A7B")
        case .chart5:
            return HexColor(lightColor: "945ECF")
        case .chart6:
            return HexColor(lightColor: "13A4B4")
        case .chart7:
            return HexColor(lightColor: "5C66F5", darkColor: "525DF4")
        case .chart8:
            return HexColor(lightColor: "C63FA4", darkColor: "BF399E")
        case .chart9:
            return HexColor(lightColor: "6C8893")
        case .chart10:
            return HexColor(lightColor: "EE6868")
        case .chart11:
            return HexColor(lightColor: "387BB7", darkColor: "2F6497")
        case .negative:
            return HexColor(lightColor: "FF9B9B", darkColor: "D9364C")
        case .critical:
            return HexColor(lightColor: "FFDB79", darkColor: "FFA325")
        case .positive:
            return HexColor(lightColor: "8EF79F", darkColor: "3A835B")
        case .map1:
            return HexColor(lightColor: "2E4A62")
        case .map2:
            return HexColor(lightColor: "56840E")
        case .map3:
            return HexColor(lightColor: "A63788")
        case .map4:
            return HexColor(lightColor: "0079C6")
        case .map5:
            return HexColor(lightColor: "6B4EA0")
        case .map6:
            return HexColor(lightColor: "A16B00")
        case .map7:
            return HexColor(lightColor: "0B6295")
        case .map8:
            return HexColor(lightColor: "D0R774")
        case .map9:
            return HexColor(lightColor: "1C857A")
        case .map10:
            return HexColor(lightColor: "C45300")
        case .esriEdit:
            return HexColor(lightColor: "FFF114", darkColor: "1B6DD2")
        default:
            return HexColor()
        }
    }
}
