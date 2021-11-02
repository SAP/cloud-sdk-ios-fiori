import Foundation

struct PaletteV6: PaletteProvider {
    /// :nodoc:
    public let uuid = UUID()
    
    /// :nodoc:
    public static let `default` = Palette(PaletteV6())
    
    let version: PaletteVersion = .v6
    
    private init() {}
    
    // swiftlint:disable function_body_length
    func hexColor(for colorStyle: ColorStyle) -> HexColor {
        switch colorStyle {
        /// Basic Colors
        case .grey1:
            return HexColor(lightColor: "111D29FF", darkColor: "F5F6F7FF")
        case .grey2:
            return HexColor(lightColor: "223548FF", darkColor: "D5DADDFF")
        case .grey3:
            return HexColor(lightColor: "354A5FFF", darkColor: "A9B4BEFF")
        case .grey4:
            return HexColor(lightColor: "475E75FF", darkColor: "8396A8FF")
        case .grey5:
            return HexColor(lightColor: "5B738BFF", darkColor: "5B738BFF")
        case .grey6:
            return HexColor(lightColor: "8396A8FF", darkColor: "475E75FF")
        case .grey7:
            return HexColor(lightColor: "A9B4BEFF", darkColor: "354A5FFF")
        case .grey8:
            return HexColor(lightColor: "D5DADDFF", darkColor: "223548FF")
        case .grey9:
            return HexColor(lightColor: "F5F6F7FF", darkColor: "111D29FF")
        case .blue1:
            return HexColor(lightColor: "00144AFF", darkColor: "EBF8FFFF")
        case .blue2:
            return HexColor(lightColor: "002A86FF", darkColor: "89D1FFFF")
        case .blue3:
            return HexColor(lightColor: "0040B0FF", darkColor: "4DB1FFFF")
        case .blue4:
            return HexColor(lightColor: "0057D2FF", darkColor: "1B90FFFF")
        case .blue5:
            return HexColor(lightColor: "0070F2FF", darkColor: "0070F2FF")
        case .blue6:
            return HexColor(lightColor: "1B90FFFF", darkColor: "0057D2FF")
        case .blue7:
            return HexColor(lightColor: "4DB1FFFF", darkColor: "0040B0FF")
        case .blue8:
            return HexColor(lightColor: "89D1FFFF", darkColor: "002A86FF")
        case .blue9:
            return HexColor(lightColor: "EBF8FFFF", darkColor: "00144AFF")
        case .teal1:
            return HexColor(lightColor: "012931FF", darkColor: "DAFDF5FF")
        case .teal2:
            return HexColor(lightColor: "02414CFF", darkColor: "64EDD2FF")
        case .teal3:
            return HexColor(lightColor: "035663FF", darkColor: "00CEACFF")
        case .teal4:
            return HexColor(lightColor: "046C7AFF", darkColor: "04ACA7FF")
        case .teal5:
            return HexColor(lightColor: "07838FFF", darkColor: "07838FFF")
        case .teal6:
            return HexColor(lightColor: "04ACA7FF", darkColor: "046C7AFF")
        case .teal7:
            return HexColor(lightColor: "00CEACFF", darkColor: "035663FF")
        case .teal8:
            return HexColor(lightColor: "64EDD2FF", darkColor: "02414CFF")
        case .teal9:
            return HexColor(lightColor: "DAFDF5FF", darkColor: "012931FF")
        case .green1:
            return HexColor(lightColor: "0E2B16FF", darkColor: "F5FAE5FF")
        case .green2:
            return HexColor(lightColor: "164323FF", darkColor: "97DD40FF")
        case .green3:
            return HexColor(lightColor: "1E592FFF", darkColor: "5DC122FF")
        case .green4:
            return HexColor(lightColor: "256F3AFF", darkColor: "36A41DFF")
        case .green5:
            return HexColor(lightColor: "188918FF", darkColor: "188918FF")
        case .green6:
            return HexColor(lightColor: "36A41DFF", darkColor: "256F3AFF")
        case .green7:
            return HexColor(lightColor: "5DC122FF", darkColor: "1E592FFF")
        case .green8:
            return HexColor(lightColor: "97DD40FF", darkColor: "164323FF")
        case .green9:
            return HexColor(lightColor: "F5FAE5FF", darkColor: "0E2B16FF")
        case .mango1:
            return HexColor(lightColor: "450B00FF", darkColor: "FFF8D6FF")
        case .mango2:
            return HexColor(lightColor: "6D1900FF", darkColor: "FFDF72FF")
        case .mango3:
            return HexColor(lightColor: "8D2A00FF", darkColor: "FFB300FF")
        case .mango4:
            return HexColor(lightColor: "A93E00FF", darkColor: "F58B00FF")
        case .mango5:
            return HexColor(lightColor: "C35500FF", darkColor: "C35500FF")
        case .mango6:
            return HexColor(lightColor: "F58B00FF", darkColor: "A93E00FF")
        case .mango7:
            return HexColor(lightColor: "FFB300FF", darkColor: "8D2A00FF")
        case .mango8:
            return HexColor(lightColor: "FFDF72FF", darkColor: "6D1900FF")
        case .mango9:
            return HexColor(lightColor: "FFF8D6FF", darkColor: "450B00FF")
        case .red1:
            return HexColor(lightColor: "350000FF", darkColor: "FFEAF4FF")
        case .red2:
            return HexColor(lightColor: "5A0404FF", darkColor: "FF8CB2FF")
        case .red3:
            return HexColor(lightColor: "840606FF", darkColor: "FF5C77FF")
        case .red4:
            return HexColor(lightColor: "AA0808FF", darkColor: "EE3939FF")
        case .red5:
            return HexColor(lightColor: "D20A0AFF", darkColor: "D20A0AFF")
        case .red6:
            return HexColor(lightColor: "EE3939FF", darkColor: "AA0808FF")
        case .red7:
            return HexColor(lightColor: "FF5C77FF", darkColor: "840606FF")
        case .red8:
            return HexColor(lightColor: "FF8CB2FF", darkColor: "5A0404FF")
        case .red9:
            return HexColor(lightColor: "FFEAF4FF", darkColor: "350000FF")
        case .pink1:
            return HexColor(lightColor: "28004AFF", darkColor: "FFF0FAFF")
        case .pink2:
            return HexColor(lightColor: "510080FF", darkColor: "FFAFEDFF")
        case .pink3:
            return HexColor(lightColor: "7800A4FF", darkColor: "FF8AF0FF")
        case .pink4:
            return HexColor(lightColor: "A100C2FF", darkColor: "F31DEDFF")
        case .pink5:
            return HexColor(lightColor: "CC00DCFF", darkColor: "CC00DCFF")
        case .pink6:
            return HexColor(lightColor: "F31DEDFF", darkColor: "A100C2FF")
        case .pink7:
            return HexColor(lightColor: "FF8AF0FF", darkColor: "7800A4FF")
        case .pink8:
            return HexColor(lightColor: "FFAFEDFF", darkColor: "510080FF")
        case .pink9:
            return HexColor(lightColor: "FFF0FAFF", darkColor: "28004AFF")
        case .indigo1:
            return HexColor(lightColor: "1C0C6EFF", darkColor: "F1ECFFFF")
        case .indigo2:
            return HexColor(lightColor: "2C13ADFF", darkColor: "D3B6FFFF")
        case .indigo3:
            return HexColor(lightColor: "470CEDFF", darkColor: "B894FFFF")
        case .indigo4:
            return HexColor(lightColor: "5D36FFFF", darkColor: "9B76FFFF")
        case .indigo5:
            return HexColor(lightColor: "7858FFFF", darkColor: "7858FFFF")
        case .indigo6:
            return HexColor(lightColor: "9B76FFFF", darkColor: "5D36FFFF")
        case .indigo7:
            return HexColor(lightColor: "B894FFFF", darkColor: "470CEDFF")
        case .indigo8:
            return HexColor(lightColor: "D3B6FFFF", darkColor: "2C13ADFF")
        case .indigo9:
            return HexColor(lightColor: "F1ECFFFF", darkColor: "1C0C6EFF")
        case .baseWhite:
            return HexColor(lightColor: "FFFFFFFF", darkColor: "FFFFFFFF")
        case .baseBlack:
            return HexColor(lightColor: "000000FF", darkColor: "000000FF")
        /// Shadow Colors
        case .cardShadow:
            return HexColor(lightColor: "0000004D", darkColor: "5B738B14")
        case .sectionShadow:
            return HexColor(lightColor: "0000003D", darkColor: "5B738B3D")
        /// Background Colors
        case .primaryBackground:
            return HexColor(lightColor: "000000FF", darkColor: "FFFFFFFF", elevatedLightColor: "192027FF")
        case .secondaryBackground:
            return HexColor(lightColor: "0F1216FF", darkColor: "F5F6F7FF", elevatedLightColor: "1F272FFF")
        case .tertiaryBackground:
            return HexColor(lightColor: "161C21FF", darkColor: "FFFFFFFF", elevatedLightColor: "242E38FF")
        case .primaryGroupedBackground:
            return HexColor(lightColor: "000000FF", darkColor: "F5F6F7FF", elevatedLightColor: "192027FF")
        case .secondaryGroupedBackground:
            return HexColor(lightColor: "161C21FF", darkColor: "FFFFFFFF", elevatedLightColor: "242E38FF")
        case .tertiaryGroupedBackground:
            return HexColor(lightColor: "0F1216FF", darkColor: "F5F6F7FF", elevatedLightColor: "1F272FFF")
        /// Label Colors
        case .primaryLabel:
            return HexColor(lightColor: "F5F6F7FF", darkColor: "223548FF")
        case .secondaryLabel:
            return HexColor(lightColor: "D5DADDFF", darkColor: "475E75FF")
        case .tertiaryLabel:
            return HexColor(lightColor: "A9B4BEFF", darkColor: "475E75E5")
        case .quarternaryLabel:
            return HexColor(lightColor: "8396A8FF", darkColor: "5B738BD4")
        /// Fill Colors
        case .primaryFill:
            return HexColor(lightColor: "223548FF", darkColor: "FFFFFFFF")
        case .secondaryFill:
            return HexColor(lightColor: "8396A81F", darkColor: "5B738B0F")
        case .tertiaryFill:
            return HexColor(lightColor: "8396A845", darkColor: "5B738B29")
        case .quarternaryFill:
            return HexColor(lightColor: "8396A814", darkColor: "5B738B14")
        /// Tint Colors:
        case .tintColor:
            return HexColor(lightColor: "4DB1FFFF", darkColor: "0070F2FF")
        case .tintColor2:
            return HexColor(lightColor: "4DB1FFFF", darkColor: "0057D2FF")
        case .tintColorTapState:
            return HexColor(lightColor: "1B90FFFF", darkColor: "0040B0FF")
        /// Semantic Colors
        case .negativeLabel:
            return HexColor(lightColor: "FF5C77FF", darkColor: "D20A0AFF")
        case .positiveLabel:
            return HexColor(lightColor: "5DC122FF", darkColor: "256F3AFF")
        case .criticalLabel:
            return HexColor(lightColor: "F58B00FF", darkColor: "A93E00FF")
        case .negativeBackground:
            return HexColor(lightColor: "350000FF", darkColor: "FFEAF4FF")
        case .positiveBackground:
            return HexColor(lightColor: "0E2B16FF", darkColor: "F5FAE5FF")
        case .criticalBackground:
            return HexColor(lightColor: "450B00FF", darkColor: "FFF8D6FF")
        case .informationBackground:
            return HexColor(lightColor: "00144AFF", darkColor: "EBF8FFFF")
        case .separator:
            return HexColor(lightColor: "8396A85E", darkColor: "5B738B5E")
        case .separatorOpaque:
            return HexColor(lightColor: "8396A8D4", darkColor: "5B738BD4")
        /// UI Materials Colors
        case .header:
            return HexColor(lightColor: "161C21FF", darkColor: "FFFFFFFF")
        case .headerBlended:
            return HexColor(lightColor: "161C21FF", darkColor: "FFFFFFFF")
        case .barTransparent:
            return HexColor(lightColor: "111D29D9", darkColor: "111D29D9")
        case .contrastElement:
            return HexColor(lightColor: "8396A8FF", darkColor: "5B738BFF")
        case .footer:
            return HexColor(lightColor: "192027FF", darkColor: "FFFFFFFF")
        case .cellBackground:
            return HexColor(lightColor: "22354800", darkColor: "FFFFFF00")
        /// Chart Colors
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
        case .stockUpStroke:
            return HexColor(lightColor: "19A979", darkColor: "19A979")
        case .stockDownStroke:
            return HexColor(lightColor: "EE6868", darkColor: "EE6868")
        /// Map Colors
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
        default:
            return HexColor(lightColor: "000000")
        }
    }
}
