import FioriSwiftUICore
import SwiftUI

struct KeyValueFormViewExample: View {
    @State var isPresented: Bool = false
    var key1: AttributedString {
        let aString = AttributedString("Key 1")
        return aString
    }

    var key1Long: AttributedString {
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
    @State var showList = true
    @State var isLoading: Bool = false
    @FocusState private var isFocused: Bool
    
    var body: some View {
        VStack {
            if !self.showList {
                KeyValueFormView(title: "KeyValueFormView", text: self.isLoading ? self.$valueText3 : self.$valueText1, placeholder: "KeyValueFormView", errorMessage: "", hintText: self.getHintText(), isCharCountEnabled: self.showsCharCount, allowsBeyondLimit: self.allowsBeyondLimit, isRequired: self.isRequired)
                    .padding(.horizontal, 10)
            } else {
                Text("KeyValueFormViewExample")
                List {
                    Text("Default KeyValueForm")
                    KeyValueFormView(title: self.key1, text: self.isLoading ? self.$valueText3 : self.$valueText1, placeholder: "KeyValueFormView", errorMessage: self.getErrorMessage(), maxTextLength: self.getMaxTextLength(), hintText: self.getHintText(), isCharCountEnabled: self.showsCharCount, allowsBeyondLimit: self.allowsBeyondLimit, isRequired: self.isRequired)
                    
                    Text("Existing Text")
                        .italic()
                    KeyValueFormView(title: self.key2, text: self.isLoading ? self.$valueText3 : self.$valueText2, placeholder: "KeyValueFormView", errorMessage: self.getErrorMessage(), maxTextLength: self.getMaxTextLength(), hintText: self.getHintText(), isCharCountEnabled: self.showsCharCount, allowsBeyondLimit: self.allowsBeyondLimit, isRequired: self.isRequired)
                    
                    Text("minHeight 50, maxHeight 200")
                        .italic()
                    KeyValueFormView(title: self.key3, text: self.$valueText3, placeholder: "Please enter something", errorMessage: self.getErrorMessage(), minTextEditorHeight: 50, maxTextEditorHeight: 200, hintText: self.getHintText(), allowsBeyondLimit: self.allowsBeyondLimit, isRequired: self.isRequired)
                    
                    Text("Disabled")
                    KeyValueFormView(title: "Disabled", text: self.isLoading ? self.$valueText3 : self.$disabledText, placeholder: "Disabled", controlState: .disabled, minTextEditorHeight: 50, maxTextEditorHeight: 200, isRequired: self.isRequired)
                    
                    Text("Read-Only")
                    KeyValueFormView(title: "Read-Only", text: self.isLoading ? self.$valueText3 : self.$readOnlyText, placeholder: "Read-Only", controlState: .readOnly, minTextEditorHeight: 50, maxTextLength: 200, hidesReadOnlyHint: self.hidesReadonlyHint, isRequired: self.isRequired)
                    
                    Text("Customized Border")
                        .italic()
                    KeyValueFormView(title: self.key2, text: self.isLoading ? self.$valueText3 : self.$valueText2, placeholder: "KeyValueFormView", errorMessage: self.getErrorMessage(), maxTextLength: self.getMaxTextLength(), hintText: self.getHintText(), isCharCountEnabled: self.showsCharCount, allowsBeyondLimit: self.allowsBeyondLimit, isRequired: self.isRequired)
                        .focused(self.$isFocused)
                        .tint(.purple)
                        .environment(\.isCustomizedBorder, true)
                        .placeholderTextEditorStyle { config in
                            PlaceholderTextEditor(config)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 8)
                                        .stroke(self.isFocused ? .purple : .green, lineWidth: self.isFocused ? 3 : 1)
                                )
                        }
                    
                    Text("Skeleton Loading")
                    KeyValueFormView(title: "", text: self.$valueText3, placeholder: "Skeleton Loading")
                }
                #if !os(visionOS)
                .scrollDismissesKeyboard(.immediately)
                #endif
            }
        }
        .environment(\.isLoading, self.isLoading)
        .sheet(isPresented: self.$isPresented, content: {
            VStack {
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
                Toggle("Show on List", isOn: self.$showList)
                    .padding(.leading, 16)
                    .padding(.trailing, 16)
                Toggle("Show SkeletonLoading", isOn: self.$isLoading)
                    .padding(.leading, 16)
                    .padding(.trailing, 16)
                Button("Dismiss Keyboard") {
                    hideKeyboard()
                }
            }
            .padding()
            .presentationDetents([.medium])
        })
        .toolbar(content: {
            FioriButton(title: "Options") { _ in
                self.isPresented = true
            }
        })
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

#if canImport(UIKit)
    extension View {
        func hideKeyboard() {
            UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
        }
    }
#endif

// #Preview {
//    KeyValueFormViewExample()
// }
