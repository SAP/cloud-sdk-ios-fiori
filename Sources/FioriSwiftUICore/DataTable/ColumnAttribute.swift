import Foundation
import SwiftUI

public struct ColumnAttribute {
    public enum Width {
        case fixed(CGFloat)
        case flexible
    }

    public var textAlignment: TextAlignment = .leading
    public var width: Width = .flexible
    
    public init(textAlignment: TextAlignment = .leading, width: Width = .flexible) {
        self.textAlignment = textAlignment
        self.width = width
    }
}
