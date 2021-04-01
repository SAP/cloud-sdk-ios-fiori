import Foundation
import SwiftUI

struct ColumnAttribute {
    enum Width {
        case fixed(CGFloat)
        case flexible
    }

    var textAlignment: TextAlignment = .leading
    var width: Width = .flexible
//    var contentInsets: EdgeInsets?
}
