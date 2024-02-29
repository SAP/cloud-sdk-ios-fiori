import Foundation
import SwiftUI

public extension Font {
    struct FioriWeight: Hashable {
        let rawValue: String
        
        public static let ultraLight: FioriWeight = .init(rawValue: "com.sap.sdk.ios.FioriSwiftUI.FioriWeight.ultraLight")

        public static let thin: FioriWeight = .init(rawValue: "com.sap.sdk.ios.FioriSwiftUI.FioriWeight.thin")

        public static let light: FioriWeight = .init(rawValue: "com.sap.sdk.ios.FioriSwiftUI.FioriWeight.light")

        public static let regular: FioriWeight = .init(rawValue: "com.sap.sdk.ios.FioriSwiftUI.FioriWeight.regular")

        public static let medium: FioriWeight = .init(rawValue: "com.sap.sdk.ios.FioriSwiftUI.FioriWeight.medium")

        public static let semibold: FioriWeight = .init(rawValue: "com.sap.sdk.ios.FioriSwiftUI.FioriWeight.semibold")
        
        public static let semiboldDuplex: FioriWeight = .init(rawValue: "com.sap.sdk.ios.FioriSwiftUI.FioriWeight.semiboldDuplex")

        public static let bold: FioriWeight = .init(rawValue: "com.sap.sdk.ios.FioriSwiftUI.FioriWeight.bold")

        public static let heavy: FioriWeight = .init(rawValue: "com.sap.sdk.ios.FioriSwiftUI.FioriWeight.heavy")

        public static let black: FioriWeight = .init(rawValue: "com.sap.sdk.ios.FioriSwiftUI.FioriWeight.black")
        
        private init(rawValue: String) {
            self.rawValue = rawValue
        }
    }
}

extension Font.FioriWeight {
    func resolveWeight(isItalic: Bool, isCondensed: Bool) -> Font.Weight {
        let weight = self.weight_72
        return isItalic ? weight.italicWeight : (isCondensed ? weight.condensedWeight : weight)
    }
    
    var fontWeight: Font.Weight {
        switch self {
        case .heavy:
            return .heavy
        case .black:
            return .black
        case .bold:
            return .bold
        case .medium:
            return .medium
        case .semibold, .semiboldDuplex:
            return .semibold
        case .regular:
            return .regular
        case .thin:
            return .thin
        case .light:
            return .light
        case .ultraLight:
            return .ultraLight
        default:
            return .regular
        }
    }
    
    var weight_72: Font.Weight {
        switch self.fontWeight {
        case .heavy, .black:
            return .black
        case .bold:
            return .bold
        case .medium, .semibold:
            return .semibold
        case .regular:
            return .regular
        case .ultraLight, .thin, .light:
            return .light
        default:
            return .regular
        }
    }
}

extension Font.FioriWeight: CustomStringConvertible {
    public var description: String {
        switch self {
        case .heavy:
            return "heavy"
        case .black:
            return "black"
        case .bold:
            return "bold"
        case .medium:
            return "medium"
        case .semibold:
            return "semibold"
        case .semiboldDuplex:
            return "semiboldDuplex"
        case .regular:
            return "regular"
        case .thin:
            return "thin"
        case .light:
            return "light"
        case .ultraLight:
            return "ultraLight"
        default:
            return "regular"
        }
    }
}

private extension Font.Weight {
    var italicWeight: Font.Weight {
        switch self {
        case .black, .bold:
            return .bold
        default:
            return .regular
        }
    }
    
    var condensedWeight: Font.Weight {
        switch self {
        case .black, .bold:
            return .bold
        default:
            return .regular
        }
    }
}
