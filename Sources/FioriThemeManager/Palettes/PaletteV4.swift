import Foundation

#if !os(watchOS)
    struct PaletteV4: PaletteProvider {
        /// :nodoc:
        public let uuid = UUID()
    
        /// :nodoc:
        public static let `default` = Palette(PaletteV4())
    
        let version: PaletteVersion = .v4
    
        private init() {}
    
        public var colorDefinitions: [ColorStyle: HexColor] = [
            .primary1: HexColor(lightColor: "FFFFFF", darkColor: "32363A"),
            .primary2: HexColor(lightColor: "FFFFFF", darkColor: "515559"),
            .primary3: HexColor(lightColor: "EBEBF599", darkColor: "6A6D70"),
            .primary4: HexColor(lightColor: "EBEBF54D", darkColor: "CCCCCC"),
            .primary5: HexColor(lightColor: "2C2C2E", darkColor: "FAFAFA"),
            .primary6: HexColor(lightColor: "1C1C1E", darkColor: "FFFFFF"),
            .primary7: HexColor(lightColor: "74777A", darkColor: "74777A"),
            .primary9: HexColor(lightColor: "48484A", darkColor: "EEEEEF"),
            .primary10: HexColor(lightColor: "89919A", darkColor: "89919A"),
            .tintColor: HexColor(lightColor: "D1E8FF", darkColor: "0A6ED1"),
            .tintColorLight: HexColor(lightColor: "0A84FF", darkColor: "D1E8FF"),
            .tintColorDark: HexColor(lightColor: "0A84FF", darkColor: "0A6ED1"),
            .tintColorTapState: HexColor(lightColor: "0A84FF66", darkColor: "0854A1"),
            .tintColorTapStateLight: HexColor(lightColor: "0A84FF66", darkColor: "74A5D5"),
            .tintColorTapStateDark: HexColor(lightColor: "0A84FF66", darkColor: "0854A1"),
            .navigationBar: HexColor(lightColor: "161616CC", darkColor: "354A5F"),
            .backgroundGradientTop: HexColor(lightColor: "161616", darkColor: "354A5F"),
            .backgroundGradientBottom: HexColor(lightColor: "354A5F", darkColor: "354A5F"),
            .backgroundBase: HexColor(lightColor: "000000", darkColor: "F3F3F3"),
            .line: HexColor(lightColor: "38383A", darkColor: "F3F3F3"),
            .cellBackgroundTapState: HexColor(lightColor: "47474CCC", darkColor: "EEEEEF"),
            .chart1: HexColor(lightColor: "74B3F0", darkColor: "5899DA"),
            .chart2: HexColor(lightColor: "E8743B", darkColor: "E8743B"),
            .chart3: HexColor(lightColor: "19A979", darkColor: "19A979"),
            .chart4: HexColor(lightColor: "ED4A7B", darkColor: "ED4A7B"),
            .chart5: HexColor(lightColor: "945ECF", darkColor: "945ECF"),
            .chart6: HexColor(lightColor: "13A4B4", darkColor: "13A4B4"),
            .chart7: HexColor(lightColor: "5C66F5", darkColor: "525DF4"),
            .chart8: HexColor(lightColor: "C63FA4", darkColor: "BF399E"),
            .chart9: HexColor(lightColor: "6C8893", darkColor: "6C8893"),
            .chart10: HexColor(lightColor: "EE6868", darkColor: "EE6868"),
            .chart11: HexColor(lightColor: "387BB7", darkColor: "2F6497"),
            .negative: HexColor(lightColor: "FF453A", darkColor: "BB0000"),
            .critical: HexColor(lightColor: "FF9F0A", darkColor: "E9730C"),
            .positive: HexColor(lightColor: "32D74B", darkColor: "107E3E"),
            .stockUpStroke: HexColor(lightColor: "19A979", darkColor: "19A979"),
            .stockDownStroke: HexColor(lightColor: "EE6868", darkColor: "EE6868"),
            .map1: HexColor(lightColor: "2E4A62", darkColor: "2E4A62"),
            .map2: HexColor(lightColor: "56840E", darkColor: "56840E"),
            .map3: HexColor(lightColor: "A63788", darkColor: "A63788"),
            .map4: HexColor(lightColor: "0079C6", darkColor: "0079C6"),
            .map5: HexColor(lightColor: "6B4EA0", darkColor: "6B4EA0"),
            .map6: HexColor(lightColor: "A16B00", darkColor: "A16B00"),
            .map7: HexColor(lightColor: "0B6295", darkColor: "0B6295"),
            .map8: HexColor(lightColor: "D0R774", darkColor: "D0R774"),
            .map9: HexColor(lightColor: "1C857A", darkColor: "1C857A"),
            .map10: HexColor(lightColor: "C45300", darkColor: "C45300"),
            .esriEdit: HexColor(lightColor: "FFF114", darkColor: "1B6DD2"),
            .negativeBackground: HexColor(lightColor: "583434CC", darkColor: "FFEBEB"),
            .criticalBackground: HexColor(lightColor: "3E5045CC", darkColor: "FEF7F1"),
            .positiveBackground: HexColor(lightColor: "6E442ACC", darkColor: "F1FDF6"),
            .informationBackground: HexColor(lightColor: "2C4660CC", darkColor: "F5FAFF"),
            .accent1: HexColor(lightColor: "E38B16", darkColor: "E38B16"),
            .accent1b: HexColor(lightColor: "D17F15", darkColor: "D17F15"),
            .accent2: HexColor(lightColor: "DC7474", darkColor: "DC7474"),
            .accent2b: HexColor(lightColor: "D04343", darkColor: "D04343"),
            .accent3: HexColor(lightColor: "DB1F77", darkColor: "DB1F77"),
            .accent4: HexColor(lightColor: "C0399F", darkColor: "C0399F"),
            .accent5: HexColor(lightColor: "6367DE", darkColor: "6367DE"),
            .accent6: HexColor(lightColor: "5899DA", darkColor: "5899DA"),
            .accent6b: HexColor(lightColor: "2B78C5", darkColor: "2B78C5"),
            .accent7: HexColor(lightColor: "13A4B4", darkColor: "13A4B4"),
            .accent7b: HexColor(lightColor: "0F828F", darkColor: "0F828F"),
            .accent8: HexColor(lightColor: "7CA10C", darkColor: "7CA10C"),
            .accent9: HexColor(lightColor: "925ACE", darkColor: "925ACE"),
            .accent10: HexColor(lightColor: "8497A4", darkColor: "8497A4"),
            .accent10b: HexColor(lightColor: "647887", darkColor: "647887")
        ]
    
        func hexColor(for colorStyle: ColorStyle) -> HexColor? {
            self.colorDefinitions[colorStyle]
        }
    }
#endif
