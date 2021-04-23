import SwiftUI

open class DataTextItem: DataItem {
    public var type: DataItemType

    public var mapping: ObjectViewProperty.Text?
    public var text: String
    public var font: Font
    public var lineLimit: Int?
    
    public init(_ text: String, _ font: Font = .body, _ mapping: ObjectViewProperty.Text? = nil, lineLimit: Int? = nil) {
        self.text = text
        self.font = font
        self.type = .text
        self.mapping = mapping
        self.lineLimit = lineLimit
    }
}
