// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import FioriThemeManager
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
    public let contentIdentifier = "FioriNoteFormView_content"
    public let textViewIdentifier = "FioriNoteFormView_textView"
    public let placeholderIdentifier = "FioriNoteFormView_placeholder"
    public let placeholderTextEditorIdentifier = "FioriNoteFormView_placeholderTextEditor"
    public let formViewIdentifier = "FioriNoteFormView_formView"

    public var componentIdentifier: String = "fiori_noteformview_component"
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

extension NoteFormViewConfiguration {
    func isDirectChild(_ componentIdentifier: String) -> Bool {
        componentIdentifier == self.componentIdentifier
    }
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

public struct NoteFormViewNSSStyle: NoteFormViewStyle {
    var isGlobal: Bool = false
    var data: NSSStyleData {
        self.isGlobal ? NSSTool.globalNSSStyle : NSSTool.mergeNSSStyle
    }

    public func makeBody(_ configuration: NoteFormViewConfiguration) -> some View {
        NoteFormView(configuration)
            .textViewStyle(TextViewNSSStyle(noteFormViewConfiguration: configuration, nssData: self.data.value(configuration.textViewIdentifier)))
            .placeholderStyle(PlaceholderNSSStyle(noteFormViewConfiguration: configuration, nssData: self.data.value(configuration.placeholderIdentifier)))
            .placeholderTextEditorStyle(PlaceholderTextEditorNSSStyle(noteFormViewConfiguration: configuration, nssData: self.data.value(configuration.placeholderTextEditorIdentifier)))
            .formViewStyle(FormViewNSSStyle(noteFormViewConfiguration: configuration, nssData: self.data.value(configuration.formViewIdentifier)))
            .noteFormViewStyle(ContentNSSStyle(noteFormViewConfiguration: configuration, nssData: self.data.value(configuration.contentIdentifier)))
    }
}
