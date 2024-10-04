@testable import FioriThemeManager
import SwiftUI
import UIKit
import XCTest

class ThemeManagerTests: XCTestCase {
    override func tearDown() {
        ThemeManager.shared.reset()
    }
    
    #if !os(watchOS)
        func testLatestColorStyle() throws {
            XCTAssertEqual(ColorStyle.allCases.count, 211)
        }
    
        func testPalette8() throws {
            let tm = ThemeManager.shared
            tm.setPaletteVersion(.v8)
            // following are same as v7
            XCTAssertEqual(tm.paletteVersion?.supportedStyles().count, 211)
            XCTAssertEqual(tm.paletteVersion?.obsoletedStyles().count, 0)
            XCTAssertEqual(tm.paletteVersion?.newStyles().count, 16)
            let newStyle_grey1 = tm.hexColor(for: .grey1)
            XCTAssertEqual(newStyle_grey1, HexColor(lightColor: "12171CFF", darkColor: "F5F6F7FF", contrastLightColor: "1C242BFF", contrastDarkColor: "EAECEEFF"))
            let newStyle_primaryLabel = tm.hexColor(for: .primaryLabel)
            XCTAssertEqual(newStyle_primaryLabel, HexColor(lightColor: "F5F6F7FF", darkColor: "223548FF", contrastLightColor: "FFFFFFFF", contrastDarkColor: "000000FF"))
            let obsoletedStyle_line = tm.hexColor(for: .line)
            XCTAssertEqual(obsoletedStyle_line, HexColor(lightColor: "8696A9", darkColor: "89919A"))
            let obsoletedStyle_negative = tm.hexColor(for: .negative)
            XCTAssertEqual(obsoletedStyle_negative, HexColor(lightColor: "FF8888", darkColor: "BB0000"))
            
            // following are changes made to v7 and available starting v8
            let primaryBackground = tm.hexColor(for: .primaryBackground)
            XCTAssertEqual(primaryBackground, HexColor(lightColor: "000000FF", darkColor: "FFFFFFFF", elevatedLightColor: "171D23FF", contrastLightColor: "000000FF", contrastDarkColor: "FFFFFFFF", elevatedContrastLightColor: "192024FF"))
            let secondaryBackground = tm.hexColor(for: .secondaryBackground)
            XCTAssertEqual(secondaryBackground, HexColor(lightColor: "161C21FF", darkColor: "F5F6F7FF", elevatedLightColor: "242D37FF", contrastLightColor: "1D252AFF", contrastDarkColor: "EAECEEFF", elevatedContrastLightColor: "212B30FF"))
            let tertiaryBackground = tm.hexColor(for: .tertiaryBackground)
            XCTAssertEqual(tertiaryBackground, HexColor(lightColor: "242E38FF", darkColor: "FFFFFFFF", elevatedLightColor: "2F3C48FF", contrastLightColor: "192024FF", contrastDarkColor: "FFFFFFFF", elevatedContrastLightColor: "253136FF"))
            let primaryGroupedBackground = tm.hexColor(for: .primaryGroupedBackground)
            XCTAssertEqual(primaryGroupedBackground, HexColor(lightColor: "000000FF", darkColor: "F5F6F7FF", elevatedLightColor: "171D23FF", contrastLightColor: "000000FF", contrastDarkColor: "E8EBEDFF", elevatedContrastLightColor: "192024FF"))
            let secondaryGroupedBackground = tm.hexColor(for: .secondaryGroupedBackground)
            XCTAssertEqual(secondaryGroupedBackground, HexColor(lightColor: "161C21FF", darkColor: "FFFFFFFF", elevatedLightColor: "242D37FF", contrastLightColor: "1D252AFF", contrastDarkColor: "FFFFFFFF", elevatedContrastLightColor: "212B30FF"))
            let tertiaryGroupedBackground = tm.hexColor(for: .tertiaryGroupedBackground)
            XCTAssertEqual(tertiaryGroupedBackground, HexColor(lightColor: "242E38FF", darkColor: "F5F6F7FF", elevatedLightColor: "2F3C48FF", contrastLightColor: "192024FF", contrastDarkColor: "E8ECEEFF", elevatedContrastLightColor: "253136FF"))
            let secondaryLabel = tm.hexColor(for: .secondaryLabel)
            XCTAssertEqual(secondaryLabel, HexColor(lightColor: "D5DADDFF", darkColor: "475E75FF", contrastLightColor: "EAECEEFF", contrastDarkColor: "223548FF"))
            let tertiaryLabel = tm.hexColor(for: .tertiaryLabel)
            XCTAssertEqual(tertiaryLabel, HexColor(lightColor: "A9B4BEFF", darkColor: "5B738BFF", contrastLightColor: "D5DADDFF", contrastDarkColor: "354A5FFF"))
            let quinaryLabel = tm.hexColor(for: .quinaryLabel)
            XCTAssertEqual(quinaryLabel, HexColor(lightColor: "000000FF", darkColor: "FFFFFFFF", contrastLightColor: "000000FF", contrastDarkColor: "FFFFFFFF"))
            let primaryFill = tm.hexColor(for: .primaryFill)
            XCTAssertEqual(primaryFill, HexColor(lightColor: "8396A84D", darkColor: "8396A83D", contrastLightColor: "8396A866", contrastDarkColor: "8799AB57"))
            let secondaryFill = tm.hexColor(for: .secondaryFill)
            XCTAssertEqual(secondaryFill, HexColor(lightColor: "8396A847", darkColor: "8396A833", contrastLightColor: "8396A861", contrastDarkColor: "8799AB4D"))
            let tertiaryFill = tm.hexColor(for: .tertiaryFill)
            XCTAssertEqual(tertiaryFill, HexColor(lightColor: "8396A833", darkColor: "8396A826", contrastLightColor: "8396A84D", contrastDarkColor: "8799AB40"))
            let quaternaryFill = tm.hexColor(for: .quaternaryFill)
            XCTAssertEqual(quaternaryFill, HexColor(lightColor: "8396A829", darkColor: "8396A817", contrastLightColor: "8396A838", contrastDarkColor: "8799AB1A"))
            let tintColor = tm.hexColor(for: .tintColor)
            XCTAssertEqual(tintColor, HexColor(lightColor: "4DB1FFFF", darkColor: "0070F2FF", contrastLightColor: "5CB7FFFF", contrastDarkColor: "0046A8FF"))
            let tintColor2 = tm.hexColor(for: .tintColor2)
            XCTAssertEqual(tintColor2, HexColor(lightColor: "4DB1FFFF", darkColor: "0057D2FF", contrastLightColor: "5CB7FFFF", contrastDarkColor: "002A85FF"))
            let tintColor3 = tm.hexColor(for: .tintColor3)
            XCTAssertEqual(tintColor3, HexColor(lightColor: "4DB1FF29", darkColor: "0070F214", contrastLightColor: "5CB7FF29", contrastDarkColor: "0070F014"))
            let tintColorTapState = tm.hexColor(for: .tintColorTapState)
            XCTAssertEqual(tintColorTapState, HexColor(lightColor: "1B90FFFF", darkColor: "0040B0FF", contrastLightColor: "3399FFFF", contrastDarkColor: "001E70FF"))
            let negativeLabel = tm.hexColor(for: .negativeLabel)
            XCTAssertEqual(negativeLabel, HexColor(lightColor: "FF5C77FF", darkColor: "AA0808FF", contrastLightColor: "FF8CB2FF", contrastDarkColor: "7F0505FF"))
            let negativeLabelTapState = tm.hexColor(for: .negativeLabelTapState)
            XCTAssertEqual(negativeLabelTapState, HexColor(lightColor: "EE3939FF", darkColor: "840606FF", contrastLightColor: "FF5C77FF", contrastDarkColor: "4E0303FF"))
            let positiveLabel = tm.hexColor(for: .positiveLabel)
            XCTAssertEqual(positiveLabel, HexColor(lightColor: "5DC122FF", darkColor: "256F3AFF", contrastLightColor: "97DD40FF", contrastDarkColor: "164323FF"))
            let positiveLabelTapState = tm.hexColor(for: .positiveLabelTapState)
            XCTAssertEqual(positiveLabelTapState, HexColor(lightColor: "36A41DFF", darkColor: "1E592FFF", contrastLightColor: "56B21FFF", contrastDarkColor: "0E2B16FF"))
            let criticalLabel = tm.hexColor(for: .criticalLabel)
            XCTAssertEqual(criticalLabel, HexColor(lightColor: "FFB300FF", darkColor: "A93E00FF", contrastLightColor: "FFC933FF", contrastDarkColor: "702100FF"))
            let criticalLabelTapState = tm.hexColor(for: .criticalLabelTapState)
            XCTAssertEqual(criticalLabelTapState, HexColor(lightColor: "FFB300FF", darkColor: "8D2A00FF", contrastLightColor: "F58F00FF", contrastDarkColor: "450B00FF"))
            let informativeLabel = tm.hexColor(for: .informativeLabel)
            XCTAssertEqual(informativeLabel, HexColor(lightColor: "4DB1FFFF", darkColor: "0057D2FF", contrastLightColor: "89D1FFFF", contrastDarkColor: "002A85FF"))
            let informativeLabelTapState = tm.hexColor(for: .informativeLabelTapState)
            XCTAssertEqual(informativeLabelTapState, HexColor(lightColor: "1B90FFFF", darkColor: "0040B0FF", contrastLightColor: "3399FFFF", contrastDarkColor: "001E70FF"))
            let neutralLabel = tm.hexColor(for: .neutralLabel)
            XCTAssertEqual(neutralLabel, HexColor(lightColor: "8396A8FF", darkColor: "354A5FFF", contrastLightColor: "A9B4BEFF", contrastDarkColor: "223548FF"))
            let neutralLabelTapState = tm.hexColor(for: .neutralLabelTapState)
            XCTAssertEqual(neutralLabelTapState, HexColor(lightColor: "8396A8FF", darkColor: "223548FF", contrastLightColor: "8799ABFF", contrastDarkColor: "1A2733FF"))
            let negativeBackground = tm.hexColor(for: .negativeBackground)
            XCTAssertEqual(negativeBackground, HexColor(lightColor: "EE39391F", darkColor: "EE393914", contrastLightColor: "FF5C771F", contrastDarkColor: "D20A0A14"))
            let negativeBackgroundTapState = tm.hexColor(for: .negativeBackgroundTapState)
            XCTAssertEqual(negativeBackgroundTapState, HexColor(lightColor: "EE393938", darkColor: "EE393929", contrastLightColor: "FF5C7738", contrastDarkColor: "D20A0A29"))
            let positiveBackground = tm.hexColor(for: .positiveBackground)
            XCTAssertEqual(positiveBackground, HexColor(lightColor: "36A41D1F", darkColor: "36A41D14", contrastLightColor: "56B21F1F", contrastDarkColor: "18891814"))
            let positiveBackgroundTapState = tm.hexColor(for: .positiveBackgroundTapState)
            XCTAssertEqual(positiveBackgroundTapState, HexColor(lightColor: "36A41D38", darkColor: "36A41D29", contrastLightColor: "56B21F38", contrastDarkColor: "18891829"))
            let criticalBackground = tm.hexColor(for: .criticalBackground)
            XCTAssertEqual(criticalBackground, HexColor(lightColor: "E765001F", darkColor: "E7650014", contrastLightColor: "F58F001F", contrastDarkColor: "C3550014"))
            let criticalBackgroundTapState = tm.hexColor(for: .criticalBackgroundTapState)
            XCTAssertEqual(criticalBackgroundTapState, HexColor(lightColor: "E7650038", darkColor: "E7650029", contrastLightColor: "F58F0038", contrastDarkColor: "C3550029"))
            let informationBackground = tm.hexColor(for: .informationBackground)
            XCTAssertEqual(informationBackground, HexColor(lightColor: "1B90FF1F", darkColor: "1B90FF14", contrastLightColor: "3399FF1F", contrastDarkColor: "0070F014"))
            let informationBackgroundTapState = tm.hexColor(for: .informationBackgroundTapState)
            XCTAssertEqual(informationBackgroundTapState, HexColor(lightColor: "1B90FF38", darkColor: "1B90FF29", contrastLightColor: "3399FF38", contrastDarkColor: "0070F029"))
            let neutralBackground = tm.hexColor(for: .neutralBackground)
            XCTAssertEqual(neutralBackground, HexColor(lightColor: "5B738B1F", darkColor: "5B738B14", contrastLightColor: "8799AB1F", contrastDarkColor: "5B738B14"))
            let neutralBackgroundTapState = tm.hexColor(for: .neutralBackgroundTapState)
            XCTAssertEqual(neutralBackgroundTapState, HexColor(lightColor: "5B738B38", darkColor: "5B738B29", contrastLightColor: "8799AB38", contrastDarkColor: "5B738B29"))
            let separator = tm.hexColor(for: .separator)
            XCTAssertEqual(separator, HexColor(lightColor: "8396A85E", darkColor: "5B738B5E", contrastLightColor: "A9B4BE5E", contrastDarkColor: "354A5F5E"))
            let separatorOpaque = tm.hexColor(for: .separatorOpaque)
            XCTAssertEqual(separatorOpaque, HexColor(lightColor: "8396A8D4", darkColor: "5B738BD4", contrastLightColor: "A9B4BED4", contrastDarkColor: "354A5FD4"))
            let header = tm.hexColor(for: .header)
            XCTAssertEqual(header, HexColor(lightColor: "161C21FF", darkColor: "FFFFFFFF", elevatedLightColor: "242E38FF", contrastLightColor: "1D252CFF", contrastDarkColor: "FFFFFFFF", elevatedContrastLightColor: "2A3540FF"))
            let headerBlended = tm.hexColor(for: .headerBlended)
            XCTAssertEqual(headerBlended, HexColor(lightColor: "13181DE6", darkColor: "FFFFFFD9", elevatedLightColor: "1F272FE6", contrastLightColor: "191F26DE6", contrastDarkColor: "FFFFFFD9", elevatedContrastLightColor: "242E38E6"))
            let barTransparent = tm.hexColor(for: .barTransparent)
            XCTAssertEqual(barTransparent, HexColor(lightColor: "12171CD9", darkColor: "12171CD9", contrastLightColor: "000000D9", contrastDarkColor: "000000D9"))
            let contrastElement = tm.hexColor(for: .contrastElement)
            XCTAssertEqual(contrastElement, HexColor(lightColor: "8396A8FF", darkColor: "5B738BFF", contrastLightColor: "96A6B5FF", contrastDarkColor: "354A5FFF"))
            let footer = tm.hexColor(for: .footer)
            XCTAssertEqual(footer, HexColor(lightColor: "192027FF", darkColor: "FFFFFFFF", elevatedLightColor: "1F272FE6", contrastLightColor: "1C242BFF", contrastDarkColor: "FFFFFFFF", elevatedContrastLightColor: "2B3641FF"))
            let cellBackground = tm.hexColor(for: .cellBackground)
            XCTAssertEqual(cellBackground, HexColor(lightColor: "22354800", darkColor: "FFFFFF00", contrastLightColor: "1A273300", contrastDarkColor: "FFFFFF00"))
            let chrome = tm.hexColor(for: .chrome)
            XCTAssertEqual(chrome, HexColor(lightColor: "000000BF", darkColor: "FFFFFFD9", elevatedLightColor: "171D23BF", contrastLightColor: "000000E6", contrastDarkColor: "FFFFFFE6", elevatedContrastLightColor: "192024E6"))
            let chromeSecondary = tm.hexColor(for: .chromeSecondary)
            XCTAssertEqual(chromeSecondary, HexColor(lightColor: "161C21BF", darkColor: "FFFFFFD9", elevatedLightColor: "242D37BF", contrastLightColor: "1D252AE6", contrastDarkColor: "FFFFFFE6", elevatedContrastLightColor: "212B30E6"))
            let cardShadow = tm.hexColor(for: .cardShadow)
            XCTAssertEqual(cardShadow, HexColor(lightColor: "0000004D", darkColor: "5B738B14", contrastLightColor: "0000004D", contrastDarkColor: "00000014"))
            let sectionShadow = tm.hexColor(for: .sectionShadow)
            XCTAssertEqual(sectionShadow, HexColor(lightColor: "0000005E", darkColor: "5B738B3D", contrastLightColor: "0000005E", contrastDarkColor: "0000003D"))
            let accentLabel1 = tm.hexColor(for: .accentLabel1)
            XCTAssertEqual(accentLabel1, HexColor(lightColor: "FFDF72FF", darkColor: "A93E00FF", contrastLightColor: "FFF3B8FF", contrastDarkColor: "702100FF"))
            let accentLabel2 = tm.hexColor(for: .accentLabel2)
            XCTAssertEqual(accentLabel2, HexColor(lightColor: "FFB2D2FF", darkColor: "AA0808FF", contrastLightColor: "FFE0F0FF", contrastDarkColor: "7F0505FF"))
            let accentLabel3 = tm.hexColor(for: .accentLabel3)
            XCTAssertEqual(accentLabel3, HexColor(lightColor: "FECBDAFF", darkColor: "BA066CFF", contrastLightColor: "FFE5EEFF", contrastDarkColor: "6F014AFF"))
            let accentLabel4 = tm.hexColor(for: .accentLabel4)
            XCTAssertEqual(accentLabel4, HexColor(lightColor: "FFAFEDFF", darkColor: "A110C2FF", contrastLightColor: "FFE0F5FF", contrastDarkColor: "510080FF"))
            let accentLabel5 = tm.hexColor(for: .accentLabel5)
            XCTAssertEqual(accentLabel5, HexColor(lightColor: "D3B6FFFF", darkColor: "470CEDFF", contrastLightColor: "ECE5FFFF", contrastDarkColor: "28119CFF"))
            let accentLabel6 = tm.hexColor(for: .accentLabel6)
            XCTAssertEqual(accentLabel6, HexColor(lightColor: "A6E0FFFF", darkColor: "0057D2FF", contrastLightColor: "D1EFFFFF", contrastDarkColor: "002A85FF"))
            let accentLabel7 = tm.hexColor(for: .accentLabel7)
            XCTAssertEqual(accentLabel7, HexColor(lightColor: "64EDD2FF", darkColor: "046C7AFF", contrastLightColor: "C2FCEEFF", contrastDarkColor: "02404BFF"))
            let accentLabel8 = tm.hexColor(for: .accentLabel8)
            XCTAssertEqual(accentLabel8, HexColor(lightColor: "BDE986FF", darkColor: "256F3AFF", contrastLightColor: "EAF4C7FF", contrastDarkColor: "164323FF"))
            let accentLabel10 = tm.hexColor(for: .accentLabel10)
            XCTAssertEqual(accentLabel10, HexColor(lightColor: "D5DADDFF", darkColor: "354A5FFF", contrastLightColor: "EAECEEFF", contrastDarkColor: "223548FF"))
            let accentBackground1 = tm.hexColor(for: .accentBackground1)
            XCTAssertEqual(accentBackground1, HexColor(lightColor: "8D2A00FF", darkColor: "FFF3B8FF", contrastLightColor: "853100FF", contrastDarkColor: "FFE17AFF"))
            let accentBackground2 = tm.hexColor(for: .accentBackground2)
            XCTAssertEqual(accentBackground2, HexColor(lightColor: "840606FF", darkColor: "FFD5EAFF", contrastLightColor: "9C0707FF", contrastDarkColor: "FFBDD8FF"))
            let accentBackground3 = tm.hexColor(for: .accentBackground3)
            XCTAssertEqual(accentBackground3, HexColor(lightColor: "9B015DFF", darkColor: "FFDCE8FF", contrastLightColor: "8B0450FF", contrastDarkColor: "FFC2D7FF"))
            let accentBackground4 = tm.hexColor(for: .accentBackground4)
            XCTAssertEqual(accentBackground4, HexColor(lightColor: "7800A4FF", darkColor: "FFDCF3FF", contrastLightColor: "800099FF", contrastDarkColor: "FFB8EFFF"))
            let accentBackground5 = tm.hexColor(for: .accentBackground5)
            XCTAssertEqual(accentBackground5, HexColor(lightColor: "2C13ADFF", darkColor: "E2D8FFFF", contrastLightColor: "440CE4FF", contrastDarkColor: "DDC7FFFF"))
            let accentBackground6 = tm.hexColor(for: .accentBackground6)
            XCTAssertEqual(accentBackground6, HexColor(lightColor: "0040B0FF", darkColor: "D1EFFFFF", contrastLightColor: "0046A8FF", contrastDarkColor: "A3DFFFFF"))
            let accentBackground7 = tm.hexColor(for: .accentBackground7)
            XCTAssertEqual(accentBackground7, HexColor(lightColor: "035663FF", darkColor: "C2FCEEFF", contrastLightColor: "03535EFF", contrastDarkColor: "83F1DBFF"))
            let accentBackground8 = tm.hexColor(for: .accentBackground8)
            XCTAssertEqual(accentBackground8, HexColor(lightColor: "1E592FFF", darkColor: "EBF5CBFF", contrastLightColor: "1C542CFF", contrastDarkColor: "B6E779FF"))
            let accentBackground9 = tm.hexColor(for: .accentBackground9)
            XCTAssertEqual(accentBackground9, HexColor(lightColor: "511F89FF", darkColor: "DDCCF0FF", contrastLightColor: "401E67FF", contrastDarkColor: "D3BEFFFF"))
            let accentBackground10 = tm.hexColor(for: .accentBackground10)
            XCTAssertEqual(accentBackground10, HexColor(lightColor: "223548FF", darkColor: "EAECEEFF", contrastLightColor: "354A5FFF", contrastDarkColor: "D5DADDFF"))
            let red9 = tm.hexColor(for: .red9)
            XCTAssertEqual(red9, HexColor(lightColor: "FFB2D2FF", darkColor: "840606FF", contrastLightColor: "FFD6EBFF", contrastDarkColor: "4E0303FF"))

            let mango2 = tm.hexColor(for: .mango2)
            XCTAssertEqual(mango2, HexColor(lightColor: "6D1900FF", darkColor: "FFF3B8FF", contrastLightColor: "611700FF", contrastDarkColor: "FFE17AFF"))
            let mango3 = tm.hexColor(for: .mango3)
            XCTAssertEqual(mango3, HexColor(lightColor: "8D2A00FF", darkColor: "FFDF72FF", contrastLightColor: "7A2500FF", contrastDarkColor: "FFCB52FF"))
            let mango5 = tm.hexColor(for: .mango5)
            XCTAssertEqual(mango5, HexColor(lightColor: "C35500FF", darkColor: "FFB300FF", contrastLightColor: "993800FF", contrastDarkColor: "F58F00FF"))
            let mango6 = tm.hexColor(for: .mango6)
            XCTAssertEqual(mango6, HexColor(lightColor: "E76500FF", darkColor: "E76500FF", contrastLightColor: "C25400FF", contrastDarkColor: "C35500FF"))
            let mango7 = tm.hexColor(for: .mango7)
            XCTAssertEqual(mango7, HexColor(lightColor: "FFB300FF", darkColor: "C35500FF", contrastLightColor: "EBA400FF", contrastDarkColor: "853100FF"))
            let mango8 = tm.hexColor(for: .mango8)
            XCTAssertEqual(mango8, HexColor(lightColor: "FFC933FF", darkColor: "A93E00FF", contrastLightColor: "FFD970FF", contrastDarkColor: "702100FF"))

            let green3 = tm.hexColor(for: .green3)
            XCTAssertEqual(green3, HexColor(lightColor: "1E592FFF", darkColor: "BDE986FF", contrastLightColor: "184927FF", contrastDarkColor: "93DC38FF"))
            let green4 = tm.hexColor(for: .green4)
            XCTAssertEqual(green4, HexColor(lightColor: "256F3AFF", darkColor: "97DD40FF", contrastLightColor: "1D5827FF", contrastDarkColor: "62CC24FF"))
            let green5 = tm.hexColor(for: .green5)
            XCTAssertEqual(green5, HexColor(lightColor: "188918FF", darkColor: "5DC122FF", contrastLightColor: "216327FF", contrastDarkColor: "56B21FFF"))
            let green7 = tm.hexColor(for: .green7)
            XCTAssertEqual(green7, HexColor(lightColor: "5DC122FF", darkColor: "188918FF", contrastLightColor: "5FC723FF", contrastDarkColor: "1C542CFF"))
            let green9 = tm.hexColor(for: .green9)
            XCTAssertEqual(green9, HexColor(lightColor: "BDE986FF", darkColor: "1E592FFF", contrastLightColor: "E0F0B2FF", contrastDarkColor: "0E2B16FF"))

            let teal2 = tm.hexColor(for: .teal2)
            XCTAssertEqual(teal2, HexColor(lightColor: "02414CFF", darkColor: "C2FCEEFF", contrastLightColor: "023640FF", contrastDarkColor: "84F1DBFF"))
            let teal3 = tm.hexColor(for: .teal3)
            XCTAssertEqual(teal3, HexColor(lightColor: "035663FF", darkColor: "64EDD2FF", contrastLightColor: "024550FF", contrastDarkColor: "3BE2C4FF"))
            let teal4 = tm.hexColor(for: .teal4)
            XCTAssertEqual(teal4, HexColor(lightColor: "046C7AFF", darkColor: "2CE0BFFF", contrastLightColor: "03535EFF", contrastDarkColor: "1ECDB2FF"))
            let teal5 = tm.hexColor(for: .teal5)
            XCTAssertEqual(teal5, HexColor(lightColor: "07838FFF", darkColor: "00CEACFF", contrastLightColor: "04606CFF", contrastDarkColor: "00B295FF"))
            let teal6 = tm.hexColor(for: .teal6)
            XCTAssertEqual(teal6, HexColor(lightColor: "049F9AFF", darkColor: "049F9AFF", contrastLightColor: "07828DFF", contrastDarkColor: "07828DFF"))
            let teal8 = tm.hexColor(for: .teal8)
            XCTAssertEqual(teal8, HexColor(lightColor: "2CE0BFFF", darkColor: "046C7AFF", contrastLightColor: "64EDD1FF", contrastDarkColor: "02404BFF"))
            let teal9 = tm.hexColor(for: .teal9)
            XCTAssertEqual(teal9, HexColor(lightColor: "64EDD2FF", darkColor: "035663FF", contrastLightColor: "A7FBE7FF", contrastDarkColor: "012A32FF"))
            let teal10 = tm.hexColor(for: .teal10)
            XCTAssertEqual(teal10, HexColor(lightColor: "C2FCEEFF", darkColor: "02414CFF", contrastLightColor: "D8FDF4FF", contrastDarkColor: "01191EFF"))
            let teal11 = tm.hexColor(for: .teal11)
            XCTAssertEqual(teal11, HexColor(lightColor: "DAFDF5FF", darkColor: "012931FF", contrastLightColor: "FFFFFFFF", contrastDarkColor: "000000FF"))

            let blue2 = tm.hexColor(for: .blue2)
            XCTAssertEqual(blue2, HexColor(lightColor: "002A86FF", darkColor: "D1EFFFFF", contrastLightColor: "002880FF", contrastDarkColor: "A3DFFFFF"))
            let blue3 = tm.hexColor(for: .blue3)
            XCTAssertEqual(blue3, HexColor(lightColor: "0040B0FF", darkColor: "A6E0FFFF", contrastLightColor: "003899FF", contrastDarkColor: "7ACCFFFF"))
            let blue4 = tm.hexColor(for: .blue4)
            XCTAssertEqual(blue4, HexColor(lightColor: "0057D2FF", darkColor: "89D1FFFF", contrastLightColor: "0046A8FF", contrastDarkColor: "5CB6FFFF"))
            let blue6 = tm.hexColor(for: .blue6)
            XCTAssertEqual(blue6, HexColor(lightColor: "1B90FFFF", darkColor: "1B90FFFF", contrastLightColor: "0070F0FF", contrastDarkColor: "0070F0FF"))
            let blue7 = tm.hexColor(for: .blue7)
            XCTAssertEqual(blue7, HexColor(lightColor: "4DB1FFFF", darkColor: "0070F2FF", contrastLightColor: "57B6FFFF", contrastDarkColor: "0046A8FF"))
            let blue8 = tm.hexColor(for: .blue8)
            XCTAssertEqual(blue8, HexColor(lightColor: "89D1FFFF", darkColor: "0057D2FF", contrastLightColor: "A3DFFFFF", contrastDarkColor: "002A85FF"))
            let blue10 = tm.hexColor(for: .blue10)
            XCTAssertEqual(blue10, HexColor(lightColor: "D1EFFFFF", darkColor: "002A86FF", contrastLightColor: "EBF8FFFF", contrastDarkColor: "00144DFF"))

            let indigo2 = tm.hexColor(for: .indigo2)
            XCTAssertEqual(indigo2, HexColor(lightColor: "1C0C6EFF", darkColor: "E2D8FFFF", contrastLightColor: "240F8AFF", contrastDarkColor: "DDC7FFFF"))
            let indigo3 = tm.hexColor(for: .indigo3)
            XCTAssertEqual(indigo3, HexColor(lightColor: "2C13ADFF", darkColor: "D3B6FFFF", contrastLightColor: "2D13AEFF", contrastDarkColor: "C2A3FFFF"))
            let indigo4 = tm.hexColor(for: .indigo4)
            XCTAssertEqual(indigo4, HexColor(lightColor: "470CEDFF", darkColor: "B894FFFF", contrastLightColor: "400BD0FF", contrastDarkColor: "AD8FFFFF"))
            let indigo5 = tm.hexColor(for: .indigo5)
            XCTAssertEqual(indigo5, HexColor(lightColor: "5D36FFFF", darkColor: "9B76FFFF", contrastLightColor: "581FF4FF", contrastDarkColor: "A180F9FF"))
            let indigo6 = tm.hexColor(for: .indigo6)
            XCTAssertEqual(indigo6, HexColor(lightColor: "7858FFFF", darkColor: "7858FFFF", contrastLightColor: "8055F6FF", contrastDarkColor: "8055F6FF"))
            let indigo7 = tm.hexColor(for: .indigo7)
            XCTAssertEqual(indigo7, HexColor(lightColor: "9B76FFFF", darkColor: "5D36FFFF", contrastLightColor: "B8A2FBFF", contrastDarkColor: "460CE4FF"))
            let indigo8 = tm.hexColor(for: .indigo8)
            XCTAssertEqual(indigo8, HexColor(lightColor: "B894FFFF", darkColor: "470CEDFF", contrastLightColor: "D4B8FFFF", contrastDarkColor: "28119CFF"))
            let indigo10 = tm.hexColor(for: .indigo10)
            
            XCTAssertEqual(indigo10, HexColor(lightColor: "E2D8FFFF", darkColor: "1C0C6EFF", contrastLightColor: "F0EBFFFF", contrastDarkColor: "0E0637FF"))
            let pink1 = tm.hexColor(for: .pink1)
            XCTAssertEqual(pink1, HexColor(lightColor: "28004AFF", darkColor: "FFF0FAFF", contrastLightColor: "340060FF", contrastDarkColor: "FFE0F5FF"))
            let pink2 = tm.hexColor(for: .pink2)
            XCTAssertEqual(pink2, HexColor(lightColor: "510080FF", darkColor: "FFDCF3FF", contrastLightColor: "4D007AFF", contrastDarkColor: "FFB8EEFF"))
            let pink3 = tm.hexColor(for: .pink3)
            XCTAssertEqual(pink3, HexColor(lightColor: "7800A4FF", darkColor: "FFAFEDFF", contrastLightColor: "640089FF", contrastDarkColor: "FF99F1FF"))
            let pink4 = tm.hexColor(for: .pink4)
            XCTAssertEqual(pink4, HexColor(lightColor: "A100C2FF", darkColor: "FF8AF0FF", contrastLightColor: "7F0099FF", contrastDarkColor: "F87CF6FF"))
            let pink5 = tm.hexColor(for: .pink5)
            XCTAssertEqual(pink5, HexColor(lightColor: "CC00DCFF", darkColor: "F65AF2FF", contrastLightColor: "9400B2FF", contrastDarkColor: "F65AF1FF"))
            let pink6 = tm.hexColor(for: .pink6)
            XCTAssertEqual(pink6, HexColor(lightColor: "F31DEDFF", darkColor: "F31DEDFF", contrastLightColor: "CC00DBFF", contrastDarkColor: "CC00DBFF"))
            let pink7 = tm.hexColor(for: .pink7)
            XCTAssertEqual(pink7, HexColor(lightColor: "F65AF2FF", darkColor: "CC00DCFF", contrastLightColor: "F781F3FF", contrastDarkColor: "7F0099FF"))
            let pink9 = tm.hexColor(for: .pink9)
            XCTAssertEqual(pink9, HexColor(lightColor: "FFAFEDFF", darkColor: "7800A4FF", contrastLightColor: "FFD1EFFF", contrastDarkColor: "400066FF"))

            let raspberry1 = tm.hexColor(for: .raspberry1)
            XCTAssertEqual(raspberry1, HexColor(lightColor: "510136FF", darkColor: "FFF0F5FF", contrastLightColor: "41002BFF", contrastDarkColor: "FFE5EEFF"))
            let raspberry2 = tm.hexColor(for: .raspberry2)
            XCTAssertEqual(raspberry2, HexColor(lightColor: "71014BFF", darkColor: "FFDCE8FF", contrastLightColor: "60003FFF", contrastDarkColor: "FFC1D6FF"))
            let raspberry3 = tm.hexColor(for: .raspberry3)
            XCTAssertEqual(raspberry3, HexColor(lightColor: "9B015DFF", darkColor: "FECBDAFF", contrastLightColor: "7E004CFF", contrastDarkColor: "FDA0BAFF"))
            let raspberry4 = tm.hexColor(for: .raspberry4)
            XCTAssertEqual(raspberry4, HexColor(lightColor: "BA066CFF", darkColor: "FEADC8FF", contrastLightColor: "940456FF", contrastDarkColor: "FD81ABFF"))
            let raspberry5 = tm.hexColor(for: .raspberry5)
            XCTAssertEqual(raspberry5, HexColor(lightColor: "FE83AEFF", darkColor: "FE83AEFF", contrastLightColor: "AD0564FF", contrastDarkColor: "FE6198FF"))
            let raspberry6 = tm.hexColor(for: .raspberry6)
            XCTAssertEqual(raspberry6, HexColor(lightColor: "FA4F96FF", darkColor: "FA4F96FF", contrastLightColor: "DD1177FF", contrastDarkColor: "E2127AFF"))
            let raspberry7 = tm.hexColor(for: .raspberry7)
            XCTAssertEqual(raspberry7, HexColor(lightColor: "FE83AEFF", darkColor: "DF1278FF", contrastLightColor: "FD8A8EFF", contrastDarkColor: "8A0450FF"))
            let raspberry8 = tm.hexColor(for: .raspberry8)
            XCTAssertEqual(raspberry8, HexColor(lightColor: "FEADC8FF", darkColor: "BA066CFF", contrastLightColor: "FDAAB1FF", contrastDarkColor: "6F014AFF"))
            let raspberry10 = tm.hexColor(for: .raspberry10)
            XCTAssertEqual(raspberry10, HexColor(lightColor: "FFDCE8FF", darkColor: "71014BFF", contrastLightColor: "FFF0F5FF", contrastDarkColor: "320021FF"))
        }

        func testPaletteV7() throws {
            let tm = ThemeManager.shared
            tm.setPaletteVersion(.v7)
            XCTAssertEqual(tm.paletteVersion?.supportedStyles().count, 195)
            XCTAssertEqual(tm.paletteVersion?.obsoletedStyles().count, 0)
            XCTAssertEqual(tm.paletteVersion?.newStyles().count, 63)
            let newStyle_grey1 = tm.hexColor(for: .grey1)
            XCTAssertEqual(newStyle_grey1, HexColor(lightColor: "12171CFF", darkColor: "F5F6F7FF", contrastLightColor: "1C242BFF", contrastDarkColor: "EAECEEFF"))
            let newStyle_primaryLabel = tm.hexColor(for: .primaryLabel)
            XCTAssertEqual(newStyle_primaryLabel, HexColor(lightColor: "F5F6F7FF", darkColor: "223548FF", contrastLightColor: "FFFFFFFF", contrastDarkColor: "000000FF"))
            let obsoletedStyle_line = tm.hexColor(for: .line)
            XCTAssertEqual(obsoletedStyle_line, HexColor(lightColor: "8696A9", darkColor: "89919A"))
            let obsoletedStyle_negative = tm.hexColor(for: .negative)
            XCTAssertEqual(obsoletedStyle_negative, HexColor(lightColor: "FF8888", darkColor: "BB0000"))
        }
    
        func testPaletteV6() throws {
            let tm = ThemeManager.shared
            tm.setPaletteVersion(.v6)
            XCTAssertEqual(tm.paletteVersion?.supportedStyles().count, 132)
            XCTAssertEqual(tm.paletteVersion?.obsoletedStyles().count, 38)
            XCTAssertEqual(tm.paletteVersion?.newStyles().count, 78)
            let newStyle_grey1 = tm.hexColor(for: .grey1)
            XCTAssertEqual(newStyle_grey1, HexColor(lightColor: "111D29FF", darkColor: "F5F6F7FF", contrastLightColor: "000000FF", contrastDarkColor: "E8EBEDFF"))
            let newStyle_primaryLabel = tm.hexColor(for: .primaryLabel)
            XCTAssertEqual(newStyle_primaryLabel, HexColor(lightColor: "F5F6F7FF", darkColor: "223548FF", contrastLightColor: "FFFFFFFF", contrastDarkColor: "000000FF"))
            let obsoletedStyle_line = tm.hexColor(for: .line)
            XCTAssertEqual(obsoletedStyle_line, HexColor(lightColor: "8696A9", darkColor: "89919A"))
            let obsoletedStyle_negative = tm.hexColor(for: .negative)
            XCTAssertEqual(obsoletedStyle_negative, HexColor(lightColor: "FF8888", darkColor: "BB0000"))
        }
    
        func testPaletteV5() throws {
            let tm = ThemeManager.shared
            tm.setPaletteVersion(.v5)
            let v5Style_primary1 = tm.hexColor(for: .primary1)
            XCTAssertEqual(v5Style_primary1, HexColor(lightColor: "FAFAFA", darkColor: "32363A"))
            let v5Style_tintColor = tm.hexColor(for: .tintColor)
            XCTAssertEqual(v5Style_tintColor, HexColor(lightColor: "91C8F6", darkColor: "0A6ED1", contrastLightColor: "91C8F6", contrastDarkColor: "91C8F6"))
            let v5Style_primaryLabel = tm.hexColor(for: .primaryLabel)
            XCTAssertEqual(v5Style_primaryLabel, HexColor(lightColor: "FAFAFA", darkColor: "32363A", contrastLightColor: "FAFAFA", contrastDarkColor: "FAFAFA"))
            let v5Style_shell = tm.hexColor(for: .shell)
            XCTAssertEqual(v5Style_shell, HexColor(lightColor: "2C3D4F", darkColor: "354A5F"))
            let v5FutureStyle_cardShadow = tm.hexColor(for: .cardShadow)
            XCTAssertEqual(v5FutureStyle_cardShadow, HexColor(lightColor: "000000"))
        }
    
        func testPaletteV4() throws {
            let tm = ThemeManager.shared
            tm.setPaletteVersion(.v4)
            let v4Style_primary1 = tm.hexColor(for: .primary1)
            XCTAssertEqual(v4Style_primary1, HexColor(lightColor: "FFFFFF", darkColor: "32363A"))
            let v4Style_tintColor = tm.hexColor(for: .tintColor)
            XCTAssertEqual(v4Style_tintColor, HexColor(lightColor: "D1E8FF", darkColor: "0A6ED1"))
            let v4Style_line = tm.hexColor(for: .line)
            XCTAssertEqual(v4Style_line, HexColor(lightColor: "38383A", darkColor: "F3F3F3"))
            let v4Style_negative = tm.hexColor(for: .negative)
            XCTAssertEqual(v4Style_negative, HexColor(lightColor: "FF453A", darkColor: "BB0000"))
            let v4FutureStyle_primaryLabel = tm.hexColor(for: .primaryLabel)
            XCTAssertEqual(v4FutureStyle_primaryLabel, HexColor(lightColor: "FFFFFF", darkColor: "32363A"))
        }
    
        func testSetColor() throws {
            let tm = ThemeManager.shared
            tm.setPaletteVersion(.v7)
        
            XCTAssertEqual(tm.developerOverrides.keys.count, 0)
        
            tm.setColor(.red, for: .grey1, variant: .light)
            tm.setColor(.blue, for: .grey1, variant: .dark)
        
            XCTAssertEqual(tm.developerOverrides.keys.count, 1)
            XCTAssertEqual(tm.developerOverrides[.grey1]?[.light], .red)
            XCTAssertEqual(tm.developerOverrides[.grey1]?[.dark], .blue)
        }
    
        func testSetColorIntegration() throws {
            let tm = ThemeManager.shared
            tm.setPaletteVersion(.v7)
        
            let expectedColor = Color.red
            tm.setColor(expectedColor, for: .grey1, variant: .light)
        
            let actualColor = Color.preferredColor(.grey1, background: .darkConstant)
        
            XCTAssertEqual(expectedColor.toHex(), actualColor.toHex())
        }
    
        func testSetHexColor() throws {
            let tm = ThemeManager.shared
            tm.setPaletteVersion(.v7)
        
            XCTAssertEqual(tm.developerOverrides.keys.count, 0)
        
            tm.setHexColor("223548FF", for: .grey1, variant: .light)
        
            XCTAssertEqual(tm.developerOverrides.keys.count, 1)
            XCTAssertEqual(tm.developerOverrides[.grey1]?[.light]?.toHex(), "223548")
        }
    
        func testSetHexColorIntegration() throws {
            let tm = ThemeManager.shared
            tm.setPaletteVersion(.v7)
        
            tm.setHexColor("223548FF", for: .grey1, variant: .light)
            XCTAssertEqual(Color.preferredColor(.grey1, background: .darkConstant).toHex(), "223548")
        }
    
        func testSetHexColorIntegration_3_digits() throws {
            let tm = ThemeManager.shared
            tm.setPaletteVersion(.v7)
        
            tm.setHexColor("#f46", for: .tintColor, variant: .light)
            let tintColor = Color.preferredColor(.tintColor, background: .darkConstant)
            XCTAssertEqual(tintColor.toHex(), "FF4466")
        }
    #else
        func testLatestColorStyle() throws {
            XCTAssertEqual(ColorStyle.allCases.count, 26)
        }
    
        func testWatchPaletteV1() throws {
            let tm = ThemeManager.shared
            tm.setPaletteVersion(.v1)
            XCTAssertEqual(tm.paletteVersion?.supportedStyles().count, 26)
        }
    #endif
}
