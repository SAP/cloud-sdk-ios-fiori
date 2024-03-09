import FioriSwiftUICore
import SwiftUI

struct KeyValueFormViewExample: View {
    var key1: AttributedString {
        var aString = AttributedString("Key 1")
        return aString
    }

    @State var valueText1: String = "1234567890 12345678"

    var key2: AttributedString {
        var aString = AttributedString("Key 2")
        return aString
    }

    @State var valueText2: String = "This is a test"

    var key3: AttributedString {
        var aString = AttributedString("Key 3")
        return aString
    }

    @State var valueText3: String = ""
    let minHeight: CGFloat = 50
    let maxHeight: CGFloat = 200

    @State var disabledText = "This is Disabled text."
    @State var readOnlyText = "This is Read-Only text."

    let errorMessage = AttributedString("Error Message")
    let hintText = AttributedString("Hint Text")
    
    @State var showsHintText = false
    @State var showsErrorMessage = false
    @State var showsCharCount = false
    @State var allowsBeyondLimit = false

    var body: some View {
        VStack {
            Text("KeyValueFormViewExample")
            List {
                Toggle("Shows Hint Text", isOn: $showsHintText)
                    .padding(.leading, 16)
                    .padding(.trailing, 16)
                Toggle("Shows Error Message", isOn: $showsErrorMessage)
                    .padding(.leading, 16)
                    .padding(.trailing, 16)
                Toggle("Shows Char Count", isOn: $showsCharCount)
                    .padding(.leading, 16)
                    .padding(.trailing, 16)
                Toggle("Allows Beyond Limit", isOn: $allowsBeyondLimit)
                    .padding(.leading, 16)
                    .padding(.trailing, 16)
                
                Text("Default KeyValueFormView")
                KeyValueFormView(title: key1, text: $valueText1, placeholder: "KeyValueFormView", errorMessage: getErrorMessage(), maxTextLength: getMaxTextLength(), hintText: getHintText(), isCharCountEnabled: showsCharCount, allowsBeyondLimit: allowsBeyondLimit)

                Text("Existing Text")
                    .italic()
                KeyValueFormView(title: key2, text: $valueText2, placeholder: "KeyValueFormView", errorMessage: getErrorMessage(), maxTextLength: getMaxTextLength(), hintText: getHintText(), isCharCountEnabled: showsCharCount)

                Text("minHeight 50, maxHeight 200")
                    .italic()
                KeyValueFormView(title: key3, text: $valueText3, placeholder: "Please enter something", errorMessage: getErrorMessage(), minTextEditorHeight: 50, maxTextEditorHeight: 200, hintText: getHintText())

                Text("Disabled")
                KeyValueFormView(title: "Disabled", text: $disabledText, placeholder: "Disabled", controlState: .disabled, minTextEditorHeight: 50, maxTextEditorHeight: 200)
                
                Text("Read-Only")
                KeyValueFormView(title: "Read-Only", text: $readOnlyText, placeholder: "Read-Only", controlState: .readOnly, minTextEditorHeight: 50, maxTextLength: 200)
            }
            .scrollDismissesKeyboard(.immediately)
        }
    }

    func getHintText() -> AttributedString? {
        self.showsHintText ? self.hintText : nil
    }

    func getErrorMessage() -> AttributedString? {
        self.showsErrorMessage ? self.errorMessage : nil
    }

    func getMaxTextLength() -> Int? {
        self.showsCharCount ? 20 : nil
    }

    func getCharCountEnabled() -> Bool? {
        self.showsCharCount ? true : nil
    }
}

// #Preview {
//    KeyValueFormViewExample()
// }
