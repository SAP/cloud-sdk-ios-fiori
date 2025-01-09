import SwiftUI

/// Describes different presentation styles in `SectionHeader` and `SectionFooter`.  Determines which views are visible; affects labels' fonts, and vertical padding.
public enum SectionHeaderFooterStyle {
    /// Only `title` is visible.
    case title
    /// Both `title` and `attribute` are visible.
    case attribute
}
