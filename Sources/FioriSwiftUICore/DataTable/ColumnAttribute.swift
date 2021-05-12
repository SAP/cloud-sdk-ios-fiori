import Foundation
import SwiftUI

/// Column attribute.
public struct ColumnAttribute {
    /// Setting the width for each column.
    public enum Width {
        /// A fixed with
        case fixed(CGFloat)
        /// Column width will be flexible.
        case flexible
    }

    /// Text alignment in each column.
    public var textAlignment: TextAlignment = .leading
    /// Setting the width for each column.
    public var width: Width = .flexible
    
    /// Public initializer for ColumnAttribute
    /// - Parameters:
    ///   - textAlignment: Text alignment in each column.
    ///   - width: Setting the width for each column.
    public init(textAlignment: TextAlignment = .leading, width: Width = .flexible) {
        self.textAlignment = textAlignment
        self.width = width
    }
}
