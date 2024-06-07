import FioriSwiftUICore
import SwiftUI

struct KeyValueFormViewExample: View {
    var key1: AttributedString {
        var aString = AttributedString("Key 1")
        return aString
    }

    var key1Long: AttributedString {
        var aString = AttributedString("Long Key 1 Long Key 1 Long Key 1 Long Key 1 Long Key 1 Long Key 1 Long Key 1 Long Key 1 Long Key 1 Long Key 1 ")
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
    @State var hidesReadonlyHint = false
    @State var isRequired = false
    
    var body: some View {
        VStack {
            Text("KeyValueFormViewExample")
            List {
                Toggle("Shows Hint Text", isOn: self.$showsHintText)
                    .padding(.leading, 16)
                    .padding(.trailing, 16)
                Toggle("Shows Error Message", isOn: self.$showsErrorMessage)
                    .padding(.leading, 16)
                    .padding(.trailing, 16)
                Toggle("Shows Char Count", isOn: self.$showsCharCount)
                    .padding(.leading, 16)
                    .padding(.trailing, 16)
                Toggle("Allows Beyond Limit", isOn: self.$allowsBeyondLimit)
                    .padding(.leading, 16)
                    .padding(.trailing, 16)
                Toggle("Hides Read-Only Hint", isOn: self.$hidesReadonlyHint)
                    .padding(.leading, 16)
                    .padding(.trailing, 16)
                Toggle("Mandatory Field", isOn: self.$isRequired)
                    .padding(.leading, 16)
                    .padding(.trailing, 16)

                Text("Default KeyValueFormView")
                KeyValueFormView(title: self.key1, text: self.$valueText1, placeholder: "KeyValueFormView", errorMessage: self.getErrorMessage(), maxTextLength: self.getMaxTextLength(), hintText: self.getHintText(), isCharCountEnabled: self.showsCharCount, allowsBeyondLimit: self.allowsBeyondLimit, isRequired: self.isRequired)

                Text("Existing Text")
                    .italic()
                KeyValueFormView(title: self.key2, text: self.$valueText2, placeholder: "KeyValueFormView", errorMessage: self.getErrorMessage(), maxTextLength: self.getMaxTextLength(), hintText: self.getHintText(), isCharCountEnabled: self.showsCharCount, allowsBeyondLimit: self.allowsBeyondLimit, isRequired: self.isRequired)

                Text("minHeight 50, maxHeight 200")
                    .italic()
                KeyValueFormView(title: self.key3, text: self.$valueText3, placeholder: "Please enter something", errorMessage: self.getErrorMessage(), minTextEditorHeight: 50, maxTextEditorHeight: 200, hintText: self.getHintText(), allowsBeyondLimit: self.allowsBeyondLimit, isRequired: self.isRequired)

                Text("Disabled")
                KeyValueFormView(title: "Disabled", text: self.$disabledText, placeholder: "Disabled", controlState: .disabled, minTextEditorHeight: 50, maxTextEditorHeight: 200)

                Text("Read-Only")
                KeyValueFormView(title: "Read-Only", text: self.$readOnlyText, placeholder: "Read-Only", controlState: .readOnly, minTextEditorHeight: 50, maxTextLength: 200, hidesReadOnlyHint: self.hidesReadonlyHint)
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
