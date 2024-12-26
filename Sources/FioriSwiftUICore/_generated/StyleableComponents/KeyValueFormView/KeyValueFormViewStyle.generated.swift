// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import FioriThemeManager
import Foundation
import SwiftUI

public protocol KeyValueFormViewStyle: DynamicProperty {
    associatedtype Body: View

    func makeBody(_ configuration: KeyValueFormViewConfiguration) -> Body
}

struct AnyKeyValueFormViewStyle: KeyValueFormViewStyle {
    let content: (KeyValueFormViewConfiguration) -> any View

    init(@ViewBuilder _ content: @escaping (KeyValueFormViewConfiguration) -> any View) {
        self.content = content
    }

    public func makeBody(_ configuration: KeyValueFormViewConfiguration) -> some View {
        self.content(configuration).typeErased
    }
}

public struct KeyValueFormViewConfiguration {
    public let contentIdentifier = "FioriKeyValueFormView_content"
    public let titleIdentifier = "FioriKeyValueFormView_title"
    public let textViewIdentifier = "FioriKeyValueFormView_textView"
    public let placeholderIdentifier = "FioriKeyValueFormView_placeholder"
    public let mandatoryFieldIndicatorIdentifier = "FioriKeyValueFormView_mandatoryFieldIndicator"
    public let noteFormViewIdentifier = "FioriKeyValueFormView_noteFormView"

    public let title: Title
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
    public let mandatoryFieldIndicator: MandatoryFieldIndicator
    public let isRequired: Bool

    public typealias Title = ConfigurationViewWrapper
    public typealias Placeholder = ConfigurationViewWrapper
    public typealias MandatoryFieldIndicator = ConfigurationViewWrapper
}

public struct KeyValueFormViewFioriStyle: KeyValueFormViewStyle {
    public func makeBody(_ configuration: KeyValueFormViewConfiguration) -> some View {
        KeyValueFormView(configuration)
            .titleStyle(TitleFioriStyle(keyValueFormViewConfiguration: configuration))
            .textViewStyle(TextViewFioriStyle(keyValueFormViewConfiguration: configuration))
            .placeholderStyle(PlaceholderFioriStyle(keyValueFormViewConfiguration: configuration))
            .mandatoryFieldIndicatorStyle(MandatoryFieldIndicatorFioriStyle(keyValueFormViewConfiguration: configuration))
            .noteFormViewStyle(NoteFormViewFioriStyle(keyValueFormViewConfiguration: configuration))
    }
}

public struct KeyValueFormViewNSSStyle: KeyValueFormViewStyle {
    var isGlobal: Bool = false
    var data: NSSStyleData {
        self.isGlobal ? NSSTool.globalNSSStyle : NSSTool.mergeNSSStyle
    }

    public func makeBody(_ configuration: KeyValueFormViewConfiguration) -> some View {
        KeyValueFormView(configuration)
            .titleStyle(TitleNSSStyle(keyValueFormViewConfiguration: configuration, nssData: self.data.value(configuration.titleIdentifier)))
            .textViewStyle(TextViewNSSStyle(keyValueFormViewConfiguration: configuration, nssData: self.data.value(configuration.textViewIdentifier)))
            .placeholderStyle(PlaceholderNSSStyle(keyValueFormViewConfiguration: configuration, nssData: self.data.value(configuration.placeholderIdentifier)))
            .mandatoryFieldIndicatorStyle(MandatoryFieldIndicatorNSSStyle(keyValueFormViewConfiguration: configuration, nssData: self.data.value(configuration.mandatoryFieldIndicatorIdentifier)))
            .noteFormViewStyle(NoteFormViewNSSStyle(keyValueFormViewConfiguration: configuration, nssData: self.data.value(configuration.noteFormViewIdentifier)))
            .keyValueFormViewStyle(ContentNSSStyle(keyValueFormViewConfiguration: configuration, nssData: self.data.value(configuration.contentIdentifier)))
    }
}
