import FioriSwiftUICore
import SwiftUI

struct TextFieldFormViewExample: View {
    var key1: AttributedString {
        let aString = AttributedString("Key 1")
        return aString
    }

    @State var valueText1: String = "1234567890 12345678"

    var key2: AttributedString {
        let aString = AttributedString("Key 2")
        return aString
    }

    @State var valueText2: String = "This is a test"

    var key3: AttributedString {
        let aString = AttributedString("Key 3")
        return aString
    }

    @State var valueText3: String = ""

    @State var disabledText = "This is Disabled text."
    @State var readOnlyText = "This is Read-Only text."

    let errorMessage = AttributedString("Error Message")
    let hintText = AttributedString("Hint Text")

    @State var showsHintText = false
    @State var showsErrorMessage = false
    @State var showsCharCount = false
    @State var allowsBeyondLimit = false
    @State var hidesReadonlyHint = false
    @State var showsAction = false

    @State var text = ""

    var body: some View {
        VStack {
            Text("TitleFormViewExample")
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
                Toggle("Shows Action", isOn: self.$showsAction)
                    .padding(.leading, 16)
                    .padding(.trailing, 16)

                Text("Default TitleForm")
                TextFieldFormView(title: self.key1, text: self.$valueText1, placeholder: "TextFieldFormView", errorMessage: self.getErrorMessage(), maxTextLength: self.getMaxTextLength(), hintText: self.getHintText(), isCharCountEnabled: self.showsCharCount, allowsBeyondLimit: self.allowsBeyondLimit, actionIcon: self.getActionIcon(), action: self.getAction())

                Text("Existing Text")
                    .italic()
                TextFieldFormView(title: self.key2, text: self.$valueText2, placeholder: "TextFieldFormView", errorMessage: self.getErrorMessage(), maxTextLength: self.getMaxTextLength(), hintText: self.getHintText(), isCharCountEnabled: self.showsCharCount, allowsBeyondLimit: self.allowsBeyondLimit, actionIcon: self.getActionIcon(), action: self.getAction())

                Text("Empty Text")
                    .italic()
                TextFieldFormView(title: self.key3, text: self.$valueText3, placeholder: "Please enter something", errorMessage: self.getErrorMessage(), maxTextLength: self.getMaxTextLength(), hintText: self.getHintText(), isCharCountEnabled: self.showsCharCount, allowsBeyondLimit: self.allowsBeyondLimit, actionIcon: self.getActionIcon(), action: self.getAction())

                Text("Disabled")
                TextFieldFormView(title: "Disabled Cell", text: self.$disabledText, placeholder: "Disabled", controlState: .disabled, actionIcon: self.getActionIcon(), action: self.getAction())

                Text("Read-Only")
                TextFieldFormView(title: "Read-Only Cell", text: self.$readOnlyText, placeholder: "Read-Only", controlState: .readOnly, hidesReadOnlyHint: self.hidesReadonlyHint, actionIcon: self.getActionIcon(), action: self.getAction())
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

    func getActionIcon() -> Image? {
        self.showsAction ? Image(systemName: "barcode") : nil
    }

    func getAction() -> (() -> Void)? {
        self.showsAction ? self.myAction : nil
    }

    func myAction() {
        print("*** action button is tapped ***")
    }
}

#Preview {
    TextFieldFormViewExample()
}
