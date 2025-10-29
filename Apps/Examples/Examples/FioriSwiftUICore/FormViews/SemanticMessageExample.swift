import FioriSwiftUICore
import FioriThemeManager
import SwiftUI

struct SemanticMessageExample: View {
    let errorMessage = AttributedString("Error Message")
    let hintText = AttributedString("Hint Text")
    @State var showsHintText = false
    @State var showsErrorMessage = false
    @State var showsCharCount = false
    @State var allowsBeyondLimit = false
    @State var showAINotice: Bool = false
    @State var isLoading: Bool = false
    @State var valueText: String = ""
    @State var longHelperText: Bool = false
    @State var longAINoticeText: Bool = false
    @State var semanticIndex: Int = 0
    let styleNames = ["Error", "Success", "Informational", "Warning"]
    var body: some View {
        VStack {
            List {
                Toggle("Shows Hint Text", isOn: self.$showsHintText)

                Toggle("Shows Error Message", isOn: self.$showsErrorMessage)

                Picker("Semantic Style", selection: self.$semanticIndex) {
                    ForEach(0 ..< self.styleNames.count, id: \.self) { index in
                        Text(self.styleNames[index])
                    }
                }
                Toggle("Shows Char Count", isOn: self.$showsCharCount)
                    
                Toggle("Allows Beyond Limit", isOn: self.$allowsBeyondLimit)
                    
                Toggle("AI Notice", isOn: self.$showAINotice)
                    
                Toggle("longAINoticeText", isOn: self.$longAINoticeText)
                    
                Toggle("longHelperText", isOn: self.$longHelperText)
                    
                Button("Dismiss Keyboard") {
                    hideKeyboard()
                }

                Text("TextFieldFormView")
                TextFieldFormView(title: "Label", text: self.$valueText, isSecureEnabled: false, placeholder: "Placeholder", errorMessage: self.getErrorMessage(), maxTextLength: self.getMaxTextLength(), hintText: self.getHintText(), isCharCountEnabled: self.showsCharCount, allowsBeyondLimit: self.allowsBeyondLimit, isAINoticeEnabled: self.showAINotice, isRequired: true)
                    .ifApply(self.showsErrorMessage) { v in
                        v.ifApply(self.semanticIndex == 0) { vs in
                            vs.textInputInfoViewStyle(.error)
                        }.ifApply(self.semanticIndex == 1) { vs in
                            vs.textInputInfoViewStyle(.success)
                        }.ifApply(self.semanticIndex == 2) { vs in
                            vs.textInputInfoViewStyle(.informational)
                        }.ifApply(self.semanticIndex == 3) { vs in
                            vs.textInputInfoViewStyle(.warning)
                        }
                    }
                    .aiNotice(self.$showAINotice, description: self.getNoticeText())
                
                Text("KeyValueFormView")
                KeyValueFormView(title: "Label", text: self.$valueText, placeholder: "Placeholder", errorMessage: self.getErrorMessage(), maxTextLength: self.getMaxTextLength(), hintText: self.getHintText(), isCharCountEnabled: self.showsCharCount, allowsBeyondLimit: self.allowsBeyondLimit, charCountBeyondLimitMsg: "reduce the number of characters", isAINoticeEnabled: self.showAINotice, isRequired: true)
                    .ifApply(self.showsErrorMessage) { v in
                        v.ifApply(self.semanticIndex == 0) { vs in
                            vs.textInputInfoViewStyle(.error)
                        }.ifApply(self.semanticIndex == 1) { vs in
                            vs.textInputInfoViewStyle(.success)
                        }.ifApply(self.semanticIndex == 2) { vs in
                            vs.textInputInfoViewStyle(.informational)
                        }.ifApply(self.semanticIndex == 3) { vs in
                            vs.textInputInfoViewStyle(.warning)
                        }
                    }
                    .aiNotice(self.$showAINotice, description: self.getNoticeText())
                
                Text("NoteFormView")
                NoteFormView(text: self.$valueText, placeholder: "Placeholder", errorMessage: self.getErrorMessage(), maxTextLength: self.getMaxTextLength(), hintText: self.getHintText(), isCharCountEnabled: self.showsCharCount, allowsBeyondLimit: self.allowsBeyondLimit, isAINoticeEnabled: self.showAINotice)
                    .ifApply(self.showsErrorMessage) { v in
                        v.ifApply(self.semanticIndex == 0) { vs in
                            vs.textInputInfoViewStyle(.error)
                        }.ifApply(self.semanticIndex == 1) { vs in
                            vs.textInputInfoViewStyle(.success)
                        }.ifApply(self.semanticIndex == 2) { vs in
                            vs.textInputInfoViewStyle(.informational)
                        }.ifApply(self.semanticIndex == 3) { vs in
                            vs.textInputInfoViewStyle(.warning)
                        }
                    }
                    .aiNotice(self.$showAINotice, description: self.getNoticeText())
            }
        }
    }
    
    func getNoticeText() -> AttributedString? {
        (self.longAINoticeText && self.showAINotice) ? "Created with AI long description lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod." : "Created With AI"
    }
    
    func getHintText() -> AttributedString? {
        self.showsHintText ? self.longHelperText ? "Helper text long description lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod." : self.hintText : nil
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
