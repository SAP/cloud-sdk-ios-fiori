import SwiftUI

public enum ColorStyle: String, CaseIterable {
    // MARK: - Fiori Next Core Colors (116 Colors)
    
    // Core 1: Greys (1 - 11)
    /// Grey 1
    /// (dark variant) ![](https://dummyimage.com/48x18/F5F6F7.png&text=+)          Hex value: F5F6F7FF
    /// (light variant) ![](https://dummyimage.com/48x18/12171C.png&text=+)          Hex value: 12171CFF
    case grey1
    
    /// Grey 2
    /// (dark variant) ![](https://dummyimage.com/48x18/EAECEE.png&text=+)          Hex value: EAECEEFF
    /// (light variant) ![](https://dummyimage.com/48x18/1A2733.png&text=+)          Hex value: 1A2733FF
    case grey2
    
    /// Grey 3
    /// (dark variant) ![](https://dummyimage.com/48x18/D5DADD.png&text=+)          Hex value: D5DADDFF
    /// (light variant) ![](https://dummyimage.com/48x18/223548.png&text=+)          Hex value: 223548FF
    case grey3
    
    /// Grey 4
    /// (dark variant) ![](https://dummyimage.com/48x18/A9B4BE.png&text=+)          Hex value: A9B4BEFF
    /// (light variant) ![](https://dummyimage.com/48x18/354A5F.png&text=+)          Hex value: 354A5FFF
    case grey4
    
    /// Grey 5
    /// (dark variant) ![](https://dummyimage.com/48x18/8396A8.png&text=+)          Hex value: 8396A8FF
    /// (light variant) ![](https://dummyimage.com/48x18/475E75.png&text=+)          Hex value: 475E75FF
    case grey5
    
    /// Grey 6
    /// (dark variant) ![](https://dummyimage.com/48x18/5B738B.png&text=+)          Hex value: 5B738BFF
    /// (light variant) ![](https://dummyimage.com/48x18/5B738B.png&text=+)          Hex value: 5B738BFF
    case grey6
    
    /// Grey 7
    /// (dark variant) ![](https://dummyimage.com/48x18/475E75.png&text=+)          Hex value: 475E75FF
    /// (light variant) ![](https://dummyimage.com/48x18/8396A8.png&text=+)          Hex value: 8396A8FF
    case grey7
    
    /// Grey 8
    /// (dark variant) ![](https://dummyimage.com/48x18/354A5F.png&text=+)          Hex value: 354A5FFF
    /// (light variant) ![](https://dummyimage.com/48x18/A9B4BE.png&text=+)          Hex value: A9B4BEFF
    case grey8
    
    /// Grey 9
    /// (dark variant) ![](https://dummyimage.com/48x18/223548.png&text=+)          Hex value: 223548FF
    /// (light variant) ![](https://dummyimage.com/48x18/D5DADD.png&text=+)          Hex value: D5DADDFF
    case grey9
    
    /// Grey 10
    /// (dark variant) ![](https://dummyimage.com/48x18/1A2733.png&text=+)          Hex value: 1A2733FF
    /// (light variant) ![](https://dummyimage.com/48x18/EAECEE.png&text=+)          Hex value: EAECEEFF
    case grey10
    
    /// Grey 11
    /// (dark variant) ![](https://dummyimage.com/48x18/12171C.png&text=+)          Hex value: 12171CFF
    /// (light variant) ![](https://dummyimage.com/48x18/F5F6F7.png&text=+)          Hex value: F5F6F7FF
    case grey11
    
    // Core 2: Blues (1 - 11)
    /// Blue 1
    /// (dark variant) ![](https://dummyimage.com/48x18/EBF8FF.png&text=+)          Hex value: EBF8FFFF
    /// (light variant) ![](https://dummyimage.com/48x18/00144A.png&text=+)          Hex value: 00144AFF
    case blue1
    
    /// Blue 2
    /// (dark variant) ![](https://dummyimage.com/48x18/D1EFFF.png&text=+)          Hex value: D1EFFFFF
    /// (light variant) ![](https://dummyimage.com/48x18/002A86.png&text=+)          Hex value: 002A86FF
    case blue2
    
    /// Blue 3
    /// (dark variant) ![](https://dummyimage.com/48x18/A6E0FF.png&text=+)          Hex value: A6E0FFFF
    /// (light variant) ![](https://dummyimage.com/48x18/0040B0.png&text=+)          Hex value: 0040B0FF
    case blue3
    
    /// Blue 4
    /// (dark variant) ![](https://dummyimage.com/48x18/89D1FF.png&text=+)          Hex value: 89D1FFFF
    /// (light variant) ![](https://dummyimage.com/48x18/0057D2.png&text=+)          Hex value: 0057D2FF
    case blue4
    
    /// Blue 5
    /// (dark variant) ![](https://dummyimage.com/48x18/4DB1FF.png&text=+)          Hex value: 4DB1FFFF
    /// (light variant) ![](https://dummyimage.com/48x18/0070F2.png&text=+)          Hex value: 0070F2FF
    case blue5
    
    /// Blue 6
    /// (dark variant) ![](https://dummyimage.com/48x18/1B90FF.png&text=+)          Hex value: 1B90FFFF
    /// (light variant) ![](https://dummyimage.com/48x18/1B90FF.png&text=+)          Hex value: 1B90FFFF
    case blue6
    
    /// Blue 7
    /// (dark variant) ![](https://dummyimage.com/48x18/0070F2.png&text=+)          Hex value: 0070F2FF
    /// (light variant) ![](https://dummyimage.com/48x18/4DB1FF.png&text=+)          Hex value: 4DB1FFFF
    case blue7
    
    /// Blue 8
    /// (dark variant) ![](https://dummyimage.com/48x18/0057D2.png&text=+)          Hex value: 0057D2FF
    /// (light variant) ![](https://dummyimage.com/48x18/89D1FF.png&text=+)          Hex value: 89D1FFFF
    case blue8
    
    /// Blue 9
    /// (dark variant) ![](https://dummyimage.com/48x18/0040B0.png&text=+)          Hex value: 0040B0FF
    /// (light variant) ![](https://dummyimage.com/48x18/A6E0FF.png&text=+)          Hex value: A6E0FFFF
    case blue9
    
    /// Blue 10
    /// (dark variant) ![](https://dummyimage.com/48x18/002A86.png&text=+)          Hex value: 002A86FF
    /// (light variant) ![](https://dummyimage.com/48x18/D1EFFF.png&text=+)          Hex value: D1EFFFFF
    case blue10
    
    /// Blue 11
    /// (dark variant) ![](https://dummyimage.com/48x18/00144A.png&text=+)          Hex value: 00144AFF
    /// (light variant) ![](https://dummyimage.com/48x18/EBF8FF.png&text=+)          Hex value: EBF8FFFF
    case blue11
    
    // Core 3: Teals (1 - 11)
    /// Teal 1
    /// (dark variant) ![](https://dummyimage.com/48x18/DAFDF5.png&text=+)          Hex value: DAFDF5FF
    /// (light variant) ![](https://dummyimage.com/48x18/012931.png&text=+)          Hex value: 012931FF
    case teal1
    
    /// Teal 2
    /// (dark variant) ![](https://dummyimage.com/48x18/C2FCEE.png&text=+)          Hex value: C2FCEEFF
    /// (light variant) ![](https://dummyimage.com/48x18/02414C.png&text=+)          Hex value: 02414CFF
    case teal2
    
    /// Teal 3
    /// (dark variant) ![](https://dummyimage.com/48x18/64EDD2.png&text=+)          Hex value: 64EDD2FF
    /// (light variant) ![](https://dummyimage.com/48x18/035663.png&text=+)          Hex value: 035663FF
    case teal3
    
    /// Teal 4
    /// (dark variant) ![](https://dummyimage.com/48x18/2CE0BF.png&text=+)          Hex value: 2CE0BFFF
    /// (light variant) ![](https://dummyimage.com/48x18/046C7A.png&text=+)          Hex value: 046C7AFF
    case teal4
    
    /// Teal 5
    /// (dark variant) ![](https://dummyimage.com/48x18/00CEAC.png&text=+)          Hex value: 00CEACFF
    /// (light variant) ![](https://dummyimage.com/48x18/07838F.png&text=+)          Hex value: 07838FFF
    case teal5
    
    /// Teal 6
    /// (dark variant) ![](https://dummyimage.com/48x18/049F9A.png&text=+)          Hex value: 049F9AFF
    /// (light variant) ![](https://dummyimage.com/48x18/049F9A.png&text=+)          Hex value: 049F9AFF
    case teal6
    
    /// Teal 7
    /// (dark variant) ![](https://dummyimage.com/48x18/07838F.png&text=+)          Hex value: 07838FFF
    /// (light variant) ![](https://dummyimage.com/48x18/00CEAC.png&text=+)          Hex value: 00CEACFF
    case teal7
    
    /// Teal 8
    /// (dark variant) ![](https://dummyimage.com/48x18/046C7A.png&text=+)          Hex value: 046C7AFF
    /// (light variant) ![](https://dummyimage.com/48x18/2CE0BF.png&text=+)          Hex value: 2CE0BFFF
    case teal8
    
    /// Teal 9
    /// (dark variant) ![](https://dummyimage.com/48x18/035663.png&text=+)          Hex value: 035663FF
    /// (light variant) ![](https://dummyimage.com/48x18/64EDD2.png&text=+)          Hex value: 64EDD2FF
    case teal9
    
    /// Teal 10
    /// (dark variant) ![](https://dummyimage.com/48x18/02414C.png&text=+)          Hex value: 02414CFF
    /// (light variant) ![](https://dummyimage.com/48x18/C2FCEE.png&text=+)          Hex value: C2FCEEFF
    case teal10
    
    /// Teal 11
    /// (dark variant) ![](https://dummyimage.com/48x18/002A86.png&text=+)          Hex value: 002A86FF
    /// (light variant) ![](https://dummyimage.com/48x18/DAFDF5.png&text=+)          Hex value: DAFDF5FF
    case teal11
    
    // Core 4: Greens (1 - 11)
    /// Green 1
    /// (dark variant) ![](https://dummyimage.com/48x18/F5FAE5.png&text=+)          Hex value: F5FAE5FF
    /// (light variant) ![](https://dummyimage.com/48x18/0E2B16.png&text=+)          Hex value: 0E2B16FF
    case green1
    
    /// Green 2
    /// (dark variant) ![](https://dummyimage.com/48x18/EBF5CB.png&text=+)          Hex value: EBF5CBFF
    /// (light variant) ![](https://dummyimage.com/48x18/164323.png&text=+)          Hex value: 164323FF
    case green2
    
    /// Green 3
    /// (dark variant) ![](https://dummyimage.com/48x18/BDE986.png&text=+)          Hex value: BDE986FF
    /// (light variant) ![](https://dummyimage.com/48x18/1E592F.png&text=+)          Hex value: 1E592FFF
    case green3
    
    /// Green 4
    /// (dark variant) ![](https://dummyimage.com/48x18/97DD40.png&text=+)          Hex value: 97DD40FF
    /// (light variant) ![](https://dummyimage.com/48x18/256F3A.png&text=+)          Hex value: 256F3AFF
    case green4
    
    /// Green 5
    /// (dark variant) ![](https://dummyimage.com/48x18/5DC122.png&text=+)          Hex value: 5DC122FF
    /// (light variant) ![](https://dummyimage.com/48x18/188918.png&text=+)          Hex value: 188918FF
    case green5
    
    /// Green 6
    /// (dark variant) ![](https://dummyimage.com/48x18/36A41D.png&text=+)          Hex value: 36A41DFF
    /// (light variant) ![](https://dummyimage.com/48x18/36A41D.png&text=+)          Hex value: 36A41DFF
    case green6
    
    /// Green 7
    /// (dark variant) ![](https://dummyimage.com/48x18/188918.png&text=+)          Hex value: 188918FF
    /// (light variant) ![](https://dummyimage.com/48x18/5DC122.png&text=+)          Hex value: 5DC122FF
    case green7
    
    /// Green 8
    /// (dark variant) ![](https://dummyimage.com/48x18/256F3A.png&text=+)          Hex value: 256F3AFF
    /// (light variant) ![](https://dummyimage.com/48x18/97DD40.png&text=+)          Hex value: 97DD40FF
    case green8
    
    /// Green 9
    /// (dark variant) ![](https://dummyimage.com/48x18/1E592F.png&text=+)          Hex value: 1E592FFF
    /// (light variant) ![](https://dummyimage.com/48x18/BDE986.png&text=+)          Hex value: BDE986FF
    case green9
    
    /// Green 10
    /// (dark variant) ![](https://dummyimage.com/48x18/450B00.png&text=+)          Hex value: 450B00FF
    /// (light variant) ![](https://dummyimage.com/48x18/EBF5CB.png&text=+)          Hex value: EBF5CBFF
    case green10
    
    /// Green 11
    /// (dark variant) ![](https://dummyimage.com/48x18/363636.png&text=+)          Hex value: 363636FF
    /// (light variant) ![](https://dummyimage.com/48x18/F5FAE5.png&text=+)          Hex value: F5FAE5FF
    case green11
    
    // Core 5: Mangos (1 - 11)
    /// Mango 1
    /// (dark variant) ![](https://dummyimage.com/48x18/FFF8D6.png&text=+)          Hex value: FFF8D6FF
    /// (light variant) ![](https://dummyimage.com/48x18/450B00.png&text=+)          Hex value: 450B00FF
    case mango1
    
    /// Mango 2
    /// (dark variant) ![](https://dummyimage.com/48x18/FFF3B8.png&text=+)          Hex value: FFF3B8FF
    /// (light variant) ![](https://dummyimage.com/48x18/6D1900.png&text=+)          Hex value: 6D1900FF
    case mango2
    
    /// Mango 3
    /// (dark variant) ![](https://dummyimage.com/48x18/FFDF72.png&text=+)          Hex value: FFDF72FF
    /// (light variant) ![](https://dummyimage.com/48x18/8D2A00.png&text=+)          Hex value: 8D2A00FF
    case mango3
    
    /// Mango 4
    /// (dark variant) ![](https://dummyimage.com/48x18/FFC933.png&text=+)          Hex value: FFC933FF
    /// (light variant) ![](https://dummyimage.com/48x18/A93E00.png&text=+)          Hex value: A93E00FF
    case mango4
    
    /// Mango 5
    /// (dark variant) ![](https://dummyimage.com/48x18/F58F00.png&text=+)          Hex value: F58F00FF
    /// (light variant) ![](https://dummyimage.com/48x18/C35500.png&text=+)          Hex value: C35500FF
    case mango5
    
    /// Mango 6
    /// (dark variant) ![](https://dummyimage.com/48x18/E76500.png&text=+)          Hex value: E76500FF
    /// (light variant) ![](https://dummyimage.com/48x18/E76500.png&text=+)          Hex value: E76500FF
    case mango6
    
    /// Mango 7
    /// (dark variant) ![](https://dummyimage.com/48x18/C35500.png&text=+)          Hex value: C35500FF
    /// (light variant) ![](https://dummyimage.com/48x18/FFB300.png&text=+)          Hex value: FFB300FF
    case mango7
    
    /// Mango 8
    /// (dark variant) ![](https://dummyimage.com/48x18/6D1900.png&text=+)          Hex value: 6D1900FF
    /// (light variant) ![](https://dummyimage.com/48x18/FFC933.png&text=+)          Hex value: FFC933FF
    case mango8
    
    /// Mango 9
    /// (dark variant) ![](https://dummyimage.com/48x18/8D2A00.png&text=+)          Hex value: 8D2A00FF
    /// (light variant) ![](https://dummyimage.com/48x18/FFDF72.png&text=+)          Hex value: FFDF72FF
    case mango9
    
    /// Mango 10
    /// (dark variant) ![](https://dummyimage.com/48x18/6D1900.png&text=+)          Hex value: 6D1900FF
    /// (light variant) ![](https://dummyimage.com/48x18/FFF3B8.png&text=+)          Hex value: FFF3B8FF
    case mango10
    
    /// Mango 11
    /// (dark variant) ![](https://dummyimage.com/48x18/450B00.png&text=+)          Hex value: 450B00FF
    /// (light variant) ![](https://dummyimage.com/48x18/FFF8D6.png&text=+)          Hex value: FFF8D6FF
    case mango11
    
    // Core 6: Reds (1 - 11)
    /// Red 1
    /// (dark variant) ![](https://dummyimage.com/48x18/FFEAF4.png&text=+)          Hex value: FFEAF4FF
    /// (light variant) ![](https://dummyimage.com/48x18/350000.png&text=+)          Hex value: 350000FF
    case red1
    
    /// Red 2
    /// (dark variant) ![](https://dummyimage.com/48x18/FFD5EA.png&text=+)          Hex value: FFD5EAFF
    /// (light variant) ![](https://dummyimage.com/48x18/5A0404.png&text=+)          Hex value: 5A0404FF
    case red2
    
    /// Red 3
    /// (dark variant) ![](https://dummyimage.com/48x18/FFB2D2.png&text=+)          Hex value: FFB2D2FF
    /// (light variant) ![](https://dummyimage.com/48x18/840606.png&text=+)          Hex value: 840606FF
    case red3
    
    /// Red 4
    /// (dark variant) ![](https://dummyimage.com/48x18/FF8CB2.png&text=+)          Hex value: FF8CB2FF
    /// (light variant) ![](https://dummyimage.com/48x18/AA0808.png&text=+)          Hex value: AA0808FF
    case red4
    
    /// Red 5
    /// (dark variant) ![](https://dummyimage.com/48x18/FF5C77.png&text=+)          Hex value: FF5C77FF
    /// (light variant) ![](https://dummyimage.com/48x18/D20A0A.png&text=+)          Hex value: D20A0AFF
    case red5
    
    /// Red 6
    /// (dark variant) ![](https://dummyimage.com/48x18/EE3939.png&text=+)          Hex value: EE3939FF
    /// (light variant) ![](https://dummyimage.com/48x18/EE3939.png&text=+)          Hex value: EE3939FF
    case red6
    
    /// Red 7
    /// (dark variant) ![](https://dummyimage.com/48x18/D20A0A.png&text=+)          Hex value: D20A0AFF
    /// (light variant) ![](https://dummyimage.com/48x18/FF5C77.png&text=+)          Hex value: FF5C77FF
    case red7
    
    /// Red 8
    /// (dark variant) ![](https://dummyimage.com/48x18/AA0808.png&text=+)          Hex value: AA0808FF
    /// (light variant) ![](https://dummyimage.com/48x18/FF8CB2.png&text=+)          Hex value: FF8CB2FF
    case red8
    
    /// Red 9
    /// (dark variant) ![](https://dummyimage.com/48x18/840606.png&text=+)          Hex value: 840606FF
    /// (light variant) ![](https://dummyimage.com/48x18/FFB2D2.png&text=+)          Hex value: FFB2D2FF
    case red9
    
    /// Red 10
    /// (dark variant) ![](https://dummyimage.com/48x18/5A0404.png&text=+)          Hex value: 5A0404FF
    /// (light variant) ![](https://dummyimage.com/48x18/FFD5EA.png&text=+)          Hex value: FFD5EAFF
    case red10
    
    /// Red 11
    /// (dark variant) ![](https://dummyimage.com/48x18/350000.png&text=+)          Hex value: 350000FF
    /// (light variant) ![](https://dummyimage.com/48x18/FFEAF4.png&text=+)          Hex value: FFEAF4FF
    case red11
    
    // Core 7: Pinks (1 - 11)
    /// Pink 1
    /// (dark variant) ![](https://dummyimage.com/48x18/FFF0FA.png&text=+)          Hex value: FFF0FAFF
    /// (light variant) ![](https://dummyimage.com/48x18/28004A.png&text=+)          Hex value: 28004AFF
    case pink1
    
    /// Pink 2
    /// (dark variant) ![](https://dummyimage.com/48x18/FFDCF3.png&text=+)          Hex value: FFDCF3FF
    /// (light variant) ![](https://dummyimage.com/48x18/510080.png&text=+)          Hex value: 510080FF
    case pink2
    
    /// Pink 3
    /// (dark variant) ![](https://dummyimage.com/48x18/FFAFED.png&text=+)          Hex value: FFAFEDFF
    /// (light variant) ![](https://dummyimage.com/48x18/7800A4.png&text=+)          Hex value: 7800A4FF
    case pink3
    
    /// Pink 4
    /// (dark variant) ![](https://dummyimage.com/48x18/FF8AF0.png&text=+)          Hex value: FF8AF0FF
    /// (light variant) ![](https://dummyimage.com/48x18/A100C2.png&text=+)          Hex value: A100C2FF
    case pink4
    
    /// Pink 5
    /// (dark variant) ![](https://dummyimage.com/48x18/F65AF2.png&text=+)          Hex value: F65AF2FF
    /// (light variant) ![](https://dummyimage.com/48x18/CC00DC.png&text=+)          Hex value: CC00DCFF
    case pink5
    
    /// Pink 6
    /// (dark variant) ![](https://dummyimage.com/48x18/F31DED.png&text=+)          Hex value: F31DEDFF
    /// (light variant) ![](https://dummyimage.com/48x18/F31DED.png&text=+)          Hex value: F31DEDFF
    case pink6
    
    /// Pink 7
    /// (dark variant) ![](https://dummyimage.com/48x18/CC00DC.png&text=+)          Hex value: CC00DCFF
    /// (light variant) ![](https://dummyimage.com/48x18/F65AF2.png&text=+)          Hex value: F65AF2FF
    case pink7
    
    /// Pink 8
    /// (dark variant) ![](https://dummyimage.com/48x18/A100C2.png&text=+)          Hex value: A100C2FF
    /// (light variant) ![](https://dummyimage.com/48x18/FF8AF0.png&text=+)          Hex value: FF8AF0FF
    case pink8
    
    /// Pink 9
    /// (dark variant) ![](https://dummyimage.com/48x18/7800A4.png&text=+)          Hex value: 7800A4FF
    /// (light variant) ![](https://dummyimage.com/48x18/FFAFED.png&text=+)          Hex value: FFAFEDFF
    case pink9
    
    /// Pink 10
    /// (dark variant) ![](https://dummyimage.com/48x18/510080.png&text=+)          Hex value: 510080FF
    /// (light variant) ![](https://dummyimage.com/48x18/FFDCF3.png&text=+)          Hex value: FFDCF3FF
    case pink10
    
    /// Pink 11
    /// (dark variant) ![](https://dummyimage.com/48x18/28004A.png&text=+)          Hex value: 28004AFF
    /// (light variant) ![](https://dummyimage.com/48x18/FFF0FA.png&text=+)          Hex value: FFF0FAFF
    case pink11
    
    // Core 8: Raspberries (1 - 11)
    /// Raspberry 1
    /// (dark variant) ![](https://dummyimage.com/48x18/FFF0F5.png&text=+)          Hex value: FFF0F5FF
    /// (light variant) ![](https://dummyimage.com/48x18/510136.png&text=+)          Hex value: 510136FF
    case raspberry1
    
    /// Raspberry 2
    /// (dark variant) ![](https://dummyimage.com/48x18/FFDCE8.png&text=+)          Hex value: FFDCE8FF
    /// (light variant) ![](https://dummyimage.com/48x18/71014B.png&text=+)          Hex value: 71014BFF
    case raspberry2
    
    /// Raspberry 3
    /// (dark variant) ![](https://dummyimage.com/48x18/FECBDA.png&text=+)          Hex value: FECBDAFF
    /// (light variant) ![](https://dummyimage.com/48x18/9B015D.png&text=+)          Hex value: 9B015DFF
    case raspberry3
    
    /// Raspberry 4
    /// (dark variant) ![](https://dummyimage.com/48x18/FEADC8.png&text=+)          Hex value: FEADC8FF
    /// (light variant) ![](https://dummyimage.com/48x18/BA066C.png&text=+)          Hex value: BA066CFF
    case raspberry4
    
    /// Raspberry 5
    /// (dark variant) ![](https://dummyimage.com/48x18/FE83AE.png&text=+)          Hex value: FE83AEFF
    /// (light variant) ![](https://dummyimage.com/48x18/DF1278.png&text=+)          Hex value: DF1278FF
    case raspberry5
    
    /// Raspberry 6
    /// (dark variant) ![](https://dummyimage.com/48x18/FA4F96.png&text=+)          Hex value: FA4F96FF
    /// (light variant) ![](https://dummyimage.com/48x18/FA4F96.png&text=+)          Hex value: FA4F96FF
    case raspberry6
    
    /// Raspberry 7
    /// (dark variant) ![](https://dummyimage.com/48x18/DF1278.png&text=+)          Hex value: DF1278FF
    /// (light variant) ![](https://dummyimage.com/48x18/FE83AE.png&text=+)          Hex value: FE83AEFF
    case raspberry7
    
    /// Raspberry 8
    /// (dark variant) ![](https://dummyimage.com/48x18/BA066C.png&text=+)          Hex value: BA066CFF
    /// (light variant) ![](https://dummyimage.com/48x18/FEADC8.png&text=+)          Hex value: FEADC8FF
    case raspberry8
    
    /// Raspberry 9
    /// (dark variant) ![](https://dummyimage.com/48x18/9B015D.png&text=+)          Hex value: 9B015DFF
    /// (light variant) ![](https://dummyimage.com/48x18/FECBDA.png&text=+)          Hex value: FECBDAFF
    case raspberry9
    
    /// Raspberry 10
    /// (dark variant) ![](https://dummyimage.com/48x18/71014B.png&text=+)          Hex value: 71014BFF
    /// (light variant) ![](https://dummyimage.com/48x18/FFDCE8.png&text=+)          Hex value: FFDCE8FF
    case raspberry10
    
    /// Raspberry 11
    /// (dark variant) ![](https://dummyimage.com/48x18/510136.png&text=+)          Hex value: 510136FF
    /// (light variant) ![](https://dummyimage.com/48x18/FFF0F5.png&text=+)          Hex value: FFF0F5FF
    case raspberry11
    
    // Core 9: Indigos (1 - 11)
    /// Indigo 1
    /// (dark variant) ![](https://dummyimage.com/48x18/F1ECFF.png&text=+)          Hex value: F1ECFFFF
    /// (light variant) ![](https://dummyimage.com/48x18/0E0637.png&text=+)          Hex value: 0E0637FF
    case indigo1
    
    /// Indigo 2
    /// (dark variant) ![](https://dummyimage.com/48x18/E2D8FF.png&text=+)          Hex value: E2D8FFFF
    /// (light variant) ![](https://dummyimage.com/48x18/1C0C6E.png&text=+)          Hex value: 1C0C6EFF
    case indigo2
    
    /// Indigo 3
    /// (dark variant) ![](https://dummyimage.com/48x18/D3B6FF.png&text=+)          Hex value: D3B6FFFF
    /// (light variant) ![](https://dummyimage.com/48x18/2C13AD.png&text=+)          Hex value: 2C13ADFF
    case indigo3
    
    /// Indigo 4
    /// (dark variant) ![](https://dummyimage.com/48x18/B894FF.png&text=+)          Hex value: B894FFFF
    /// (light variant) ![](https://dummyimage.com/48x18/470CED.png&text=+)          Hex value: 470CEDFF
    case indigo4
    
    /// Indigo 5
    /// (dark variant) ![](https://dummyimage.com/48x18/9B76FF.png&text=+)          Hex value: 9B76FFFF
    /// (light variant) ![](https://dummyimage.com/48x18/5D36FF.png&text=+)          Hex value: 5D36FFFF
    case indigo5
    
    /// Indigo 6
    /// (dark variant) ![](https://dummyimage.com/48x18/7858FF.png&text=+)          Hex value: 7858FFFF
    /// (light variant) ![](https://dummyimage.com/48x18/7858FF.png&text=+)          Hex value: 7858FFFF
    case indigo6
    
    /// Indigo 7
    /// (dark variant) ![](https://dummyimage.com/48x18/5D36FF.png&text=+)          Hex value: 5D36FFFF
    /// (light variant) ![](https://dummyimage.com/48x18/9B76FF.png&text=+)          Hex value: 9B76FFFF
    case indigo7
    
    /// Indigo 8
    /// (dark variant) ![](https://dummyimage.com/48x18/470CED.png&text=+)          Hex value: 470CEDFF
    /// (light variant) ![](https://dummyimage.com/48x18/B894FF.png&text=+)          Hex value: B894FFFF
    case indigo8
    
    /// Indigo 9
    /// (dark variant) ![](https://dummyimage.com/48x18/2C13AD.png&text=+)          Hex value: 2C13ADFF
    /// (light variant) ![](https://dummyimage.com/48x18/D3B6FF.png&text=+)          Hex value: D3B6FFFF
    case indigo9
    
    /// Indigo 10
    /// (dark variant) ![](https://dummyimage.com/48x18/1C0C6E.png&text=+)          Hex value: 1C0C6EFF
    /// (light variant) ![](https://dummyimage.com/48x18/E2D8FF.png&text=+)          Hex value: E2D8FFFF
    case indigo10
    
    /// Indigo 11
    /// (dark variant) ![](https://dummyimage.com/48x18/0E0637.png&text=+)          Hex value: 0E0637FF
    /// (light variant) ![](https://dummyimage.com/48x18/F1ECFF.png&text=+)          Hex value: F1ECFFFF
    case indigo11
    
    // Core 10: Basis (total 4)
    /// Base White
    /// (dark variant) ![](https://dummyimage.com/48x18/FFFFFF.png&text=+)          Hex value: FFFFFFFF
    /// (light variant) ![](https://dummyimage.com/48x18/FFFFFF.png&text=+)          Hex value: FFFFFFFF
    case baseWhite
    
    /// BaseBlack
    /// (dark variant) ![](https://dummyimage.com/48x18/000000.png&text=+)          Hex value: 000000FF
    /// (light variant) ![](https://dummyimage.com/48x18/000000.png&text=+)          Hex value: 000000FF
    case baseBlack
    
    /// Base 1
    /// (dark variant) ![](https://dummyimage.com/48x18/000000.png&text=+)          Hex value: 000000FF
    /// (light variant) ![](https://dummyimage.com/48x18/FFFFFF.png&text=+)          Hex value: FFFFFFFF
    case base1
    
    /// Base 2
    /// (dark variant) ![](https://dummyimage.com/48x18/FFFFFF.png&text=+)          Hex value: FFFFFFFF
    /// (light variant) ![](https://dummyimage.com/48x18/000000.png&text=+)          Hex value: 000000FF
    case base2
    
    /// AccentLabel 1
    /// (dark variant) ![](https://dummyimage.com/48x18/A93E00.png&text=+)          Hex value: A93E00FF
    /// (light variant) ![](https://dummyimage.com/48x18/FFDF72.png&text=+)          Hex value: FFDF72FF
    case accentLabel1
    
    /// AccentLabel 2
    /// (dark variant) ![](https://dummyimage.com/48x18/AA0808.png&text=+)          Hex value: AA0808FF
    /// (light variant) ![](https://dummyimage.com/48x18/FFB2D2.png&text=+)          Hex value: FFB2D2FF
    case accentLabel2
    
    /// AccentLabel 3
    /// (dark variant) ![](https://dummyimage.com/48x18/BA066C.png&text=+)          Hex value: BA066CFF
    /// (light variant) ![](https://dummyimage.com/48x18/FECBDA.png&text=+)          Hex value: FECBDAFF
    case accentLabel3
    
    /// AccentLabel 4
    /// (dark variant) ![](https://dummyimage.com/48x18/A100C2.png&text=+)          Hex value: A100C2FF
    /// (light variant) ![](https://dummyimage.com/48x18/FFAFED.png&text=+)          Hex value: FFAFEDFF
    case accentLabel4
    
    /// AccentLabel 5
    /// (dark variant) ![](https://dummyimage.com/48x18/470CED.png&text=+)          Hex value: 470CEDFF
    /// (light variant) ![](https://dummyimage.com/48x18/D3B6FF.png&text=+)          Hex value: D3B6FFFF
    case accentLabel5
    
    /// AccentLabel 6
    /// (dark variant) ![](https://dummyimage.com/48x18/0057D2.png&text=+)          Hex value: 0057D2FF
    /// (light variant) ![](https://dummyimage.com/48x18/A6E0FF.png&text=+)          Hex value: A6E0FFFF
    case accentLabel6
    
    /// AccentLabel 7
    /// (dark variant) ![](https://dummyimage.com/48x18/046C7A.png&text=+)          Hex value: 046C7AFF
    /// (light variant) ![](https://dummyimage.com/48x18/64EDD2.png&text=+)          Hex value: 64EDD2FF
    case accentLabel7
    
    /// AccentLabel 8
    /// (dark variant) ![](https://dummyimage.com/48x18/256F3A.png&text=+)          Hex value: 256F3AFF
    /// (light variant) ![](https://dummyimage.com/48x18/BDE986.png&text=+)          Hex value: BDE986FF
    case accentLabel8
    
    /// AccentLabel 9
    /// (dark variant) ![](https://dummyimage.com/48x18/6C32A9.png&text=+)          Hex value: 6C32A9FF
    /// (light variant) ![](https://dummyimage.com/48x18/D0B8EA.png&text=+)          Hex value: D0B8EAFF
    case accentLabel9
    
    /// AccentLabel 10
    /// (dark variant) ![](https://dummyimage.com/48x18/354A5F.png&text=+)          Hex value: 354A5FFF
    /// (light variant) ![](https://dummyimage.com/48x18/D5DADD.png&text=+)          Hex value: D5DADDFF
    case accentLabel10
    
    /// AccentBackground 1
    /// (dark variant) ![](https://dummyimage.com/48x18/FFF3B8.png&text=+)          Hex value: FFF3B8FF
    /// (light variant) ![](https://dummyimage.com/48x18/8D2A00.png&text=+)          Hex value: 8D2A00FF
    case accentBackground1
    
    /// AccentBackground 2
    /// (dark variant) ![](https://dummyimage.com/48x18/FFD5EA.png&text=+)          Hex value: FFD5EAFF
    /// (light variant) ![](https://dummyimage.com/48x18/840606.png&text=+)          Hex value: 840606FF
    case accentBackground2
    
    /// AccentBackground 3
    /// (dark variant) ![](https://dummyimage.com/48x18/FFDCE8.png&text=+)          Hex value: FFDCE8FF
    /// (light variant) ![](https://dummyimage.com/48x18/9B015D.png&text=+)          Hex value: 9B015DFF
    case accentBackground3
    
    /// AccentBackground 4
    /// (dark variant) ![](https://dummyimage.com/48x18/FFDCF3.png&text=+)          Hex value: FFDCF3FF
    /// (light variant) ![](https://dummyimage.com/48x18/7800A4.png&text=+)          Hex value: 7800A4FF
    case accentBackground4
    
    /// AccentBackground 5
    /// (dark variant) ![](https://dummyimage.com/48x18/E2D8FF.png&text=+)          Hex value: E2D8FFFF
    /// (light variant) ![](https://dummyimage.com/48x18/2C13AD.png&text=+)          Hex value: 2C13ADFF
    case accentBackground5
    
    /// AccentBackground 6
    /// (dark variant) ![](https://dummyimage.com/48x18/D1EFFF.png&text=+)          Hex value: D1EFFFFF
    /// (light variant) ![](https://dummyimage.com/48x18/0040B0.png&text=+)          Hex value: 0040B0FF
    case accentBackground6
    
    /// AccentBackground 7
    /// (dark variant) ![](https://dummyimage.com/48x18/C2FCEE.png&text=+)          Hex value: C2FCEEFF
    /// (light variant) ![](https://dummyimage.com/48x18/035663.png&text=+)          Hex value: 035663FF
    case accentBackground7
    
    /// AccentBackground 8
    /// (dark variant) ![](https://dummyimage.com/48x18/EBF5CB.png&text=+)          Hex value: EBF5CBFF
    /// (light variant) ![](https://dummyimage.com/48x18/1E592F.png&text=+)          Hex value: 1E592FFF
    case accentBackground8
    
    /// AccentBackground 9
    /// (dark variant) ![](https://dummyimage.com/48x18/DDCCF0.png&text=+)          Hex value: DDCCF0FF
    /// (light variant) ![](https://dummyimage.com/48x18/511F89.png&text=+)          Hex value: 511F89FF
    case accentBackground9
    
    /// AccentBackground 10
    /// (dark variant) ![](https://dummyimage.com/48x18/EAECEE.png&text=+)          Hex value: EAECEEFF
    /// (light variant) ![](https://dummyimage.com/48x18/223548.png&text=+)          Hex value: 223548FF
    case accentBackground10
    
    // MARK: - Shadow Colors (2 Colors)
    
    /// Card Shadow
    /// (dark variant) ![](https://dummyimage.com/48x18/5B738B.png&text=+)          Hex value: 5B738B14
    /// (light variant) ![](https://dummyimage.com/48x18/000000.png&text=+)          Hex value: 0000004D
    case cardShadow
    
    /// Section Shadow
    /// (dark variant) ![](https://dummyimage.com/48x18/5B738B.png&text=+)          Hex value: 5B738B3D
    /// (light variant) ![](https://dummyimage.com/48x18/000000.png&text=+)          Hex value: 0000003D
    case sectionShadow
    
    // MARK: - Grouped Background Colors (3 Colors)
    
    /// Primary grouped background colors, with variants for base and elevated UI schemes.
    /// (base dark variant) ![](https://dummyimage.com/48x18/F5F6F7.png&text=+)              Hex color: F5F6F7FF
    /// (base light variant) ![](https://dummyimage.com/48x18/000000.png&text=+)              Hex color: 000000FF
    /// (elevated light variant) ![](https://dummyimage.com/48x18/192027.png&text=+)        Hex color: 192027FF
    case primaryGroupedBackground
    
    /// Secondary grouped background colors, with variants for base and elevated UI schemes.
    /// (base dark variant) ![](https://dummyimage.com/48x18/FFFFFF.png&text=+)              Hex color: FFFFFFFF
    /// (base light variant) ![](https://dummyimage.com/48x18/161C21.png&text=+)              Hex color: 161C21FF
    /// (elevated light variant) ![](https://dummyimage.com/48x18/242E38.png&text=+)        Hex color: 242E38FF
    case secondaryGroupedBackground
    
    /// Secondary grouped background colors, with variants for base and elevated UI schemes.
    /// (base dark variant) ![](https://dummyimage.com/48x18/F5F6F7.png&text=+)              Hex color: F5F6F7FF
    /// (base light variant) ![](https://dummyimage.com/48x18/0F1216.png&text=+)              Hex color: 0F1216FF
    /// (elevated light variant) ![](https://dummyimage.com/48x18/1F272F.png&text=+)        Hex color: 1F272FFF
    case tertiaryGroupedBackground
    
    // MARK: - Background Colors (3 Colors)
    
    /// Primary grouped background colors, with variants for base and elevated UI schemes.
    /// (base dark variant) ![](https://dummyimage.com/48x18/FFFFFF.png&text=+)              Hex color: FFFFFFFF
    /// (base light variant) ![](https://dummyimage.com/48x18/000000.png&text=+)              Hex color: 000000FF
    /// (elevated light variant) ![](https://dummyimage.com/48x18/192027.png&text=+)        Hex color: 192027FF
    case primaryBackground
    
    /// Secondary grouped background colors, with variants for base and elevated UI schemes.
    /// (base dark variant) ![](https://dummyimage.com/48x18/F5F6F7.png&text=+)              Hex color: F5F6F7FF
    /// (base light variant) ![](https://dummyimage.com/48x18/0F1216.png&text=+)              Hex color: 0F1216FF
    /// (elevated light variant) ![](https://dummyimage.com/48x18/1F272F.png&text=+)        Hex color: 1F272FFF
    case secondaryBackground
    
    /// Secondary grouped background colors, with variants for base and elevated UI schemes.
    /// (base dark variant) ![](https://dummyimage.com/48x18/FFFFFF.png&text=+)              Hex color: FFFFFFFF
    /// (base light variant) ![](https://dummyimage.com/48x18/161C21.png&text=+)              Hex color: 161C21FF
    /// (elevated light variant) ![](https://dummyimage.com/48x18/242E38.png&text=+)        Hex color: 242E38FF
    case tertiaryBackground
    
    // MARK: - Label Colors (4 Colors)
    
    /// Standard color for primary label.
    /// (dark variant - normal) ![](https://dummyimage.com/48x18/223548.png&text=+)          Hex value: 223548FF
    /// (light variant - normal) ![](https://dummyimage.com/48x18/F5F6F7.png&text=+)          Hex value: F5F6F7FF
    case primaryLabel
    
    /// Standard color for secondary label.
    /// (dark variant - normal) ![](https://dummyimage.com/48x18/475E75.png&text=+)          Hex value: 475E75FF
    /// (light variant - normal) ![](https://dummyimage.com/48x18/D5DADD.png&text=+)          Hex value: D5DADDFF
    case secondaryLabel
    
    /// Standard color for tertiary label.
    /// (dark variant - normal) ![](https://dummyimage.com/48x18/475E75.png&text=+)          Hex value: 475E75E5
    /// (light variant - normal) ![](https://dummyimage.com/48x18/A9B4BE.png&text=+)          Hex value: A9B4BEFF
    case tertiaryLabel
    
    /// Standard color for quaternary label.
    /// (dark variant - normal) ![](https://dummyimage.com/48x18/5B738B.png&text=+)          Hex value: 5B738BD4
    /// (light variant - normal) ![](https://dummyimage.com/48x18/8396A8.png&text=+)          Hex value: 8396A8FF
    case quaternaryLabel
    
    // MARK: - Fill Colors (4 Colors)
    
    /// Standard color for primary fill.
    /// (dark variant - normal) ![](https://dummyimage.com/48x18/FFFFFF.png&text=+)          Hex value: FFFFFFFF
    /// (light variant - normal) ![](https://dummyimage.com/48x18/8396A8.png&text=+)          Hex value: 8396A8FF
    case primaryFill
    
    /// Standard color for secondary fill.
    /// (dark variant - normal) ![](https://dummyimage.com/48x18/5B738B.png&text=+)          Hex value: 5B738B0F
    /// (light variant - normal) ![](https://dummyimage.com/48x18/8396A8.png&text=+)          Hex value: 8396A833
    case secondaryFill
    
    /// Standard color for tertiary fill.
    /// (dark variant - normal) ![](https://dummyimage.com/48x18/5B738B.png&text=+)          Hex value: 5B738B29
    /// (light variant - normal) ![](https://dummyimage.com/48x18/8396A8.png&text=+)          Hex value: 8396A845
    case tertiaryFill
    
    /// Standard color for quaternary fill.
    /// (dark variant - normal) ![](https://dummyimage.com/48x18/5B738B.png&text=+)          Hex value: 5B738B14
    /// (light variant - normal) ![](https://dummyimage.com/48x18/8396A8.png&text=+)          Hex value: 8396A814
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
    case tintColor2
    
    /// Wraps `tintColorTapStateLight` and `tintColorTapStateDark`.
    /// Use `Color.preferredColor(forStyle:background:)` to select appropriate variant.
    /// (dark variant) ![](https://dummyimage.com/48x18/0040B0.png&text=+)          Hex color: 0040B0FF
    /// (light variant) ![](https://dummyimage.com/48x18/1B90FF.png&text=+)          Hex color: 1B90FFFF
    case tintColorTapState
    
    // MARK: - Semantic Colors (14 Colors)
    
    /// Semantic color for "negative" (bad) label, with light and dark color variants.

    /// (dark variant) ![](https://dummyimage.com/48x18/D20A0A.png&text=+)          Hex value: D20A0AFF
    /// (light variant) ![](https://dummyimage.com/48x18/FF8CB2.png&text=+)          Hex value: FF8CB2FF
    case negativeLabel
    
    /// Semantic color for "positive" (good) label, with light and dark color variants.
    /// (dark variant) ![](https://dummyimage.com/48x18/256F3A.png&text=+)          Hex value: 256F3AFF
    /// (light variant) ![](https://dummyimage.com/48x18/97DD40.png&text=+)          Hex value: 97DD40FF
    case positiveLabel
    
    /// Semantic color for "critical" (risky) label, with light and dark color variants.
    /// (dark variant) ![](https://dummyimage.com/48x18/C35500.png&text=+)          Hex value: C35500FF
    /// (light variant) ![](https://dummyimage.com/48x18/FFC933.png&text=+)          Hex value: FFC933FF

    case criticalLabel
    
    /// NegativeLabelTapState
    /// (dark variant) ![](https://dummyimage.com/48x18/AA0808.png&text=+)          Hex value: AA0808FF
    /// (light variant) ![](https://dummyimage.com/48x18/FF5C77.png&text=+)          Hex value: FF5C77FF
    case negativeLabelTapState
    
    /// PositiveLabelTapState
    /// (dark variant) ![](https://dummyimage.com/48x18/1E592F.png&text=+)          Hex value: 1E592FFF
    /// (light variant) ![](https://dummyimage.com/48x18/5DC122.png&text=+)          Hex value: 5DC122FF
    case positiveLabelTapState
    
    /// CriticalLabelTapState
    /// (dark variant) ![](https://dummyimage.com/48x18/A93E00.png&text=+)          Hex value: A93E00FF
    /// (light variant) ![](https://dummyimage.com/48x18/FFB300.png&text=+)          Hex value: FFB300FF
    case criticalLabelTapState
    
    /// Semantic color for "negative" (bad) background, with light and dark color variants.
    /// (dark variant) ![](https://dummyimage.com/48x18/FF80BC.png&text=+)          Hex value: FF80BC29
    /// (light variant) ![](https://dummyimage.com/48x18/FF5252.png&text=+)          Hex value: FF525229
    case negativeBackground
    
    /// Semantic color for "positive" (good) background, with light and dark color variants.
    /// (dark variant) ![](https://dummyimage.com/48x18/BDDE54.png&text=+)          Hex value: BDDE5429
    /// (light variant) ![](https://dummyimage.com/48x18/66FF90.png&text=+)          Hex value: 66FF9029
    case positiveBackground
    
    /// Semantic color for "critical" (risky) background, with light and dark color variants.
    /// (dark variant) ![](https://dummyimage.com/48x18/FFD500.png&text=+)          Hex value: FFD50029
    /// (light variant) ![](https://dummyimage.com/48x18/FFC933.png&text=+)          Hex value: FFC93329
    case criticalBackground
    
    /// Semantic color for "information" (neutral) background, with light and dark color variants.
    /// (dark variant) ![](https://dummyimage.com/48x18/85D4FF.png&text=+)          Hex value: 85D4FF29
    /// (light variant) ![](https://dummyimage.com/48x18/366CFE.png&text=+)          Hex value: 366CFE29
    case informationBackground
    
    /// NegativeBackgroundTapState
    /// (dark variant) ![](https://dummyimage.com/48x18/FF80BC.png&text=+)          Hex value: FF80BC52
    /// (light variant) ![](https://dummyimage.com/48x18/FF5252.png&text=+)          Hex value: FF52521F
    case negativeBackgroundTapState
    
    /// PositiveBackgroundTapState
    /// (dark variant) ![](https://dummyimage.com/48x18/BDDE54.png&text=+)          Hex value: BDDE5452
    /// (light variant) ![](https://dummyimage.com/48x18/66FF90.png&text=+)          Hex value: 66FF901F
    case positiveBackgroundTapState
    
    /// CriticalBackgroundTapState
    /// (dark variant) ![](https://dummyimage.com/48x18/FFD500.png&text=+)          Hex value: FFD50052
    /// (light variant) ![](https://dummyimage.com/48x18/FFC933.png&text=+)          Hex value: FFC9331F
    case criticalBackgroundTapState
    
    /// InformationBackgroundTapState
    /// (dark variant) ![](https://dummyimage.com/48x18/85D4FF.png&text=+)          Hex value: 85D4FF52
    /// (light variant) ![](https://dummyimage.com/48x18/366CFE.png&text=+)          Hex value: 366CFE1F
    case informationBackgroundTapState
    
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
    case header
    
    /// Blended color for navigation bar or headers.
    /// (dark variant) ![](https://dummyimage.com/48x18/FFFFFF.png&text=+)          Hex value: FFFFFFFF
    /// (light variant) ![](https://dummyimage.com/48x18/161C21.png&text=+)          Hex value: 161C21FF
    case headerBlended
    
    /// Transparent color for navigation bar or tap bar.
    /// (dark variant) ![](https://dummyimage.com/48x18/111D29.png&text=+)          Hex value: 111D29D9
    /// (light variant) ![](https://dummyimage.com/48x18/111D29.png&text=+)          Hex value: 111D29D9
    case barTransparent
    
    /// Color for contrast element.
    /// (dark variant) ![](https://dummyimage.com/48x18/5B738B.png&text=+)          Hex value: 5B738BFF
    /// (light variant) ![](https://dummyimage.com/48x18/8396A8.png&text=+)          Hex value: 8396A8FF
    case contrastElement
    
    /// Standard background color for toolbar, tab bar or footers.
    /// (dark variant) ![](https://dummyimage.com/48x18/FFFFFF.png&text=+)          Hex value: FFFFFFFF
    /// (light variant) ![](https://dummyimage.com/48x18/192027.png&text=+)          Hex value: 192027FF
    case footer
    
    /// Standard cell background color, with variants for light and dark color schemes.
    /// (dark variant) ![](https://dummyimage.com/48x18/FFFFFF.png&text=+)          Hex color: FFFFFF00
    /// (light variant) ![](https://dummyimage.com/48x18/223548.png&text=+)          Hex color: 22354800
    case cellBackground
    
    // MARK: - Chart Colors (13 Styles)
    
    /// Chart 1
    /// (dark variant) ![](https://dummyimage.com/48x18/1B90FF.png&text=+)          Hex value: 1B90FF
    /// (light variant) ![](https://dummyimage.com/48x18/4DB1FF.png&text=+)          Hex value: 4DB1FF
    case chart1
    
    /// Chart 2
    /// (dark variant) ![](https://dummyimage.com/48x18/E76500.png&text=+)          Hex value: E76500
    /// (light variant) ![](https://dummyimage.com/48x18/FFB300.png&text=+)          Hex value: FFB300
    case chart2
    
    /// Chart 3
    /// (dark variant) ![](https://dummyimage.com/48x18/36A41D.png&text=+)          Hex value: 36A41D
    /// (light variant) ![](https://dummyimage.com/48x18/5DC122.png&text=+)          Hex value: 5DC122
    case chart3
    
    /// Chart 4
    /// (dark variant) ![](https://dummyimage.com/48x18/FA4F96.png&text=+)          Hex value: FA4F96
    /// (light variant) ![](https://dummyimage.com/48x18/FE83AE.png&text=+)          Hex value: FE83AE
    case chart4
    
    /// Chart 5
    /// (dark variant) ![](https://dummyimage.com/48x18/7858FF.png&text=+)          Hex value: 7858FF
    /// (light variant) ![](https://dummyimage.com/48x18/9B76FF.png&text=+)          Hex value: 9B76FF
    case chart5
    
    /// Chart 6
    /// (dark variant) ![](https://dummyimage.com/48x18/049F9A.png&text=+)          Hex value: 049F9A
    /// (light variant) ![](https://dummyimage.com/48x18/00CEAC.png&text=+)          Hex value: 00CEAC
    case chart6
    
    /// Chart 7
    /// (dark variant) ![](https://dummyimage.com/48x18/F31DED.png&text=+)          Hex value: F31DED
    /// (light variant) ![](https://dummyimage.com/48x18/F65AF2.png&text=+)          Hex value: F65AF2
    case chart7
    
    /// Chart 8
    /// (dark variant) ![](https://dummyimage.com/48x18/5B738B.png&text=+)          Hex value: 5B738B
    /// (light variant) ![](https://dummyimage.com/48x18/8396A8.png&text=+)          Hex value: 8396A8
    case chart8
    
    /// Chart 9
    /// (dark variant) ![](https://dummyimage.com/48x18/EE3939.png&text=+)          Hex value: EE3939
    /// (light variant) ![](https://dummyimage.com/48x18/FF5C77.png&text=+)          Hex value: FF5C77
    case chart9
    
    /// Chart 10
    /// (dark variant) ![](https://dummyimage.com/48x18/049F9A.png&text=+)          Hex value: 049F9A
    /// (light variant) ![](https://dummyimage.com/48x18/00CEAC.png&text=+)          Hex value: 00CEAC
    ///
    /// - Note: Removed since Palette V7. Mapping to `chart6`.
    case chart10
    
    /// Chart 11
    /// (dark variant) ![](https://dummyimage.com/48x18/1B90FF.png&text=+)          Hex value: 1B90FF
    /// (light variant) ![](https://dummyimage.com/48x18/4DB1FF.png&text=+)          Hex value: 4DB1FF
    /// 
    /// - Note: Removed since Palette V7. Mapping to `chart1`.
    case chart11
    
    /// StockUpStroke
    /// (dark variant) ![](https://dummyimage.com/48x18/19A979.png&text=+)          Hex value: 19A979
    /// (light variant) ![](https://dummyimage.com/48x18/19A979.png&text=+)          Hex value: 19A979
    case stockUpStroke
    
    /// StockDownStroke
    /// (dark variant) ![](https://dummyimage.com/48x18/EE6868.png&text=+)          Hex value: EE6868
    /// (light variant) ![](https://dummyimage.com/48x18/EE6868.png&text=+)          Hex value: EE6868
    case stockDownStroke
    
    // MARK: - Map Colors (11 Styles)
    
    /// Map 1
    /// (dark variant) ![](https://dummyimage.com/48x18/2E4A62.png&text=+)          Hex value: 2E4A62
    /// (light variant) ![](https://dummyimage.com/48x18/2E4A62.png&text=+)          Hex value: 2E4A62
    case map1
    
    /// Map 2
    /// (dark variant) ![](https://dummyimage.com/48x18/56840E.png&text=+)          Hex value: 56840E
    /// (light variant) ![](https://dummyimage.com/48x18/56840E.png&text=+)          Hex value: 56840E
    case map2
    
    /// Map 3
    /// (dark variant) ![](https://dummyimage.com/48x18/A63788.png&text=+)          Hex value: A63788
    /// (light variant) ![](https://dummyimage.com/48x18/A63788.png&text=+)          Hex value: A63788
    case map3
    
    /// Map 4
    /// (dark variant) ![](https://dummyimage.com/48x18/0079C6.png&text=+)          Hex value: 0079C6
    /// (light variant) ![](https://dummyimage.com/48x18/0079C6.png&text=+)          Hex value: 0079C6
    case map4
    
    /// Map 5
    /// (dark variant) ![](https://dummyimage.com/48x18/6B4EA0.png&text=+)          Hex value: 6B4EA0
    /// (light variant) ![](https://dummyimage.com/48x18/6B4EA0.png&text=+)          Hex value: 6B4EA0
    case map5
    
    /// Map 6
    /// (dark variant) ![](https://dummyimage.com/48x18/A16B00.png&text=+)          Hex value: A16B00
    /// (light variant) ![](https://dummyimage.com/48x18/A16B00.png&text=+)          Hex value: A16B00
    case map6
    
    /// Map 7
    /// (dark variant) ![](https://dummyimage.com/48x18/0B6295.png&text=+)          Hex value: 0B6295
    /// (light variant) ![](https://dummyimage.com/48x18/0B6295.png&text=+)          Hex value: 0B6295
    case map7
    
    /// Map 8
    /// (dark variant) ![](https://dummyimage.com/48x18/D0R774.png&text=+)          Hex value: D0R774
    /// (light variant) ![](https://dummyimage.com/48x18/D0R774.png&text=+)          Hex value: D0R774
    case map8
    
    /// Map 9
    /// (dark variant) ![](https://dummyimage.com/48x18/1C857A.png&text=+)          Hex value: 1C857A
    /// (light variant) ![](https://dummyimage.com/48x18/1C857A.png&text=+)          Hex value: 1C857A
    case map9
    
    /// Map 10
    /// (dark variant) ![](https://dummyimage.com/48x18/C45300.png&text=+)          Hex value: C45300
    /// (light variant) ![](https://dummyimage.com/48x18/C45300.png&text=+)          Hex value: C45300
    case map10
    
    // MARK: - Custom Colors (6 Styles)
    
    /// Custom Color 1
    /// (dark variant) ![](https://dummyimage.com/48x18/475E75.png&text=+)          Hex value: 475E75FF
    /// (light variant) ![](https://dummyimage.com/48x18/8396A8.png&text=+)          Hex value: 8396A8FF
    case customColor1
    
    /// Custom Color 2
    /// (dark variant) ![](https://dummyimage.com/48x18/0057D2.png&text=+)          Hex value: 0057D2FF
    /// (light variant) ![](https://dummyimage.com/48x18/1B90FF.png&text=+)          Hex value: 1B90FFFF
    case customColor2
    
    /// Custom Color 3
    /// (dark variant) ![](https://dummyimage.com/48x18/046C7A.png&text=+)          Hex value: 046C7AFF
    /// (light variant) ![](https://dummyimage.com/48x18/04ACA7.png&text=+)          Hex value: 04ACA7FF
    case customColor3
    
    /// Custom Color 4
    /// (dark variant) ![](https://dummyimage.com/48x18/256F3A.png&text=+)          Hex value: 256F3AFF
    /// (light variant) ![](https://dummyimage.com/48x18/36A41D.png&text=+)          Hex value: 36A41DFF
    case customColor4
    
    /// Custom Color 5
    /// (dark variant) ![](https://dummyimage.com/48x18/A93E00.png&text=+)          Hex value: A93E00FF
    /// (light variant) ![](https://dummyimage.com/48x18/F58B00.png&text=+)          Hex value: F58B00FF
    case customColor5
    
    /// Custom Color 6
    /// (dark variant) ![](https://dummyimage.com/48x18/D20A0A.png&text=+)          Hex value: D20A0AFF
    /// (light variant) ![](https://dummyimage.com/48x18/D20A0A.png&text=+)          Hex value: D20A0AFF
    case customColor6
    
    /// EsriEdit
    /// (dark variant) ![](https://dummyimage.com/48x18/1B6DD2.png&text=+)          Hex value: 1B6DD2
    /// (light variant) ![](https://dummyimage.com/48x18/FFF114.png&text=+)          Hex value: FFF114
    case esriEdit
    
    // MARK: - Deprecated Basic Colors
    
    /// Standard color for quaternary label.
    /// (dark variant - normal) ![](https://dummyimage.com/48x18/5B738B.png&text=+)          Hex value: 5B738BD4
    /// (light variant - normal) ![](https://dummyimage.com/48x18/8396A8.png&text=+)          Hex value: 8396A8FF
    @available(*, deprecated, renamed: "quaternaryLabel")
    case quarternaryLabel
    
    /// Standard color for quaternary fill.
    /// (dark variant - normal) ![](https://dummyimage.com/48x18/5B738B.png&text=+)          Hex value: 5B738B14
    /// (light variant - normal) ![](https://dummyimage.com/48x18/8396A8.png&text=+)          Hex value: 8396A814
    @available(*, deprecated, renamed: "quaternaryFill")
    case quarternaryFill
    
    /// Standard base color, with variants for light and dark color schemes.
    /// (dark variant) ![](https://dummyimage.com/48x18/354A5F.png&text=+)        Hex color: 354A5F
    /// (light variant) ![](https://dummyimage.com/48x18/2C3D4F.png&text=+)        Hex color: 2C3D4F
    @available(*, deprecated, renamed: "header")
    case shell
    
    /// Standard background color, with variants for light and dark color schemes.
    /// (dark variant) ![](https://dummyimage.com/48x18/EDEFF0.png&text=+)        Hex color: EDEFF0
    /// (light variant) ![](https://dummyimage.com/48x18/1C2228.png&text=+)        Hex color: 1C2228
    @available(*, deprecated, renamed: "primaryGroupedBackground")
    case background1
    
    /// Standard background color, with variants for light and dark color schemes.
    /// (dark variant) ![](https://dummyimage.com/48x18/F7F7F7.png&text=+)        Hex color: F7F7F7
    /// (light variant) ![](https://dummyimage.com/48x18/232A31.png&text=+)        Hex color: 232A31
    @available(*, deprecated, renamed: "tertiaryGroupedBackground")
    case background2
    
    /// Standard line color, with variants for light and dark color schemes.
    /// (dark variant) ![](https://dummyimage.com/48x18/89919A.png&text=+)          Hex color: 89919A
    /// (light variant) ![](https://dummyimage.com/48x18/8696A9.png&text=+)          Hex value: 8696A9
    @available(*, deprecated, renamed: "separatorOpaque")
    case line
    
    /// Standard text color, with variants for light and dark color schemes.
    /// (dark variant) ![](https://dummyimage.com/48x18/32636A.png&text=+)        Hex color: 32636A
    /// (light variant) ![](https://dummyimage.com/48x18/FAFAFA.png&text=+)        Hex color: FAFAFA
    @available(*, deprecated, renamed: "primaryLabel")
    case primary1
    
    /// Standard secondary text color, with variants for light and dark color schemes.
    /// (dark variant) ![](https://dummyimage.com/48x18/515456.png&text=+)        Hex color: 515456
    /// (light variant) ![](https://dummyimage.com/48x18/EEF0F1.png&text=+)        Hex color: EEF0F1
    @available(*, deprecated, renamed: "secondaryLabel")
    case primary2
    
    /// Standard secondary text color, with variants for light and dark color schemes.
    /// (dark variant) ![](https://dummyimage.com/48x18/6A6D70.png&text=+)        Hex color: 6A6D70
    /// (light variant) ![](https://dummyimage.com/48x18/D3D7D9.png&text=+)        Hex color: D3D7D9
    @available(*, deprecated, renamed: "tertiaryLabel")
    case primary3
    
    /// Standard background and accent color, used in any color scheme.
    /// (dark variant) ![](https://dummyimage.com/48x18/CCCCCC.png&text=+)          Hex color: CCCCCC
    /// (light variant) ![](https://dummyimage.com/48x18/687D94.png&text=+)          Hex color: 687D94
    @available(*, deprecated, renamed: "secondaryFill")
    case primary4
    
    /// Standard background and accent color, used in any color scheme.
    /// (dark variant) ![](https://dummyimage.com/48x18/FAFAFA.png&text=+)          Hex color: FAFAFA
    /// (light variant) ![](https://dummyimage.com/48x18/23303E.png&text=+)          Hex color: 23303E
    @available(*, deprecated, renamed: "footer")
    case primary5
    
    /// Standard background and accent color, for use in header and cell background.
    /// (dark variant) ![](https://dummyimage.com/48x18/FFFFFF.png&text=+)          Hex color: FFFFFF
    /// (light variant) ![](https://dummyimage.com/48x18/29313A.png&text=+)          Hex color: 29313A
    @available(*, deprecated, renamed: "secondaryGroupedBackground")
    case primary6
    
    /// Standard background and accent color that is used in tag outline.
    /// (dark variant) ![](https://dummyimage.com/48x18/74777A.png&text=+)          Hex color: 74777A
    /// (light variant) ![](https://dummyimage.com/48x18/B8BEC1.png&text=+)          Hex color: B8BEC1
    @available(*, deprecated, renamed: "quaternaryLabel")
    case primary7
    
    /// Background and accent color that is mainly used with dark color scheme.
    /// ![](https://dummyimage.com/48x18/2F3943.png&text=+)          Hex color: 2F3943
    @available(*, deprecated, renamed: "barTransparent")
    case primary8
    
    /// Standard background and accent color.
    /// (dark variant) ![](https://dummyimage.com/48x18/E5E5E5.png&text=+)          Hex color: E5E5E5
    /// (light variant) ![](https://dummyimage.com/48x18/3A4552.png&text=+)          Hex color: 3A4552
    @available(*, deprecated, renamed: "separator")
    case primary9
    
    /// Standard background and accent color.
    /// (dark variant) ![](https://dummyimage.com/48x18/89919A.png&text=+)          Hex color: 89919A
    /// (light variant) ![](https://dummyimage.com/48x18/8696A9.png&text=+)          Hex color: 8696A9
    @available(*, deprecated, renamed: "contrastElement")
    case primary10
    
    /// Default light `tintColor`.
    /// (dark variant) ![](https://dummyimage.com/48x18/91C8F6.png&text=+)          Hex color: 91C8F6
    /// (light variant) ![](https://dummyimage.com/48x18/91C8F6.png&text=+)          Hex color: 91C8F6
    @available(*, deprecated, renamed: "tintColor")
    case tintColorLight
    
    /// Default dark `tintColor`.
    /// (dark variant) ![](https://dummyimage.com/48x18/0A6ED1.png&text=+)          Hex color: 0A6ED1
    /// (light variant) ![](https://dummyimage.com/48x18/0A6ED1.png&text=+)          Hex color: 0A6ED1
    @available(*, deprecated, renamed: "tintColor2")
    case tintColorDark
    
    /// Tap state (`UIControlState.highlighted`) color for control with `tintColor` equal to `tintColorLight`.  Should not be used as text color.
    /// (dark variant) ![](https://dummyimage.com/48x18/74A5D5.png&text=+)          Hex color: 74A5D5
    /// (light variant) ![](https://dummyimage.com/48x18/0A84FF.png&text=+)          Hex color: 0A84FF66 (alpha: 40%)
    @available(*, deprecated, renamed: "tintColorTapStateLight")
    case tintColorTapStateLight
    
    /// Tap state (`UIControlState.highlighted`) color for control with `tintColor` equal to `tintColorDark`.  May be used as text color.
    /// (dark variant) ![](https://dummyimage.com/48x18/0854A1.png&text=+)          Hex color: 0854A1
    /// (light variant) ![](https://dummyimage.com/48x18/0A84FF.png&text=+)          Hex color: 0A84FF66 (alpha: 40%)
    @available(*, deprecated, renamed: "tintColorTapStateDark")
    case tintColorTapStateDark
    
    /// Standard cell background color when being tapped, with variants for light and dark color schemes.
    /// (dark variant) ![](https://dummyimage.com/48x18/89919A.png&text=+)          Hex color: 89919A1C (alpha: 11%)
    /// (light variant) ![](https://dummyimage.com/48x18/8696A9.png&text=+)          Hex color: 8696A91C (alpha: 11%)
    @available(*, deprecated, renamed: "quaternaryFill")
    case cellBackgroundTapState
    
    /// Standard shadow color.
    /// ![](https://dummyimage.com/48x18/000000.png&text=+)          Hex color: 000000
    @available(*, deprecated, renamed: "cardShadow")
    case shadow
    
    /// Semantic color for "negative" (bad) value, with light and dark color variants.
    /// (dark variant) ![](https://dummyimage.com/48x18/BB0000.png&text=+)        Hex color: BB0000
    /// (light variant) ![](https://dummyimage.com/48x18/FF453A.png&text=+)        Hex color: FF453A
    @available(*, deprecated, renamed: "negativeLabel")
    case negative
    
    /// Semantic color for "positive" (good) value, with light and dark color variants.
    /// (dark variant) ![](https://dummyimage.com/48x18/107E3E.png&text=+)        Hex color: 107E3E
    /// (light variant) ![](https://dummyimage.com/48x18/32D74B.png&text=+)        Hex color: 32D74B
    @available(*, deprecated, renamed: "positiveLabel")
    case positive
    
    /// Semantic color for "critical" (risky) value, with light and dark color variants.
    /// (dark variant) ![](https://dummyimage.com/48x18/E9730C.png&text=+)        Hex color: E9730C
    /// (light variant) ![](https://dummyimage.com/48x18/FF9F0A.png&text=+)        Hex color: FF9F0A
    @available(*, deprecated, renamed: "criticalLabel")
    case critical
    
    // MARK: - Deprecated Accent Colors
    
    @available(*, deprecated, renamed: "mango3")
    case accent1
    
    @available(*, deprecated, renamed: "mango4")
    case accent1b
    
    @available(*, deprecated, renamed: "red4")
    case accent2
    
    @available(*, deprecated, renamed: "red5")
    case accent2b
    
    @available(*, deprecated, renamed: "pink5")
    case accent3
    
    @available(*, deprecated, renamed: "pink6")
    case accent4
    
    @available(*, deprecated, renamed: "indigo6")
    case accent5
    
    @available(*, deprecated, renamed: "blue6")
    case accent6
    
    @available(*, deprecated, renamed: "blue7")
    case accent6b
    
    @available(*, deprecated, renamed: "teal4")
    case accent7
    
    @available(*, deprecated, renamed: "teal5")
    case accent7b
    
    @available(*, deprecated, renamed: "green4")
    case accent8
    
    @available(*, deprecated, renamed: "indigo5")
    case accent9
    
    @available(*, deprecated, renamed: "grey5")
    case accent10
    
    @available(*, deprecated, renamed: "grey4")
    case accent10b
    
    // MARK: - Deprecated Colors Since Fiori FUIPalette V5
    
    /// Standard background color for `UINavigationBar`.
    /// (dark variant) ![](https://dummyimage.com/48x18/354A5F.png&text=+)          Hex value: 354A5F
    /// (light variant) ![](https://dummyimage.com/48x18/2C3D4F.png&text=+)          Hex value: 2C3D4F
    @available(*, deprecated, renamed: "header")
    case navigationBar
    
    /// Top gradient color, originating at SAP Fiori `UINavigationBar`.  ![](https://dummyimage.com/48x18/445E75.png&text=+) Hex color: 445E75
    @available(*, deprecated, renamed: "header")
    case backgroundGradientTop
    /// Bottom gradient color, originating at SAP Fiori `UINavigationBar`.  ![](https://dummyimage.com/48x18/3F566B.png&text=+) Hex color: 3F566B
    @available(*, deprecated, renamed: "header")
    case backgroundGradientBottom
    /// Standard background color, with variants for light and dark color schemes.
    /// (dark variant) ![](https://dummyimage.com/48x18/F3F3F3.png&text=+)          Hex value: F3F3F3
    /// (light variant) ![](https://dummyimage.com/48x18/000000.png&text=+)          Hex value: 000000
    @available(*, deprecated, renamed: "primaryBackground")
    case backgroundBase
    
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
                                                .primaryLabel, .secondaryLabel, .tertiaryLabel, .quaternaryLabel,
                                                .primaryFill, .secondaryFill, .tertiaryFill, .quaternaryFill,
                                                .tintColor, .tintColor2, .tintColorTapState, .negativeLabel,
                                                .positiveLabel, .criticalLabel, .negativeLabelTapState,
                                                .positiveLabelTapState, .criticalLabelTapState,
                                                .negativeBackground, .positiveBackground, .criticalBackground,
                                                .informationBackground, .negativeBackgroundTapState,
                                                .positiveBackgroundTapState, .criticalBackgroundTapState,
                                                .informationBackgroundTapState, .separator, .separatorOpaque,
                                                .header, .headerBlended, .barTransparent, .contrastElement,
                                                .footer, .cellBackground, .chart1, .chart2, .chart3, .chart4,
                                                .chart5, .chart6, .chart7, .chart8, .chart9, .chart10, .chart11,
                                                .stockUpStroke, .stockDownStroke, .map1, .map2, .map3, .map4,
                                                .map5, .map6, .map7, .map8, .map9, .map10, .customColor1, .customColor2, .customColor3, .customColor4, .customColor5, .customColor6, .esriEdit]
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
