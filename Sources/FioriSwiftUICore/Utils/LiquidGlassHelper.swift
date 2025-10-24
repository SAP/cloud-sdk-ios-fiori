import Darwin
import Foundation
import SwiftUI

enum LiquidGlassHelper {
    static var version: Int {
        #if os(iOS)
            #if canImport(os_availability_internal)
                return Int(__IPHONE_OS_VERSION_MAX_ALLOWED)
            #else
                return Int.max
            #endif
        #else
            return Int.max
        #endif
    }
    
    static var requiresDesignCompatibility: Bool {
        if let value = Bundle.main.infoDictionary?["UIDesignRequiresCompatibility"] as? Bool {
            return value
        }
        return false
    }
    
    static var usesLiquidGlassUI: Bool {
        if #available(iOS 26, *) {
            #if os(iOS)
                // This will tell if project is built below Xcode 26 or liquid glass is disabled by 'UIDesignRequiresCompatibility', yes, then we should not update component style.
                return !(version < 260000 || requiresDesignCompatibility)
            #else
                return true
            #endif
        } else {
            return false
        }
    }
}
