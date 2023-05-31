import Foundation
import OSLog

/// An enum for different version of `Palette`.
public enum PaletteVersion: Int {
    /// First snapshotted palette, from SAP Fiori SDK version 3.0 SP01
    @available(watchOS, unavailable)
    case v3_x

    /**
     Snapshot of palette at SAP Fiori SDK version 3.0 SP02.
 
     - Important: Referred to in SAP Fiori Design Guidelines as 'Fiori 3' styling.
     */
    @available(watchOS, unavailable)
    case v3_2

    /**
     Snapshot of palette at SAP Fiori SDK version 5.0.
 
     - Important: Referred to in SAP Fiori Design Guidelines as 'Fiori 5' styling. Introduced dark mode support.
     */
    @available(watchOS, unavailable)
    case v4

    /**
     Snapshot of palette at SAP Fiori SDK version 6.0.
 
     - Important: Referred to in SAP Fiori Design Guidelines as 'Fiori 6' styling. Introduced elevated and contrast colors support.
     */
    @available(watchOS, unavailable)
    case v5

    /**
     Snapshot of palette at SAP Fiori SDK version 7.0.
 
     - Important: Referred to in SAP Fiori Design Guidelines as 'Fiori Next' styling.
     */
    @available(watchOS, unavailable)
    case v6

    /**
     Snapshot of palette at SAP Fiori SDK version 8.0.
 
     - Important: Referred to in SAP Fiori Design Guidelines as 'Fiori Next' styling.
     */
    @available(watchOS, unavailable)
    case v7

    /**
     Snapshot of palette at SAP Fiori SDK version 9.1.
 
     - Important: Referred to in SAP Fiori Design Guidelines as 'Fiori Next' styling.
     */
    @available(watchOS, unavailable)
    case v8
    
    /**
     Snapshot of palette at SAP Fiori SDK version 9.2 for watch platform.
 
     - Important: Referred to in SAP Fiori Design Guidelines as 'Fiori Next' styling.
     */
    @available(watchOS, introduced: 7.0)
    @available(iOS, unavailable)
    case v1
    
    /// FUIPalette version which should be adopted by developer, if creating a custom palette from scratch.
    /// - Note: Creating a custom palette from scratch is very uncommon and not generally recommended: it is more typical and convenient to override specific colors of the current system-provided palette, using the `ThemeManager.shared.setColor(...)` or `ThemeManager.shared.setHexColor(...)` APIs.
    public static let latest: PaletteVersion = { allCases.last! }()
    
    /// Palette version which previous being adopted by developer, if exists.
    public func previous() -> PaletteVersion? {
        guard let index = PaletteVersion.allCases.firstIndex(of: self), index > 0 else { return nil }
        return PaletteVersion.allCases[index - 1]
    }
    
    /// Palette version which next being adopted by developer, if exists.
    public func next() -> PaletteVersion? {
        guard let index = PaletteVersion.allCases.firstIndex(of: self), index < (PaletteVersion.allCases.count - 1) else { return nil }
        return PaletteVersion.allCases[index + 1]
    }
    
    #if !os(watchOS)
        static let initialSupportedStyles: Set<ColorStyle> = Set(PaletteV2.default.colorDefinitions.keys)
    #else
        static let initialSupportedStyles: Set<ColorStyle> = Set(WatchPaletteV1.default.colorDefinitions.keys)
    #endif
    
    /// Returns supported color styles in current palette.
    public func supportedStyles() -> Set<ColorStyle> {
        Set(self.palette.colorDefinitions.keys)
    }
    
    /// Returns obsoleted color styles since current palette.
    public func obsoletedStyles() -> Set<ColorStyle> {
        guard let previous = self.previous() else { return [] }
        let currentStyles = self.palette.colorDefinitions.keys
        let previousStyles = previous.palette.colorDefinitions.keys
        return Set(previousStyles).subtracting(currentStyles)
    }
    
    /// Returns new color styles added to current palette.
    public func newStyles() -> Set<ColorStyle> {
        guard let previous = self.previous() else { return Set(self.palette.colorDefinitions.keys) }
        let currentStyles = self.palette.colorDefinitions.keys
        let previousStyles = previous.palette.colorDefinitions.keys
        return Set(currentStyles).subtracting(previousStyles)
    }
}

/// :nodoc:
public extension PaletteVersion {
    /// :nodoc:
    init?(palette: Palette) {
        switch palette {
        #if !os(watchOS)
            case PaletteV2.default:
                self = .v3_x
            case PaletteV3.default:
                self = .v3_2
            case PaletteV4.default:
                self = .v4
            case PaletteV5.default:
                self = .v5
            case PaletteV6.default:
                self = .v6
            case PaletteV7.default:
                self = .v7
            case PaletteV8.default:
                self = .v8
        #else
            case WatchPaletteV1.default:
                self = .v1
        #endif
        default:
            return nil
        }
    }
    
    var palette: Palette {
        switch self {
        #if !os(watchOS)
            case .v1:
                Logger().error("Palette version v1 is not available for iOS SDK.")
                fatalError()
            case .v3_x:
                return PaletteV2.default
            case .v3_2:
                return PaletteV3.default
            case .v4:
                return PaletteV4.default
            case .v5:
                return PaletteV5.default
            case .v6:
                return PaletteV6.default
            case .v7:
                return PaletteV7.default
            case .v8:
                return PaletteV8.default
        #else
            case .v1:
                return WatchPaletteV1.default
        #endif
        }
    }
    
    internal var compatibilityMap: ColorCompatibilityMap? {
        switch self {
        #if !os(watchOS)
            case .v7:
                return ColorCompatibilityMapV7.default
            case .v6:
                return ColorCompatibilityMapV6.default
            case .v5:
                return ColorCompatibilityMapV5.default
            case .v4:
                return ColorCompatibilityMapV4.default
        #endif
        default:
            return nil
        }
    }
}

extension PaletteVersion: CaseIterable {
    public static var allCases: [PaletteVersion] {
        #if !os(watchOS)
            return [v3_x, v3_2, v4, v5, v6, v7, v8]
        #else
            return [v1]
        #endif
    }
}
