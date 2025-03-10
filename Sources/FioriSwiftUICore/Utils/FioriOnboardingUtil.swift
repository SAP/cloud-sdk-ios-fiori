import Foundation
import SwiftUI

enum FioriOnboardingUtil {
    /// Devices can be separated into several types by height, like small, medium, large, extraLarge, and extraExtraLarge
    enum SupportedType: Int {
        // [375, 440], e.g.,
        // height = 375, iPhone X, iPhone XS, iPhone 11 Pro, iPhone 12 mini, iPhone 13 mini, iPhone SE 2, iPhone SE 3, Landscape
        // height = 390, iPhone 12, iPhone 12 Pro, iPhone 13, iPhone 13 Pro, iPhone 14, Landscape
        // height = 393, iPhone 14 Pro, iPhone 15, iPhone 15 Pro, iPhone 16, Landscape
        // height = 402, iPhone 16 Pro, Landscape
        // height = 414, iPhone XR, iPhone XS Max, iPhone 11, iPhone 11 Pro Max, Landscape
        // height = 428, iPhone 12 Pro Max, iPhone 13 Pro Max, iPhone 14 Plus, Landscape
        // height = 430, iPhone 14 Pro Max, iPhone 15 Plus, iPhone 15 Pro Max, iPhone 16 Plus, Landscape
        // height = 440, iPhone 16 Pro Max, Landscape
        case small
        
        // [667, 768], e.g.,
        // height = 667, iPhone SE 2, iPhone SE 3, Portrait
        // height = 744, iPad Mini 6, iPad Mini 7, Landscape
        // height = 768, iPad 5, iPad 6, iPad Mini 5, Landscape
        case medium
        
        // [810, 956], e.g.,
        // height = 810, iPad 7, iPad 8, iPad 9, Landscape
        // height = 812, iPhone X, iPhone XS, iPhone 11 Pro, iPhone 12 mini, iPhone 13 mini, Portrait
        // height = 820, iPad Air 4, iPad Air 5, iPad Air 6, iPad 10, Landscape
        // height = 834, iPad Pro 2, iPad Pro 3, iPad Pro 4, iPad Pro 5, iPad Pro 6, iPad Air 3, Landscape
        // height = 844, iPhone 12, iPhone 12 Pro, iPhone 13, iPhone 13 Pro, iPhone 14, Portrait
        // height = 852, iPhone 14 Pro, iPhone 15, iPhone 15 Pro, iPhone 16, Portrait
        // height = 874, iPhone 16 Pro, Portrait
        // height = 896, iPhone XR, iPhone XS Max, iPhone 11, iPhone 11 Pro Max, Portrait
        // height = 926, iPhone 12 Pro Max, iPhone 13 Pro Max, iPhone 14 Plus, Portrait
        // height = 932, iPhone 14 Pro Max, iPhone 15 Plus, iPhone 15 Pro Max, iPhone 16 Plus, Portrait
        // height = 956, iPhone 16 Pro Max, Portrait
        case large
        
        // [1024, 1210], e.g.,
        // height = 1024, iPad Pro 2, iPad Pro 3, iPad Pro 4, iPad Pro 5, iPad Pro 6, iPad Air 6, Landscape
        // height = 1024, iPad Mini 5, iPad 5, iPad 6, Portrait
        // height = 1032, iPad Pro 7, Landscape
        // height = 1080, iPad 7, iPad 8, iPad 9, Portrait
        // height = 1112, iPad Air 3, iPad Pro 2, Portrait
        // height = 1133, iPad Mini 6, iPad Mini 7, Portrait
        // height = 1180, iPad Air 4, iPad Air 5, iPad Air 6, iPad 10, Portrait
        // height = 1194, iPad Pro 3, iPad Pro 4, iPad Pro 5, iPad Pro 6, Portrait
        // height = 1210, iPad Pro 7, Portrait
        case extraLarge
        
        // [1366, *], e.g.,
        // height = 1366, iPad Pro 2, iPad Pro 3, iPad Pro 4, iPad Pro 5, iPad Pro 6, iPad Air 6, Portrait
        // height = 1376, iPad Pro 7, Portrait
        case extraExtraLarge
    }
    
    /// Get current supported type
    /// - Parameter height: The height should be got from GeometryReader
    /// - Returns: Suppported Type
    static func currentSupportedType(height: CGFloat) -> SupportedType {
        switch height {
        case 375 ... 440:
            return .small
        case 667 ... 768:
            return .medium
        case 810 ... 956:
            return .large
        case 1024 ... 1210:
            return .extraLarge
        case 1366...:
            return .extraLarge
        default:
            return .medium
        }
    }
}
