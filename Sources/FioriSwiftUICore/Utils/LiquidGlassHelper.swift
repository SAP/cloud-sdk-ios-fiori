import Darwin
import Foundation
import SwiftUI

/// A helper utility that determines whether modern Liquid Glass UI treatments
/// should be adopted based on system availability, Xcode build version, and compatibility flags.
public enum LiquidGlassHelper {
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

    /// A Boolean value indicating whether components should render using Liquid Glass UI effects.
    ///
    /// This property evaluates OS availability and compatibility configurations:
    /// - **iOS 27 / watchOS 27+**: Evaluates `hostAppXcodeVersion`. `UIDesignRequiresCompatibility`
    ///   is only honored when compiled with Xcode 26 (`DTXcode < 2700`). Apps built with Xcode 27+
    ///   have the flag ignored and will return `true`.
    /// - **iOS 26 / watchOS 26**: Returns `true` unless `UIDesignRequiresCompatibility` is set on iOS.
    /// - **Older OS versions**: Always returns `false`.
    public static var usesLiquidGlassUI: Bool {
        if #available(iOS 27, watchOS 27, *) {
            // On iOS 27, UIDesignRequiresCompatibility is only honored when built with Xcode 26 (DTXcode < 2700).
            // Apps built with Xcode 27+ have it ignored by the system.
            return hostAppXcodeVersion >= 2700 || !requiresDesignCompatibility
        } else if #available(iOS 26, watchOS 26, *) {
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
