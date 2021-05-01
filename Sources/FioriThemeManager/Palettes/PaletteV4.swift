import Foundation

struct PaletteV4: PaletteProvider {
    /// :nodoc:
    public let uuid = UUID()
    
    /// :nodoc:
    public static let `default` = Palette(PaletteV4())
    
    let version: PaletteVersion = .v4
    
    private init() {}
    
    // swiftlint:disable function_body_length
    func hexColor(for colorStyle: ColorStyle) -> HexColor {
        switch colorStyle {
        case .primary1:
            return HexColor(lightColor: "FFFFFF", darkColor: "32363A")
        case .primary2:
            return HexColor(lightColor: "FFFFFF", darkColor: "515559")
        case .primary3:
            return HexColor(lightColor: "EBEBF599", darkColor: "6A6D70")
        case .primary4:
            return HexColor(lightColor: "EBEBF54D", darkColor: "CCCCCC")
        case .primary5:
            return HexColor(lightColor: "2C2C2E", darkColor: "FAFAFA")
        case .primary6:
            return HexColor(lightColor: "1C1C1E", darkColor: "FFFFFF")
        case .primary7:
            return HexColor(lightColor: "74777A", darkColor: "74777A")
        case .primary9:
            return HexColor(lightColor: "48484A", darkColor: "EEEEEF")
        case .primary10:
            return HexColor(lightColor: "89919A", darkColor: "89919A")
        case .tintColor:
            return HexColor(lightColor: "D1E8FF", darkColor: "0A6ED1")
        case .tintColorLight:
            return HexColor(lightColor: "0A84FF", darkColor: "D1E8FF")
        case .tintColorDark:
            return HexColor(lightColor: "0A84FF", darkColor: "0A6ED1")
        case .tintColorTapState:
            return HexColor(lightColor: "0A84FF66", darkColor: "0854A1")
        case .tintColorTapStateLight:
            return HexColor(lightColor: "0A84FF66", darkColor: "74A5D5")
        case .tintColorTapStateDark:
            return HexColor(lightColor: "0A84FF66", darkColor: "0854A1")
        case .navigationBar:
            return HexColor(lightColor: "161616CC", darkColor: "354A5F")
        case .backgroundGradientTop:
            return HexColor(lightColor: "161616", darkColor: "354A5F")
        case .backgroundGradientBottom:
            return HexColor(lightColor: "354A5F", darkColor: "354A5F")
        case .backgroundBase:
            return HexColor(lightColor: "000000", darkColor: "F3F3F3")
        case .line:
            return HexColor(lightColor: "38383A", darkColor: "F3F3F3")
        case .cellBackgroundTapState:
            return HexColor(lightColor: "47474CCC", darkColor: "EEEEEF")
        case .chart1:
            return HexColor(lightColor: "74B3F0", darkColor: "5899DA")
        case .chart2:
            return HexColor(lightColor: "E8743B", darkColor: "E8743B")
        case .chart3:
            return HexColor(lightColor: "19A979", darkColor: "19A979")
        case .chart4:
            return HexColor(lightColor: "ED4A7B", darkColor: "ED4A7B")
        case .chart5:
            return HexColor(lightColor: "945ECF", darkColor: "945ECF")
        case .chart6:
            return HexColor(lightColor: "13A4B4", darkColor: "13A4B4")
        case .chart7:
            return HexColor(lightColor: "5C66F5", darkColor: "525DF4")
        case .chart8:
            return HexColor(lightColor: "C63FA4", darkColor: "BF399E")
        case .chart9:
            return HexColor(lightColor: "6C8893", darkColor: "6C8893")
        case .chart10:
            return HexColor(lightColor: "EE6868", darkColor: "EE6868")
        case .chart11:
            return HexColor(lightColor: "387BB7", darkColor: "2F6497")
        case .negative:
            return HexColor(lightColor: "FF453A", darkColor: "BB0000")
        case .critical:
            return HexColor(lightColor: "FF9F0A", darkColor: "E9730C")
        case .positive:
            return HexColor(lightColor: "32D74B", darkColor: "107E3E")
        case .stockUpStroke:
            return HexColor(lightColor: "19A979", darkColor: "19A979")
        case .stockDownStroke:
            return HexColor(lightColor: "EE6868", darkColor: "EE6868")
        case .map1:
            return HexColor(lightColor: "2E4A62", darkColor: "2E4A62")
        case .map2:
            return HexColor(lightColor: "56840E", darkColor: "56840E")
        case .map3:
            return HexColor(lightColor: "A63788", darkColor: "A63788")
        case .map4:
            return HexColor(lightColor: "0079C6", darkColor: "0079C6")
        case .map5:
            return HexColor(lightColor: "6B4EA0", darkColor: "6B4EA0")
        case .map6:
            return HexColor(lightColor: "A16B00", darkColor: "A16B00")
        case .map7:
            return HexColor(lightColor: "0B6295", darkColor: "0B6295")
        case .map8:
            return HexColor(lightColor: "D0R774", darkColor: "D0R774")
        case .map9:
            return HexColor(lightColor: "1C857A", darkColor: "1C857A")
        case .map10:
            return HexColor(lightColor: "C45300", darkColor: "C45300")
        case .esriEdit:
            return HexColor(lightColor: "FFF114", darkColor: "1B6DD2")
        case .negativeBackground:
            return HexColor(lightColor: "583434CC", darkColor: "FFEBEB")
        case .criticalBackground:
            return HexColor(lightColor: "3E5045CC", darkColor: "FEF7F1")
        case .positiveBackground:
            return HexColor(lightColor: "6E442ACC", darkColor: "F1FDF6")
        case .informationBackground:
            return HexColor(lightColor: "2C4660CC", darkColor: "F5FAFF")
        case .accent1:
            return HexColor(lightColor: "E38B16", darkColor: "E38B16")
        case .accent1b:
            return HexColor(lightColor: "D17F15", darkColor: "D17F15")
        case .accent2:
            return HexColor(lightColor: "DC7474", darkColor: "DC7474")
        case .accent2b:
            return HexColor(lightColor: "D04343", darkColor: "D04343")
        case .accent3:
            return HexColor(lightColor: "DB1F77", darkColor: "DB1F77")
        case .accent4:
            return HexColor(lightColor: "C0399F", darkColor: "C0399F")
        case .accent5:
            return HexColor(lightColor: "6367DE", darkColor: "6367DE")
        case .accent6:
            return HexColor(lightColor: "5899DA", darkColor: "5899DA")
        case .accent6b:
            return HexColor(lightColor: "2B78C5", darkColor: "2B78C5")
        case .accent7:
            return HexColor(lightColor: "13A4B4", darkColor: "13A4B4")
        case .accent7b:
            return HexColor(lightColor: "0F828F", darkColor: "0F828F")
        case .accent8:
            return HexColor(lightColor: "7CA10C", darkColor: "7CA10C")
        case .accent9:
            return HexColor(lightColor: "925ACE", darkColor: "925ACE")
        case .accent10:
            return HexColor(lightColor: "8497A4", darkColor: "8497A4")
        case .accent10b:
            return HexColor(lightColor: "647887", darkColor: "647887")
        default:
            return HexColor()
        }
    }
}
