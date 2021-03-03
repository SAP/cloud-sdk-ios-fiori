import SwiftUI

enum TableViewLayout {
    static let minUnitHeight: CGFloat = 0.0000000001
    
    /// Minimum unit width
    static let minUnitWidth: CGFloat = 0.0000000001
    
    ///
    static let minItemWidth: CGFloat = 90
    
    static let seperationLineColor = Color(red: 243, green: 243, blue: 243)
    
    static let lineShadowColor = Color(red: 0, green: 0, blue: 0).opacity(0.15)
    
    static let lineShadowOffset: CGFloat = 0.5
    
    static let lineBorderRadius: CGFloat = 0
    
    static let lineHeight: CGFloat = 1
    
    static let minRowHeight: CGFloat = 54
    
    static let defaultItemWidth: CGFloat = 90
    
    static let maxDataWidth: CGFloat = 90
    
    static let itemPadding: CGFloat = 20
    
    static let columnGapInCompact: CGFloat = 8
    
    static let columnGapInRegualr: CGFloat = 30

    static let topAndBottomPaddings: CGFloat = 16
    
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
    
    static let imageWidth: CGFloat = 45
}
