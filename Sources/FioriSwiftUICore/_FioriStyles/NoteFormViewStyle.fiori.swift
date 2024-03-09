import FioriThemeManager
import Foundation
import SwiftUI

/**
 This file provides default fiori style for the component.
 
 1. Uncomment fhe following code.
 2. Implement layout and style in corresponding places.
 3. Delete `.generated` from file name.
 4. Move this file to `_FioriStyles` folder under `FioriSwiftUICore`.
 */

// Base Layout style
public struct NoteFormViewBaseStyle: NoteFormViewStyle {
    @FocusState var isFocused: Bool

    public func makeBody(_ configuration: NoteFormViewConfiguration) -> some View {
        VStack(alignment: .leading) {
            configuration._placeholderTextEditor
                .frame(minHeight: getMinHeight(configuration))
                .frame(maxHeight: getMaxHeight(configuration))
                .focused($isFocused)
                .padding(.top, 9)
                .disabled(getDisabled(configuration))
                .onChange(of: configuration.text) { s in
                    checkCharCount(configuration, textString: s)
                }
                .padding(.bottom, isInfoViewNeeded(configuration) ? 0 : 9)
        }
        .textInputInfoView(isPresented: Binding(get: { isInfoViewNeeded(configuration) }, set: { _ in }), description: self.getInfoString(configuration, isFocused: self.isFocused), counter: self.getCounterString(configuration, isFocused: self.isFocused))
    }

    func getMinHeight(_ configuration: NoteFormViewConfiguration) -> CGFloat {
        // Somehow, the minHeight is 14pt higher than the specified. Use this adjustment.
        let minHeightAdjustMent = 14.0
        guard let minHeight = configuration.minTextEditorHeight else {
            return 88 - minHeightAdjustMent
        }
        guard minHeight > 0 else {
            return 88 - minHeightAdjustMent
        }
        return minHeight - minHeightAdjustMent
    }

    func getMaxHeight(_ configuration: NoteFormViewConfiguration) -> CGFloat {
        guard let maxHeight = configuration.maxTextEditorHeight else {
            return .infinity
        }
        let minHeght = self.getMinHeight(configuration)
        return maxHeight > minHeght ? maxHeight : minHeght
    }

    func getDisabled(_ configuration: NoteFormViewConfiguration) -> Bool {
        switch getControlState(configuration) {
        case .disabled, .readOnly:
            return true
        default:
            return false
        }
    }

    func isInfoViewNeeded(_ configuration: NoteFormViewConfiguration) -> Bool {
        if let errorMessage = configuration.errorMessage, !errorMessage.characters.isEmpty {
            return true
        }
        if let hintText = configuration.hintText, !hintText.characters.isEmpty {
            return true
        }
        if let isCharCountEnabled = configuration.isCharCountEnabled, isCharCountEnabled {
            return true
        }
        return false
    }

    func checkCharCount(_ configuration: NoteFormViewConfiguration, textString: String) {
        guard let maxTextLength = configuration.maxTextLength, maxTextLength > 0 else {
            return
        }
        if !(configuration.allowsBeyondLimit == true), textString.count > maxTextLength {
            configuration.text = String(textString.prefix(maxTextLength))
        }
    }

    func getCounterString(_ configuration: NoteFormViewConfiguration, isFocused: Bool) -> AttributedString? {
        guard configuration.isCharCountEnabled == true else {
            return nil
        }

        guard let limit = configuration.maxTextLength, limit > 0 else {
            return nil
        }

        var hasError = false
        if let errorMessage = configuration.errorMessage, !errorMessage.characters.isEmpty {
            hasError = true
        }

        let charCount = configuration.text.count
        var charCountString = AttributedString((!isFocused && charCount == 0) ? "-" : "\(charCount)")
        if (isFocused && !hasError) || (checkMaxLength(configuration) == .onLimit) {
            charCountString.foregroundColor = .preferredColor(.tintColor)
        }
        var limitString = AttributedString("/\(limit)")
        limitString.foregroundColor = .preferredColor(.primaryLabel)
        var counterString = charCountString + limitString
        counterString.font = .fiori(forTextStyle: .footnote)
        return counterString
    }

    func getInfoString(_ configuration: NoteFormViewConfiguration, isFocused: Bool) -> AttributedString? {
        let lengthCondition = checkMaxLength(configuration)

        if let errorMessage = configuration.errorMessage, !errorMessage.characters.isEmpty {
            return errorMessage
        }

        if lengthCondition == .onLimit {
            let infoString = AttributedString(configuration.charCountReachLimitMessage ?? NSLocalizedString("No more characters remaining", tableName: "FioriSwiftUICore", bundle: fioriSwiftUICoreBundle, comment: ""))
            return infoString
        }

        if lengthCondition == .overLimit {
            let infoString = AttributedString(configuration.charCountReachLimitMessage ?? NSLocalizedString("Reduce the number of characters", tableName: "FioriSwiftUICore", bundle: fioriSwiftUICoreBundle, comment: ""))
            return infoString
        }

        if let hintText = configuration.hintText {
            return hintText
        }

        return nil
    }
}

// Default fiori styles
extension NoteFormViewFioriStyle {
    struct ContentFioriStyle: NoteFormViewStyle {
        @FocusState var isFocused: Bool

        @ViewBuilder
        func makeBody(_ configuration: NoteFormViewConfiguration) -> some View {
            NoteFormView(configuration)
                .foregroundStyle(self.getTextColor(configuration))
                .font(.fiori(forTextStyle: .body))
                .accentColor(self.getCursorColor(configuration))
                .focused($isFocused)
                .textInputInfoViewStyle { config in
                    let isError = isErrorStyle(configuration)
                    let style: any TextInputInfoViewStyle = isError ? .error : .fiori
                    TextInputInfoView(config)
                        .textInputInfoViewStyle(style)
                        .typeErased
                }
                .placeholderTextEditorStyle { config in
                    PlaceholderTextEditor(config)
                        .background(RoundedRectangle(cornerRadius: 8).stroke(getBorderColor(configuration), lineWidth: getBorderWidth(configuration)).background(getBackgroundColor(configuration)))
                }
        }

        func getTextColor(_ configuration: NoteFormViewConfiguration) -> Color {
            switch getControlState(configuration) {
            case .disabled:
                return .preferredColor(.separator) // .opacity(0.37)
            default:
                return .preferredColor(.primaryLabel)
            }
        }

        func getCursorColor(_ configuration: NoteFormViewConfiguration) -> Color {
            hasErrorMessage(configuration) ? .preferredColor(.negativeLabel) : .preferredColor(.tintColor)
        }
        
        func getBorderColor(_ configuration: NoteFormViewConfiguration) -> Color {
            guard !hasErrorMessage(configuration) else {
                return .preferredColor(.negativeLabel)
            }

            if self.isFocused {
                return .preferredColor(.tintColor)
            }

            switch getControlState(configuration) {
            case .disabled:
                return .preferredColor(.tertiaryFill)
            case .readOnly:
                return .clear
            default:
                return .preferredColor(.separatorOpaque)
            }
        }

        func getBackgroundColor(_ configuration: NoteFormViewConfiguration) -> Color {
            switch getControlState(configuration) {
            case .disabled, .readOnly:
                return .preferredColor(.tertiaryFill)
            default:
                return .clear
            }
        }

        func getBorderWidth(_ configuration: NoteFormViewConfiguration) -> CGFloat {
            self.isFocused ? 2.0 : 0.5
        }

        func isErrorStyle(_ configuration: NoteFormViewConfiguration, isFocused: Bool = false) -> Bool {
            let lengthCondition = checkMaxLength(configuration)

            if let errorMessage = configuration.errorMessage, !errorMessage.characters.isEmpty {
                return true
            } else if lengthCondition == .onLimit {
                return false
            } else if lengthCondition == .overLimit {
                return true
            }
            return false
        }
    }

    struct TextViewFioriStyle: TextViewStyle {
        func makeBody(_ configuration: TextViewConfiguration) -> some View {
            TextView(configuration)
        }
    }

    struct PlaceholderFioriStyle: PlaceholderStyle {
        func makeBody(_ configuration: PlaceholderConfiguration) -> some View {
            Placeholder(configuration)
        }
    }

    struct PlaceholderTextEditorFioriStyle: PlaceholderTextEditorStyle {
        func makeBody(_ configuration: PlaceholderTextEditorConfiguration) -> some View {
            PlaceholderTextEditor(configuration)
        }
    }

    struct FormViewFioriStyle: FormViewStyle {
        func makeBody(_ configuration: FormViewConfiguration) -> some View {
            FormView(configuration)
        }
    }
}

func getControlState(_ configuration: NoteFormViewConfiguration) -> ControlState {
    guard let controlState = configuration.controlState else {
        return .normal
    }
    return controlState
}

extension View {
    func getCounterString(_ configuration: NoteFormViewConfiguration, isFocused: Bool) -> AttributedString? {
        guard configuration.isCharCountEnabled == true else {
            return nil
        }

        guard let limit = configuration.maxTextLength, limit > 0 else {
            return nil
        }

        var hasError = false
        if let errorMessage = configuration.errorMessage, !errorMessage.characters.isEmpty {
            hasError = true
        }

        let charCount = configuration.text.count
        var charCountString = AttributedString((!isFocused && charCount == 0) ? "-" : "\(charCount)")
        if (isFocused && !hasError) || (checkMaxLength(configuration) == .onLimit) {
            charCountString.foregroundColor = .preferredColor(.tintColor)
        }
        var limitString = AttributedString("/\(limit)")
        limitString.foregroundColor = .preferredColor(.primaryLabel)
        return charCountString + limitString
    }
}

private let fioriSwiftUICoreBundle = Bundle.accessor

private func hasErrorMessage(_ configuration: NoteFormViewConfiguration) -> Bool {
    if let errorMessage = configuration.errorMessage, !errorMessage.characters.isEmpty {
        // Has non-empty error message
        return true
    }

    guard let maxTextLength = configuration.maxTextLength, maxTextLength > 0 else {
        // No limit
        return false
    }

    if configuration.text.count > maxTextLength {
        return true
    }

    return false
}

enum LengthCondition {
    case underLimit, onLimit, overLimit
}

private func checkMaxLength(_ configuration: NoteFormViewConfiguration) -> LengthCondition {
    guard let maxTextLength = configuration.maxTextLength, maxTextLength > 0 else {
        return .underLimit
    }

    let count = configuration.text.count

    if count < maxTextLength {
        return .underLimit
    }

    if count == maxTextLength || configuration.allowsBeyondLimit != true {
        return .onLimit
    }

    return .overLimit
}
