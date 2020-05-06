//
//  File.swift
//  FioriCharts
//
//  Created by Xu, Sheng on 3/16/20.
//

import Foundation
import SwiftUI

public enum ColorStyle: String, CaseIterable {
    case background
    ///
    ///
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
    /// (light variant) ![](https://dummyimage.com/48x18/EBEBF5.png&text=+)          Hex color: EBEBF5        alpha: 30%
    case primary4
    
    /// Standard text color, with variants for light and dark color variants.
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
    
    /// Semanticfill color for gradient start color when stock goes up.
    /// (light variant) ![](https://dummyimage.com/48x18/7EFAA1.png&text=+)        Hex color: 7EFAA1
    case stockUpFill
    
    /// Semantic fill color for gradient start color when stock goes up.
    /// (light variant) ![](https://dummyimage.com/48x18/EDD3D2.png&text=+)        Hex color: EDD3D2
    case stockDownFill
    
    /// Semantic fill color for gradient end color.
    /// (light variant) ![](https://dummyimage.com/48x18/FCFDFC.png&text=+)        Hex color: FCFDFC
    case stockFillEndColor
}

extension ColorStyle: CustomDebugStringConvertible {
    public var debugDescription: String {
        return self.rawValue
    }
}

public class Palette {
    public class func hexColor(for colorStyle: ColorStyle) -> HexColor {
        switch colorStyle {
        case . background:
            return HexColor(lightColor: "FFFFFF", darkColor: "000000")
        case.primary1:
            return HexColor(lightColor: "32636A", darkColor: "FFFFFF")
        case.primary2:
            return HexColor(lightColor: "515559", darkColor: "FFFFFF")
        case.primary3:
            return HexColor(lightColor: "6A6D70", darkColor: "EBEBF599")
        case.primary4:
            return HexColor(lightColor: "CCCCCC", darkColor: "EBEBF54D")
        case .chart1:
            return HexColor(lightColor: "5899DA", darkColor: "74B3F0")
        case .chart2:
            return HexColor(lightColor: "E8743B", darkColor: "E8743B")
        case .chart3:
            return HexColor(lightColor: "19A979", darkColor: "19A979")
        case .chart4:
            return HexColor(lightColor: "ED4A7B", darkColor: "5899DA")
        case .chart5:
            return HexColor(lightColor: "945ECF", darkColor: "5899DA")
        case .chart6:
            return HexColor(lightColor: "13A4B4", darkColor: "5899DA")
        case .chart7:
            return HexColor(lightColor: "525DF4", darkColor: "5C66F5")
        case .chart8:
            return HexColor(lightColor: "BF399E", darkColor: "C63FA4")
        case .chart9:
            return HexColor(lightColor: "6C8893", darkColor: "6C8893")
        case .chart10:
            return HexColor(lightColor: "EE6868", darkColor: "EE6868")
        case .chart11:
            return HexColor(lightColor: "2F6497", darkColor: "387BB7")
        case .negative:
            return HexColor(lightColor: "BB0000", darkColor: "FF453A")
        case .critical:
            return HexColor(lightColor: "E9730C", darkColor: "FF9F0A")
        case .positive:
            return HexColor(lightColor: "107E3E", darkColor: "32D74B")
        case .stockUpStroke:
            return HexColor(lightColor: "19A979", darkColor: "19A979")
        case .stockDownStroke:
            return HexColor(lightColor: "EE6868", darkColor: "EE6868")
        case .stockUpFill:
            return HexColor(lightColor: "19A97966", darkColor: "19A97966")
        case .stockDownFill:
            return HexColor(lightColor: "EE686866", darkColor: "EE686866")
        case .stockFillEndColor:
            return HexColor(lightColor: "FCFDFC", darkColor: "000000")
        }
    }
}
