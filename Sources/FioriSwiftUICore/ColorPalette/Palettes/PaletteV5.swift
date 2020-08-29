//
//  PaletteV5.swift
//  FioriSwiftUICore
//
//  Created by Guo, Justin on 8/10/20.
//

import Foundation

struct PaletteV5: PaletteProvider {
    /// :nodoc:
    public let uuid: UUID = UUID()
    
    /// :nodoc:
    public static let `default`: Palette = Palette(PaletteV5())
    
    let version: PaletteVersion = .v5
    
    private init() {}
    
    //swiftlint:disable function_body_length
    func hexColor(for colorStyle: ColorStyle) -> HexColor {
        switch colorStyle {
        case .shell:
            return HexColor(lightColor: "2C3D4F", darkColor: "354A5F")
        case .background1:
            return HexColor(lightColor: "1C2228", darkColor: "EDEFF0")
        case .background2:
            return HexColor(lightColor: "232A31", darkColor: "F7F7F7")
        case .line:
            return HexColor(lightColor: "8696A9", darkColor: "89919A")
        case .separator:
            return HexColor(lightColor: "8696A945", darkColor: "89919A69")
        case .primary1:
            return HexColor(lightColor: "FAFAFA", darkColor: "32363A")
        case .primary2:
            return HexColor(lightColor: "EEF0F1", darkColor: "515456")
        case .primary3:
            return HexColor(lightColor: "D3D7D9", darkColor: "6A6D70")
        case .primary4:
            return HexColor(lightColor: "687D94", darkColor: "CCCCCC")
        case .primary5:
            return HexColor(lightColor: "23303E", darkColor: "FAFAFA")
        case .primary6:
            return HexColor(lightColor: "29313A", darkColor: "FFFFFF")
        case .primary7:
            return HexColor(lightColor: "B8BEC1", darkColor: "74777A")
        case .primary8:
            return HexColor(lightColor: "2F3943")
        case .primary9:
            return HexColor(lightColor: "3A4552", darkColor: "E5E5E5")
        case .primary10:
            return HexColor(lightColor: "8696A9", darkColor: "89919A")
        case .shadow:
            return HexColor(lightColor: "000000")
        case .primaryGroupedBackgrond:
            return HexColor(lightColor: "1C2228", darkColor: "EDEFF0", elevatedLightColor: "232A31", elevatedDarkColor: "EDEFF0")
        case .secondaryGroupedBackgrond:
            return HexColor(lightColor: "232A31", darkColor: "FFFFFF", elevatedLightColor: "29313A", elevatedDarkColor: "FFFFFF")
        case .tertiaryGroupedBackgrond:
            return HexColor(lightColor: "29313A", darkColor: "FFFFFF", elevatedLightColor: "2F3943", elevatedDarkColor: "FFFFFF")
        case .primaryBackgrond:
            return HexColor(lightColor: "232A31", darkColor: "FFFFFF", elevatedLightColor: "29313A", elevatedDarkColor: "FFFFFF")
        case .secondaryBackgrond:
            return HexColor(lightColor: "1C2228", darkColor: "F7F7F7", elevatedLightColor: "232A31", elevatedDarkColor: "F7F7F7")
        case .tertiaryBackgrond:
            return HexColor(lightColor: "29313A", darkColor: "FFFFFF", elevatedLightColor: "2F3943", elevatedDarkColor: "FFFFFF")
        case .primaryLabel:
            return HexColor(lightColor: "FAFAFA", darkColor: "32363A", contrastLightColor: "FAFAFA", contrastDarkColor: "FAFAFA")
        case .secondaryLabel:
            return HexColor(lightColor: "FAFAFAD9", darkColor: "32363AD9", contrastLightColor: "FAFAFAD9", contrastDarkColor: "FAFAFAD9")
        case .tertiaryLabel:
            return HexColor(lightColor: "FAFAFAB8", darkColor: "32363AB8", contrastLightColor: "FAFAFAB8", contrastDarkColor: "FAFAFAB8")
        case .quarternaryLabel:
            return HexColor(lightColor: "FAFAFA8C", darkColor: "32363A8C", contrastLightColor: "FAFAFA8C", contrastDarkColor: "FAFAFA8C")
        case .primaryFill:
            return HexColor(lightColor: "8696A959", darkColor: "89919A33", contrastLightColor: "8696A959", contrastDarkColor: "8696A959")
        case .secondaryFill:
            return HexColor(lightColor: "8696A945", darkColor: "89919A29", contrastLightColor: "8696A945", contrastDarkColor: "8696A945")
        case .tertiaryFill:
            return HexColor(lightColor: "8696A930", darkColor: "89919A1F", contrastLightColor: "8696A930", contrastDarkColor: "8696A930")
        case .quarternaryFill:
            return HexColor(lightColor: "8696A91C", darkColor: "89919A14", contrastLightColor: "8696A91C", contrastDarkColor: "8696A91C")
        case .header:
            return HexColor(lightColor: "2C3D4F", darkColor: "354A5F")
        case .footer:
            return HexColor(lightColor: "23303EEB", darkColor: "FAFAFAEB")
        case .cellBackground:
            return HexColor(lightColor: "FFFFFF00")
        case .cellBackgroundTapState:
            return HexColor(lightColor: "8696A91C", darkColor: "89919A1C")
        case .tintColor:
            return HexColor(lightColor: "91C8F6", darkColor: "0A6ED1", contrastLightColor: "91C8F6", contrastDarkColor: "91C8F6")
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
        case .chart1:
            return HexColor(lightColor: "E38B16")
        case .chart2:
            return HexColor(lightColor: "D17F15")
        case .chart3:
            return HexColor(lightColor: "DC7474")
        case .chart4:
            return HexColor(lightColor: "D04343")
        case .chart5:
            return HexColor(lightColor: "DB1F77")
        case .chart6:
            return HexColor(lightColor: "C0399F")
        case .chart7:
            return HexColor(lightColor: "6367DE")
        case .chart8:
            return HexColor(lightColor: "5899DA")
        case .chart9:
            return HexColor(lightColor: "2B78C5")
        case .chart10:
            return HexColor(lightColor: "13A4B4")
        case .chart11:
            return HexColor(lightColor: "0F828F")
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
        case .negative:
            return HexColor(lightColor: "FF8888", darkColor: "BB0000")
        case .positive:
            return HexColor(lightColor: "ABE2AB", darkColor: "107E3E")
        case .critical:
            return HexColor(lightColor: "FABD64", darkColor: "E9730C")
        case .negativeLabel:
            return HexColor(lightColor: "FF8888", darkColor: "BB0000", contrastDarkColor: "FF8888")
        case .positiveLabel:
            return HexColor(lightColor: "ABE2AB", darkColor: "107E3E", contrastDarkColor: "ABE2AB")
        case .criticalLabel:
            return HexColor(lightColor: "FABD64", darkColor: "E9730C", contrastDarkColor: "FABD64")
        case .negativeBackground:
            return HexColor(lightColor: "FF888824", darkColor: "BB000014", contrastDarkColor: "BB000024")
        case .positiveBackground:
            return HexColor(lightColor: "ABE2AB24", darkColor: "107E3E14", contrastDarkColor: "107E3E24")
        case .criticalBackground:
            return HexColor(lightColor: "FABD6424", darkColor: "E9730C14", contrastDarkColor: "E9730C24")
        case .informationBackground:
            return HexColor(lightColor: "91C8F624", darkColor: "0A6ED114", contrastDarkColor: "0A6ED124")
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
        }
    }
}
