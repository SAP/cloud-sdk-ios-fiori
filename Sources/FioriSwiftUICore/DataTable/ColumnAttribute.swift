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
        
        /// fill the remaining space if possible
        case infinity
    }

    /// Text alignment in each column.
    public var textAlignment: TextAlignment = .leading
    /// Setting the width for each column.
    public var width: Width = .flexible
    
    /// used by date or time column
    public var dateFormatter: DateFormatter?
    
    /**
     Set this property to customize the format of duration text.
     If this property is not set, using the default text format.
     The default text format is "%d Hrs %d Min" where %d is the number of
     hours and minutes.
     */
    public var durationTextFormat: String {
        get {
            if let tf = _durationTextFormat {
                return tf
            }
            
            let tf = NSLocalizedString("%d Hrs %d Min", tableName: "FioriSwiftUICore", bundle: Bundle.accessor, comment: "")
            
            return tf
        }
        
        set {
            self._durationTextFormat = newValue
        }
    }
    
    private var _durationTextFormat: String?
    
    ///
    public func dateFormatter(for dataItemType: DataItemType) -> DateFormatter {
        if let df = dateFormatter {
            return df
        }
        
        let df = DateFormatter()
        
        if dataItemType == .date {
            df.dateStyle = .medium
            df.timeStyle = .none
        } else {
            df.dateStyle = .none
            df.timeStyle = .short
        }
        
        return df
    }
    
    /// Public initializer for ColumnAttribute
    /// - Parameters:
    ///   - textAlignment: Text alignment in each column.
    ///   - width: Setting the width for each column.
    public init(textAlignment: TextAlignment = .leading, width: Width = .flexible) {
        self.textAlignment = textAlignment
        self.width = width
    }
}
