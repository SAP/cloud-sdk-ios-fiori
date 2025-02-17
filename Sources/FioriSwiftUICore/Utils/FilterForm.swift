import Foundation

/// Size of `FUIFilterFormView` button
public enum FilterButtonSize {
    /// Items will be displayed in two columns, each column's width will be 50% of available space.
    case fixed
    /// Items will be displayed in sequence, each item size will be decided by its own content.
    case flexible
    /// Items will be displayed in sequence, each item size will be the same as the chip size with largest content.
    case flexibleByMaxChip
}
