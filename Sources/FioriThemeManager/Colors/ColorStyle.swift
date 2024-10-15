import SwiftUI

public enum ColorStyle: String, CaseIterable {
    // MARK: - Fiori Next Core Colors (116 Colors)
    
    // Core 1: Greys (1 - 11)
    /// Grey 1
    /// (dark variant) ![](https://dummyimage.com/48x18/F5F6F7.png&text=+)          Hex value: F5F6F7FF
    /// (light variant) ![](https://dummyimage.com/48x18/12171C.png&text=+)          Hex value: 12171CFF
    @available(watchOS, unavailable)
    case grey1
    
    /// Grey 2
    /// (dark variant) ![](https://dummyimage.com/48x18/EAECEE.png&text=+)          Hex value: EAECEEFF
    /// (light variant) ![](https://dummyimage.com/48x18/1A2733.png&text=+)          Hex value: 1A2733FF
    @available(watchOS, unavailable)
    case grey2
    
    /// Grey 3
    /// (dark variant) ![](https://dummyimage.com/48x18/D5DADD.png&text=+)          Hex value: D5DADDFF
    /// (light variant) ![](https://dummyimage.com/48x18/223548.png&text=+)          Hex value: 223548FF
    @available(watchOS, unavailable)
    case grey3
    
    /// Grey 4
    /// (dark variant) ![](https://dummyimage.com/48x18/A9B4BE.png&text=+)          Hex value: A9B4BEFF
    /// (light variant) ![](https://dummyimage.com/48x18/354A5F.png&text=+)          Hex value: 354A5FFF
    @available(watchOS, unavailable)
    case grey4
    
    /// Grey 5
    /// (dark variant) ![](https://dummyimage.com/48x18/8396A8.png&text=+)          Hex value: 8396A8FF
    /// (light variant) ![](https://dummyimage.com/48x18/475E75.png&text=+)          Hex value: 475E75FF
    @available(watchOS, unavailable)
    case grey5
    
    /// Grey 6
    /// (dark variant) ![](https://dummyimage.com/48x18/5B738B.png&text=+)          Hex value: 5B738BFF
    /// (light variant) ![](https://dummyimage.com/48x18/5B738B.png&text=+)          Hex value: 5B738BFF
    @available(watchOS, unavailable)
    case grey6
    
    /// Grey 7
    /// (dark variant) ![](https://dummyimage.com/48x18/475E75.png&text=+)          Hex value: 475E75FF
    /// (light variant) ![](https://dummyimage.com/48x18/8396A8.png&text=+)          Hex value: 8396A8FF
    @available(watchOS, unavailable)
    case grey7
    
    /// Grey 8
    /// (dark variant) ![](https://dummyimage.com/48x18/354A5F.png&text=+)          Hex value: 354A5FFF
    /// (light variant) ![](https://dummyimage.com/48x18/A9B4BE.png&text=+)          Hex value: A9B4BEFF
    @available(watchOS, unavailable)
    case grey8
    
    /// Grey 9
    /// (dark variant) ![](https://dummyimage.com/48x18/223548.png&text=+)          Hex value: 223548FF
    /// (light variant) ![](https://dummyimage.com/48x18/D5DADD.png&text=+)          Hex value: D5DADDFF
    @available(watchOS, unavailable)
    case grey9
    
    /// Grey 10
    /// (dark variant) ![](https://dummyimage.com/48x18/1A2733.png&text=+)          Hex value: 1A2733FF
    /// (light variant) ![](https://dummyimage.com/48x18/EAECEE.png&text=+)          Hex value: EAECEEFF
    @available(watchOS, unavailable)
    case grey10
    
    /// Grey 11
    /// (dark variant) ![](https://dummyimage.com/48x18/12171C.png&text=+)          Hex value: 12171CFF
    /// (light variant) ![](https://dummyimage.com/48x18/F5F6F7.png&text=+)          Hex value: F5F6F7FF
    @available(watchOS, unavailable)
    case grey11
    
    // Core 2: Blues (1 - 11)
    /// Blue 1
    /// (dark variant) ![](https://dummyimage.com/48x18/EBF8FF.png&text=+)          Hex value: EBF8FFFF
    /// (light variant) ![](https://dummyimage.com/48x18/00144A.png&text=+)          Hex value: 00144AFF
    @available(watchOS, unavailable)
    case blue1
    
    /// Blue 2
    /// (dark variant) ![](https://dummyimage.com/48x18/D1EFFF.png&text=+)          Hex value: D1EFFFFF
    /// (light variant) ![](https://dummyimage.com/48x18/002A86.png&text=+)          Hex value: 002A86FF
    @available(watchOS, unavailable)
    case blue2
    
    /// Blue 3
    /// (dark variant) ![](https://dummyimage.com/48x18/A6E0FF.png&text=+)          Hex value: A6E0FFFF
    /// (light variant) ![](https://dummyimage.com/48x18/0040B0.png&text=+)          Hex value: 0040B0FF
    @available(watchOS, unavailable)
    case blue3
    
    /// Blue 4
    /// (dark variant) ![](https://dummyimage.com/48x18/89D1FF.png&text=+)          Hex value: 89D1FFFF
    /// (light variant) ![](https://dummyimage.com/48x18/0057D2.png&text=+)          Hex value: 0057D2FF
    @available(watchOS, unavailable)
    case blue4
    
    /// Blue 5
    /// (dark variant) ![](https://dummyimage.com/48x18/4DB1FF.png&text=+)          Hex value: 4DB1FFFF
    /// (light variant) ![](https://dummyimage.com/48x18/0070F2.png&text=+)          Hex value: 0070F2FF
    @available(watchOS, unavailable)
    case blue5
    
    /// Blue 6
    /// (dark variant) ![](https://dummyimage.com/48x18/1B90FF.png&text=+)          Hex value: 1B90FFFF
    /// (light variant) ![](https://dummyimage.com/48x18/1B90FF.png&text=+)          Hex value: 1B90FFFF
    @available(watchOS, unavailable)
    case blue6
    
    /// Blue 7
    /// (dark variant) ![](https://dummyimage.com/48x18/0070F2.png&text=+)          Hex value: 0070F2FF
    /// (light variant) ![](https://dummyimage.com/48x18/4DB1FF.png&text=+)          Hex value: 4DB1FFFF
    @available(watchOS, unavailable)
    case blue7
    
    /// Blue 8
    /// (dark variant) ![](https://dummyimage.com/48x18/0057D2.png&text=+)          Hex value: 0057D2FF
    /// (light variant) ![](https://dummyimage.com/48x18/89D1FF.png&text=+)          Hex value: 89D1FFFF
    @available(watchOS, unavailable)
    case blue8
    
    /// Blue 9
    /// (dark variant) ![](https://dummyimage.com/48x18/0040B0.png&text=+)          Hex value: 0040B0FF
    /// (light variant) ![](https://dummyimage.com/48x18/A6E0FF.png&text=+)          Hex value: A6E0FFFF
    @available(watchOS, unavailable)
    case blue9
    
    /// Blue 10
    /// (dark variant) ![](https://dummyimage.com/48x18/002A86.png&text=+)          Hex value: 002A86FF
    /// (light variant) ![](https://dummyimage.com/48x18/D1EFFF.png&text=+)          Hex value: D1EFFFFF
    @available(watchOS, unavailable)
    case blue10
    
    /// Blue 11
    /// (dark variant) ![](https://dummyimage.com/48x18/00144A.png&text=+)          Hex value: 00144AFF
    /// (light variant) ![](https://dummyimage.com/48x18/EBF8FF.png&text=+)          Hex value: EBF8FFFF
    @available(watchOS, unavailable)
    case blue11
    
    // Core 3: Teals (1 - 11)
    /// Teal 1
    /// (dark variant) ![](https://dummyimage.com/48x18/DAFDF5.png&text=+)          Hex value: DAFDF5FF
    /// (light variant) ![](https://dummyimage.com/48x18/012931.png&text=+)          Hex value: 012931FF
    @available(watchOS, unavailable)
    case teal1
    
    /// Teal 2
    /// (dark variant) ![](https://dummyimage.com/48x18/C2FCEE.png&text=+)          Hex value: C2FCEEFF
    /// (light variant) ![](https://dummyimage.com/48x18/02414C.png&text=+)          Hex value: 02414CFF
    @available(watchOS, unavailable)
    case teal2
    
    /// Teal 3
    /// (dark variant) ![](https://dummyimage.com/48x18/64EDD2.png&text=+)          Hex value: 64EDD2FF
    /// (light variant) ![](https://dummyimage.com/48x18/035663.png&text=+)          Hex value: 035663FF
    @available(watchOS, unavailable)
    case teal3
    
    /// Teal 4
    /// (dark variant) ![](https://dummyimage.com/48x18/2CE0BF.png&text=+)          Hex value: 2CE0BFFF
    /// (light variant) ![](https://dummyimage.com/48x18/046C7A.png&text=+)          Hex value: 046C7AFF
    @available(watchOS, unavailable)
    case teal4
    
    /// Teal 5
    /// (dark variant) ![](https://dummyimage.com/48x18/00CEAC.png&text=+)          Hex value: 00CEACFF
    /// (light variant) ![](https://dummyimage.com/48x18/07838F.png&text=+)          Hex value: 07838FFF
    @available(watchOS, unavailable)
    case teal5
    
    /// Teal 6
    /// (dark variant) ![](https://dummyimage.com/48x18/049F9A.png&text=+)          Hex value: 049F9AFF
    /// (light variant) ![](https://dummyimage.com/48x18/049F9A.png&text=+)          Hex value: 049F9AFF
    @available(watchOS, unavailable)
    case teal6
    
    /// Teal 7
    /// (dark variant) ![](https://dummyimage.com/48x18/07838F.png&text=+)          Hex value: 07838FFF
    /// (light variant) ![](https://dummyimage.com/48x18/00CEAC.png&text=+)          Hex value: 00CEACFF
    @available(watchOS, unavailable)
    case teal7
    
    /// Teal 8
    /// (dark variant) ![](https://dummyimage.com/48x18/046C7A.png&text=+)          Hex value: 046C7AFF
    /// (light variant) ![](https://dummyimage.com/48x18/2CE0BF.png&text=+)          Hex value: 2CE0BFFF
    @available(watchOS, unavailable)
    case teal8
    
    /// Teal 9
    /// (dark variant) ![](https://dummyimage.com/48x18/035663.png&text=+)          Hex value: 035663FF
    /// (light variant) ![](https://dummyimage.com/48x18/64EDD2.png&text=+)          Hex value: 64EDD2FF
    @available(watchOS, unavailable)
    case teal9
    
    /// Teal 10
    /// (dark variant) ![](https://dummyimage.com/48x18/02414C.png&text=+)          Hex value: 02414CFF
    /// (light variant) ![](https://dummyimage.com/48x18/C2FCEE.png&text=+)          Hex value: C2FCEEFF
    @available(watchOS, unavailable)
    case teal10
    
    /// Teal 11
    /// (dark variant) ![](https://dummyimage.com/48x18/002A86.png&text=+)          Hex value: 002A86FF
    /// (light variant) ![](https://dummyimage.com/48x18/DAFDF5.png&text=+)          Hex value: DAFDF5FF
    @available(watchOS, unavailable)
    case teal11
    
    // Core 4: Greens (1 - 11)
    /// Green 1
    /// (dark variant) ![](https://dummyimage.com/48x18/F5FAE5.png&text=+)          Hex value: F5FAE5FF
    /// (light variant) ![](https://dummyimage.com/48x18/0E2B16.png&text=+)          Hex value: 0E2B16FF
    @available(watchOS, unavailable)
    case green1
    
    /// Green 2
    /// (dark variant) ![](https://dummyimage.com/48x18/EBF5CB.png&text=+)          Hex value: EBF5CBFF
    /// (light variant) ![](https://dummyimage.com/48x18/164323.png&text=+)          Hex value: 164323FF
    @available(watchOS, unavailable)
    case green2
    
    /// Green 3
    /// (dark variant) ![](https://dummyimage.com/48x18/BDE986.png&text=+)          Hex value: BDE986FF
    /// (light variant) ![](https://dummyimage.com/48x18/1E592F.png&text=+)          Hex value: 1E592FFF
    @available(watchOS, unavailable)
    case green3
    
    /// Green 4
    /// (dark variant) ![](https://dummyimage.com/48x18/97DD40.png&text=+)          Hex value: 97DD40FF
    /// (light variant) ![](https://dummyimage.com/48x18/256F3A.png&text=+)          Hex value: 256F3AFF
    @available(watchOS, unavailable)
    case green4
    
    /// Green 5
    /// (dark variant) ![](https://dummyimage.com/48x18/5DC122.png&text=+)          Hex value: 5DC122FF
    /// (light variant) ![](https://dummyimage.com/48x18/188918.png&text=+)          Hex value: 188918FF
    @available(watchOS, unavailable)
    case green5
    
    /// Green 6
    /// (dark variant) ![](https://dummyimage.com/48x18/36A41D.png&text=+)          Hex value: 36A41DFF
    /// (light variant) ![](https://dummyimage.com/48x18/36A41D.png&text=+)          Hex value: 36A41DFF
    @available(watchOS, unavailable)
    case green6
    
    /// Green 7
    /// (dark variant) ![](https://dummyimage.com/48x18/188918.png&text=+)          Hex value: 188918FF
    /// (light variant) ![](https://dummyimage.com/48x18/5DC122.png&text=+)          Hex value: 5DC122FF
    @available(watchOS, unavailable)
    case green7
    
    /// Green 8
    /// (dark variant) ![](https://dummyimage.com/48x18/256F3A.png&text=+)          Hex value: 256F3AFF
    /// (light variant) ![](https://dummyimage.com/48x18/97DD40.png&text=+)          Hex value: 97DD40FF
    @available(watchOS, unavailable)
    case green8
    
    /// Green 9
    /// (dark variant) ![](https://dummyimage.com/48x18/1E592F.png&text=+)          Hex value: 1E592FFF
    /// (light variant) ![](https://dummyimage.com/48x18/BDE986.png&text=+)          Hex value: BDE986FF
    @available(watchOS, unavailable)
    case green9
    
    /// Green 10
    /// (dark variant) ![](https://dummyimage.com/48x18/450B00.png&text=+)          Hex value: 450B00FF
    /// (light variant) ![](https://dummyimage.com/48x18/EBF5CB.png&text=+)          Hex value: EBF5CBFF
    @available(watchOS, unavailable)
    case green10
    
    /// Green 11
    /// (dark variant) ![](https://dummyimage.com/48x18/363636.png&text=+)          Hex value: 363636FF
    /// (light variant) ![](https://dummyimage.com/48x18/F5FAE5.png&text=+)          Hex value: F5FAE5FF
    @available(watchOS, unavailable)
    case green11
    
    // Core 5: Mangos (1 - 11)
    /// Mango 1
    /// (dark variant) ![](https://dummyimage.com/48x18/FFF8D6.png&text=+)          Hex value: FFF8D6FF
    /// (light variant) ![](https://dummyimage.com/48x18/450B00.png&text=+)          Hex value: 450B00FF
    @available(watchOS, unavailable)
    case mango1
    
    /// Mango 2
    /// (dark variant) ![](https://dummyimage.com/48x18/FFF3B8.png&text=+)          Hex value: FFF3B8FF
    /// (light variant) ![](https://dummyimage.com/48x18/6D1900.png&text=+)          Hex value: 6D1900FF
    @available(watchOS, unavailable)
    case mango2
    
    /// Mango 3
    /// (dark variant) ![](https://dummyimage.com/48x18/FFDF72.png&text=+)          Hex value: FFDF72FF
    /// (light variant) ![](https://dummyimage.com/48x18/8D2A00.png&text=+)          Hex value: 8D2A00FF
    @available(watchOS, unavailable)
    case mango3
    
    /// Mango 4
    /// (dark variant) ![](https://dummyimage.com/48x18/FFC933.png&text=+)          Hex value: FFC933FF
    /// (light variant) ![](https://dummyimage.com/48x18/A93E00.png&text=+)          Hex value: A93E00FF
    @available(watchOS, unavailable)
    case mango4
    
    /// Mango 5
    /// (dark variant) ![](https://dummyimage.com/48x18/FFB300.png&text=+)          Hex value: FFB300FF
    /// (light variant) ![](https://dummyimage.com/48x18/C35500.png&text=+)          Hex value: C35500FF
    @available(watchOS, unavailable)
    case mango5
    
    /// Mango 6
    /// (dark variant) ![](https://dummyimage.com/48x18/E76500.png&text=+)          Hex value: E76500FF
    /// (light variant) ![](https://dummyimage.com/48x18/E76500.png&text=+)          Hex value: E76500FF
    @available(watchOS, unavailable)
    case mango6
    
    /// Mango 7
    /// (dark variant) ![](https://dummyimage.com/48x18/C35500.png&text=+)          Hex value: C35500FF
    /// (light variant) ![](https://dummyimage.com/48x18/FFB300.png&text=+)          Hex value: FFB300FF
    @available(watchOS, unavailable)
    case mango7
    
    /// Mango 8
    /// (dark variant) ![](https://dummyimage.com/48x18/A93E00.png&text=+)          Hex value: A93E00FF
    /// (light variant) ![](https://dummyimage.com/48x18/FFC933.png&text=+)          Hex value: FFC933FF
    @available(watchOS, unavailable)
    case mango8
    
    /// Mango 9
    /// (dark variant) ![](https://dummyimage.com/48x18/8D2A00.png&text=+)          Hex value: 8D2A00FF
    /// (light variant) ![](https://dummyimage.com/48x18/FFDF72.png&text=+)          Hex value: FFDF72FF
    @available(watchOS, unavailable)
    case mango9
    
    /// Mango 10
    /// (dark variant) ![](https://dummyimage.com/48x18/6D1900.png&text=+)          Hex value: 6D1900FF
    /// (light variant) ![](https://dummyimage.com/48x18/FFF3B8.png&text=+)          Hex value: FFF3B8FF
    @available(watchOS, unavailable)
    case mango10
    
    /// Mango 11
    /// (dark variant) ![](https://dummyimage.com/48x18/450B00.png&text=+)          Hex value: 450B00FF
    /// (light variant) ![](https://dummyimage.com/48x18/FFF8D6.png&text=+)          Hex value: FFF8D6FF
    @available(watchOS, unavailable)
    case mango11
    
    // Core 6: Reds (1 - 11)
    /// Red 1
    /// (dark variant) ![](https://dummyimage.com/48x18/FFEAF4.png&text=+)          Hex value: FFEAF4FF
    /// (light variant) ![](https://dummyimage.com/48x18/350000.png&text=+)          Hex value: 350000FF
    @available(watchOS, unavailable)
    case red1
    
    /// Red 2
    /// (dark variant) ![](https://dummyimage.com/48x18/FFD5EA.png&text=+)          Hex value: FFD5EAFF
    /// (light variant) ![](https://dummyimage.com/48x18/5A0404.png&text=+)          Hex value: 5A0404FF
    @available(watchOS, unavailable)
    case red2
    
    /// Red 3
    /// (dark variant) ![](https://dummyimage.com/48x18/FFB2D2.png&text=+)          Hex value: FFB2D2FF
    /// (light variant) ![](https://dummyimage.com/48x18/840606.png&text=+)          Hex value: 840606FF
    @available(watchOS, unavailable)
    case red3
    
    /// Red 4
    /// (dark variant) ![](https://dummyimage.com/48x18/FF8CB2.png&text=+)          Hex value: FF8CB2FF
    /// (light variant) ![](https://dummyimage.com/48x18/AA0808.png&text=+)          Hex value: AA0808FF
    @available(watchOS, unavailable)
    case red4
    @available(watchOS, unavailable)
    
    /// Red 5
    /// (dark variant) ![](https://dummyimage.com/48x18/FF5C77.png&text=+)          Hex value: FF5C77FF
    /// (light variant) ![](https://dummyimage.com/48x18/D20A0A.png&text=+)          Hex value: D20A0AFF
    @available(watchOS, unavailable)
    case red5
    
    /// Red 6
    /// (dark variant) ![](https://dummyimage.com/48x18/EE3939.png&text=+)          Hex value: EE3939FF
    /// (light variant) ![](https://dummyimage.com/48x18/EE3939.png&text=+)          Hex value: EE3939FF
    @available(watchOS, unavailable)
    case red6
    
    /// Red 7
    /// (dark variant) ![](https://dummyimage.com/48x18/D20A0A.png&text=+)          Hex value: D20A0AFF
    /// (light variant) ![](https://dummyimage.com/48x18/FF5C77.png&text=+)          Hex value: FF5C77FF
    @available(watchOS, unavailable)
    case red7
    
    /// Red 8
    /// (dark variant) ![](https://dummyimage.com/48x18/AA0808.png&text=+)          Hex value: AA0808FF
    /// (light variant) ![](https://dummyimage.com/48x18/FF8CB2.png&text=+)          Hex value: FF8CB2FF
    @available(watchOS, unavailable)
    case red8
    
    /// Red 9
    /// (dark variant) ![](https://dummyimage.com/48x18/840606.png&text=+)          Hex value: 840606FF
    /// (light variant) ![](https://dummyimage.com/48x18/FFB2D2.png&text=+)          Hex value: FFB2D2FF
    @available(watchOS, unavailable)
    case red9
    
    /// Red 10
    /// (dark variant) ![](https://dummyimage.com/48x18/5A0404.png&text=+)          Hex value: 5A0404FF
    /// (light variant) ![](https://dummyimage.com/48x18/FFD5EA.png&text=+)          Hex value: FFD5EAFF
    @available(watchOS, unavailable)
    case red10
    
    /// Red 11
    /// (dark variant) ![](https://dummyimage.com/48x18/350000.png&text=+)          Hex value: 350000FF
    /// (light variant) ![](https://dummyimage.com/48x18/FFEAF4.png&text=+)          Hex value: FFEAF4FF
    @available(watchOS, unavailable)
    case red11
    
    // Core 7: Pinks (1 - 11)
    /// Pink 1
    /// (dark variant) ![](https://dummyimage.com/48x18/FFF0FA.png&text=+)          Hex value: FFF0FAFF
    /// (light variant) ![](https://dummyimage.com/48x18/28004A.png&text=+)          Hex value: 28004AFF
    @available(watchOS, unavailable)
    case pink1
    
    /// Pink 2
    /// (dark variant) ![](https://dummyimage.com/48x18/FFDCF3.png&text=+)          Hex value: FFDCF3FF
    /// (light variant) ![](https://dummyimage.com/48x18/510080.png&text=+)          Hex value: 510080FF
    @available(watchOS, unavailable)
    case pink2
    
    /// Pink 3
    /// (dark variant) ![](https://dummyimage.com/48x18/FFAFED.png&text=+)          Hex value: FFAFEDFF
    /// (light variant) ![](https://dummyimage.com/48x18/7800A4.png&text=+)          Hex value: 7800A4FF
    @available(watchOS, unavailable)
    case pink3
    
    /// Pink 4
    /// (dark variant) ![](https://dummyimage.com/48x18/FF8AF0.png&text=+)          Hex value: FF8AF0FF
    /// (light variant) ![](https://dummyimage.com/48x18/A100C2.png&text=+)          Hex value: A100C2FF
    @available(watchOS, unavailable)
    case pink4
    
    /// Pink 5
    /// (dark variant) ![](https://dummyimage.com/48x18/F65AF2.png&text=+)          Hex value: F65AF2FF
    /// (light variant) ![](https://dummyimage.com/48x18/CC00DC.png&text=+)          Hex value: CC00DCFF
    @available(watchOS, unavailable)
    case pink5
    
    /// Pink 6
    /// (dark variant) ![](https://dummyimage.com/48x18/F31DED.png&text=+)          Hex value: F31DEDFF
    /// (light variant) ![](https://dummyimage.com/48x18/F31DED.png&text=+)          Hex value: F31DEDFF
    @available(watchOS, unavailable)
    case pink6
    
    /// Pink 7
    /// (dark variant) ![](https://dummyimage.com/48x18/CC00DC.png&text=+)          Hex value: CC00DCFF
    /// (light variant) ![](https://dummyimage.com/48x18/F65AF2.png&text=+)          Hex value: F65AF2FF
    @available(watchOS, unavailable)
    case pink7
    
    /// Pink 8
    /// (dark variant) ![](https://dummyimage.com/48x18/A100C2.png&text=+)          Hex value: A100C2FF
    /// (light variant) ![](https://dummyimage.com/48x18/FF8AF0.png&text=+)          Hex value: FF8AF0FF
    @available(watchOS, unavailable)
    case pink8
    
    /// Pink 9
    /// (dark variant) ![](https://dummyimage.com/48x18/7800A4.png&text=+)          Hex value: 7800A4FF
    /// (light variant) ![](https://dummyimage.com/48x18/FFAFED.png&text=+)          Hex value: FFAFEDFF
    @available(watchOS, unavailable)
    case pink9
    
    /// Pink 10
    /// (dark variant) ![](https://dummyimage.com/48x18/510080.png&text=+)          Hex value: 510080FF
    /// (light variant) ![](https://dummyimage.com/48x18/FFDCF3.png&text=+)          Hex value: FFDCF3FF
    @available(watchOS, unavailable)
    case pink10
    
    /// Pink 11
    /// (dark variant) ![](https://dummyimage.com/48x18/28004A.png&text=+)          Hex value: 28004AFF
    /// (light variant) ![](https://dummyimage.com/48x18/FFF0FA.png&text=+)          Hex value: FFF0FAFF
    @available(watchOS, unavailable)
    case pink11
    
    // Core 8: Raspberries (1 - 11)
    /// Raspberry 1
    /// (dark variant) ![](https://dummyimage.com/48x18/FFF0F5.png&text=+)          Hex value: FFF0F5FF
    /// (light variant) ![](https://dummyimage.com/48x18/510136.png&text=+)          Hex value: 510136FF
    @available(watchOS, unavailable)
    case raspberry1
    
    /// Raspberry 2
    /// (dark variant) ![](https://dummyimage.com/48x18/FFDCE8.png&text=+)          Hex value: FFDCE8FF
    /// (light variant) ![](https://dummyimage.com/48x18/71014B.png&text=+)          Hex value: 71014BFF
    @available(watchOS, unavailable)
    case raspberry2
    
    /// Raspberry 3
    /// (dark variant) ![](https://dummyimage.com/48x18/FECBDA.png&text=+)          Hex value: FECBDAFF
    /// (light variant) ![](https://dummyimage.com/48x18/9B015D.png&text=+)          Hex value: 9B015DFF
    @available(watchOS, unavailable)
    case raspberry3
    
    /// Raspberry 4
    /// (dark variant) ![](https://dummyimage.com/48x18/FEADC8.png&text=+)          Hex value: FEADC8FF
    /// (light variant) ![](https://dummyimage.com/48x18/BA066C.png&text=+)          Hex value: BA066CFF
    @available(watchOS, unavailable)
    case raspberry4
    
    /// Raspberry 5
    /// (dark variant) ![](https://dummyimage.com/48x18/FE83AE.png&text=+)          Hex value: FE83AEFF
    /// (light variant) ![](https://dummyimage.com/48x18/DF1278.png&text=+)          Hex value: DF1278FF
    @available(watchOS, unavailable)
    case raspberry5
    
    /// Raspberry 6
    /// (dark variant) ![](https://dummyimage.com/48x18/FA4F96.png&text=+)          Hex value: FA4F96FF
    /// (light variant) ![](https://dummyimage.com/48x18/FA4F96.png&text=+)          Hex value: FA4F96FF
    @available(watchOS, unavailable)
    case raspberry6
    
    /// Raspberry 7
    /// (dark variant) ![](https://dummyimage.com/48x18/DF1278.png&text=+)          Hex value: DF1278FF
    /// (light variant) ![](https://dummyimage.com/48x18/FE83AE.png&text=+)          Hex value: FE83AEFF
    @available(watchOS, unavailable)
    case raspberry7
    
    /// Raspberry 8
    /// (dark variant) ![](https://dummyimage.com/48x18/BA066C.png&text=+)          Hex value: BA066CFF
    /// (light variant) ![](https://dummyimage.com/48x18/FEADC8.png&text=+)          Hex value: FEADC8FF
    @available(watchOS, unavailable)
    case raspberry8
    
    /// Raspberry 9
    /// (dark variant) ![](https://dummyimage.com/48x18/9B015D.png&text=+)          Hex value: 9B015DFF
    /// (light variant) ![](https://dummyimage.com/48x18/FECBDA.png&text=+)          Hex value: FECBDAFF
    @available(watchOS, unavailable)
    case raspberry9
    
    /// Raspberry 10
    /// (dark variant) ![](https://dummyimage.com/48x18/71014B.png&text=+)          Hex value: 71014BFF
    /// (light variant) ![](https://dummyimage.com/48x18/FFDCE8.png&text=+)          Hex value: FFDCE8FF
    @available(watchOS, unavailable)
    case raspberry10
    
    /// Raspberry 11
    /// (dark variant) ![](https://dummyimage.com/48x18/510136.png&text=+)          Hex value: 510136FF
    /// (light variant) ![](https://dummyimage.com/48x18/FFF0F5.png&text=+)          Hex value: FFF0F5FF
    @available(watchOS, unavailable)
    case raspberry11
    
    // Core 9: Indigos (1 - 11)
    /// Indigo 1
    /// (dark variant) ![](https://dummyimage.com/48x18/F1ECFF.png&text=+)          Hex value: F1ECFFFF
    /// (light variant) ![](https://dummyimage.com/48x18/0E0637.png&text=+)          Hex value: 0E0637FF
    @available(watchOS, unavailable)
    case indigo1
    
    /// Indigo 2
    /// (dark variant) ![](https://dummyimage.com/48x18/E2D8FF.png&text=+)          Hex value: E2D8FFFF
    /// (light variant) ![](https://dummyimage.com/48x18/1C0C6E.png&text=+)          Hex value: 1C0C6EFF
    @available(watchOS, unavailable)
    case indigo2
    
    /// Indigo 3
    /// (dark variant) ![](https://dummyimage.com/48x18/D3B6FF.png&text=+)          Hex value: D3B6FFFF
    /// (light variant) ![](https://dummyimage.com/48x18/2C13AD.png&text=+)          Hex value: 2C13ADFF
    @available(watchOS, unavailable)
    case indigo3
    
    /// Indigo 4
    /// (dark variant) ![](https://dummyimage.com/48x18/B894FF.png&text=+)          Hex value: B894FFFF
    /// (light variant) ![](https://dummyimage.com/48x18/470CED.png&text=+)          Hex value: 470CEDFF
    @available(watchOS, unavailable)
    case indigo4
    
    /// Indigo 5
    /// (dark variant) ![](https://dummyimage.com/48x18/9B76FF.png&text=+)          Hex value: 9B76FFFF
    /// (light variant) ![](https://dummyimage.com/48x18/5D36FF.png&text=+)          Hex value: 5D36FFFF
    @available(watchOS, unavailable)
    case indigo5
    
    /// Indigo 6
    /// (dark variant) ![](https://dummyimage.com/48x18/7858FF.png&text=+)          Hex value: 7858FFFF
    /// (light variant) ![](https://dummyimage.com/48x18/7858FF.png&text=+)          Hex value: 7858FFFF
    @available(watchOS, unavailable)
    case indigo6
    
    /// Indigo 7
    /// (dark variant) ![](https://dummyimage.com/48x18/5D36FF.png&text=+)          Hex value: 5D36FFFF
    /// (light variant) ![](https://dummyimage.com/48x18/9B76FF.png&text=+)          Hex value: 9B76FFFF
    @available(watchOS, unavailable)
    case indigo7
    
    /// Indigo 8
    /// (dark variant) ![](https://dummyimage.com/48x18/470CED.png&text=+)          Hex value: 470CEDFF
    /// (light variant) ![](https://dummyimage.com/48x18/B894FF.png&text=+)          Hex value: B894FFFF
    @available(watchOS, unavailable)
    case indigo8
    
    /// Indigo 9
    /// (dark variant) ![](https://dummyimage.com/48x18/2C13AD.png&text=+)          Hex value: 2C13ADFF
    /// (light variant) ![](https://dummyimage.com/48x18/D3B6FF.png&text=+)          Hex value: D3B6FFFF
    @available(watchOS, unavailable)
    case indigo9
    
    /// Indigo 10
    /// (dark variant) ![](https://dummyimage.com/48x18/1C0C6E.png&text=+)          Hex value: 1C0C6EFF
    /// (light variant) ![](https://dummyimage.com/48x18/E2D8FF.png&text=+)          Hex value: E2D8FFFF
    @available(watchOS, unavailable)
    case indigo10
    
    /// Indigo 11
    /// (dark variant) ![](https://dummyimage.com/48x18/0E0637.png&text=+)          Hex value: 0E0637FF
    /// (light variant) ![](https://dummyimage.com/48x18/F1ECFF.png&text=+)          Hex value: F1ECFFFF
    @available(watchOS, unavailable)
    case indigo11
    
    // Core 10: Basis (total 4)
    /// Base White
    /// (dark variant) ![](https://dummyimage.com/48x18/FFFFFF.png&text=+)          Hex value: FFFFFFFF
    /// (light variant) ![](https://dummyimage.com/48x18/FFFFFF.png&text=+)          Hex value: FFFFFFFF
    @available(watchOS, unavailable)
    case baseWhite
    
    /// BaseBlack
    /// (dark variant) ![](https://dummyimage.com/48x18/000000.png&text=+)          Hex value: 000000FF
    /// (light variant) ![](https://dummyimage.com/48x18/000000.png&text=+)          Hex value: 000000FF
    @available(watchOS, unavailable)
    case baseBlack
    
    /// Base 1
    /// (dark variant) ![](https://dummyimage.com/48x18/000000.png&text=+)          Hex value: 000000FF
    /// (light variant) ![](https://dummyimage.com/48x18/FFFFFF.png&text=+)          Hex value: FFFFFFFF
    @available(watchOS, unavailable)
    case base1
    
    /// Base 2
    /// (dark variant) ![](https://dummyimage.com/48x18/FFFFFF.png&text=+)          Hex value: FFFFFFFF
    /// (light variant) ![](https://dummyimage.com/48x18/000000.png&text=+)          Hex value: 000000FF
    @available(watchOS, unavailable)
    case base2
    
    /// AccentLabel 1
    /// (dark variant) ![](https://dummyimage.com/48x18/A93E00.png&text=+)          Hex value: A93E00FF
    /// (light variant) ![](https://dummyimage.com/48x18/FFDF72.png&text=+)          Hex value: FFDF72FF
    @available(watchOS, unavailable)
    case accentLabel1
    
    /// AccentLabel 2
    /// (dark variant) ![](https://dummyimage.com/48x18/AA0808.png&text=+)          Hex value: AA0808FF
    /// (light variant) ![](https://dummyimage.com/48x18/FFB2D2.png&text=+)          Hex value: FFB2D2FF
    @available(watchOS, unavailable)
    case accentLabel2
    
    /// AccentLabel 3
    /// (dark variant) ![](https://dummyimage.com/48x18/BA066C.png&text=+)          Hex value: BA066CFF
    /// (light variant) ![](https://dummyimage.com/48x18/FECBDA.png&text=+)          Hex value: FECBDAFF
    @available(watchOS, unavailable)
    case accentLabel3
    
    /// AccentLabel 4
    /// (dark variant) ![](https://dummyimage.com/48x18/A100C2.png&text=+)          Hex value: A100C2FF
    /// (light variant) ![](https://dummyimage.com/48x18/FFAFED.png&text=+)          Hex value: FFAFEDFF
    @available(watchOS, unavailable)
    case accentLabel4
    
    /// AccentLabel 5
    /// (dark variant) ![](https://dummyimage.com/48x18/470CED.png&text=+)          Hex value: 470CEDFF
    /// (light variant) ![](https://dummyimage.com/48x18/D3B6FF.png&text=+)          Hex value: D3B6FFFF
    @available(watchOS, unavailable)
    case accentLabel5
    
    /// AccentLabel 6
    /// (dark variant) ![](https://dummyimage.com/48x18/0057D2.png&text=+)          Hex value: 0057D2FF
    /// (light variant) ![](https://dummyimage.com/48x18/A6E0FF.png&text=+)          Hex value: A6E0FFFF
    @available(watchOS, unavailable)
    case accentLabel6
    
    /// AccentLabel 7
    /// (dark variant) ![](https://dummyimage.com/48x18/046C7A.png&text=+)          Hex value: 046C7AFF
    /// (light variant) ![](https://dummyimage.com/48x18/64EDD2.png&text=+)          Hex value: 64EDD2FF
    @available(watchOS, unavailable)
    case accentLabel7
    
    /// AccentLabel 8
    /// (dark variant) ![](https://dummyimage.com/48x18/256F3A.png&text=+)          Hex value: 256F3AFF
    /// (light variant) ![](https://dummyimage.com/48x18/BDE986.png&text=+)          Hex value: BDE986FF
    @available(watchOS, unavailable)
    case accentLabel8
    
    /// AccentLabel 9
    /// (dark variant) ![](https://dummyimage.com/48x18/6C32A9.png&text=+)          Hex value: 6C32A9FF
    /// (light variant) ![](https://dummyimage.com/48x18/D0B8EA.png&text=+)          Hex value: D0B8EAFF
    @available(watchOS, unavailable)
    case accentLabel9
    
    /// AccentLabel 10
    /// (dark variant) ![](https://dummyimage.com/48x18/354A5F.png&text=+)          Hex value: 354A5FFF
    /// (light variant) ![](https://dummyimage.com/48x18/D5DADD.png&text=+)          Hex value: D5DADDFF
    @available(watchOS, unavailable)
    case accentLabel10
    
    /// AccentBackground 1
    /// (dark variant) ![](https://dummyimage.com/48x18/FFF3B8.png&text=+)          Hex value: FFF3B8FF
    /// (light variant) ![](https://dummyimage.com/48x18/8D2A00.png&text=+)          Hex value: 8D2A00FF
    @available(watchOS, unavailable)
    case accentBackground1
    
    /// AccentBackground 2
    /// (dark variant) ![](https://dummyimage.com/48x18/FFD5EA.png&text=+)          Hex value: FFD5EAFF
    /// (light variant) ![](https://dummyimage.com/48x18/840606.png&text=+)          Hex value: 840606FF
    @available(watchOS, unavailable)
    case accentBackground2
    
    /// AccentBackground 3
    /// (dark variant) ![](https://dummyimage.com/48x18/FFDCE8.png&text=+)          Hex value: FFDCE8FF
    /// (light variant) ![](https://dummyimage.com/48x18/9B015D.png&text=+)          Hex value: 9B015DFF
    @available(watchOS, unavailable)
    case accentBackground3
    
    /// AccentBackground 4
    /// (dark variant) ![](https://dummyimage.com/48x18/FFDCF3.png&text=+)          Hex value: FFDCF3FF
    /// (light variant) ![](https://dummyimage.com/48x18/7800A4.png&text=+)          Hex value: 7800A4FF
    @available(watchOS, unavailable)
    case accentBackground4
    
    /// AccentBackground 5
    /// (dark variant) ![](https://dummyimage.com/48x18/E2D8FF.png&text=+)          Hex value: E2D8FFFF
    /// (light variant) ![](https://dummyimage.com/48x18/2C13AD.png&text=+)          Hex value: 2C13ADFF
    @available(watchOS, unavailable)
    case accentBackground5
    
    /// AccentBackground 6
    /// (dark variant) ![](https://dummyimage.com/48x18/D1EFFF.png&text=+)          Hex value: D1EFFFFF
    /// (light variant) ![](https://dummyimage.com/48x18/0040B0.png&text=+)          Hex value: 0040B0FF
    @available(watchOS, unavailable)
    case accentBackground6
    
    /// AccentBackground 7
    /// (dark variant) ![](https://dummyimage.com/48x18/C2FCEE.png&text=+)          Hex value: C2FCEEFF
    /// (light variant) ![](https://dummyimage.com/48x18/035663.png&text=+)          Hex value: 035663FF
    @available(watchOS, unavailable)
    case accentBackground7
    
    /// AccentBackground 8
    /// (dark variant) ![](https://dummyimage.com/48x18/EBF5CB.png&text=+)          Hex value: EBF5CBFF
    /// (light variant) ![](https://dummyimage.com/48x18/1E592F.png&text=+)          Hex value: 1E592FFF
    @available(watchOS, unavailable)
    case accentBackground8
    
    /// AccentBackground 9
    /// (dark variant) ![](https://dummyimage.com/48x18/DDCCF0.png&text=+)          Hex value: DDCCF0FF
    /// (light variant) ![](https://dummyimage.com/48x18/511F89.png&text=+)          Hex value: 511F89FF
    @available(watchOS, unavailable)
    case accentBackground9
    
    /// AccentBackground 10
    /// (dark variant) ![](https://dummyimage.com/48x18/EAECEE.png&text=+)          Hex value: EAECEEFF
    /// (light variant) ![](https://dummyimage.com/48x18/223548.png&text=+)          Hex value: 223548FF
    @available(watchOS, unavailable)
    case accentBackground10
    
    // MARK: - Shadow Colors (2 Colors)
    
    /// Card Shadow
    /// (dark variant) ![](https://dummyimage.com/48x18/5B738B.png&text=+)          Hex value: 5B738B14
    /// (light variant) ![](https://dummyimage.com/48x18/000000.png&text=+)          Hex value: 0000004D
    @available(watchOS, unavailable)
    case cardShadow
    
    /// Section Shadow
    /// (dark variant) ![](https://dummyimage.com/48x18/5B738B.png&text=+)          Hex value: 5B738B3D
    /// (light variant) ![](https://dummyimage.com/48x18/000000.png&text=+)          Hex value: 0000005E
    @available(watchOS, unavailable)
    case sectionShadow
    
    // MARK: - Grouped Background Colors (3 Colors)
    
    /// Primary grouped background colors, with variants for base and elevated UI schemes.
    /// (base dark variant) ![](https://dummyimage.com/48x18/F5F6F7.png&text=+)              Hex color: F5F6F7FF
    /// (base light variant) ![](https://dummyimage.com/48x18/000000.png&text=+)              Hex color: 000000FF
    /// (elevated light variant) ![](https://dummyimage.com/48x18/171D23.png&text=+)        Hex color: 171D23FF
    @available(watchOS, unavailable)
    case primaryGroupedBackground
    
    /// Secondary grouped background colors, with variants for base and elevated UI schemes.
    /// (base dark variant) ![](https://dummyimage.com/48x18/FFFFFF.png&text=+)              Hex color: FFFFFFFF
    /// (base light variant) ![](https://dummyimage.com/48x18/161C21.png&text=+)              Hex color: 161C21FF
    /// (elevated light variant) ![](https://dummyimage.com/48x18/242D3.png&text=+)        Hex color: 242D37FF
    @available(watchOS, unavailable)
    case secondaryGroupedBackground
    
    /// Secondary grouped background colors, with variants for base and elevated UI schemes.
    /// (base dark variant) ![](https://dummyimage.com/48x18/F5F6F7.png&text=+)              Hex color: F5F6F7FF
    /// (base light variant) ![](https://dummyimage.com/48x18/242E38.png&text=+)              Hex color: 242E38FF
    /// (elevated light variant) ![](https://dummyimage.com/48x18/2F3C48.png&text=+)        Hex color: 2F3C48FF
    @available(watchOS, unavailable)
    case tertiaryGroupedBackground
    
    // MARK: - Background Colors (3 Colors)
    
    /// Primary grouped background colors, with variants for base and elevated UI schemes.
    /// (base dark variant) ![](https://dummyimage.com/48x18/FFFFFF.png&text=+)              Hex color: FFFFFFFF
    /// (base light variant) ![](https://dummyimage.com/48x18/000000.png&text=+)              Hex color: 000000FF
    /// (elevated light variant) ![](https://dummyimage.com/48x18/171D23.png&text=+)        Hex color: 171D23FF
    case primaryBackground
    
    /// Secondary grouped background colors, with variants for base and elevated UI schemes.
    /// (base dark variant) ![](https://dummyimage.com/48x18/F5F6F7.png&text=+)              Hex color: F5F6F7FF
    /// (base light variant) ![](https://dummyimage.com/48x18/161C21.png&text=+)              Hex color: 161C21FF
    /// (elevated light variant) ![](https://dummyimage.com/48x18/242D37.png&text=+)        Hex color: 242D37FF
    case secondaryBackground
    
    /// Secondary grouped background colors, with variants for base and elevated UI schemes.
    /// (base dark variant) ![](https://dummyimage.com/48x18/FFFFFF.png&text=+)              Hex color: FFFFFFFF
    /// (base light variant) ![](https://dummyimage.com/48x18/242E38.png&text=+)              Hex color: 242E38FF
    /// (elevated light variant) ![](https://dummyimage.com/48x18/2F3C48.png&text=+)        Hex color: 2F3C48FF
    case tertiaryBackground
    
    // MARK: - Label Colors (5 Colors)
    
    /// Standard color for navigation bar title label.
    /// (dark variant - normal) ![](https://dummyimage.com/48x18/223548.png&text=+)          Hex value: 223548FF
    /// (light variant - normal) ![](https://dummyimage.com/48x18/F5F6F7.png&text=+)          Hex value: F5F6F7FF
    @available(watchOS, unavailable)
    case navBarTitleLabel
    
    /// Standard color for primary label.
    /// (dark variant - normal) ![](https://dummyimage.com/48x18/223548.png&text=+)          Hex value: 223548FF
    /// (light variant - normal) ![](https://dummyimage.com/48x18/F5F6F7.png&text=+)          Hex value: F5F6F7FF
    case primaryLabel
    
    /// Standard color for secondary label.
    /// (dark variant - normal) ![](https://dummyimage.com/48x18/475E75.png&text=+)          Hex value: 475E75FF
    /// (light variant - normal) ![](https://dummyimage.com/48x18/D5DADD.png&text=+)          Hex value: D5DADDFF
    case secondaryLabel
    
    /// Standard color for tertiary label.
    /// (dark variant - normal) ![](https://dummyimage.com/48x18/475E75.png&text=+)          Hex value: 475E75E6
    /// (light variant - normal) ![](https://dummyimage.com/48x18/A9B4BE.png&text=+)          Hex value: A9B4BEFF
    case tertiaryLabel
    
    /// Standard color for quaternary label.
    /// (dark variant - normal) ![](https://dummyimage.com/48x18/8396A8.png&text=+)          Hex value: 8396A875
    /// (light variant - normal) ![](https://dummyimage.com/48x18/A9B4BE.png&text=+)          Hex value: A9B4BE4D
    case quaternaryLabel
    
    /// Standard color for quinary label.
    /// (dark variant - normal) ![](https://dummyimage.com/48x18/FFFFFF.png&text=+)          Hex value: FFFFFFFF
    /// (light variant - normal) ![](https://dummyimage.com/48x18/000000.png&text=+)          Hex value: 000000FF
    @available(watchOS, unavailable)
    case quinaryLabel

    /// Standard color for neutral label.
    /// (dark variant - normal) ![](https://dummyimage.com/48x18/354A5F.png&text=+)          Hex value: 354A5FFF
    /// (light variant - normal) ![](https://dummyimage.com/48x18/8396A8.png&text=+)          Hex value: 8396A8FF
    @available(watchOS, unavailable)
    case neutralLabel

    // MARK: - Fill Colors (4 Colors)
    
    /// Standard color for primary fill.
    /// (dark variant - normal) ![](https://dummyimage.com/48x18/8396A8.png&text=+)          Hex value: 8396A83D
    /// (light variant - normal) ![](https://dummyimage.com/48x18/8396A8.png&text=+)          Hex value: 8396A84D
    @available(watchOS, unavailable)
    case primaryFill
    
    /// Standard color for secondary fill.
    /// (dark variant - normal) ![](https://dummyimage.com/48x18/8396A8.png&text=+)          Hex value: 8396A833
    /// (light variant - normal) ![](https://dummyimage.com/48x18/8396A8.png&text=+)          Hex value: 8396A847
    @available(watchOS, unavailable)
    case secondaryFill
    
    /// Standard color for tertiary fill.
    /// (dark variant - normal) ![](https://dummyimage.com/48x18/8396A8.png&text=+)          Hex value: 8396A826
    /// (light variant - normal) ![](https://dummyimage.com/48x18/8396A8.png&text=+)          Hex value: 8396A833
    @available(watchOS, unavailable)
    case tertiaryFill
    
    /// Standard color for quaternary fill.
    /// (dark variant - normal) ![](https://dummyimage.com/48x18/8396A8.png&text=+)          Hex value: 8396A817
    /// (light variant - normal) ![](https://dummyimage.com/48x18/8396A8.png&text=+)          Hex value: 8396A829
    @available(watchOS, unavailable)
    case quaternaryFill
    
    // MARK: - Tint Colors (3 Colors)
    
    /// Standard color for tappable elements. Wraps `tintColorLight` and `tintColorDark`.
    /// Use `Color.preferredColor(forStyle:background:)` to select appropriate variant.
    /// (dark variant) ![](https://dummyimage.com/48x18/0070F2.png&text=+)          Hex color: 0070F2FF
    /// (light variant) ![](https://dummyimage.com/48x18/4DB1FF.png&text=+)          Hex color: 4DB1FFFF
    case tintColor
    
    /// Color for tappable elements on less contrast backgrounds.
    /// (dark variant) ![](https://dummyimage.com/48x18/0057D2.png&text=+)          Hex color: 0057D2FF
    /// (light variant) ![](https://dummyimage.com/48x18/4DB1FF.png&text=+)          Hex color: 4DB1FFFF
    @available(watchOS, unavailable)
    case tintColor2
    
    /// Color for tappable elements on less contrast backgrounds.
    /// (dark variant) ![](https://dummyimage.com/48x18/0070F2.png&text=+)          Hex color: 0070F214
    /// (light variant) ![](https://dummyimage.com/48x18/4DB1FF.png&text=+)          Hex color: 4DB1FF29
    @available(watchOS, unavailable)
    case tintColor3
    
    /// Wraps `tintColorTapStateLight` and `tintColorTapStateDark`.
    /// Use `Color.preferredColor(forStyle:background:)` to select appropriate variant.
    /// (dark variant) ![](https://dummyimage.com/48x18/0040B0.png&text=+)          Hex color: 0040B0FF
    /// (light variant) ![](https://dummyimage.com/48x18/1B90FF.png&text=+)          Hex color: 1B90FFFF
    case tintColorTapState
    
    // MARK: - Semantic Colors (14 Colors)
    
    /// Semantic color for "negative" (bad) label, with light and dark color variants.

    /// (dark variant) ![](https://dummyimage.com/48x18/AA0808.png&text=+)          Hex value: AA0808FF
    /// (light variant) ![](https://dummyimage.com/48x18/FF5C77.png&text=+)          Hex value: FF5C77FF
    case negativeLabel
    
    /// Semantic color for "positive" (good) label, with light and dark color variants.
    /// (dark variant) ![](https://dummyimage.com/48x18/256F3A.png&text=+)          Hex value: 256F3AFF
    /// (light variant) ![](https://dummyimage.com/48x18/5DC122.png&text=+)          Hex value: 5DC122FF
    case positiveLabel
    
    /// Semantic color for "critical" (risky) label, with light and dark color variants.
    /// (dark variant) ![](https://dummyimage.com/48x18/C35500.png&text=+)          Hex value: C35500FF
    /// (light variant) ![](https://dummyimage.com/48x18/FFB300.png&text=+)          Hex value: FFB300FF
    case criticalLabel
    
    /// Semantic color for "informative" label, with light and dark color variants.
    /// (dark variant) ![](https://dummyimage.com/48x18/0057D2.png&text=+)          Hex value: 0057D2FF
    /// (light variant) ![](https://dummyimage.com/48x18/4DB1FF.png&text=+)          Hex value: 4DB1FFFF
    @available(watchOS, unavailable)
    case informativeLabel
    
    /// NegativeLabelTapState
    /// (dark variant) ![](https://dummyimage.com/48x18/840606.png&text=+)          Hex value: 840606FF
    /// (light variant) ![](https://dummyimage.com/48x18/EE3939.png&text=+)          Hex value: EE3939FF
    case negativeLabelTapState
    
    /// PositiveLabelTapState
    /// (dark variant) ![](https://dummyimage.com/48x18/1E592F.png&text=+)          Hex value: 1E592FFF
    /// (light variant) ![](https://dummyimage.com/48x18/36A41D.png&text=+)          Hex value: 36A41DFF
    case positiveLabelTapState
    
    /// CriticalLabelTapState
    /// (dark variant) ![](https://dummyimage.com/48x18/8D2A00.png&text=+)          Hex value: 8D2A00FF
    /// (light variant) ![](https://dummyimage.com/48x18/FFB300.png&text=+)          Hex value: FFB300FF
    case criticalLabelTapState
    
    /// InformativeLabelTapState
    /// (dark variant) ![](https://dummyimage.com/48x18/0040B0.png&text=+)          Hex value: 0040B0FF
    /// (light variant) ![](https://dummyimage.com/48x18/1B90FF.png&text=+)          Hex value: 1B90FFFF
    @available(watchOS, unavailable)
    case informativeLabelTapState
    
    /// NeutralLabelTapState
    /// (dark variant) ![](https://dummyimage.com/48x18/223548.png&text=+)          Hex value: 223548FF
    /// (light variant) ![](https://dummyimage.com/48x18/8396A8.png&text=+)          Hex value: 8396A8FF
    @available(watchOS, unavailable)
    case neutralLabelTapState
    
    /// Semantic color for "negative" (bad) background, with light and dark color variants.
    /// (dark variant) ![](https://dummyimage.com/48x18/EE3939.png&text=+)          Hex value: EE393914
    /// (light variant) ![](https://dummyimage.com/48x18/EE3939.png&text=+)          Hex value: EE39391F
    @available(watchOS, unavailable)
    case negativeBackground
    
    /// Semantic color for "positive" (good) background, with light and dark color variants.
    /// (dark variant) ![](https://dummyimage.com/48x18/36A41D.png&text=+)          Hex value: 36A41D14
    /// (light variant) ![](https://dummyimage.com/48x18/36A41D.png&text=+)          Hex value: 36A41D1F
    @available(watchOS, unavailable)
    case positiveBackground
    
    /// Semantic color for "critical" (risky) background, with light and dark color variants.
    /// (dark variant) ![](https://dummyimage.com/48x18/E76500.png&text=+)          Hex value: E7650014
    /// (light variant) ![](https://dummyimage.com/48x18/E76500.png&text=+)          Hex value: E765001F
    @available(watchOS, unavailable)
    case criticalBackground
    
    /// Semantic color for "information" (neutral) background, with light and dark color variants.
    /// (dark variant) ![](https://dummyimage.com/48x18/1B90FF.png&text=+)          Hex value: 1B90FF14
    /// (light variant) ![](https://dummyimage.com/48x18/1B90FF.png&text=+)          Hex value: 1B90FF1F
    @available(watchOS, unavailable)
    case informationBackground
    
    /// Semantic color for "neutral" background, with light and dark color variants.
    /// (dark variant) ![](https://dummyimage.com/48x18/5B738B.png&text=+)          Hex value: 5B738B29
    /// (light variant) ![](https://dummyimage.com/48x18/5B738B.png&text=+)          Hex value: 5B738B38
    @available(watchOS, unavailable)
    case neutralBackground
    
    /// NegativeBackgroundTapState
    /// (dark variant) ![](https://dummyimage.com/48x18/EE3939.png&text=+)          Hex value: EE393929
    /// (light variant) ![](https://dummyimage.com/48x18/EE3939.png&text=+)          Hex value: EE393938
    @available(watchOS, unavailable)
    case negativeBackgroundTapState
    
    /// PositiveBackgroundTapState
    /// (dark variant) ![](https://dummyimage.com/48x18/36A41D.png&text=+)          Hex value: 36A41D29
    /// (light variant) ![](https://dummyimage.com/48x18/36A41D.png&text=+)          Hex value: 36A41D38
    @available(watchOS, unavailable)
    case positiveBackgroundTapState
    
    /// CriticalBackgroundTapState
    /// (dark variant) ![](https://dummyimage.com/48x18/E76500.png&text=+)          Hex value: E7650029
    /// (light variant) ![](https://dummyimage.com/48x18/E76500.png&text=+)          Hex value: E7650038
    @available(watchOS, unavailable)
    case criticalBackgroundTapState
    
    /// InformationBackgroundTapState
    /// (dark variant) ![](https://dummyimage.com/48x18/1B90FF.png&text=+)          Hex value: 1B90FF29
    /// (light variant) ![](https://dummyimage.com/48x18/1B90FF.png&text=+)          Hex value: 1B90FF38
    @available(watchOS, unavailable)
    case informationBackgroundTapState
    
    /// NeutralBackgroundTapState
    /// (dark variant) ![](https://dummyimage.com/48x18/5B738B.png&text=+)          Hex value: 5B738B29
    /// (light variant) ![](https://dummyimage.com/48x18/5B738B.png&text=+)          Hex value: 5B738B38
    @available(watchOS, unavailable)
    case neutralBackgroundTapState
    
    // MARK: - Separator Colors (2 Colors)
    
    /// Standard separator color, with variants for light and dark color schemes.
    /// (dark variant) ![](https://dummyimage.com/48x18/5B738B.png&text=+)          Hex color: #5B738B5E
    /// (light variant) ![](https://dummyimage.com/48x18/8396A8.png&text=+)          Hex value: #8396A85E
    case separator
    
    /// Standard separator color to be used in an opaque background, with variants for light and dark color schemes.
    /// (dark variant) ![](https://dummyimage.com/48x18/5B738B.png&text=+)          Hex color: #5B738BD4
    /// (light variant) ![](https://dummyimage.com/48x18/8396A8.png&text=+)          Hex value: #8396A8D4
    case separatorOpaque
    
    // MARK: - UI Materials Colors (6 Colors)
    
    /// Standard background color for navigation bar or headers.
    /// (dark variant) ![](https://dummyimage.com/48x18/FFFFFF.png&text=+)          Hex value: FFFFFFFF
    /// (light variant) ![](https://dummyimage.com/48x18/161C21.png&text=+)          Hex value: 161C21FF
    @available(watchOS, unavailable)
    case header
    
    /// Blended color for navigation bar or headers.
    /// (dark variant) ![](https://dummyimage.com/48x18/FFFFFF.png&text=+)          Hex value: FFFFFFD9
    /// (light variant) ![](https://dummyimage.com/48x18/13181D.png&text=+)          Hex value: 13181DE6
    @available(watchOS, unavailable)
    case headerBlended
    
    /// Transparent color for navigation bar or tap bar.
    /// (dark variant) ![](https://dummyimage.com/48x18/12171C.png&text=+)          Hex value: 12171CD9
    /// (light variant) ![](https://dummyimage.com/48x18/12171C.png&text=+)          Hex value: 12171CD9
    @available(watchOS, unavailable)
    case barTransparent
    
    /// Color for contrast element.
    /// (dark variant) ![](https://dummyimage.com/48x18/5B738B.png&text=+)          Hex value: 5B738BFF
    /// (light variant) ![](https://dummyimage.com/48x18/8396A8.png&text=+)          Hex value: 8396A8FF
    @available(watchOS, unavailable)
    case contrastElement
    
    /// Standard background color for toolbar, tab bar or footers.
    /// (dark variant) ![](https://dummyimage.com/48x18/FFFFFF.png&text=+)          Hex value: FFFFFFFF
    /// (light variant) ![](https://dummyimage.com/48x18/192027.png&text=+)          Hex value: 192027FF
    @available(watchOS, unavailable)
    case footer
    
    /// Standard cell background color, with variants for light and dark color schemes.
    /// (dark variant) ![](https://dummyimage.com/48x18/FFFFFF.png&text=+)          Hex color: FFFFFF00
    /// (light variant) ![](https://dummyimage.com/48x18/223548.png&text=+)          Hex color: 22354800
    @available(watchOS, unavailable)
    case cellBackground
    
    /// Apple materials effect color to be applied to priamry background color, with variants for light and dark color schemes.
    /// (base dark variant) ![](https://dummyimage.com/48x18/FFFFFF.png&text=+)              Hex color: FFFFFFD9
    /// (base light variant) ![](https://dummyimage.com/48x18/000000.png&text=+)              Hex color: 000000BF
    /// (elevated light variant) ![](https://dummyimage.com/48x18/171D23.png&text=+)        Hex color: 171D23BF
    @available(watchOS, unavailable)
    case chrome
    
    /// Apple materials effect color to be applied to secondary background color, with variants for light and dark color schemes.
    /// (base dark variant) ![](https://dummyimage.com/48x18/FFFFFF.png&text=+)              Hex color: FFFFFFD9
    /// (base light variant) ![](https://dummyimage.com/48x18/161C21.png&text=+)              Hex color: 161C21BF
    /// (elevated light variant) ![](https://dummyimage.com/48x18/242D37.png&text=+)        Hex color: 242D37BF
    @available(watchOS, unavailable)
    case chromeSecondary
    
    // MARK: - Chart Colors (13 Styles)
    
    /// Chart 1
    /// (dark variant) ![](https://dummyimage.com/48x18/3278BE.png&text=+)          Hex value: 3278BEFF
    /// (light variant) ![](https://dummyimage.com/48x18/3278BE.png&text=+)          Hex value: 3278BEFF
    @available(watchOS, unavailable)
    case chart1
    
    /// Chart 2
    /// (dark variant) ![](https://dummyimage.com/48x18/C87B00.png&text=+)          Hex value: C87B00FF
    /// (light variant) ![](https://dummyimage.com/48x18/F2A634.png&text=+)          Hex value: F2A634FF
    @available(watchOS, unavailable)
    case chart2
    
    /// Chart 3
    /// (dark variant) ![](https://dummyimage.com/48x18/75980B.png&text=+)          Hex value: 75980BFF
    /// (light variant) ![](https://dummyimage.com/48x18/B4CE35.png&text=+)          Hex value: B4CE35FF
    @available(watchOS, unavailable)
    case chart3
    
    /// Chart 4
    /// (dark variant) ![](https://dummyimage.com/48x18/DF1278.png&text=+)          Hex value: DF1278FF
    /// (light variant) ![](https://dummyimage.com/48x18/FA4F96.png&text=+)          Hex value: FA4F96FF
    @available(watchOS, unavailable)
    case chart4
    
    /// Chart 5
    /// (dark variant) ![](https://dummyimage.com/48x18/8B47D7.png&text=+)          Hex value: 8B47D7FF
    /// (light variant) ![](https://dummyimage.com/48x18/8B47D7.png&text=+)          Hex value: 8B47D7FF
    @available(watchOS, unavailable)
    case chart5
    
    /// Chart 6
    /// (dark variant) ![](https://dummyimage.com/48x18/049F9A.png&text=+)          Hex value: 049F9AFF
    /// (light variant) ![](https://dummyimage.com/48x18/049F9A.png&text=+)          Hex value: 049F9AFF
    @available(watchOS, unavailable)
    case chart6
    
    /// Chart 7
    /// (dark variant) ![](https://dummyimage.com/48x18/0070F2.png&text=+)          Hex value: 0070F2FF
    /// (light variant) ![](https://dummyimage.com/48x18/0070F2.png&text=+)          Hex value: 0070F2FF
    @available(watchOS, unavailable)
    case chart7
    
    /// Chart 8
    /// (dark variant) ![](https://dummyimage.com/48x18/CC00DC.png&text=+)          Hex value: CC00DCFF
    /// (light variant) ![](https://dummyimage.com/48x18/F31DED.png&text=+)          Hex value: F31DEDFF
    @available(watchOS, unavailable)
    case chart8
    
    /// Chart 9
    /// (dark variant) ![](https://dummyimage.com/48x18/798C77.png&text=+)          Hex value: 798C77FF
    /// (light variant) ![](https://dummyimage.com/48x18/8EA18C.png&text=+)          Hex value: 8EA18CFF
    @available(watchOS, unavailable)
    case chart9
    
    /// Chart 10
    /// (dark variant) ![](https://dummyimage.com/48x18/DA6C6C.png&text=+)          Hex value: DA6C6CFF
    /// (light variant) ![](https://dummyimage.com/48x18/F28585.png&text=+)          Hex value: F28585FF
    /// - Note: Removed since Palette V7. Mapping to `chart6`.
    @available(watchOS, unavailable)
    case chart10
    
    /// Chart 11
    /// (dark variant) ![](https://dummyimage.com/48x18/5D36FF.png&text=+)          Hex value: 5D36FFFF
    /// (light variant) ![](https://dummyimage.com/48x18/7858FF.png&text=+)          Hex value: 7858FFFF
    /// - Note: Removed since Palette V7. Mapping to `chart1`.
    @available(watchOS, unavailable)
    case chart11
    
    /// Chart 12
    /// (dark variant) ![](https://dummyimage.com/48x18/A68A5B.png&text=+)          Hex value: A68A5BFF
    /// (light variant) ![](https://dummyimage.com/48x18/A68A5B.png&text=+)          Hex value: A68A5BFF
    @available(watchOS, unavailable)
    case chart12
    
    /// StockUpStroke
    /// (dark variant) ![](https://dummyimage.com/48x18/30914C.png&text=+)          Hex value: 30914CFF
    /// (light variant) ![](https://dummyimage.com/48x18/30914C.png&text=+)          Hex value: 30914CFF
    @available(watchOS, unavailable)
    case stockUpStroke
    
    /// StockDownStroke
    /// (dark variant) ![](https://dummyimage.com/48x18/F53232.png&text=+)          Hex value: F53232FF
    /// (light variant) ![](https://dummyimage.com/48x18/F83030.png&text=+)          Hex value: F83030FF
    @available(watchOS, unavailable)
    case stockDownStroke
    
    /// ChartBad
    /// (dark variant) ![](https://dummyimage.com/48x18/F53232.png&text=+)          Hex value: F53232FF
    /// (light variant) ![](https://dummyimage.com/48x18/F83030.png&text=+)          Hex value: F83030FF
    @available(watchOS, unavailable)
    case chartBad
    
    /// ChartCritical
    /// (dark variant) ![](https://dummyimage.com/48x18/E26300.png&text=+)          Hex value: E26300FF
    /// (light variant) ![](https://dummyimage.com/48x18/DD6100.png&text=+)          Hex value: DD6100FF
    @available(watchOS, unavailable)
    case chartCritical
    
    /// ChartGood
    /// (dark variant) ![](https://dummyimage.com/48x18/30914C.png&text=+)          Hex value: 30914CFF
    /// (light variant) ![](https://dummyimage.com/48x18/30914C.png&text=+)          Hex value: 30914CFF
    @available(watchOS, unavailable)
    case chartGood
    
    /// ChartNeutral
    /// (dark variant) ![](https://dummyimage.com/48x18/6F89A1.png&text=+)          Hex value: 6F89A1FF
    /// (light variant) ![](https://dummyimage.com/48x18/758CA4.png&text=+)          Hex value: 758CA4FF
    @available(watchOS, unavailable)
    case chartNeutral
    
    // MARK: - Map Colors (11 Styles)
    
    /// Map 1
    /// (dark variant) ![](https://dummyimage.com/48x18/2E4A62.png&text=+)          Hex value: 2E4A62
    /// (light variant) ![](https://dummyimage.com/48x18/2E4A62.png&text=+)          Hex value: 2E4A62
    @available(watchOS, unavailable)
    case map1
    
    /// Map 2
    /// (dark variant) ![](https://dummyimage.com/48x18/56840E.png&text=+)          Hex value: 56840E
    /// (light variant) ![](https://dummyimage.com/48x18/56840E.png&text=+)          Hex value: 56840E
    @available(watchOS, unavailable)
    case map2
    
    /// Map 3
    /// (dark variant) ![](https://dummyimage.com/48x18/A63788.png&text=+)          Hex value: A63788
    /// (light variant) ![](https://dummyimage.com/48x18/A63788.png&text=+)          Hex value: A63788
    @available(watchOS, unavailable)
    case map3
    
    /// Map 4
    /// (dark variant) ![](https://dummyimage.com/48x18/0079C6.png&text=+)          Hex value: 0079C6
    /// (light variant) ![](https://dummyimage.com/48x18/0079C6.png&text=+)          Hex value: 0079C6
    @available(watchOS, unavailable)
    case map4
    
    /// Map 5
    /// (dark variant) ![](https://dummyimage.com/48x18/6B4EA0.png&text=+)          Hex value: 6B4EA0
    /// (light variant) ![](https://dummyimage.com/48x18/6B4EA0.png&text=+)          Hex value: 6B4EA0
    @available(watchOS, unavailable)
    case map5
    
    /// Map 6
    /// (dark variant) ![](https://dummyimage.com/48x18/A16B00.png&text=+)          Hex value: A16B00
    /// (light variant) ![](https://dummyimage.com/48x18/A16B00.png&text=+)          Hex value: A16B00
    @available(watchOS, unavailable)
    case map6
    
    /// Map 7
    /// (dark variant) ![](https://dummyimage.com/48x18/0B6295.png&text=+)          Hex value: 0B6295
    /// (light variant) ![](https://dummyimage.com/48x18/0B6295.png&text=+)          Hex value: 0B6295
    @available(watchOS, unavailable)
    case map7
    
    /// Map 8
    /// (dark variant) ![](https://dummyimage.com/48x18/D0R774.png&text=+)          Hex value: D0R774
    /// (light variant) ![](https://dummyimage.com/48x18/D0R774.png&text=+)          Hex value: D0R774
    @available(watchOS, unavailable)
    case map8
    
    /// Map 9
    /// (dark variant) ![](https://dummyimage.com/48x18/1C857A.png&text=+)          Hex value: 1C857A
    /// (light variant) ![](https://dummyimage.com/48x18/1C857A.png&text=+)          Hex value: 1C857A
    @available(watchOS, unavailable)
    case map9
    
    /// Map 10
    /// (dark variant) ![](https://dummyimage.com/48x18/C45300.png&text=+)          Hex value: C45300
    /// (light variant) ![](https://dummyimage.com/48x18/C45300.png&text=+)          Hex value: C45300
    @available(watchOS, unavailable)
    case map10
    
    // MARK: - Custom Colors (6 Styles)
    
    /// Custom Color 1
    /// (dark variant) ![](https://dummyimage.com/48x18/475E75.png&text=+)          Hex value: 475E75FF
    /// (light variant) ![](https://dummyimage.com/48x18/8396A8.png&text=+)          Hex value: 8396A8FF
    @available(watchOS, unavailable)
    case customColor1
    
    /// Custom Color 2
    /// (dark variant) ![](https://dummyimage.com/48x18/0057D2.png&text=+)          Hex value: 0057D2FF
    /// (light variant) ![](https://dummyimage.com/48x18/1B90FF.png&text=+)          Hex value: 1B90FFFF
    @available(watchOS, unavailable)
    case customColor2
    
    /// Custom Color 3
    /// (dark variant) ![](https://dummyimage.com/48x18/046C7A.png&text=+)          Hex value: 046C7AFF
    /// (light variant) ![](https://dummyimage.com/48x18/04ACA7.png&text=+)          Hex value: 04ACA7FF
    @available(watchOS, unavailable)
    case customColor3
    
    /// Custom Color 4
    /// (dark variant) ![](https://dummyimage.com/48x18/256F3A.png&text=+)          Hex value: 256F3AFF
    /// (light variant) ![](https://dummyimage.com/48x18/36A41D.png&text=+)          Hex value: 36A41DFF
    @available(watchOS, unavailable)
    case customColor4
    
    /// Custom Color 5
    /// (dark variant) ![](https://dummyimage.com/48x18/A93E00.png&text=+)          Hex value: A93E00FF
    /// (light variant) ![](https://dummyimage.com/48x18/F58B00.png&text=+)          Hex value: F58B00FF
    @available(watchOS, unavailable)
    case customColor5
    
    /// Custom Color 6
    /// (dark variant) ![](https://dummyimage.com/48x18/D20A0A.png&text=+)          Hex value: D20A0AFF
    /// (light variant) ![](https://dummyimage.com/48x18/D20A0A.png&text=+)          Hex value: D20A0AFF
    @available(watchOS, unavailable)
    case customColor6
    
    /// EsriEdit
    /// (dark variant) ![](https://dummyimage.com/48x18/1B6DD2.png&text=+)          Hex value: 1B6DD2
    /// (light variant) ![](https://dummyimage.com/48x18/FFF114.png&text=+)          Hex value: FFF114
    @available(watchOS, unavailable)
    case esriEdit
    
    /// jouleBrand
    /// (dark variant) ![](https://dummyimage.com/48x18/714FFF.png&text=+)          Hex value: 714FFF
    /// (light variant) ![](https://dummyimage.com/48x18/5D36FF.png&text=+)          Hex value: 5D36FF
    @available(watchOS, unavailable)
    case jouleBrand
    
    /// jouleAccent1
    /// (dark variant) ![](https://dummyimage.com/48x18/A100C2.png&text=+)          Hex value: A100C2
    /// (light variant) ![](https://dummyimage.com/48x18/D522BF.png&text=+)          Hex value: D522BF
    @available(watchOS, unavailable)
    case jouleAccent1
    
    /// jouleAccent2
    /// (dark variant) ![](https://dummyimage.com/48x18/7458FF.png&text=+)          Hex value: 7458FF
    /// (light variant) ![](https://dummyimage.com/48x18/7458FF.png&text=+)          Hex value: 7458FF
    @available(watchOS, unavailable)
    case jouleAccent2
    
    /// jouleAccent3
    /// (dark variant) ![](https://dummyimage.com/48x18/7458FF.png&text=+)          Hex value: 7458FF
    /// (light variant) ![](https://dummyimage.com/48x18/9D85FF.png&text=+)          Hex value: 9D85FF
    @available(watchOS, unavailable)
    case jouleAccent3
    
    /// jouleGradien1
    /// (dark variant) ![](https://dummyimage.com/48x18/5D36FF.png&text=+)          Hex value: 5D36FF
    /// (light variant) ![](https://dummyimage.com/48x18/714FFF.png&text=+)          Hex value: 714FFF
    @available(watchOS, unavailable)
    case jouleGradient1
    
    /// jouleGradient2
    /// (dark variant) ![](https://dummyimage.com/48x18/A100C2.png&text=+)          Hex value: A100C2
    /// (light variant) ![](https://dummyimage.com/48x18/D522BF.png&text=+)          Hex value: D522BF
    @available(watchOS, unavailable)
    case jouleGradient2
    
    // MARK: - Deprecated Basic Colors
    
    /// Standard color for quaternary label.
    /// (dark variant - normal) ![](https://dummyimage.com/48x18/5B738B.png&text=+)          Hex value: 5B738BD4
    /// (light variant - normal) ![](https://dummyimage.com/48x18/8396A8.png&text=+)          Hex value: 8396A8FF
    @available(*, unavailable, renamed: "quaternaryLabel")
    @available(watchOS, unavailable)
    case quarternaryLabel
    
    /// Standard color for quaternary fill.
    /// (dark variant - normal) ![](https://dummyimage.com/48x18/5B738B.png&text=+)          Hex value: 5B738B14
    /// (light variant - normal) ![](https://dummyimage.com/48x18/8396A8.png&text=+)          Hex value: 8396A814
    @available(*, unavailable, renamed: "quaternaryFill")
    @available(watchOS, unavailable)
    case quarternaryFill
    
    /// Standard base color, with variants for light and dark color schemes.
    /// (dark variant) ![](https://dummyimage.com/48x18/354A5F.png&text=+)        Hex color: 354A5F
    /// (light variant) ![](https://dummyimage.com/48x18/2C3D4F.png&text=+)        Hex color: 2C3D4F
    @available(*, deprecated, renamed: "header")
    @available(watchOS, unavailable)
    case shell
    
    /// Standard background color, with variants for light and dark color schemes.
    /// (dark variant) ![](https://dummyimage.com/48x18/EDEFF0.png&text=+)        Hex color: EDEFF0
    /// (light variant) ![](https://dummyimage.com/48x18/1C2228.png&text=+)        Hex color: 1C2228
    @available(*, deprecated, renamed: "primaryGroupedBackground")
    @available(watchOS, unavailable)
    case background1
    
    /// Standard background color, with variants for light and dark color schemes.
    /// (dark variant) ![](https://dummyimage.com/48x18/F7F7F7.png&text=+)        Hex color: F7F7F7
    /// (light variant) ![](https://dummyimage.com/48x18/232A31.png&text=+)        Hex color: 232A31
    @available(*, deprecated, renamed: "tertiaryGroupedBackground")
    @available(watchOS, unavailable)
    case background2
    
    /// Standard line color, with variants for light and dark color schemes.
    /// (dark variant) ![](https://dummyimage.com/48x18/89919A.png&text=+)          Hex color: 89919A
    /// (light variant) ![](https://dummyimage.com/48x18/8696A9.png&text=+)          Hex value: 8696A9
    @available(*, deprecated, renamed: "separatorOpaque")
    @available(watchOS, unavailable)
    case line
    
    /// Standard text color, with variants for light and dark color schemes.
    /// (dark variant) ![](https://dummyimage.com/48x18/32636A.png&text=+)        Hex color: 32636A
    /// (light variant) ![](https://dummyimage.com/48x18/FAFAFA.png&text=+)        Hex color: FAFAFA
    @available(*, deprecated, renamed: "primaryLabel")
    @available(watchOS, unavailable)
    case primary1
    
    /// Standard secondary text color, with variants for light and dark color schemes.
    /// (dark variant) ![](https://dummyimage.com/48x18/515456.png&text=+)        Hex color: 515456
    /// (light variant) ![](https://dummyimage.com/48x18/EEF0F1.png&text=+)        Hex color: EEF0F1
    @available(*, deprecated, renamed: "secondaryLabel")
    @available(watchOS, unavailable)
    case primary2
    
    /// Standard secondary text color, with variants for light and dark color schemes.
    /// (dark variant) ![](https://dummyimage.com/48x18/6A6D70.png&text=+)        Hex color: 6A6D70
    /// (light variant) ![](https://dummyimage.com/48x18/D3D7D9.png&text=+)        Hex color: D3D7D9
    @available(*, deprecated, renamed: "tertiaryLabel")
    @available(watchOS, unavailable)
    case primary3
    
    /// Standard background and accent color, used in any color scheme.
    /// (dark variant) ![](https://dummyimage.com/48x18/CCCCCC.png&text=+)          Hex color: CCCCCC
    /// (light variant) ![](https://dummyimage.com/48x18/687D94.png&text=+)          Hex color: 687D94
    @available(*, deprecated, renamed: "secondaryFill")
    @available(watchOS, unavailable)
    case primary4
    
    /// Standard background and accent color, used in any color scheme.
    /// (dark variant) ![](https://dummyimage.com/48x18/FAFAFA.png&text=+)          Hex color: FAFAFA
    /// (light variant) ![](https://dummyimage.com/48x18/23303E.png&text=+)          Hex color: 23303E
    @available(*, deprecated, renamed: "footer")
    @available(watchOS, unavailable)
    case primary5
    
    /// Standard background and accent color, for use in header and cell background.
    /// (dark variant) ![](https://dummyimage.com/48x18/FFFFFF.png&text=+)          Hex color: FFFFFF
    /// (light variant) ![](https://dummyimage.com/48x18/29313A.png&text=+)          Hex color: 29313A
    @available(*, deprecated, renamed: "secondaryGroupedBackground")
    @available(watchOS, unavailable)
    case primary6
    
    /// Standard background and accent color that is used in tag outline.
    /// (dark variant) ![](https://dummyimage.com/48x18/74777A.png&text=+)          Hex color: 74777A
    /// (light variant) ![](https://dummyimage.com/48x18/B8BEC1.png&text=+)          Hex color: B8BEC1
    @available(*, deprecated, renamed: "quaternaryLabel")
    @available(watchOS, unavailable)
    case primary7
    
    /// Background and accent color that is mainly used with dark color scheme.
    /// ![](https://dummyimage.com/48x18/2F3943.png&text=+)          Hex color: 2F3943
    @available(*, deprecated, renamed: "barTransparent")
    @available(watchOS, unavailable)
    case primary8
    
    /// Standard background and accent color.
    /// (dark variant) ![](https://dummyimage.com/48x18/E5E5E5.png&text=+)          Hex color: E5E5E5
    /// (light variant) ![](https://dummyimage.com/48x18/3A4552.png&text=+)          Hex color: 3A4552
    @available(*, deprecated, renamed: "separator")
    @available(watchOS, unavailable)
    case primary9
    
    /// Standard background and accent color.
    /// (dark variant) ![](https://dummyimage.com/48x18/89919A.png&text=+)          Hex color: 89919A
    /// (light variant) ![](https://dummyimage.com/48x18/8696A9.png&text=+)          Hex color: 8696A9
    @available(*, deprecated, renamed: "contrastElement")
    @available(watchOS, unavailable)
    case primary10
    
    /// Default light `tintColor`.
    /// (dark variant) ![](https://dummyimage.com/48x18/91C8F6.png&text=+)          Hex color: 91C8F6
    /// (light variant) ![](https://dummyimage.com/48x18/91C8F6.png&text=+)          Hex color: 91C8F6
    @available(*, deprecated, renamed: "tintColor")
    @available(watchOS, unavailable)
    case tintColorLight
    
    /// Default dark `tintColor`.
    /// (dark variant) ![](https://dummyimage.com/48x18/0A6ED1.png&text=+)          Hex color: 0A6ED1
    /// (light variant) ![](https://dummyimage.com/48x18/0A6ED1.png&text=+)          Hex color: 0A6ED1
    @available(*, deprecated, renamed: "tintColor2")
    @available(watchOS, unavailable)
    case tintColorDark
    
    /// Tap state (`UIControlState.highlighted`) color for control with `tintColor` equal to `tintColorLight`.  Should not be used as text color.
    /// (dark variant) ![](https://dummyimage.com/48x18/74A5D5.png&text=+)          Hex color: 74A5D5
    /// (light variant) ![](https://dummyimage.com/48x18/0A84FF.png&text=+)          Hex color: 0A84FF66 (alpha: 40%)
    @available(*, deprecated, renamed: "tintColorTapStateLight")
    @available(watchOS, unavailable)
    case tintColorTapStateLight
    
    /// Tap state (`UIControlState.highlighted`) color for control with `tintColor` equal to `tintColorDark`.  May be used as text color.
    /// (dark variant) ![](https://dummyimage.com/48x18/0854A1.png&text=+)          Hex color: 0854A1
    /// (light variant) ![](https://dummyimage.com/48x18/0A84FF.png&text=+)          Hex color: 0A84FF66 (alpha: 40%)
    @available(*, deprecated, renamed: "tintColorTapStateDark")
    @available(watchOS, unavailable)
    case tintColorTapStateDark
    
    /// Standard cell background color when being tapped, with variants for light and dark color schemes.
    /// (dark variant) ![](https://dummyimage.com/48x18/89919A.png&text=+)          Hex color: 89919A1C (alpha: 11%)
    /// (light variant) ![](https://dummyimage.com/48x18/8696A9.png&text=+)          Hex color: 8696A91C (alpha: 11%)
    @available(*, deprecated, renamed: "quaternaryFill")
    @available(watchOS, unavailable)
    case cellBackgroundTapState
    
    /// Standard shadow color.
    /// ![](https://dummyimage.com/48x18/000000.png&text=+)          Hex color: 000000
    @available(*, deprecated, renamed: "cardShadow")
    @available(watchOS, unavailable)
    case shadow
    
    /// Semantic color for "negative" (bad) value, with light and dark color variants.
    /// (dark variant) ![](https://dummyimage.com/48x18/BB0000.png&text=+)        Hex color: BB0000
    /// (light variant) ![](https://dummyimage.com/48x18/FF453A.png&text=+)        Hex color: FF453A
    @available(*, deprecated, renamed: "negativeLabel")
    @available(watchOS, unavailable)
    case negative
    
    /// Semantic color for "positive" (good) value, with light and dark color variants.
    /// (dark variant) ![](https://dummyimage.com/48x18/107E3E.png&text=+)        Hex color: 107E3E
    /// (light variant) ![](https://dummyimage.com/48x18/32D74B.png&text=+)        Hex color: 32D74B
    @available(*, deprecated, renamed: "positiveLabel")
    @available(watchOS, unavailable)
    case positive
    
    /// Semantic color for "critical" (risky) value, with light and dark color variants.
    /// (dark variant) ![](https://dummyimage.com/48x18/E9730C.png&text=+)        Hex color: E9730C
    /// (light variant) ![](https://dummyimage.com/48x18/FF9F0A.png&text=+)        Hex color: FF9F0A
    @available(*, deprecated, renamed: "criticalLabel")
    @available(watchOS, unavailable)
    case critical
    
    // MARK: - Deprecated Accent Colors
    
    @available(iOS, deprecated, renamed: "mango3")
    @available(macOS, deprecated, renamed: "mango3")
    @available(macCatalyst, deprecated, renamed: "mango3")
    case accent1
    
    @available(*, deprecated, renamed: "mango4")
    @available(watchOS, unavailable)
    case accent1b
    
    @available(iOS, deprecated, renamed: "red4")
    @available(macOS, deprecated, renamed: "red4")
    @available(macCatalyst, deprecated, renamed: "red4")
    case accent2
    
    @available(*, deprecated, renamed: "red5")
    @available(watchOS, unavailable)
    case accent2b
    
    @available(iOS, deprecated, renamed: "pink5")
    @available(macOS, deprecated, renamed: "pink5")
    @available(macCatalyst, deprecated, renamed: "pink5")
    case accent3
    
    @available(iOS, deprecated, renamed: "pink6")
    @available(macOS, deprecated, renamed: "pink6")
    @available(macCatalyst, deprecated, renamed: "pink6")
    case accent4
    
    @available(iOS, deprecated, renamed: "indigo6")
    @available(macOS, deprecated, renamed: "indigo6")
    @available(macCatalyst, deprecated, renamed: "indigo6")
    case accent5
    
    @available(iOS, deprecated, renamed: "blue6")
    @available(macOS, deprecated, renamed: "blue6")
    @available(macCatalyst, deprecated, renamed: "blue6")
    case accent6
    
    @available(*, deprecated, renamed: "blue7")
    @available(watchOS, unavailable)
    case accent6b
    
    @available(iOS, deprecated, renamed: "teal4")
    @available(macOS, deprecated, renamed: "teal4")
    @available(macCatalyst, deprecated, renamed: "teal4")
    case accent7
    
    @available(*, deprecated, renamed: "teal5")
    @available(watchOS, unavailable)
    case accent7b
    
    @available(iOS, deprecated, renamed: "green4")
    @available(macOS, deprecated, renamed: "green4")
    @available(macCatalyst, deprecated, renamed: "green4")
    case accent8
    
    @available(iOS, deprecated, renamed: "indigo5")
    @available(macOS, deprecated, renamed: "indigo5")
    @available(macCatalyst, deprecated, renamed: "indigo5")
    case accent9
    
    @available(*, deprecated, renamed: "grey5")
    @available(watchOS, unavailable)
    case accent10
    
    @available(*, deprecated, renamed: "grey4")
    @available(watchOS, unavailable)
    case accent10b
    
    // MARK: - Deprecated Colors Since Fiori FUIPalette V5
    
    /// Standard background color for `UINavigationBar`.
    /// (dark variant) ![](https://dummyimage.com/48x18/354A5F.png&text=+)          Hex value: 354A5F
    /// (light variant) ![](https://dummyimage.com/48x18/2C3D4F.png&text=+)          Hex value: 2C3D4F
    @available(*, deprecated, renamed: "header")
    @available(watchOS, unavailable)
    case navigationBar
    
    /// Top gradient color, originating at SAP Fiori `UINavigationBar`.  ![](https://dummyimage.com/48x18/445E75.png&text=+) Hex color: 445E75
    @available(*, deprecated, renamed: "header")
    @available(watchOS, unavailable)
    case backgroundGradientTop
    /// Bottom gradient color, originating at SAP Fiori `UINavigationBar`.  ![](https://dummyimage.com/48x18/3F566B.png&text=+) Hex color: 3F566B
    @available(*, deprecated, renamed: "header")
    @available(watchOS, unavailable)
    case backgroundGradientBottom
    /// Standard background color, with variants for light and dark color schemes.
    /// (dark variant) ![](https://dummyimage.com/48x18/F3F3F3.png&text=+)          Hex value: F3F3F3
    /// (light variant) ![](https://dummyimage.com/48x18/000000.png&text=+)          Hex value: 000000
    @available(*, deprecated, renamed: "primaryBackground")
    @available(watchOS, unavailable)
    case backgroundBase
    
    #if !os(watchOS)
        public static var allCases: [ColorStyle] = [.grey1, .grey2, .grey3, .grey4, .grey5, .grey6,
                                                    .grey7, .grey8, .grey9, .grey10, .grey11, .blue1,
                                                    .blue2, .blue3, .blue4, .blue5, .blue6, .blue7,
                                                    .blue8, .blue9, .blue10, .blue11, .teal1, .teal2,
                                                    .teal3, .teal4, .teal5, .teal6, .teal7, .teal8,
                                                    .teal9, .teal10, .teal11, .green1, .green2, .green3,
                                                    .green4, .green5, .green6, .green7, .green8, .green9,
                                                    .green10, .green11, .mango1, .mango2, .mango3, .mango4,
                                                    .mango5, .mango6, .mango7, .mango8, .mango9, .mango10,
                                                    .mango11, .red1, .red2, .red3, .red4, .red5, .red6,
                                                    .red7, .red8, .red9, .red10, .red11, .pink1, .pink2,
                                                    .pink3, .pink4, .pink5, .pink6, .pink7, .pink8, .pink9,
                                                    .pink10, .pink11, .raspberry1, .raspberry2, .raspberry3,
                                                    .raspberry4, .raspberry5, .raspberry6, .raspberry7,
                                                    .raspberry8, .raspberry9, .raspberry10, .raspberry11,
                                                    .indigo1, .indigo2, .indigo3, .indigo4, .indigo5,
                                                    .indigo6, .indigo7, .indigo8, .indigo9, .indigo10,
                                                    .indigo11, .baseWhite, .baseBlack, .base1, .base2,
                                                    .accentLabel1, .accentLabel2, .accentLabel3, .accentLabel4,
                                                    .accentLabel5, .accentLabel6, .accentLabel7, .accentLabel8,
                                                    .accentLabel9, .accentLabel10, .accentBackground1,
                                                    .accentBackground2, .accentBackground3, .accentBackground4,
                                                    .accentBackground5, .accentBackground6, .accentBackground7,
                                                    .accentBackground8, .accentBackground9, .accentBackground10,
                                                    .cardShadow, .sectionShadow, .primaryGroupedBackground,
                                                    .secondaryGroupedBackground, .tertiaryGroupedBackground,
                                                    .primaryBackground, .secondaryBackground, .tertiaryBackground,
                                                    .navBarTitleLabel, .primaryLabel, .secondaryLabel,
                                                    .tertiaryLabel, .quaternaryLabel, .quinaryLabel, .informativeLabel,
                                                    .neutralLabel, .primaryFill, .secondaryFill, .tertiaryFill, .quaternaryFill,
                                                    .tintColor, .tintColor2, .tintColor3, .tintColorTapState, .negativeLabel,
                                                    .positiveLabel, .criticalLabel, .negativeLabelTapState,
                                                    .positiveLabelTapState, .criticalLabelTapState, .neutralLabelTapState,
                                                    .negativeBackground, .positiveBackground, .criticalBackground,
                                                    .informationBackground, .neutralBackground, .negativeBackgroundTapState,
                                                    .positiveBackgroundTapState, .criticalBackgroundTapState,
                                                    .informationBackgroundTapState, .informativeLabelTapState,
                                                    .neutralBackgroundTapState, .separator, .separatorOpaque,
                                                    .header, .headerBlended, .barTransparent, .contrastElement,
                                                    .footer, .cellBackground, .chrome, .chromeSecondary, .chart1, .chart2, .chart3, .chart4,
                                                    .chart5, .chart6, .chart7, .chart8, .chart9, .chart10, .chart11, .chart12,
                                                    .stockUpStroke, .stockDownStroke, .chartBad, .chartCritical, .chartNeutral, .chartGood, .map1, .map2, .map3, .map4,
                                                    .map5, .map6, .map7, .map8, .map9, .map10, .customColor1, .customColor2, .customColor3, .customColor4, .customColor5, .customColor6,
                                                    .esriEdit, .jouleBrand, .jouleAccent1, .jouleAccent2, .jouleAccent3, .jouleGradient1, .jouleGradient2]
    #else
        public static var allCases: [ColorStyle] = [.primaryLabel, .secondaryLabel, .tertiaryLabel, .quaternaryLabel, .primaryBackground, .secondaryBackground, .tertiaryBackground, .tintColor, .tintColorTapState, .negativeLabel, .negativeLabelTapState, .criticalLabel, .criticalLabelTapState, .positiveLabel, .positiveLabelTapState, .separator, .separatorOpaque, .accent1, .accent2, .accent3, .accent4, .accent5, .accent6, .accent7, .accent8, .accent9]
    #endif
}

#if !SAPFIORI_TARGET
    extension ColorStyle {
        // get color from `Color.preferredColor` given a global definition name in a style sheet, e.g. tintColor_lightBackground
        static func color(from stringName: String) -> Color? {
            func parseColor(from string: String) -> Color? {
                var styleString = string
                var optSchemeString: String?
    
                if let index = string.firstIndex(of: "_") {
                    styleString = String(string.prefix(upTo: index))
                    if let schemeIndex = string.index(index, offsetBy: 1, limitedBy: string.endIndex) {
                        optSchemeString = String(string.suffix(from: schemeIndex))
                    }
                }
    
                guard let style = ColorStyle(rawValue: styleString) else { return nil }
                guard let schemeString = optSchemeString, let scheme = BackgroundColorScheme(rawValue: schemeString) else {
                    return Color.preferredColor(style)
                }
                return Color.preferredColor(style, background: scheme)
            }
            return parseColor(from: stringName)
        }
    }
#endif
