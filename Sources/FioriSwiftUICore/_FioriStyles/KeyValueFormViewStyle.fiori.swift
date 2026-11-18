import FioriThemeManager
import Foundation
import SwiftUI

/// The base layout style for `KeyValueFormView`.
public struct KeyValueFormViewBaseStyle: KeyValueFormViewStyle {
    @Environment(\.isLoading) var isLoading
    @Environment(\.isAccessibilityCombined) var isAccessibilityCombined
    public func makeBody(_ configuration: KeyValueFormViewConfiguration) -> some View {
        SkeletonLoadingContainer {
            VStack(alignment: .leading) {
                self.getTitle(configuration)
                configuration._noteFormView
            }
            .ifApply(self.isAccessibilityCombined, content: {
                $0.accessibilityElement(children: .combine)
            })
        }
    }
    
    func getTitle(_ configuration: KeyValueFormViewConfiguration) -> some View {
        if self.isLoading {
            return Text("KeyValueFormView title").typeErased
        } else {
            return configuration.title.typeErased
        }
    }
}
    
// Default fiori styles
extension KeyValueFormViewFioriStyle {
    struct ContentFioriStyle: KeyValueFormViewStyle {
        @FocusState var isFocused: Bool
        func makeBody(_ configuration: KeyValueFormViewConfiguration) -> some View {
            KeyValueFormView(configuration)
                .titleStyle { titleConf in
                    Title(titleConf)
                        .foregroundStyle(self.getTitleColor(configuration))
                        .font(.fiori(forTextStyle: .subheadline, weight: .semibold))
                }
                .focused(self.$isFocused)
        }

        private func getTitleColor(_ configuration: KeyValueFormViewConfiguration) -> Color {
            TextInputFormViewConfiguration(configuration, isFocused: self.isFocused).getTitleColor()
        }

        private func getMandatoryIndicatorColor(_ configuration: KeyValueFormViewConfiguration) -> Color {
            TextInputFormViewConfiguration(configuration, isFocused: false).getTitleColor()
        }
    }

    struct TitleFioriStyle: TitleStyle {
        let keyValueFormViewConfiguration: KeyValueFormViewConfiguration

        func makeBody(_ configuration: TitleConfiguration) -> some View {
            Title(configuration)
                .foregroundStyle(self.getTitleColor(self.keyValueFormViewConfiguration))
                .font(.fiori(forTextStyle: .subheadline, weight: .semibold))
                .padding(.bottom, -4)
                .padding(.top, 11)
        }
        
        private func getTitleColor(_ configuration: KeyValueFormViewConfiguration) -> Color {
            TextInputFormViewConfiguration(configuration, isFocused: false).getTitleColor()
        }
        
        private func isDisabled(_ configuration: KeyValueFormViewConfiguration) -> Bool {
            configuration.controlState == .disabled
        }

        private func isErrorStyle(_ configuration: KeyValueFormViewConfiguration) -> Bool {
            TextInputFormViewConfiguration(configuration, isFocused: false).isErrorStyle()
        }
    }

    struct TextViewFioriStyle: TextViewStyle {
        let keyValueFormViewConfiguration: KeyValueFormViewConfiguration
        
        func makeBody(_ configuration: TextViewConfiguration) -> some View {
            TextView(configuration)
        }
    }

    struct PlaceholderFioriStyle: PlaceholderStyle {
        let keyValueFormViewConfiguration: KeyValueFormViewConfiguration
        
        func makeBody(_ configuration: PlaceholderConfiguration) -> some View {
            Placeholder(configuration)
        }
    }

    struct NoteFormViewFioriStyle: NoteFormViewStyle {
        let keyValueFormViewConfiguration: KeyValueFormViewConfiguration

        func makeBody(_ configuration: NoteFormViewConfiguration) -> some View {
            NoteFormView(configuration)
        }
    }
}

// MARK: - KeyValueFormView Focus

public extension View {
    /// Binds the focus state of a `KeyValueFormView`'s text editor to an external binding.
    ///
    /// `KeyValueFormView` embeds a multi-line text editor whose Return key inserts a newline rather
    /// than dismissing the keyboard, so there is no built-in way to resign first responder. Pass a
    /// `@State var` binding here to:
    /// - observe when the editor becomes/resigns first responder (the binding is written `true`/`false`), and
    /// - dismiss the keyboard programmatically by setting the binding to `false`.
    ///
    /// This lets you host your own keyboard toolbar with a Done button:
    /// ```swift
    /// @State private var isEditing = false
    ///
    /// KeyValueFormView(title: "Notes", text: $text, placeholder: "Enter text")
    ///     .keyValueFormViewFocused($isEditing)
    ///     .toolbar {
    ///         ToolbarItemGroup(placement: .keyboard) {
    ///             if isEditing {
    ///                 Button { isEditing = false } label: { Text("Done") }
    ///                 Spacer()
    ///             }
    ///         }
    ///     }
    /// ```
    /// - Parameter binding: A binding kept in sync with the editor's focus state.
    func keyValueFormViewFocused(_ binding: Binding<Bool>) -> some View {
        environment(\.textEditorFocusBinding, binding)
    }
}
