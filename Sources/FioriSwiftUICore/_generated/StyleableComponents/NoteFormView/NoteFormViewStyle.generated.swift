// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

public protocol NoteFormViewStyle: DynamicProperty {
    associatedtype Body: View

    func makeBody(_ configuration: NoteFormViewConfiguration) -> Body
}

struct AnyNoteFormViewStyle: NoteFormViewStyle {
    let content: (NoteFormViewConfiguration) -> any View

    init(@ViewBuilder _ content: @escaping (NoteFormViewConfiguration) -> any View) {
        self.content = content
    }

    public func makeBody(_ configuration: NoteFormViewConfiguration) -> some View {
        self.content(configuration).typeErased
    }
}

public struct NoteFormViewConfiguration {
    @Binding public var text: String
    public let placeholder: Placeholder
    public let controlState: ControlState
    public let errorMessage: AttributedString?
    public let minTextEditorHeight: CGFloat?
    public let maxTextEditorHeight: CGFloat?
    public let maxTextLength: Int?
    public let hintText: AttributedString?
    public let hidesReadOnlyHint: Bool
    public let isCharCountEnabled: Bool
    public let allowsBeyondLimit: Bool
    public let charCountReachLimitMessage: String?
    public let charCountBeyondLimitMsg: String?

    public typealias Placeholder = ConfigurationViewWrapper
}

public struct NoteFormViewFioriStyle: NoteFormViewStyle {
    public func makeBody(_ configuration: NoteFormViewConfiguration) -> some View {
        NoteFormView(configuration)
            .textViewStyle(TextViewFioriStyle(noteFormViewConfiguration: configuration))
            .placeholderStyle(PlaceholderFioriStyle(noteFormViewConfiguration: configuration))
            .placeholderTextEditorStyle(PlaceholderTextEditorFioriStyle(noteFormViewConfiguration: configuration))
            .formViewStyle(FormViewFioriStyle(noteFormViewConfiguration: configuration))
    }
}
