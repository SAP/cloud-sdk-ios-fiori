import SwiftUI

enum TableViewLayout {
    static let minUnitHeight: CGFloat = 0.0000000001
    
    /// Minimum unit width
    static let minUnitWidth: CGFloat = 0.0000000001
    ///
    static let minItemWidth: CGFloat = 90
    
    static let seperationLineColor = Color(red: 243, green: 243, blue: 243)
    
    static let defaultBackgroundColor = Color.preferredColor(.primaryBackground)
    
    static let defaultForegroundColor = Color.preferredColor(.quarternaryLabel)
    
    static let lineShadowColor = Color(red: 0, green: 0, blue: 0).opacity(0.15)
    
    static let lineShadowOffset: CGFloat = 0.5
    
    static let lineBorderRadius: CGFloat = 0
    
    static let lineHeight: CGFloat = 1
    
    static let minRowHeight: CGFloat = 48
                
    static let columnGapInCompact: CGFloat = 8
    
    static let columnGapInRegualr: CGFloat = 30

    static let topAndBottomPaddings: CGFloat = 16
    static let topAndBottomPaddingsForHeader: CGFloat = 8
    
    static let topAndBottomHeaderPaddings: CGFloat = 8
    
    static let minColumnWidth: CGFloat = 0.25
    static let maxColumnWidth: CGFloat = 0.5
    
    static let minColumnWidthInPt: CGFloat = 48
    
    /// fixed image size
    static let imageSize: CGFloat = 45
    
    /// Icon widh and height in leading or trailing accessory view
    static let buttonSize: CGFloat = 44
    
    /// Icon widh and height in leading or trailing accessory view
    static let iconSize: CGFloat = 20
    
    /// spacing between accessories
    static let accessorySpacing: CGFloat = 4
    
    static let leadingMarginInRegularFull: CGFloat = 48
    static let leadingMarginInRegular: CGFloat = 20
    static let leadingMarginInCompact: CGFloat = 16
    
    static let leadingTrailingPaddingInRegular: CGFloat = 16
    static let leadingTrailingPaddingInCompact: CGFloat = 8
    
    static let trailingMarginInReguarlFull: CGFloat = 48
    static let trailingMarginInRegualr: CGFloat = 20
    static let trailingMarginInCompact: CGFloat = 16
    
    static func defaultFont(_ isHeader: Bool) -> Font {
        isHeader ? .subheadline : .body
    }
    
    static func defaultUIFont(_ isHeader: Bool) -> UIFont {
        isHeader ? UIFont.preferredFont(from: .subheadline) : UIFont.preferredFont(from: .body)
    }
    
    static func defaultFontColor(_ isHeader: Bool) -> Color {
        isHeader ? Color.preferredColor(.secondaryLabel) : Color.preferredColor(.primaryLabel)
    }
    
    static func leadingOrTrailingMargin(width: CGFloat, sizeClass: UserInterfaceSizeClass) -> CGFloat {
        0
    }
    
    static func contentInset(sizeClass: UserInterfaceSizeClass) -> CGFloat {
        sizeClass == .compact ? 8 : 16
    }
    
    static func leftPaddingForLeadingAccessoryView(width: CGFloat, sizeClass: UserInterfaceSizeClass, hasButton: Bool) -> CGFloat {
        0
    }
    
    static func rightPaddingForLeadingAccessoryView(_ sizeClass: UserInterfaceSizeClass) -> CGFloat {
        sizeClass == .compact ? 8 : 12
    }
    
    static let accessoryViewLeftPaddingInCompact: CGFloat = 10
}

extension TextAlignment {
    func toTextFrameAlignment() -> Alignment {
        switch self {
        case .leading:
            return .leading
        case .trailing:
            return .trailing
        case .center:
            return .center
        }
    }
}

// 1. Create the key with a default value
private struct BackgroundColorKey: EnvironmentKey {
    static let defaultValue = TableViewLayout.defaultBackgroundColor
}

// 2. Extend the environment with our property
extension EnvironmentValues {
    var backgroundColor: Color {
        get { self[BackgroundColorKey.self] }
        set { self[BackgroundColorKey.self] = newValue }
    }
}
