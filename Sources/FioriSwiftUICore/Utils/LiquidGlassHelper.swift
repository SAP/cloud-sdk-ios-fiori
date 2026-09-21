import Darwin
import Foundation
import SwiftUI

enum LiquidGlassHelper {
    static var requiresDesignCompatibility: Bool {
        if let value = Bundle.main.infoDictionary?["UIDesignRequiresCompatibility"] as? Bool {
            return value
        }
        return false
    }

    static var hostAppXcodeVersion: Int {
        guard let xcodeVersionString = Bundle.main.infoDictionary?["DTXcode"] as? String,
              let xcodeVersion = Int(xcodeVersionString) else { return Int.max }
        return xcodeVersion
    }

    static var usesLiquidGlassUI: Bool {
        if #available(iOS 27, *) {
            // On iOS 27, UIDesignRequiresCompatibility is only honored when built with Xcode 26 (DTXcode < 2700).
            // Apps built with Xcode 27+ have it ignored by the system.
            return hostAppXcodeVersion >= 2700 || !requiresDesignCompatibility
        } else if #available(iOS 26, *) {
            #if os(iOS)
                // This will tell if project is built below Xcode 26 or liquid glass is disabled by 'UIDesignRequiresCompatibility', yes, then we should not update component style.
                return !(hostAppXcodeVersion < 2600 || requiresDesignCompatibility)
            #else
                return true
            #endif
        } else {
            return false
        }
    }
}
