import FioriThemeManager
import Foundation
import SwiftUI

/// The base layout style for `TitleFormView`.
public struct TitleFormViewBaseStyle: TitleFormViewStyle {
    @FocusState var isFocused: Bool

    @ViewBuilder
    public func makeBody(_ configuration: TitleFormViewConfiguration) -> some View {
        nonisolated(unsafe) let configuration = configuration
        SkeletonLoadingContainer {
            VStack(alignment: .leading) {
                configuration._placeholderTextField
                    .focused(self.$isFocused)
                    .disabled(self.getDisabled(configuration))
            }
            .textInputInfoView(isPresented: Binding(get: { self.isInfoViewNeeded(configuration) }, set: { _ in }), description: self.getInfoString(configuration), counter: self.getCounterString(configuration))
            .padding(.top, -1)
            .padding(.bottom, self.isInfoViewNeeded(configuration) ? -12 : -1)
            .accessibilityElement(children: .contain)
            .accessibilityHint(self.getAccessibilityHint(configuration, isFocused: self.isFocused))
            .disabled(configuration.controlState == .disabled)
        }
    }

    func getDisabled(_ configuration: TitleFormViewConfiguration) -> Bool {
        !TextInputFormViewConfiguration(configuration, isFocused: self.isFocused).getEditable()
    }

    func getCounterString(_ configuration: TitleFormViewConfiguration) -> AttributedString? {
        TextInputFormViewConfiguration(configuration, isFocused: self.isFocused).getCounterInfo().string
    }
    
    func getCounterLeft(_ configuration: TitleFormViewConfiguration) -> Int? {
        TextInputFormViewConfiguration(configuration, isFocused: self.isFocused).getCounterInfo().leftCount
    }

    func getInfoString(_ configuration: TitleFormViewConfiguration) -> AttributedString? {
        TextInputFormViewConfiguration(configuration, isFocused: self.isFocused).getInfoString()
    }

    func isInfoViewNeeded(_ configuration: TitleFormViewConfiguration) -> Bool {
        TextInputFormViewConfiguration(configuration, isFocused: self.isFocused).isInfoViewNeeded()
    }

    func getAccessibilityHint(_ configuration: TitleFormViewConfiguration, isFocused: Bool) -> String {
        var accHintString = ""
        if let leftCount = self.getCounterLeft(configuration) {
            accHintString = leftCount > 1 ? String(format: "%d characters left".localizedFioriString(), leftCount) : String(format: "%d character left".localizedFioriString(), leftCount)
        }
        switch configuration.controlState {
        case .normal:
            accHintString += " "
            if isFocused {
                if configuration.text.isEmpty {
                    accHintString += NSLocalizedString("Text field, is editing", tableName: "FioriSwiftUICore", bundle: Bundle.accessor, comment: "Text field, is editing")
                } else {
                    accHintString += NSLocalizedString("Text field, is editing. Double tap to clear text", tableName: "FioriSwiftUICore", bundle: Bundle.accessor, comment: "Text field, is editing. Double tap to clear text")
                }
            } else {
                accHintString += NSLocalizedString("Text field, Double tap to edit", tableName: "FioriSwiftUICore", bundle: Bundle.accessor, comment: "Text field, Double tap to edit")
            }
        default:
            break
        }
        return accHintString
    }
}

// Default fiori styles
extension TitleFormViewFioriStyle {
    struct ContentFioriStyle: TitleFormViewStyle {
        @FocusState var isFocused: Bool

        func makeBody(_ configuration: TitleFormViewConfiguration) -> some View {
            VStack {
                TitleFormView(configuration)
                    .foregroundStyle(self.getTextColor(configuration))
                    .font(.fiori(forTextStyle: .body))
                    .accentColor(self.getCursorColor(configuration))
                    .focused(self.$isFocused)
                    .textInputInfoViewStyle { config in
                        let isError = self.isErrorStyle(configuration)
                        let style: any TextInputInfoViewStyle = isError ? .error : .fiori
                        TextInputInfoView(config)
                            .textInputInfoViewStyle(style)
                            .typeErased
                            .padding(.top, -4)
                    }
                    .placeholderTextFieldStyle { config in
                        PlaceholderTextField(config)
                            .setOnChange(of: configuration.text, action1: { s in
                                self.checkCharCount(configuration, textString: s)
                            }) { _, s in
                                self.checkCharCount(configuration, textString: s)
                            }
                            .background(self.getBackgroundColor(configuration))
                    }
            }
        }

        func getTextColor(_ configuration: TitleFormViewConfiguration) -> Color {
            TextInputFormViewConfiguration(configuration, isFocused: self.isFocused).getTextColor()
        }

        func getCursorColor(_ configuration: TitleFormViewConfiguration) -> Color {
            TextInputFormViewConfiguration(configuration, isFocused: self.isFocused).getCursorColor()
        }

        func getBackgroundColor(_ configuration: TitleFormViewConfiguration) -> Color {
            if configuration.controlState == .disabled {
                return Color.clear
            }
            return TextInputFormViewConfiguration(configuration, isFocused: self.isFocused).getBackgroundColor()
        }

        func isErrorStyle(_ configuration: TitleFormViewConfiguration) -> Bool {
            TextInputFormViewConfiguration(configuration, isFocused: self.isFocused).isErrorStyle()
        }

        func isInfoViewNeeded(_ configuration: TitleFormViewConfiguration) -> Bool {
            TextInputFormViewConfiguration(configuration, isFocused: self.isFocused).isInfoViewNeeded()
        }

        func checkCharCount(_ configuration: TitleFormViewConfiguration, textString: String) {
            guard let maxTextLength = configuration.maxTextLength, maxTextLength > 0 else {
                return
            }
            if !(configuration.allowsBeyondLimit == true), textString.count > maxTextLength {
                configuration.text = String(textString.prefix(maxTextLength))
            }
        }
    }

    struct TextInputFieldFioriStyle: TextInputFieldStyle {
        let titleFormViewConfiguration: TitleFormViewConfiguration
        
        func makeBody(_ configuration: TextInputFieldConfiguration) -> some View {
            TextInputField(configuration)
        }
    }

    struct PlaceholderFioriStyle: PlaceholderStyle {
        let titleFormViewConfiguration: TitleFormViewConfiguration
        
        func makeBody(_ configuration: PlaceholderConfiguration) -> some View {
            Placeholder(configuration)
        }
    }

    struct PlaceholderTextFieldFioriStyle: PlaceholderTextFieldStyle {
        let titleFormViewConfiguration: TitleFormViewConfiguration
        
        func makeBody(_ configuration: PlaceholderTextFieldConfiguration) -> some View {
            PlaceholderTextField(configuration)
        }
    }

    struct FormViewFioriStyle: FormViewStyle {
        let titleFormViewConfiguration: TitleFormViewConfiguration

        func makeBody(_ configuration: FormViewConfiguration) -> some View {
            FormView(configuration)
        }
    }
}

// MARK: - TitleFormView Focus

public extension View {
    /// Binds the focus state of a `TitleFormView`'s text field to an external binding.
    ///
    /// Pass a `@State var` binding here to:
    /// - observe when the field becomes/resigns first responder (the binding is written `true`/`false`), and
    /// - dismiss the keyboard programmatically by setting the binding to `false`.
    ///
    /// This lets you host your own keyboard toolbar with a Done button — useful when the field uses a
    /// number/decimal keyboard that has no Return/Done key:
    /// ```swift
    /// @State private var isEditing = false
    ///
    /// TitleFormView(text: $text, placeholder: "Enter text")
    ///     .titleFormViewFocused($isEditing)
    ///     .toolbar {
    ///         ToolbarItemGroup(placement: .keyboard) {
    ///             if isEditing {
    ///                 Button { isEditing = false } label: { Text("Done") }
    ///                 Spacer()
    ///             }
    ///         }
    ///     }
    /// ```
    /// - Parameter binding: A binding kept in sync with the field's focus state.
    func titleFormViewFocused(_ binding: Binding<Bool>) -> some View {
        environment(\.textFieldFocusBinding, binding)
    }
}

struct TextFieldFocusBindingKey: EnvironmentKey {
    static let defaultValue: Binding<Bool>? = nil
}

extension EnvironmentValues {
    /// An optional external binding that mirrors the focus state of the shared single-line text field
    /// (used by `TitleFormView` and, transitively, `TextFieldFormView`, including its currency mode).
    ///
    /// Set via `.titleFormViewFocused(_:)` / `.textFieldFormViewFocused(_:)`. The component keeps this
    /// binding in sync with its internal focus state: it writes `true`/`false` as the field gains or
    /// loses focus, and setting it to `false` programmatically resigns the field's first responder.
    /// This lets consumers host their own keyboard toolbar (e.g. a Done button) to dismiss the keyboard —
    /// the number/decimal keyboard used in currency mode has no Return/Done key.
    var textFieldFocusBinding: Binding<Bool>? {
        get { self[TextFieldFocusBindingKey.self] }
        set { self[TextFieldFocusBindingKey.self] = newValue }
    }
}
