import SwiftUI

open class DataTextItem: DataItem {
    public var type: DataItemType

    public var mapping: ObjectViewProperty.Text?
    var text: String
    var font: Font
    var lineLimit: Int?
    
    public init(_ text: String, _ font: Font = .body, _ mapping: ObjectViewProperty.Text? = nil) {
        self.text = text
        self.font = font
        self.type = .text
        self.mapping = mapping
    }
}
