import SwiftUI

enum TableViewLayout {
    static let minUnitHeight: CGFloat = 0.0000000001
    
    /// Minimum unit width
    static let minUnitWidth: CGFloat = 0.0000000001
    ///
    static let minItemWidth: CGFloat = 90
    
    static let seperationLineColor = Color(red: 243, green: 243, blue: 243)
    
    static let defaultBackgroundColor = Color.preferredColor(.primaryBackground)
    
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
    
    static let minColumnWidthInRegular: CGFloat = 60
    
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
        if sizeClass == .compact {
            return 16
        }
        return width > 768 ? 48 : 20
    }
    
    static func contentInset(sizeClass: UserInterfaceSizeClass) -> CGFloat {
        sizeClass == .compact ? 8 : 16
    }
    
    static func accessoryViewLeadingMargin(width: CGFloat, sizeClass: UserInterfaceSizeClass) -> CGFloat {
        if sizeClass == .compact {
            return 10
        }
        return width > 768 ? 48 : 14
    }
    
    static func leftPaddingForLeadingAccessoryView(width: CGFloat, sizeClass: UserInterfaceSizeClass, hasButton: Bool) -> CGFloat {
        if sizeClass == .compact {
            return 10
        }
        return width > 768 ? (hasButton ? 48 : 20) : 14
    }
    
    static func rightPaddingForLeadingAccessoryView(_ sizeClass: UserInterfaceSizeClass) -> CGFloat {
        sizeClass == .compact ? 8 : 12
    }
    
    static let accessoryViewLeftPaddingInCompact: CGFloat = 10
    
    static let imageWidth: CGFloat = 45
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

extension String {
    func boundingBoxSize(with fontSize: CGFloat, width: CGFloat = CGFloat(MAXFLOAT), height: CGFloat = CGFloat(MAXFLOAT)) -> CGSize {
        #if os(iOS) || os(tvOS) || os(watchOS)
            let font = UIFont.systemFont(ofSize: fontSize)
        #elseif os(macOS)
            let font = NSFont.systemFont(ofSize: fontSize)
        #endif

        let size = (self as NSString)
            .boundingRect(with: CGSize(width: width, height: height),
                          options: .usesLineFragmentOrigin,
                          attributes: [NSAttributedString.Key.font: font],
                          context: nil).size

        return size
    }
}

extension UIFont {
    class func preferredFont(from font: Font) -> UIFont {
        let uiFont: UIFont

        if #available(iOS 14.0, *) {
            switch font {
            case .largeTitle:
                uiFont = UIFont.preferredFont(forTextStyle: .largeTitle)
            case .title:
                uiFont = UIFont.preferredFont(forTextStyle: .title1)
            case .title2:
                uiFont = UIFont.preferredFont(forTextStyle: .title2)
            case .title3:
                uiFont = UIFont.preferredFont(forTextStyle: .title3)
            case .headline:
                uiFont = UIFont.preferredFont(forTextStyle: .headline)
            case .subheadline:
                uiFont = UIFont.preferredFont(forTextStyle: .subheadline)
            case .callout:
                uiFont = UIFont.preferredFont(forTextStyle: .callout)
            case .caption:
                uiFont = UIFont.preferredFont(forTextStyle: .caption1)
            case .caption2:
                uiFont = UIFont.preferredFont(forTextStyle: .caption2)
            case .footnote:
                uiFont = UIFont.preferredFont(forTextStyle: .footnote)
            default:
                uiFont = UIFont.preferredFont(forTextStyle: .body)
            }
        } else {
            uiFont = .systemFont(ofSize: 14)
        }

        return uiFont
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
