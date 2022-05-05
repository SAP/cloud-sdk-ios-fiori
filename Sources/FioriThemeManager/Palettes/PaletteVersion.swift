import Foundation

/// :nodoc:
extension PaletteVersion: RawRepresentable {
    /// :nodoc:
    public typealias RawValue = Palette
    
    /// :nodoc:
    public init?(rawValue: Palette) {
        switch rawValue {
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
        default:
            return nil
        }
    }
    
    /// :nodoc:
    public var rawValue: Palette {
        switch self {
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
        }
    }
    
    var compatibilityMap: ColorCompatibilityMap? {
        switch self {
        case .v6:
            return ColorCompatibilityMapV6.default
        case .v5:
            return ColorCompatibilityMapV5.default
        case .v4:
            return ColorCompatibilityMapV4.default
        default:
            return nil
        }
    }
}

/// An enum for different version of `Palette`.
public enum PaletteVersion: CaseIterable, Comparable {
    /// First snapshotted palette, from SAP Fiori SDK version 3.0 SP01
    case v3_x
    
    /**
     Snapshot of palette at SAP Fiori SDK version 3.0 SP02.
     
     - Important: Referred to in SAP Fiori Design Guidelines as 'Fiori 3' styling.
     */
    case v3_2
    
    /**
     Snapshot of palette at SAP Fiori SDK version 5.0.
     
     - Important: Referred to in SAP Fiori Design Guidelines as 'Fiori 5' styling. Introduced dark mode support.
     */
    case v4
    
    /**
     Snapshot of palette at SAP Fiori SDK version 6.0.
     
     - Important: Referred to in SAP Fiori Design Guidelines as 'Fiori 6' styling. Introduced elevated and contrast colors support.
     */
    case v5
    
    /**
     Snapshot of palette at SAP Fiori SDK version 7.0.
     
     - Important: Referred to in SAP Fiori Design Guidelines as 'Fiori Next' styling.
     */
    case v6
    
    /**
     Snapshot of palette at SAP Fiori SDK version 8.0.
     
     - Important: Referred to in SAP Fiori Design Guidelines as 'Fiori Next' styling.
     */
    case v7
    
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
    
    static let initialSupportedStyles: Set<ColorStyle> = Set(PaletteV2.default.colorDefinitions.keys)
    
    /// Returns supported color styles in current palette.
    public func supportedStyles() -> Set<ColorStyle> {
        Set(self.rawValue.colorDefinitions.keys)
    }
    
    /// Returns obsoleted color styles since current palette.
    public func obsoletedStyles() -> Set<ColorStyle> {
        guard let previous = self.previous() else { return [] }
        let currentStyles = self.rawValue.colorDefinitions.keys
        let previousStyles = previous.rawValue.colorDefinitions.keys
        return Set(previousStyles).subtracting(currentStyles)
    }
    
    /// Returns new color styles added to current palette.
    public func newStyles() -> Set<ColorStyle> {
        guard let previous = self.previous() else { return Set(self.rawValue.colorDefinitions.keys) }
        let currentStyles = self.rawValue.colorDefinitions.keys
        let previousStyles = previous.rawValue.colorDefinitions.keys
        return Set(currentStyles).subtracting(previousStyles)
    }
}
