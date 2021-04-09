public enum ColorStyle: String, CaseIterable {
    // MARK: - Basic Palette Colors
    
    /// Standard base color, with variants for light and dark color schemes.
    /// (dark variant) ![](https://dummyimage.com/48x18/354A5F.png&text=+)        Hex color: 354A5F
    /// (light variant) ![](https://dummyimage.com/48x18/2C3D4F.png&text=+)        Hex color: 2C3D4F
    case shell
    
    /// Standard background color, with variants for light and dark color schemes.
    /// (dark variant) ![](https://dummyimage.com/48x18/EDEFF0.png&text=+)        Hex color: EDEFF0
    /// (light variant) ![](https://dummyimage.com/48x18/1C2228.png&text=+)        Hex color: 1C2228
    case background1
    
    /// Standard background color, with variants for light and dark color schemes.
    /// (dark variant) ![](https://dummyimage.com/48x18/F7F7F7.png&text=+)        Hex color: F7F7F7
    /// (light variant) ![](https://dummyimage.com/48x18/232A31.png&text=+)        Hex color: 232A31
    case background2
    
    /// Standard line color, with variants for light and dark color schemes.
    /// (dark variant) ![](https://dummyimage.com/48x18/89919A.png&text=+)          Hex color: 89919A
    /// (light variant) ![](https://dummyimage.com/48x18/8696A9.png&text=+)          Hex value: 8696A9
    case line
    
    /// Standard line color, with variants for light and dark color schemes.
    /// (dark variant) ![](https://dummyimage.com/48x18/89919A.png&text=+)          Hex color: 89919A69 (alpha: 41%)
    /// (light variant) ![](https://dummyimage.com/48x18/8696A9.png&text=+)          Hex value: 8696A945 (alpha: 27%)
    case separator
    
    /// Standard text color, with variants for light and dark color schemes.
    /// (dark variant) ![](https://dummyimage.com/48x18/32636A.png&text=+)        Hex color: 32636A
    /// (light variant) ![](https://dummyimage.com/48x18/FAFAFA.png&text=+)        Hex color: FAFAFA
    case primary1
    
    /// Standard secondary text color, with variants for light and dark color schemes.
    /// (dark variant) ![](https://dummyimage.com/48x18/515456.png&text=+)        Hex color: 515456
    /// (light variant) ![](https://dummyimage.com/48x18/EEF0F1.png&text=+)        Hex color: EEF0F1
    case primary2
    
    /// Standard secondary text color, with variants for light and dark color schemes.
    /// (dark variant) ![](https://dummyimage.com/48x18/6A6D70.png&text=+)        Hex color: 6A6D70
    /// (light variant) ![](https://dummyimage.com/48x18/D3D7D9.png&text=+)        Hex color: D3D7D9
    case primary3
    
    /// Standard background and accent color, used in any color scheme.
    /// (dark variant) ![](https://dummyimage.com/48x18/CCCCCC.png&text=+)          Hex color: CCCCCC
    /// (light variant) ![](https://dummyimage.com/48x18/687D94.png&text=+)          Hex color: 687D94
    case primary4
    
    /// Standard background and accent color, used in any color scheme.
    /// (dark variant) ![](https://dummyimage.com/48x18/FAFAFA.png&text=+)          Hex color: FAFAFA
    /// (light variant) ![](https://dummyimage.com/48x18/23303E.png&text=+)          Hex color: 23303E
    case primary5
    
    /// Standard background and accent color, for use in header and cell background.
    /// (dark variant) ![](https://dummyimage.com/48x18/FFFFFF.png&text=+)          Hex color: FFFFFF
    /// (light variant) ![](https://dummyimage.com/48x18/29313A.png&text=+)          Hex color: 29313A
    case primary6
    
    /// Standard background and accent color that is used in tag outline.
    /// (dark variant) ![](https://dummyimage.com/48x18/74777A.png&text=+)          Hex color: 74777A
    /// (light variant) ![](https://dummyimage.com/48x18/B8BEC1.png&text=+)          Hex color: B8BEC1
    case primary7
    
    /// Background and accent color that is mainly used with dark color scheme.
    /// ![](https://dummyimage.com/48x18/2F3943.png&text=+)          Hex color: 2F3943
    case primary8
    
    /// Standard background and accent color.
    /// (dark variant) ![](https://dummyimage.com/48x18/E5E5E5.png&text=+)          Hex color: E5E5E5
    /// (light variant) ![](https://dummyimage.com/48x18/3A4552.png&text=+)          Hex color: 3A4552
    case primary9
    
    /// Standard background and accent color.
    /// (dark variant) ![](https://dummyimage.com/48x18/89919A.png&text=+)          Hex color: 89919A
    /// (light variant) ![](https://dummyimage.com/48x18/8696A9.png&text=+)          Hex color: 8696A9
    case primary10
    
    /// Standard shadow color.
    /// ![](https://dummyimage.com/48x18/000000.png&text=+)          Hex color: 000000
    case shadow
    
    // MARK: - Grouped Background Colors
    
    /// Primary grouped background colors, with variants for base and elevated UI schemes.
    /// (base dark variant) ![](https://dummyimage.com/48x18/EDEFF0.png&text=+)              Hex color: EDEFF0
    /// (base light variant) ![](https://dummyimage.com/48x18/1C2228.png&text=+)              Hex color: 1C2228
    /// (elevated dark variant) ![](https://dummyimage.com/48x18/EDEFF0.png&text=+)        Hex color: EDEFF0
    /// (elevated light variant) ![](https://dummyimage.com/48x18/232A31.png&text=+)        Hex color: 232A31
    case primaryGroupedBackground
    
    /// Secondary grouped background colors, with variants for base and elevated UI schemes.
    /// (base dark variant) ![](https://dummyimage.com/48x18/FFFFFF.png&text=+)              Hex color: FFFFFF
    /// (base light variant) ![](https://dummyimage.com/48x18/232A31.png&text=+)              Hex color: 232A31
    /// (elevated dark variant) ![](https://dummyimage.com/48x18/FFFFFF.png&text=+)        Hex color: FFFFFF
    /// (elevated light variant) ![](https://dummyimage.com/48x18/29313A.png&text=+)        Hex color: 29313A
    case secondaryGroupedBackground
    
    /// Secondary grouped background colors, with variants for base and elevated UI schemes.
    /// (base dark variant) ![](https://dummyimage.com/48x18/FFFFFF.png&text=+)              Hex color: FFFFFF
    /// (base light variant) ![](https://dummyimage.com/48x18/29313A.png&text=+)              Hex color: 29313A
    /// (elevated dark variant) ![](https://dummyimage.com/48x18/FFFFFF.png&text=+)        Hex color: FFFFFF
    /// (elevated light variant) ![](https://dummyimage.com/48x18/2F3943.png&text=+)        Hex color: 2F3943
    case tertiaryGroupedBackground
    
    // MARK: - Background Colors
    
    /// Primary grouped background colors, with variants for base and elevated UI schemes.
    /// (base dark variant) ![](https://dummyimage.com/48x18/FFFFFF.png&text=+)              Hex color: FFFFFF
    /// (base light variant) ![](https://dummyimage.com/48x18/232A31.png&text=+)              Hex color: 232A31
    /// (elevated dark variant) ![](https://dummyimage.com/48x18/FFFFFF.png&text=+)        Hex color: FFFFFF
    /// (elevated light variant) ![](https://dummyimage.com/48x18/29313A.png&text=+)        Hex color: 29313A
    case primaryBackground
    
    /// Secondary grouped background colors, with variants for base and elevated UI schemes.
    /// (base dark variant) ![](https://dummyimage.com/48x18/F7F7F7.png&text=+)              Hex color: F7F7F7
    /// (base light variant) ![](https://dummyimage.com/48x18/1C2228.png&text=+)              Hex color: 1C2228
    /// (elevated dark variant) ![](https://dummyimage.com/48x18/F7F7F7.png&text=+)        Hex color: F7F7F7
    /// (elevated light variant) ![](https://dummyimage.com/48x18/232A31.png&text=+)        Hex color: 232A31
    case secondaryBackground
    
    /// Secondary grouped background colors, with variants for base and elevated UI schemes.
    /// (base dark variant) ![](https://dummyimage.com/48x18/FFFFFF.png&text=+)              Hex color: FFFFFF
    /// (base light variant) ![](https://dummyimage.com/48x18/29313A.png&text=+)              Hex color: 29313A
    /// (elevated dark variant) ![](https://dummyimage.com/48x18/FFFFFF.png&text=+)        Hex color: FFFFFF
    /// (elevated light variant) ![](https://dummyimage.com/48x18/2F3943.png&text=+)        Hex color: 2F3943
    case tertiaryBackground
    
    // MARK: - Label Colors
    
    /// Standard color for primary label.
    /// (dark variant - normal) ![](https://dummyimage.com/48x18/32363A.png&text=+)          Hex value: 32363A
    /// (light variant - normal) ![](https://dummyimage.com/48x18/FAFAFA.png&text=+)          Hex value: FAFAFA
    /// (dark variant - contrast) ![](https://dummyimage.com/48x18/FAFAFA.png&text=+)        Hex value: FAFAFA
    /// (light variant - contrast) ![](https://dummyimage.com/48x18/FAFAFA.png&text=+)        Hex value: FAFAFAB8 (alpha: 72%)
    case primaryLabel
    
    /// Standard color for secondary label.
    /// (dark variant - normal) ![](https://dummyimage.com/48x18/32363A.png&text=+)          Hex value: 32363AD9 (alpha: 85%)
    /// (light variant - normal) ![](https://dummyimage.com/48x18/FAFAFA.png&text=+)          Hex value: FAFAFAD9 (alpha: 85%)
    /// (dark variant - contrast) ![](https://dummyimage.com/48x18/FAFAFA.png&text=+)        Hex value: FAFAFAD9 (alpha: 85%)
    /// (light variant - contrast) ![](https://dummyimage.com/48x18/FAFAFA.png&text=+)        Hex value: FAFAFAD9 (alpha: 85%)
    case secondaryLabel
    
    /// Standard color for tertiary label.
    /// (dark variant - normal) ![](https://dummyimage.com/48x18/32363A.png&text=+)          Hex value: 32363AB8 (alpha: 72%)
    /// (light variant - normal) ![](https://dummyimage.com/48x18/FAFAFA.png&text=+)          Hex value: FAFAFAB8 (alpha: 72%)
    /// (dark variant - contrast) ![](https://dummyimage.com/48x18/FAFAFA.png&text=+)        Hex value: FAFAFAB8 (alpha: 72%)
    /// (light variant - contrast) ![](https://dummyimage.com/48x18/FAFAFA.png&text=+)        Hex value: FAFAFAB8 (alpha: 72%)
    case tertiaryLabel
    
    /// Standard color for quarternary label.
    /// (dark variant - normal) ![](https://dummyimage.com/48x18/32363A.png&text=+)          Hex value: 32363A8C (alpha: 55%)
    /// (light variant - normal) ![](https://dummyimage.com/48x18/FAFAFA.png&text=+)          Hex value: FAFAFA8C (alpha: 55%)
    /// (dark variant - contrast) ![](https://dummyimage.com/48x18/FAFAFA.png&text=+)        Hex value: FAFAFA8C (alpha: 55%)
    /// (light variant - contrast) ![](https://dummyimage.com/48x18/FAFAFA.png&text=+)        Hex value: FAFAFA8C (alpha: 55%)
    case quarternaryLabel
    
    // MARK: - Fill Colors
    
    /// Standard color for primary fill.
    /// (dark variant - normal) ![](https://dummyimage.com/48x18/8696A9.png&text=+)          Hex value: 8696A959 (alpha: 35%)
    /// (light variant - normal) ![](https://dummyimage.com/48x18/89919A.png&text=+)          Hex value: 89919A33 (alpha: 20%)
    /// (dark variant - contrast) ![](https://dummyimage.com/48x18/8696A9.png&text=+)        Hex value: 8696A959 (alpha: 35%)
    /// (light variant - contrast) ![](https://dummyimage.com/48x18/8696A9.png&text=+)        Hex value: 8696A959 (alpha: 35%)
    case primaryFill
    
    /// Standard color for secondary fill.
    /// (dark variant - normal) ![](https://dummyimage.com/48x18/8696A9.png&text=+)          Hex value: 8696A945 (alpha: 27%)
    /// (light variant - normal) ![](https://dummyimage.com/48x18/89919A.png&text=+)          Hex value: 89919A29 (alpha: 16%)
    /// (dark variant - contrast) ![](https://dummyimage.com/48x18/8696A9.png&text=+)        Hex value: 8696A945 (alpha: 27%)
    /// (light variant - contrast) ![](https://dummyimage.com/48x18/8696A9.png&text=+)        Hex value: 8696A945 (alpha: 27%)
    case secondaryFill
    
    /// Standard color for tertiary fill.
    /// (dark variant - normal) ![](https://dummyimage.com/48x18/8696A9.png&text=+)          Hex value: 8696A930 (alpha: 19%)
    /// (light variant - normal) ![](https://dummyimage.com/48x18/89919A.png&text=+)          Hex value: 89919A1F (alpha: 12%)
    /// (dark variant - contrast) ![](https://dummyimage.com/48x18/8696A9.png&text=+)        Hex value: 89919A30 (alpha: 19%)
    /// (light variant - contrast) ![](https://dummyimage.com/48x18/8696A9.png&text=+)        Hex value: 8696A930 (alpha: 19%)
    case tertiaryFill
    
    /// Standard color for quarternary fill.
    /// (dark variant - normal) ![](https://dummyimage.com/48x18/8696A9.png&text=+)          Hex value: 8696A91C (alpha: 11%)
    /// (light variant - normal) ![](https://dummyimage.com/48x18/89919A.png&text=+)          Hex value: 89919A14 (alpha: 8%)
    /// (dark variant - contrast) ![](https://dummyimage.com/48x18/8696A9.png&text=+)        Hex value: 89919A1C (alpha: 11%)
    /// (light variant - contrast) ![](https://dummyimage.com/48x18/8696A9.png&text=+)        Hex value: 8696A91C (alpha: 11%)
    case quarternaryFill
    
    // MARK: - Specific UI Materials Colors
    
    /// Standard background color for navigation bar or headers.
    /// (dark variant) ![](https://dummyimage.com/48x18/354A5F.png&text=+)          Hex value: 354A5F
    /// (light variant) ![](https://dummyimage.com/48x18/2C3D4F.png&text=+)          Hex value: 2C3D4F
    case header
    
    /// Blended color for navigation bar or headers.
    /// (dark variant) ![](https://dummyimage.com/48x18/FFFFFF.png&text=+)          Hex value: FFFFFFA6 (alpha: 65%)
    /// (light variant) ![](https://dummyimage.com/48x18/1C2228.png&text=+)          Hex value: 1C2228A6 (alpha: 65%)
    /// (elevated dark variant) ![](https://dummyimage.com/48x18/FFFFFF.png&text=+)        Hex color: FFFFFFA6 (alpha: 65%)
    /// (elevated light variant) ![](https://dummyimage.com/48x18/232A31.png&text=+)        Hex color: 232A31A6 (alpha: 65%)
    case headerBlended
    
    /// Transparent color for navigation bar or tap bar.
    /// (dark variant) ![](https://dummyimage.com/48x18/23303E.png&text=+)          Hex value: 23303ED9 (alpha: 85%)
    /// (light variant) ![](https://dummyimage.com/48x18/23303E.png&text=+)          Hex value: 23303ED9 (alpha: 85%)
    case barTransparent
    
    /// Standard background color for toolbar, tab bar or footers.
    /// (dark variant) ![](https://dummyimage.com/48x18/FAFAFA.png&text=+)          Hex value: FAFAFAEB (alpha: 92%)
    /// (light variant) ![](https://dummyimage.com/48x18/23303E.png&text=+)          Hex value: 23303EEB (alpha: 92%)
    case footer
    
    /// Standard cell background color, with variants for light and dark color schemes.
    /// (dark variant) ![](https://dummyimage.com/48x18/FFFFFF.png&text=+)          Hex color: FFFFFF00 (alpha: 0%)
    /// (light variant) ![](https://dummyimage.com/48x18/FFFFFF.png&text=+)          Hex color: FFFFFF00 (alpha: 0%)
    case cellBackground
    
    /// Standard cell background color when being tapped, with variants for light and dark color schemes.
    /// (dark variant) ![](https://dummyimage.com/48x18/89919A.png&text=+)          Hex color: 89919A1C (alpha: 11%)
    /// (light variant) ![](https://dummyimage.com/48x18/8696A9.png&text=+)          Hex color: 8696A91C (alpha: 11%)
    case cellBackgroundTapState
    
    /// Wraps `tintColorLight` and `tintColorDark`.
    /// Use `Color.preferredColor(forStyle:background:)` to select appropriate variant.
    /// (dark variant) ![](https://dummyimage.com/48x18/0A6ED1.png&text=+)          Hex color: 0A6ED1
    /// (light variant) ![](https://dummyimage.com/48x18/91C8F6.png&text=+)          Hex color: 91C8F6
    case tintColor
    
    /// Default light `tintColor`.
    /// (dark variant) ![](https://dummyimage.com/48x18/91C8F6.png&text=+)          Hex color: 91C8F6
    /// (light variant) ![](https://dummyimage.com/48x18/91C8F6.png&text=+)          Hex color: 91C8F6
    case tintColorLight
    
    /// Default dark `tintColor`.
    /// (dark variant) ![](https://dummyimage.com/48x18/0A6ED1.png&text=+)          Hex color: 0A6ED1
    /// (light variant) ![](https://dummyimage.com/48x18/0A6ED1.png&text=+)          Hex color: 0A6ED1
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
    
    /// Standard background color for `UINavigationBar`.
    /// (dark variant) ![](https://dummyimage.com/48x18/354A5F.png&text=+)          Hex value: 354A5F
    /// (light variant) ![](https://dummyimage.com/48x18/2C3D4F.png&text=+)          Hex value: 2C3D4F
    @available(*, deprecated, renamed: "header")
    public static let navigationBar = ColorStyle.header
    
    /// Top gradient color, originating at SAP Fiori `UINavigationBar`.  ![](https://dummyimage.com/48x18/445E75.png&text=+) Hex color: 445E75
    @available(*, deprecated, renamed: "header")
    public static let backgroundGradientTop = ColorStyle.header
    /// Bottom gradient color, originating at SAP Fiori `UINavigationBar`.  ![](https://dummyimage.com/48x18/3F566B.png&text=+) Hex color: 3F566B
    @available(*, deprecated, renamed: "header")
    public static let backgroundGradientBottom = ColorStyle.header
    /// Standard background color, with variants for light and dark color schemes.
    /// (dark variant) ![](https://dummyimage.com/48x18/F3F3F3.png&text=+)          Hex value: F3F3F3
    /// (light variant) ![](https://dummyimage.com/48x18/000000.png&text=+)          Hex value: 000000
    @available(*, deprecated, renamed: "background2")
    public static let backgroundBase = ColorStyle.background2
    
    // MARK: - Chart Colors
    
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
    
    /// Semantic stroke color for line when stock goes up.
    /// (light variant) ![](https://dummyimage.com/48x18/19A979.png&text=+)        Hex color: 19A979
    case stockUpStroke
    
    /// Semantic stroke color for line when stock goes down.
    /// (light variant) ![](https://dummyimage.com/48x18/AB2217.png&text=+)        Hex color: AB2217
    case stockDownStroke
    
    // MARK: - Map Colors
    
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
    
    // MARK: - Semantic Colors
    
    /// Semantic color for "negative" (bad) value, with light and dark color variants.
    /// (dark variant) ![](https://dummyimage.com/48x18/BB0000.png&text=+)        Hex color: BB0000
    /// (light variant) ![](https://dummyimage.com/48x18/FF453A.png&text=+)        Hex color: FF453A
    case negative
    
    /// Semantic color for "positive" (good) value, with light and dark color variants.
    /// (dark variant) ![](https://dummyimage.com/48x18/107E3E.png&text=+)        Hex color: 107E3E
    /// (light variant) ![](https://dummyimage.com/48x18/32D74B.png&text=+)        Hex color: 32D74B
    case positive
    
    /// Semantic color for "critical" (risky) value, with light and dark color variants.
    /// (dark variant) ![](https://dummyimage.com/48x18/E9730C.png&text=+)        Hex color: E9730C
    /// (light variant) ![](https://dummyimage.com/48x18/FF9F0A.png&text=+)        Hex color: FF9F0A
    case critical
    
    /// Semantic color for "negative" (bad) label, with light and dark color variants.
    /// (dark variant - normal) ![](https://dummyimage.com/48x18/BB0000.png&text=+)        Hex color: BB0000
    /// (light variant - normal) ![](https://dummyimage.com/48x18/FF8888.png&text=+)        Hex color: FF8888
    /// (dark variant - contrast) ![](https://dummyimage.com/48x18/FF8888.png&text=+)      Hex color: FF8888
    /// (light variant - contrast) ![](https://dummyimage.com/48x18/FF8888.png&text=+)      Hex color: FF8888
    case negativeLabel
    
    /// Semantic color for "positive" (good) label, with light and dark color variants.
    /// (dark variant - normal) ![](https://dummyimage.com/48x18/107E3E.png&text=+)        Hex color: 107E3E
    /// (light variant - normal) ![](https://dummyimage.com/48x18/ABE2AB.png&text=+)        Hex color: ABE2AB
    /// (dark variant - contrast) ![](https://dummyimage.com/48x18/ABE2AB.png&text=+)      Hex color: ABE2AB
    /// (light variant - contrast) ![](https://dummyimage.com/48x18/ABE2AB.png&text=+)      Hex color: ABE2AB
    case positiveLabel
    
    /// Semantic color for "critical" (risky) label, with light and dark color variants.
    /// (dark variant - normal) ![](https://dummyimage.com/48x18/E9730C.png&text=+)        Hex color: E9730C
    /// (light variant - normal) ![](https://dummyimage.com/48x18/FABD64.png&text=+)        Hex color: FABD64
    /// (dark variant - contrast) ![](https://dummyimage.com/48x18/FABD64.png&text=+)      Hex color: FABD64
    /// (light variant - contrast) ![](https://dummyimage.com/48x18/FABD64.png&text=+)      Hex color: FABD64
    case criticalLabel
    
    /// Semantic color for "negative" (bad) background, with light and dark color variants.
    /// (dark variant - normal) ![](https://dummyimage.com/48x18/BB0000.png&text=+)        Hex color: BB000014 (alpha: 8%)
    /// (light variant - normal) ![](https://dummyimage.com/48x18/FF8888.png&text=+)        Hex color: FF888824 (alpha: 14%)
    /// (dark variant - contrast) ![](https://dummyimage.com/48x18/BB0000.png&text=+)      Hex color: BB000024 (alpha: 14%)
    /// (light variant - contrast) ![](https://dummyimage.com/48x18/FF8888.png&text=+)      Hex color: FF888824 (alpha: 14%)
    case negativeBackground
    
    /// Semantic color for "positive" (good) background, with light and dark color variants.
    /// (dark variant - normal) ![](https://dummyimage.com/48x18/107E3E.png&text=+)        Hex color: 107E3E14 (alpha: 8%)
    /// (light variant - normal) ![](https://dummyimage.com/48x18/ABE2AB.png&text=+)        Hex color: ABE2AB24 (alpha: 14%)
    /// (dark variant - contrast) ![](https://dummyimage.com/48x18/107E3E.png&text=+)      Hex color: 107E3E24 (alpha: 14%)
    /// (light variant - contrast) ![](https://dummyimage.com/48x18/ABE2AB.png&text=+)      Hex color: ABE2AB24 (alpha: 14%)
    case positiveBackground
    
    /// Semantic color for "critical" (risky) background, with light and dark color variants.
    /// (dark variant - normal) ![](https://dummyimage.com/48x18/E9730C.png&text=+)        Hex color: E9730C14 (alpha: 8%)
    /// (light variant - normal) ![](https://dummyimage.com/48x18/FABD64.png&text=+)        Hex color: FABD6424 (alpha: 14%)
    /// (dark variant - contrast) ![](https://dummyimage.com/48x18/E9730C.png&text=+)      Hex color: E9730C24 (alpha: 14%)
    /// (light variant - contrast) ![](https://dummyimage.com/48x18/FABD64.png&text=+)      Hex color: FABD6424 (alpha: 14%)
    case criticalBackground
    
    /// Semantic color for "information" (neutral) background, with light and dark color variants.
    /// (dark variant - normal) ![](https://dummyimage.com/48x18/0A6ED1.png&text=+)        Hex color: 0A6ED114 (alpha: 8%)
    /// (light variant - normal) ![](https://dummyimage.com/48x18/91C8F6.png&text=+)        Hex color: 91C8F624 (alpha: 14%)
    /// (dark variant - contrast) ![](https://dummyimage.com/48x18/0A6ED1.png&text=+)      Hex color: 0A6ED124 (alpha: 14%)
    /// (light variant - contrast) ![](https://dummyimage.com/48x18/91C8F6.png&text=+)      Hex color: 91C8F624 (alpha: 14%)
    case informationBackground
    
    // MARK: - Accent Colors
    
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
