//
//  PaletteVersion.swift
//  FioriSwiftUICore
//
//  Created by Guo, Justin on 6/14/20.
//

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
        }
    }
}

/// An enum for different version of `Palette`.
public enum PaletteVersion: CaseIterable {
    /// First snapshotted palette, from SAP Fiori SDK version 3.0 SP01
    case v3_x
    
    /**
     Snapshot of palette at SAP Fiori SDK version 3.0 SP02.
     
     - Important: Referred to in SAP Fiori Design Guidelines as 'Fiori 3' styling.
     */
    case v3_2
    
    /**
     Snapshot of palette at SAP Fiori SDK version 4.0 and version 5.0.
     
     - Important: Referred to in SAP Fiori Design Guidelines as 'Fiori 3' styling.
     */
    case v4
    
    /**
     Snapshot of palette at SAP Fiori SDK version 6.0.
     
     - Important: Referred to in SAP Fiori Design Guidelines as 'Fiori 3' styling.
     */
    case v5
    
    /// Palette version which should be adopted by developer, if creating a custom palette from scratch.
    /// - Note: Creating a custom palette from scratch is very uncommon and not generally recommended: it is more typical and convenient to override specific colors of the current system-provided palette, using the `ThemeManager.shared.setColor(...)` or `ThemeManager.shared.setHexColor(...)` APIs.
    public static let latest: PaletteVersion = { allCases.last! }()
    
    /// Palette version which previous being adopted by developer, if exists.
    public func previous() -> PaletteVersion? {
        guard let index = PaletteVersion.allCases.firstIndex(of: self), index > 0 else { return nil }
        return PaletteVersion.allCases[index - 1]
    }
    
    func next() -> PaletteVersion? {
        guard let index = PaletteVersion.allCases.firstIndex(of: self), index < (PaletteVersion.allCases.count - 1) else { return nil }
        return PaletteVersion.allCases[index + 1]
    }
    
    static let initialSupportedStyles: Set<ColorStyle> = [.primary1, .primary2, .primary3, .primary4, .primary5, .primary6, .primary7, .primary8, .primary9, .tintColor, .tintColorLight, .tintColorDark, .tintColorTapState, .tintColorTapStateLight, .tintColorTapStateDark, .navigationBar, .backgroundGradientTop, .backgroundGradientBottom, .backgroundBase, .cellBackgroundTapState, .line, .chart1, .chart2, .chart3, .chart4, .chart5, .chart6, .chart7, .chart8, .chart9, .chart10, .chart11, .negative, .critical, .positive, .map1, .map2, .map3, .map4, .map5, .map6, .map7, .map8, .map9, .map10, .esriEdit]
    
    func supportedStyles() -> Set<ColorStyle> {
        guard let previous = self.previous() else { return PaletteVersion.initialSupportedStyles }
        return previous.supportedStyles().subtracting(self.obsoletedStyles()).union(self.newStyles())
    }
    
    func obsoletedStyles() -> Set<ColorStyle> {
        guard let previous = self.previous() else { return [] }
        switch self {
        case .v3_2:
            return previous.obsoletedStyles().union([.tintColorTapStateLight, .tintColorTapStateDark, .tintColorLight, .tintColorDark])
        case .v4:
            return previous.obsoletedStyles().union([.backgroundGradientTop, .backgroundGradientBottom])
        case .v5:
            return previous.obsoletedStyles().union([.navigationBar, .backgroundBase])
        default:
            return []
        }
    }
    
    func newStyles() -> Set<ColorStyle> {
        switch self {
        case .v3_x:
            return PaletteVersion.initialSupportedStyles
        case .v3_2:
            return [.primary10, .negativeBackground, .positiveBackground, .criticalBackground, .informationBackground, .accent1, .accent1b, .accent2, .accent4, .accent5, .accent6, .accent6b, .accent7, .accent7b, .accent8, .accent9, .accent10, .accent10b]
        case .v4:
            return [.navigationBar, .stockUpStroke, .stockDownStroke]
        case .v5:
            return [.shell, .background1, .background2, .separator, .shadow, .primaryGroupedBackgrond, .secondaryGroupedBackgrond, .tertiaryGroupedBackgrond, .primaryBackgrond, .secondaryBackgrond, .tertiaryBackgrond, .primaryLabel, .secondaryLabel, .tertiaryLabel, .quarternaryLabel, .primaryFill, .secondaryFill, .tertiaryFill, .quarternaryFill, .header, .footer, .cellBackground, .negativeLabel, .positiveLabel, .criticalLabel, .negativeBackground, .positiveBackground, .criticalBackground, .informationBackground]
        }
    }
}
