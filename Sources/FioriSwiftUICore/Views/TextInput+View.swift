/// - Important: to make `@Environment` properties (e.g. `horizontalSizeClass`), internally accessible
/// to extensions, add as sourcery annotation in `FioriSwiftUICore/Models/ModelDefinitions.swift`
/// to declare a wrapped property
/// e.g.:  `// sourcery: add_env_props = ["horizontalSizeClass"]`

import SwiftUI

extension Fiori {
    enum TextInput {
        typealias TextFilled = EmptyModifier
        static let textFilled = TextFilled()
    }
}

extension TextInput: View {
    public var body: some View {
        TextField(self._textFilled!, text: $textInputValue.userInputValue)
            .modifier(TextFieldClearButton(textValue: $textInputValue.userInputValue))
    }
}

struct TextFieldClearButton: ViewModifier {
    @Binding var textValue: String
    func body(content: Content) -> some View {
        HStack {
            content
            if !textValue.isEmpty {
                Button(
                    action: { self.textValue = "" },
                    label: {
                        Image(systemName: "xmark.circle.fill")
                            .foregroundColor(Color(UIColor.black))
                    }
                )
            }
            Spacer()
        }
    }
}

class UserInput: ObservableObject {
    @Published var userInputValue: String = ""
}
