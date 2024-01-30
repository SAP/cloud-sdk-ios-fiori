import FioriSwiftUICore
import SwiftUI

struct ToolbarExample: View {
    @State var isPresented: Bool = false
    @State var numberOfButtons: Int = 2
    @State var useFioriToolbar: Bool = true
    @State var helperText: String = ""
    @State var customHelperText: Bool = false
    @State var customOverflowIcon: Bool = false
    @State var primaryButton: String = ""
    @State var secondaryButton: String = ""
    @State var thirdButton: String = ""
    @State var buttonType: ItemStyle = .fiori

    var body: some View {
        Form {
            HStack {
                Text("Selecte to Test")
                Spacer()
            }
            .contentShape(Rectangle())
            .onTapGesture {
                isPresented.toggle()
            }
            .sheet(isPresented: $isPresented) {
                NavigationStack {
                    ToolbarView(numberOfButtons: $numberOfButtons, useFioriToolbar: $useFioriToolbar, helperText: $helperText, customHelperText: $customHelperText, customOverflowIcon: $customOverflowIcon, primaryButtonText: $primaryButton, secondaryButtonText: $secondaryButton, thirdButtonText: $thirdButton, buttonType: $buttonType)
                }
            }
            
            Picker("Number of Buttons", selection: $numberOfButtons) {
                ForEach(0 ..< 8, id: \.self) { index in
                    Text("\(index + 1)").tag(index + 1)
                }
            }
                        
            Toggle("Use FioriToolbar", isOn: $useFioriToolbar)
            
            Picker("Button Type", selection: $buttonType) {
                Text("Fiori Button").tag(ItemStyle.fiori)
                Text("Icon").tag(ItemStyle.icon)
                Text("SiwftUI Button").tag(ItemStyle.button)
            }
            
            Picker("Helper Text", selection: $helperText) {
                Text("None").tag("")
                Text("Short").tag("Helper Text")
                Text("Long").tag("Long Long Long Long Long Helper Text")
                Text("Extra Long").tag("Extra Extra Extra Extra Extra Extra Extra Long Long Long Long Long Helper Text")
                Text("Extra Extra Long").tag("Extra Extra Extra Extra Extra Extra Extra Extra Extra Extra Extra Extra Long Long Long Long Long Helper Text")
            }
            
            Group {
                Toggle("Custom Helper Text Color & Font", isOn: $customHelperText)
                
                Toggle("Custom Overflow Icon", isOn: $customOverflowIcon)
            }
            
            Picker("Primary Button", selection: $primaryButton) {
                Text("None").tag("")
                Text("Long Primary Button").tag("Long Long Primary Button Title")
                Text("Extra Long Primary Button").tag("Extra Long Long Long Long Long Long Long Long Long Long Long Long Primary Button Title")
            }
            
            Picker("Secondary Button", selection: $secondaryButton) {
                Text("None").tag("")
                Text("Long Secondary Button").tag("Long Secondary Button Title")
                Text("Extra Long Secondary Button").tag("Extra Long Long Long Long Long Long Long LongLong Long Secondary Button Title")
            }
            
            Picker("3rd Button", selection: $thirdButton) {
                Text("None").tag("")
                Text("Long 3rd Button").tag("Long Long Long Button Title")
                Text("Extra Long 3rd Button").tag("Extra Long Long Long Long Long Long Long LongLong Long Long Button Title")
            }
        }
    }
}

#Preview {
    NavigationStack {
        ToolbarExample()
    }
}
