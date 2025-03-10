/// - Important: to make `@Environment` properties (e.g. `horizontalSizeClass`), internally accessible
/// to extensions, add as sourcery annotation in `FioriSwiftUICore/Models/ModelDefinitions.swift`
/// to declare a wrapped property
/// e.g.:  `// sourcery: add_env_props = ["horizontalSizeClass"]`

import SwiftUI

extension Fiori {
    enum _TextInput {
        typealias TextInputValue = EmptyModifier
        static let textInputValue = TextInputValue()
    }
}

extension _TextInput: View {
    public var body: some View {
        TextField("Default",
                  text: self._textInputValue,
                  onCommit: self._onCommit ?? {})
            .modifier(TextFieldClearButton(textValue: self._textInputValue))
            .textFieldStyle(BottomTextFieldStyle())
            .font(.fiori(forTextStyle: .body))
            .foregroundColor(.preferredColor(.primaryLabel))
    }
}

struct TextFieldClearButton: ViewModifier {
    @Binding var textValue: String
    func body(content: Content) -> some View {
        HStack {
            content
            if !self.textValue.isEmpty {
                Button(
                    action: { self.textValue = "" },
                    label: {
                        Image(systemName: "xmark.circle.fill")
                            .foregroundColor(.preferredColor(.tintColor))
                    }
                )
            }
            Spacer()
        }
    }
}

@available(iOS 14.0, *)
struct BottomTextFieldStyle: TextFieldStyle {
    let color1 = Color.preferredColor(.primaryLabel).opacity(0)
    let color2 = Color.preferredColor(.primaryLabel).opacity(0.15)
    func _body(configuration: TextField<Self._Label>) -> some View {
        VStack {
            configuration
            Rectangle()
                .fill(LinearGradient(gradient: Gradient(colors: [self.color1, self.color2, self.color1]), startPoint: .leading, endPoint: .topTrailing))
                .frame(height: 1, alignment: .bottom)
        }
    }
}
