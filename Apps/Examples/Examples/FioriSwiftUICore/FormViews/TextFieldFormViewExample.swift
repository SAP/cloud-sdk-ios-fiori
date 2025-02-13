import FioriSwiftUICore
import SwiftUI

struct TextFieldFormViewExample: View {
//    var key1: AttributedString {
//        let aString = AttributedString("Key 1")
//        return aString
//    }
    var key1: AttributedString {
        let aString = AttributedString("Long Key 1 Long Key 1 Long Key 1 Long Key 1 Long Key 1 Long Key 1 Long Key 1 Long Key 1 Long Key 1 Long Key 1 ")
        return aString
    }

    @State var valueText1: String = "This is default text for one line"

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
    @State var isRequired = false

    @State var text = ""

    var body: some View {
        VStack {
            Text("TextFieldFormViewExample")
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
                Toggle("Mandatory Field", isOn: self.$isRequired)
                    .padding(.leading, 16)
                    .padding(.trailing, 16)
                Button("Dismiss Keyboard") {
                    hideKeyboard()
                }
                .padding(.leading, 16)
                .padding(.trailing, 16)

                Text("Default TextFieldForm")
                    .italic()
                TextFieldFormView(title: self.key1, text: self.$valueText1, placeholder: "TextFieldFormView", errorMessage: self.getErrorMessage(), maxTextLength: self.getMaxTextLength(), hintText: self.getHintText(), isCharCountEnabled: self.showsCharCount, allowsBeyondLimit: self.allowsBeyondLimit, isRequired: self.isRequired, actionIcon: self.getActionIcon(), action: self.getAction1(), actionIconAccessibilityLabel: self.getActionIconAccessibilityLabel())

                Text("Existing Text")
                    .italic()
                TextFieldFormView(title: self.key2, text: self.$valueText2, placeholder: "TextFieldFormView", errorMessage: self.getErrorMessage(), maxTextLength: self.getMaxTextLength(), hintText: self.getHintText(), isCharCountEnabled: self.showsCharCount, allowsBeyondLimit: self.allowsBeyondLimit, isRequired: self.isRequired, actionIcon: self.getActionIcon(), action: self.getAction2(), actionIconAccessibilityLabel: self.getActionIconAccessibilityLabel())

                Text("Empty Text")
                    .italic()
                TextFieldFormView(title: self.key3, text: self.$valueText3, placeholder: "Please enter something", errorMessage: self.getErrorMessage(), maxTextLength: self.getMaxTextLength(), hintText: self.getHintText(), isCharCountEnabled: self.showsCharCount, allowsBeyondLimit: self.allowsBeyondLimit, isRequired: self.isRequired, actionIcon: self.getActionIcon(), action: self.getAction3(), actionIconAccessibilityLabel: self.getActionIconAccessibilityLabel())

                Text("Disabled")
                TextFieldFormView(title: "Disabled Cell", text: self.$disabledText, placeholder: "Disabled", controlState: .disabled, isRequired: self.isRequired, actionIcon: self.getActionIcon(), action: self.getAction4())

                Text("Read-Only")
                TextFieldFormView(title: "Read-Only Cell", text: self.$readOnlyText, placeholder: "Read-Only", controlState: .readOnly, hidesReadOnlyHint: self.hidesReadonlyHint, isRequired: self.isRequired, actionIcon: self.getActionIcon(), action: self.getAction4())
            }
            #if !os(visionOS)
            .scrollDismissesKeyboard(.immediately)
            #endif
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

    func getActionIconAccessibilityLabel() -> String? {
        self.showsAction ? "barcode" : nil
    }

    func getAction1() -> (() -> Void)? {
        self.showsAction ? self.myAction1 : nil
    }

    func myAction1() {
        print("*** action1 button tapped ***")
        self.valueText1 = "action1 button tapped"
    }

    func getAction2() -> (() -> Void)? {
        self.showsAction ? self.myAction2 : nil
    }

    func myAction2() {
        print("*** action2 button tapped ***")
        self.valueText2 = "action2 button tapped"
    }

    func getAction3() -> (() -> Void)? {
        self.showsAction ? self.myAction3 : nil
    }

    func myAction3() {
        print("*** action3 button tapped ***")
        self.valueText3 = "action3 button tapped"
    }

    func getAction4() -> (() -> Void)? {
        self.showsAction ? self.myAction3 : nil
    }

    func myAction4() {
        print("*** action4 button tapped ***")
        self.valueText3 = "action4 button tapped"
    }
}

#Preview {
    TextFieldFormViewExample()
}
