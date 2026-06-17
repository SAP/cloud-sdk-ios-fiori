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
    
    static var usesLiquidGlassUI: Bool {
        if #available(iOS 27, *) {
            return true
        } else if #available(iOS 26, *) {
            #if os(iOS)
                return !requiresDesignCompatibility
            #else
                return true
            #endif
        } else {
            return false
        }
    }
}
