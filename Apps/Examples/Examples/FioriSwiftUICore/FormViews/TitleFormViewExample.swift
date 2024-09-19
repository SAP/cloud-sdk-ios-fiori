import FioriSwiftUICore
import SwiftUI

struct TitleFormViewExample: View {
    @State var valueText1: String = "1234567890 12345678"
    
    @State var valueText2: String = "This is a test"
    
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
    
    @State var text = ""
    
    var body: some View {
        VStack {
            Text("TitleFormViewExample")
            Form {
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
                
                Text("Default TitleForm")
                TitleFormView(text: self.$valueText1, placeholder: "TitleFormView", errorMessage: self.getErrorMessage(), maxTextLength: self.getMaxTextLength(), hintText: self.getHintText(), isCharCountEnabled: self.showsCharCount, allowsBeyondLimit: self.allowsBeyondLimit)
                    .padding(.leading, -4)
                    .padding(.trailing, -4)

                Text("Existing Text")
                    .italic()
                TitleFormView(text: self.$valueText2, placeholder: "TitleFormView", errorMessage: self.getErrorMessage(), maxTextLength: self.getMaxTextLength(), hintText: self.getHintText(), isCharCountEnabled: self.showsCharCount, allowsBeyondLimit: self.allowsBeyondLimit)
                    .padding(.leading, -4)
                    .padding(.trailing, -4)

                Text("Empty Text")
                    .italic()
                TitleFormView(text: self.$valueText3, placeholder: "Please enter something", errorMessage: self.getErrorMessage(), maxTextLength: self.getMaxTextLength(), hintText: self.getHintText(), isCharCountEnabled: self.showsCharCount, allowsBeyondLimit: self.allowsBeyondLimit)
                    .padding(.leading, -4)
                    .padding(.trailing, -4)

                Text("Disabled")
                TitleFormView(text: self.$disabledText, placeholder: "Disabled", controlState: .disabled)
                    .padding(.leading, -4)
                    .padding(.trailing, -4)

                Text("Read-Only")
                TitleFormView(text: self.$readOnlyText, placeholder: "Read-Only", controlState: .readOnly, hidesReadOnlyHint: self.hidesReadonlyHint)
                    .padding(.leading, -4)
                    .padding(.trailing, -4)
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
}

// #Preview {
//    TitleFormViewExample()
// }
