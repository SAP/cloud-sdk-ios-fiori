import FioriThemeManager
import Foundation
import SwiftUI

/// The base layout style for `TextInputInfoView`.
public struct TextInputInfoViewBaseStyle: TextInputInfoViewStyle {
    @Environment(\.aiNotice) var aiNoticeConfig: AINoticeItemConfiguration
    public func makeBody(_ configuration: TextInputInfoViewConfiguration) -> some View {
        HStack(alignment: .top, spacing: 8) {
            VStack(alignment: .leading, spacing: 0) {
                HStack(alignment: .top, spacing: 8) {
                    configuration.icon
                    configuration.description
                }
                
                if self.aiNoticeConfig.isPresented.wrappedValue {
                    AINotice(icon: self.aiNoticeConfig.icon, description: self.aiNoticeConfig.description, actionLabel: self.aiNoticeConfig.actionLabel, viewMoreAction: self.aiNoticeConfig.viewMoreAction, viewAlignment: .leading)
                        .padding(.top, configuration.description.isEmpty ? 0 : 4)
                }
            }
            Spacer()
            configuration.counter
                .padding(.leading, 16)
        }
        .padding(.top, 4)
        .padding(.bottom, 11)
    }
}

// Default fiori styles
extension TextInputInfoViewFioriStyle {
    struct ContentFioriStyle: TextInputInfoViewStyle {
        func makeBody(_ configuration: TextInputInfoViewConfiguration) -> some View {
            TextInputInfoView(configuration)
                .foregroundColor(.preferredColor(.tertiaryLabel))
        }
    }
    
    struct IconFioriStyle: IconStyle {
        let textInputInfoViewConfiguration: TextInputInfoViewConfiguration
        
        func makeBody(_ configuration: IconConfiguration) -> some View {
            Icon(configuration)
                .foregroundStyle(Color.preferredColor(.tertiaryLabel))
                .font(.fiori(forTextStyle: .footnote))
        }
    }
    
    struct DescriptionFioriStyle: DescriptionStyle {
        let textInputInfoViewConfiguration: TextInputInfoViewConfiguration
        
        func makeBody(_ configuration: DescriptionConfiguration) -> some View {
            Description(configuration)
                .foregroundStyle(Color.preferredColor(.tertiaryLabel))
                .font(.fiori(forTextStyle: .footnote))
        }
    }
    
    struct CounterFioriStyle: CounterStyle {
        let textInputInfoViewConfiguration: TextInputInfoViewConfiguration
        
        func makeBody(_ configuration: CounterConfiguration) -> some View {
            Counter(configuration)
                .foregroundStyle(Color.preferredColor(.tertiaryLabel))
                .font(.fiori(forTextStyle: .footnote))
        }
    }
    
    struct InformationViewFioriStyle: InformationViewStyle {
        let textInputInfoViewConfiguration: TextInputInfoViewConfiguration
        
        func makeBody(_ configuration: InformationViewConfiguration) -> some View {
            InformationView(configuration)
        }
    }
}

struct TextInputInfoViewModifier: ViewModifier {
    @Binding var isPresented: Bool
    let icon: Image?
    let description: AttributedString?
    let counter: AttributedString?
    
    func body(content: Content) -> some View {
        VStack {
            content
            
            if self.isPresented {
                TextInputInfoView(icon: self.icon, description: self.description, counter: self.counter)
                    .accessibilityElement(children: .combine)
            }
        }
    }
}

extension View {
    /// To show the TextInputInfoView at the bottom of the view. It includes an icon and text. It is used in error handling to show error / warning / informational / success confirmation message.
    func textInputInfoView(isPresented: Binding<Bool>, icon: Image? = nil, description: AttributedString? = nil, counter: AttributedString? = nil) -> some View {
        self.modifier(TextInputInfoViewModifier(isPresented: isPresented, icon: icon, description: description, counter: counter))
    }
}

/// Error style
public struct TextInputInfoViewErrorStyle: TextInputInfoViewStyle {
    @Environment(\.isEnabled) var isEnabled
    public func makeBody(_ configuration: TextInputInfoViewConfiguration) -> some View {
        TextInputInfoView(configuration)
            .iconStyle(content: { IconConfiguration in
                if IconConfiguration.icon.isEmpty {
                    Image(systemName: "exclamationmark.circle")
                        .foregroundStyle(Color.preferredColor(self.isEnabled ? .negativeLabel : .quaternaryLabel))
                } else {
                    IconConfiguration.icon
                        .foregroundStyle(Color.preferredColor(self.isEnabled ? .negativeLabel : .quaternaryLabel))
                }
            })
            .descriptionStyle(content: { descriptionConfiguration in
                descriptionConfiguration.description
                    .foregroundStyle(Color.preferredColor(self.isEnabled ? .negativeLabel : .quaternaryLabel))
            })
            .counterStyle(content: { counterConfiguration in
                if !counterConfiguration.counter.isEmpty {
                    counterConfiguration.counter
                        .foregroundStyle(Color.preferredColor(self.isEnabled ? .negativeLabel : .quaternaryLabel))
                        .font(.fiori(forTextStyle: .footnote))
                }
            })
    }
}

/// Warning style
public struct TextInputInfoViewWarningStyle: TextInputInfoViewStyle {
    @Environment(\.isEnabled) var isEnabled
    public func makeBody(_ configuration: TextInputInfoViewConfiguration) -> some View {
        TextInputInfoView(configuration)
            .iconStyle(content: { IconConfiguration in
                if IconConfiguration.icon.isEmpty {
                    Image(systemName: "exclamationmark.triangle")
                        .foregroundStyle(Color.preferredColor(self.isEnabled ? .criticalLabel : .quaternaryLabel))
                } else {
                    IconConfiguration.icon
                        .foregroundStyle(Color.preferredColor(self.isEnabled ? .criticalLabel : .quaternaryLabel))
                }
            })
            .descriptionStyle(content: { descriptionConfiguration in
                descriptionConfiguration.description
                    .foregroundStyle(Color.preferredColor(self.isEnabled ? .criticalLabel : .quaternaryLabel))
            })
    }
}

/// Informational Style
public struct TextInputInfoViewInformationalStyle: TextInputInfoViewStyle {
    @Environment(\.isEnabled) var isEnabled
    public func makeBody(_ configuration: TextInputInfoViewConfiguration) -> some View {
        TextInputInfoView(configuration)
            .iconStyle(content: { IconConfiguration in
                if IconConfiguration.icon.isEmpty {
                    Image(systemName: "info.circle")
                        .foregroundStyle(Color.preferredColor(self.isEnabled ? .primaryLabel : .quaternaryLabel))
                } else {
                    IconConfiguration.icon
                        .foregroundStyle(Color.preferredColor(self.isEnabled ? .primaryLabel : .quaternaryLabel))
                }
            })
            .descriptionStyle(content: { descriptionConfiguration in
                descriptionConfiguration.description
                    .foregroundStyle(Color.preferredColor(self.isEnabled ? .primaryLabel : .quaternaryLabel))
            })
    }
}

/// Success Style
public struct TextInputInfoViewSuccessStyle: TextInputInfoViewStyle {
    @Environment(\.isEnabled) var isEnabled
    public func makeBody(_ configuration: TextInputInfoViewConfiguration) -> some View {
        TextInputInfoView(configuration)
            .iconStyle(content: { IconConfiguration in
                if IconConfiguration.icon.isEmpty {
                    Image(systemName: "checkmark.circle")
                        .foregroundStyle(Color.preferredColor(self.isEnabled ? .positiveLabel : .quaternaryLabel))
                } else {
                    IconConfiguration.icon
                        .foregroundStyle(Color.preferredColor(self.isEnabled ? .positiveLabel : .quaternaryLabel))
                }
            })
            .descriptionStyle(content: { descriptionConfiguration in
                descriptionConfiguration.description
                    .foregroundStyle(Color.preferredColor(self.isEnabled ? .positiveLabel : .quaternaryLabel))
            })
    }
}

/// Error style of the TextInputInfoView. It is used to show error message.
public extension TextInputInfoViewStyle where Self == TextInputInfoViewErrorStyle {
    static var error: TextInputInfoViewErrorStyle {
        TextInputInfoViewErrorStyle()
    }
}

/// Warning style of the TextInputInfoView. It is used to show warning message.
public extension TextInputInfoViewStyle where Self == TextInputInfoViewWarningStyle {
    static var warning: TextInputInfoViewWarningStyle {
        TextInputInfoViewWarningStyle()
    }
}

/// Informationalstyle of the TextInputInfoView. It is used to show informational message.
public extension TextInputInfoViewStyle where Self == TextInputInfoViewInformationalStyle {
    static var informational: TextInputInfoViewInformationalStyle {
        TextInputInfoViewInformationalStyle()
    }
}

/// Success style of the TextInputInfoView. It is used to show success message.
public extension TextInputInfoViewStyle where Self == TextInputInfoViewSuccessStyle {
    static var success: TextInputInfoViewSuccessStyle {
        TextInputInfoViewSuccessStyle()
    }
}

enum LengthCondition {
    case underLimit, onLimit, overLimit
}

// internal utilities
private let fioriSwiftUICoreBundle = Bundle.accessor

struct TextInputFormViewConfiguration {
    let text: String
    let controlState: ControlState
    let errorMessage: AttributedString?
    let maxTextLength: Int?
    let hintText: AttributedString?
    let hidesReadOnlyHint: Bool
    let isCharCountEnabled: Bool
    let allowsBeyondLimit: Bool
    let charCountReachLimitMessage: String?
    let charCountBeyondLimitMsg: String?
    let isFocused: Bool
    let isAINoticeEnabled: Bool

    init(_ noteFormViewConfiguration: NoteFormViewConfiguration, isFocused: Bool) {
        self.text = noteFormViewConfiguration.text
        self.controlState = noteFormViewConfiguration.controlState
        self.errorMessage = noteFormViewConfiguration.errorMessage
        self.maxTextLength = noteFormViewConfiguration.maxTextLength
        self.hintText = noteFormViewConfiguration.hintText
        self.hidesReadOnlyHint = noteFormViewConfiguration.hidesReadOnlyHint
        self.isCharCountEnabled = noteFormViewConfiguration.isCharCountEnabled
        self.allowsBeyondLimit = noteFormViewConfiguration.allowsBeyondLimit
        self.charCountReachLimitMessage = noteFormViewConfiguration.charCountReachLimitMessage
        self.charCountBeyondLimitMsg = noteFormViewConfiguration.charCountBeyondLimitMsg
        self.isFocused = isFocused
        self.isAINoticeEnabled = noteFormViewConfiguration.isAINoticeEnabled
    }

    init(_ titleFormViewConfiguration: TitleFormViewConfiguration, isFocused: Bool) {
        self.text = titleFormViewConfiguration.text
        self.controlState = titleFormViewConfiguration.controlState
        self.errorMessage = titleFormViewConfiguration.errorMessage
        self.maxTextLength = titleFormViewConfiguration.maxTextLength
        self.hintText = titleFormViewConfiguration.hintText
        self.hidesReadOnlyHint = titleFormViewConfiguration.hidesReadOnlyHint
        self.isCharCountEnabled = titleFormViewConfiguration.isCharCountEnabled
        self.allowsBeyondLimit = titleFormViewConfiguration.allowsBeyondLimit
        self.charCountReachLimitMessage = titleFormViewConfiguration.charCountReachLimitMessage
        self.charCountBeyondLimitMsg = titleFormViewConfiguration.charCountBeyondLimitMsg
        self.isFocused = isFocused
        self.isAINoticeEnabled = titleFormViewConfiguration.isAINoticeEnabled
    }

    init(_ textFieldFormViewConfiguration: TextFieldFormViewConfiguration, isFocused: Bool) {
        self.text = textFieldFormViewConfiguration.text
        self.controlState = textFieldFormViewConfiguration.controlState
        self.errorMessage = textFieldFormViewConfiguration.errorMessage
        self.maxTextLength = textFieldFormViewConfiguration.maxTextLength
        self.hintText = textFieldFormViewConfiguration.hintText
        self.hidesReadOnlyHint = textFieldFormViewConfiguration.hidesReadOnlyHint
        self.isCharCountEnabled = textFieldFormViewConfiguration.isCharCountEnabled
        self.allowsBeyondLimit = textFieldFormViewConfiguration.allowsBeyondLimit
        self.charCountReachLimitMessage = textFieldFormViewConfiguration.charCountReachLimitMessage
        self.charCountBeyondLimitMsg = textFieldFormViewConfiguration.charCountBeyondLimitMsg
        self.isFocused = isFocused
        self.isAINoticeEnabled = textFieldFormViewConfiguration.isAINoticeEnabled
    }

    init(_ keyValueFormViewConfiguration: KeyValueFormViewConfiguration, isFocused: Bool) {
        self.text = keyValueFormViewConfiguration.text
        self.controlState = keyValueFormViewConfiguration.controlState
        self.errorMessage = keyValueFormViewConfiguration.errorMessage
        self.maxTextLength = keyValueFormViewConfiguration.maxTextLength
        self.hintText = keyValueFormViewConfiguration.hintText
        self.hidesReadOnlyHint = keyValueFormViewConfiguration.hidesReadOnlyHint
        self.isCharCountEnabled = keyValueFormViewConfiguration.isCharCountEnabled
        self.allowsBeyondLimit = keyValueFormViewConfiguration.allowsBeyondLimit
        self.charCountReachLimitMessage = keyValueFormViewConfiguration.charCountReachLimitMessage
        self.charCountBeyondLimitMsg = keyValueFormViewConfiguration.charCountBeyondLimitMsg
        self.isFocused = isFocused
        self.isAINoticeEnabled = keyValueFormViewConfiguration.isAINoticeEnabled
    }

    func getControlState() -> ControlState {
        self.controlState
    }

    func getEditable() -> Bool {
        switch self.getControlState() {
        case .disabled, .readOnly:
            return false
        default:
            return true
        }
    }

    func getCounterString() -> AttributedString? {
        guard self.isCharCountEnabled == true else {
            return nil
        }

        guard let limit = maxTextLength, limit > 0 else {
            return nil
        }

        var hasError = false
        if let errorMessage, !errorMessage.characters.isEmpty {
            hasError = true
        }

        let charCount = self.text.count
        var charCountString = AttributedString((!self.isFocused && charCount == 0) ? "-" : "\(charCount)")
        if self.isFocused, hasError {
            charCountString.foregroundColor = .preferredColor(self.checkMaxLength() == .overLimit ? .negativeLabel : .tertiaryLabel)
        } else {
            charCountString.foregroundColor = .preferredColor(self.checkMaxLength() == .overLimit ? .negativeLabel : .tertiaryLabel)
        }
        var limitString = AttributedString("/\(limit)")
        limitString.foregroundColor = .preferredColor(.tertiaryLabel)
        var counterString = charCountString + limitString
        counterString.font = .fiori(forTextStyle: .footnote)
        return counterString
    }

    func checkMaxLength() -> LengthCondition {
        guard let maxTextLength, maxTextLength > 0 else {
            return .underLimit
        }

        let count = self.text.count

        if count < maxTextLength {
            return .underLimit
        }

        if count == maxTextLength || self.allowsBeyondLimit != true {
            return .onLimit
        }

        return .overLimit
    }

    func getInfoString() -> AttributedString? {
        let lengthCondition = self.checkMaxLength()

        if let errorMessage, !errorMessage.characters.isEmpty {
            return errorMessage
        }

        if lengthCondition == .onLimit {
            let infoString = AttributedString(charCountReachLimitMessage ?? NSLocalizedString("No more characters remaining", tableName: "FioriSwiftUICore", bundle: fioriSwiftUICoreBundle, comment: ""))
            return infoString
        }

        if lengthCondition == .overLimit {
            let infoString = AttributedString(charCountReachLimitMessage ?? NSLocalizedString("Reduce the number of characters", tableName: "FioriSwiftUICore", bundle: fioriSwiftUICoreBundle, comment: ""))
            return infoString
        }

        if let hintText {
            return hintText
        }

        if self.getControlState() == .readOnly, self.hidesReadOnlyHint == false {
            let readOnlyHint = AttributedString(NSLocalizedString("Read-only field", tableName: "FioriSwiftUICore", bundle: fioriSwiftUICoreBundle, comment: ""))
            return readOnlyHint
        }

        return nil
    }

    func hasErrorMessage() -> Bool {
        guard let maxTextLength, maxTextLength > 0 else {
            // No limit
            return false
        }

        if self.text.count > maxTextLength {
            return true
        }

        return false
    }

    func getTextColor() -> Color {
        switch self.getControlState() {
        case .disabled:
            return .preferredColor(.quaternaryLabel)
        default:
            return .preferredColor(.primaryLabel)
        }
    }

    func getCursorColor() -> Color {
        self.hasErrorMessage() ? .preferredColor(.negativeLabel) : .preferredColor(.tintColor)
    }

    func getBorderColor() -> Color {
        guard !self.hasErrorMessage() else {
            return .preferredColor(.negativeLabel)
        }

        if self.isFocused {
            return .preferredColor(.tintColor)
        }

        switch self.getControlState() {
        case .disabled:
            return .preferredColor(.tertiaryFill)
        case .readOnly:
            return .clear
        default:
            return .preferredColor(.separatorOpaque)
        }
    }

    func getBackgroundColor() -> Color {
        self.getEditable() ? .clear : .preferredColor(.quaternaryFill)
    }

    func getBorderWidth() -> CGFloat {
        self.isFocused ? 2.0 : 0.5
    }

    func isErrorStyle() -> Bool {
        let lengthCondition = self.checkMaxLength()

        if let errorMessage, !errorMessage.characters.isEmpty {
            return true
        } else if lengthCondition == .onLimit {
            return false
        } else if lengthCondition == .overLimit {
            return true
        }
        return false
    }

    func isInfoViewNeeded() -> Bool {
        if let errorMessage, !errorMessage.characters.isEmpty {
            return true
        }
        if let hintText, !hintText.characters.isEmpty {
            return true
        }
        if self.isCharCountEnabled {
            return true
        }
        
        if self.isAINoticeEnabled {
            return true
        }
        
        if self.controlState == .readOnly, self.hidesReadOnlyHint != true {
            return true
        }
        return false
    }

    func getTitleColor() -> Color {
        switch self.getControlState() {
        case .disabled:
            return .preferredColor(.quaternaryLabel)
        default:
            return .preferredColor(.primaryLabel)
        }
    }
}

#Preview(body: {
    VStack(alignment: .leading) {
        Text("Default Fiori style, no icon")
            .textInputInfoView(isPresented: Binding(get: { true }, set: { _ in }), description: AttributedString("test message"), counter: AttributedString("10/100"))
        
        Text("Default Fiori style, no message")
            .textInputInfoView(isPresented: Binding(get: { true }, set: { _ in }), counter: AttributedString("10/100"))
        
        Text("Default Fiori style, no counter")
            .textInputInfoView(isPresented: Binding(get: { true }, set: { _ in }), description: AttributedString("test message"))
        
        Text("Error style")
            .textInputInfoView(isPresented: Binding(get: { true }, set: { _ in }), description: AttributedString("test message, long message  long message  long message  long message  long message  long message long message  long message"), counter: AttributedString("12/10"))
            .textInputInfoViewStyle(.error)
        
        Text("Warning style")
            .textInputInfoView(isPresented: Binding(get: { true }, set: { _ in }), description: AttributedString("test message, long message  long message  long message  long message  long message  long message long message  long message"), counter: AttributedString("10/10"))
            .textInputInfoViewStyle(.warning)
        
        Text("Informational style")
            .textInputInfoView(isPresented: Binding(get: { true }, set: { _ in }), description: AttributedString("test message"), counter: AttributedString("0/10"))
            .textInputInfoViewStyle(.informational)
        
        Text("Success style")
            .textInputInfoView(isPresented: Binding(get: { true }, set: { _ in }), description: AttributedString("test message"), counter: AttributedString("10/100"))
            .textInputInfoViewStyle(.success)
        
        Text("Customized icon")
            .textInputInfoView(isPresented: Binding(get: { true }, set: { _ in }), icon: Image(systemName: "heart"), description: AttributedString("test message, long message  long message  long message  long message  long message  long message long message  long message"), counter: AttributedString("10/100"))
        
        Text("Customized font and color")
            .textInputInfoView(isPresented: Binding(get: { true }, set: { _ in }), icon: Image(systemName: "diamond"), description: AttributedString("test message"), counter: AttributedString("10/100"))
            .iconStyle(content: { iconConfiguration in
                iconConfiguration.icon
                    .foregroundStyle(Color.preferredColor(.tintColor))
            })
            .descriptionStyle(content: { descriptionConfiguration in
                descriptionConfiguration.description
                    .foregroundStyle(Color.preferredColor(.criticalLabel))
                    .font(.fiori(forTextStyle: .title2))
            })
            .counterStyle(content: { counterConfiguration in
                counterConfiguration.counter
                    .foregroundStyle(Color.preferredColor(.criticalLabel))
                    .font(.fiori(forTextStyle: .title2))
            })
        
        Spacer()
    }
    .padding()
})
