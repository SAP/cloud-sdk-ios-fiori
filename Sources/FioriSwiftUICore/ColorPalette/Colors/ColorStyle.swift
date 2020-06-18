//
//  ColorStyle.swift
//  FioriSwiftUICore
//
//  Created by Guo, Justin on 6/14/20.
//

public enum ColorStyle: String, CaseIterable {
    /// Dynamic text color, with variants for light and dark color schemes.
    /// (dark variant) ![](https://dummyimage.com/48x18/32636A.png&text=+)        Hex color: 32636A
    /// (light variant) ![](https://dummyimage.com/48x18/FFFFFF.png&text=+)        Hex color: FFFFFF
    case primary1
    /// Dynamic secondary text color, with variants for light and dark color schemes.
    /// (dark variant) ![](https://dummyimage.com/48x18/515559.png&text=+)        Hex color: 515559
    /// (light variant) ![](https://dummyimage.com/48x18/FFFFFF.png&text=+)        Hex color: FFFFFF
    case primary2
    /// Dynamic secondary text color, with variants for light and dark color schemes.
    /// (dark variant) ![](https://dummyimage.com/48x18/6A6D70.png&text=+)        Hex color: 6A6D70
    /// (light variant) ![](https://dummyimage.com/48x18/EBEBF5.png&text=+)        Hex color: EBEBF5        alpha: 60%
    case primary3
    /// Dynamic background and accent color, used in any color scheme.
    /// (dark variant) ![](https://dummyimage.com/48x18/CCCCCC.png&text=+)          Hex color: CCCCCC
    /// (light variant) ![](https://dummyimage.com/48x18/EBEBF5.png&text=+)          Hex color: EBEBF599 (alpha: 30%)
    case primary4
    /// Dynamic background and accent color, used in any color scheme.
    /// (dark variant) ![](https://dummyimage.com/48x18/FAFAFA.png&text=+)          Hex color: FAFAFA
    /// (light variant) ![](https://dummyimage.com/48x18/2C2C2E.png&text=+)          Hex color: 2C2C2E
    case primary5
    /// Dynamic background and accent color, for use in header and cell background.
    /// (dark variant) ![](https://dummyimage.com/48x18/FFFFFF.png&text=+)          Hex color: FFFFFF
    /// (light variant) ![](https://dummyimage.com/48x18/1C1C1E.png&text=+)          Hex color: 1C1C1E
    case primary6
    /// Standard background and accent color that is used in tag outline.  ![](https://dummyimage.com/48x18/74777A.png&text=+)          Hex color: 74777A
    case primary7
    /// Standard background and accent color.  ![](https://dummyimage.com/48x18/192835.png&text=+)          Hex color: 192835
    case primary8
    /// Dynamic background and accent color.
    /// (dark variant) ![](https://dummyimage.com/48x18/EEEEEF.png&text=+)          Hex color: EEEEEF
    /// (light variant) ![](https://dummyimage.com/48x18/48484A.png&text=+)          Hex color: 48484A
    case primary9
    /// Standard universal background and accent color.  ![](https://dummyimage.com/48x18/89919A.png&text=+)          Hex color: 89919A
    case primary10
    
    /// Wraps `tintColorLight` and `tintColorDark`.
    /// Use `Color.preferredColor(forStyle:background:)` to select appropriate variant.
    /// (dark variant) ![](https://dummyimage.com/48x18/0A6ED1.png&text=+)          Hex color: 0A6ED1
    /// (light variant) ![](https://dummyimage.com/48x18/D1E8FF.png&text=+)          Hex color: D1E8FF
    case tintColor
    /// Default light `tintColor`.
    /// (dark variant) ![](https://dummyimage.com/48x18/D1E8FF.png&text=+)          Hex color: D1E8FF
    /// (light variant) ![](https://dummyimage.com/48x18/0A84FF.png&text=+)          Hex color: 0A84FF
    case tintColorLight
    /// Default dark `tintColor`.
    /// (dark variant) ![](https://dummyimage.com/48x18/0A6ED1.png&text=+)          Hex color: 0A6ED1
    /// (light variant) ![](https://dummyimage.com/48x18/0A84FF.png&text=+)          Hex color: 0A84FF
    case tintColorDark
    /// Wraps `tintColorTapStateLight` and `tintColorTapStateDark`.
    /// Use `Color.preferredColor(forStyle:background:)` to select appropriate variant.
    /// (dark variant) ![](https://dummyimage.com/48x18/0854A1.png&text=+)          Hex color: 0854A1
    /// (light variant) ![](https://dummyimage.com/48x18/0A84FF.png&text=+)          Hex color: 0A84FF66 (alpha: 40%)
    case tintColorTapState
    /// Tap state (`UIControlState.highlighted`) color for control with `tintColor` equal to `tintColorLight`.  Should not be used as text color.
    /// (dark variant) ![](https://dummyimage.com/48x18/74A5D5.png&text=+)          Hex color: 74A5D5
    /// (light variant) ![](https://dummyimage.com/48x18/0A84FF.png&text=+)          Hex color: 0A84FF66 (alpha: 40%)
    case tintColorTapStateLight
    /// Tap state (`UIControlState.highlighted`) color for control with `tintColor` equal to `tintColorDark`.  May be used as text color.
    /// (dark variant) ![](https://dummyimage.com/48x18/0854A1.png&text=+)          Hex color: 0854A1
    /// (light variant) ![](https://dummyimage.com/48x18/0A84FF.png&text=+)          Hex color: 0A84FF66 (alpha: 40%)
    case tintColorTapStateDark
    
    /// Standard color for `UINavigationBar`.
    /// (dark variant) ![](https://dummyimage.com/48x18/354A5F.png&text=+)          Hex value: 354A5F
    /// (light variant) ![](https://dummyimage.com/48x18/161616.png&text=+)          Hex value: 161616CC (alpha: 80%)
    case navigationBar
    /// Top gradient color, originating at SAP Fiori `UINavigationBar`.  ![](https://dummyimage.com/48x18/445E75.png&text=+) Hex color: 445E75
    @available(*, deprecated, renamed: "navigationBar")
    public static let backgroundGradientTop = ColorStyle.navigationBar
    /// Bottom gradient color, originating at SAP Fiori `UINavigationBar`.  ![](https://dummyimage.com/48x18/3F566B.png&text=+) Hex color: 3F566B
    @available(*, deprecated, renamed: "navigationBar")
    public static let backgroundGradientBottom = ColorStyle.navigationBar
    
    /// Standard background color, with variants for light and dark color schemes.
    /// (dark variant) ![](https://dummyimage.com/48x18/F3F3F3.png&text=+)          Hex value: F3F3F3
    /// (light variant) ![](https://dummyimage.com/48x18/000000.png&text=+)          Hex value: 000000
    case backgroundBase
    /// Standard cell background color when being tapped, with variants for light and dark color schemes.
    /// (dark variant) ![](https://dummyimage.com/48x18/EEEEEF.png&text=+)          Hex color: EEEEEF
    /// (light variant) ![](https://dummyimage.com/48x18/47474C.png&text=+)          Hex color: 47474CCC (alpha: 80%)
    case cellBackgroundTapState
    /// Standard line color, with variants for light and dark color schemes.
    /// (dark variant) ![](https://dummyimage.com/48x18/F3F3F3.png&text=+)          Hex color: F3F3F3
    /// (light variant) ![](https://dummyimage.com/48x18/38383A.png&text=+)          Hex value: 38383A
    case line
    /// Standard text color, with variants for light and dark color variants.
    /// Use `UIColor.preferredFioriColor(forStyle: background:)` to select appropriate variant.
    /// (dark variant) ![](https://dummyimage.com/48x18/5899DA.png&text=+)        Hex color: 5899DA
    /// (light variant) ![](https://dummyimage.com/48x18/74B3F0.png&text=+)        Hex color: 74B3F0
    
    case chart1
    /// ![](https://dummyimage.com/48x18/E8743B.png&text=+)        Hex color: E8743B
    case chart2
    /// ![](https://dummyimage.com/48x18/19A979.png&text=+)        Hex color: 19A979
    case chart3
    /// ![](https://dummyimage.com/48x18/ED4A7B.png&text=+)        Hex color: ED4A7B
    case chart4
    /// ![](https://dummyimage.com/48x18/945ECF.png&text=+)        Hex color: 945ECF
    case chart5
    /// ![](https://dummyimage.com/48x18/13A4B4.png&text=+)        Hex color: 13A4B4
    case chart6
    /// ![](https://dummyimage.com/48x18/525DF4.png&text=+)        Hex color: 525DF4
    case chart7
    /// ![](https://dummyimage.com/48x18/BF399E.png&text=+)        Hex color: BF399E
    case chart8
    /// ![](https://dummyimage.com/48x18/6C8893.png&text=+)        Hex color: 6C8893
    case chart9
    /// ![](https://dummyimage.com/48x18/EE6868.png&text=+)        Hex color: EE6868
    case chart10
    /// ![](https://dummyimage.com/48x18/2F6497.png&text=+)        Hex color: 2F6497
    case chart11
    
    /// Semantic color for "negative" (bad) value, with light and dark color variants.
    /// (dark variant) ![](https://dummyimage.com/48x18/BB0000.png&text=+)        Hex color: BB0000
    /// (light variant) ![](https://dummyimage.com/48x18/FF453A.png&text=+)        Hex color: FF453A
    case negative
    /// Semantic color for "critical" (risky) value, with light and dark color variants.
    /// (dark variant) ![](https://dummyimage.com/48x18/E9730C.png&text=+)        Hex color: E9730C
    /// (light variant) ![](https://dummyimage.com/48x18/FF9F0A.png&text=+)        Hex color: FF9F0A
    case critical
    /// Semantic color for "positive" (good) value, with light and dark color variants.
    /// (dark variant) ![](https://dummyimage.com/48x18/107E3E.png&text=+)        Hex color: 107E3E
    /// (light variant) ![](https://dummyimage.com/48x18/32D74B.png&text=+)        Hex color: 32D74B
    case positive
    
    /// Semantic stroke color for line when stock goes up.
    /// (light variant) ![](https://dummyimage.com/48x18/19A979.png&text=+)        Hex color: 19A979
    case stockUpStroke
    /// Semantic stroke color for line when stock goes down.
    /// (light variant) ![](https://dummyimage.com/48x18/AB2217.png&text=+)        Hex color: AB2217
    case stockDownStroke
    
    /// ![](https://dummyimage.com/48x18/2E4A62.png&text=+)        Hex color: 2E4A62
    case map1
    /// ![](https://dummyimage.com/48x18/56840E.png&text=+)        Hex color: 56840E
    case map2
    /// ![](https://dummyimage.com/48x18/A63788.png&text=+)        Hex color: A63788
    case map3
    /// ![](https://dummyimage.com/48x18/0079C6.png&text=+)        Hex color: 0079C6
    case map4
    /// ![](https://dummyimage.com/48x18/6B4EA0.png&text=+)        Hex color: 6B4EA0
    case map5
    /// ![](https://dummyimage.com/48x18/A16B00.png&text=+)        Hex color: A16B00
    case map6
    /// ![](https://dummyimage.com/48x18/0B6295.png&text=+)        Hex color: 0B6295
    case map7
    /// ![](https://dummyimage.com/48x18/D0R774.png&text=+)        Hex color: D0R774
    case map8
    /// ![](https://dummyimage.com/48x18/1C857A.png&text=+)        Hex color: 1C857A
    case map9
    /// ![](https://dummyimage.com/48x18/C45300.png&text=+)        Hex color: C45300
    case map10
    /// ![](https://dummyimage.com/48x18/1B6DD2.png&text=+)        Hex color: 1B6DD2
    case esriEdit
    
    // MARK: - Fiori 3
    case negativeBackground
    case positiveBackground
    case criticalBackground
    case informationBackground
    case accent1
    case accent1b
    case accent2
    case accent2b
    case accent3
    case accent4
    case accent5
    case accent6
    case accent6b
    case accent7
    case accent7b
    case accent8
    case accent9
    case accent10
    case accent10b
}
