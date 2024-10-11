import FioriSwiftUICore
import SwiftUI

struct ToolbarExample: View {
    @State var isPresented: Bool = false
    @State var isPresented2: Bool = false
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
                Text("Select to Test")
                Spacer()
            }
            .contentShape(Rectangle())
            .onTapGesture {
                self.isPresented.toggle()
            }
            .sheet(isPresented: self.$isPresented) {
                NavigationStack {
                    ToolbarView(numberOfButtons: self.$numberOfButtons, useFioriToolbar: self.$useFioriToolbar, helperText: self.$helperText, customHelperText: self.$customHelperText, moreActionOverflowIcon: self.$customOverflowIcon, primaryButtonText: self.$primaryButton, secondaryButtonText: self.$secondaryButton, thirdButtonText: self.$thirdButton, buttonType: self.$buttonType)
                }
            }
            
            Picker("Number of Buttons", selection: self.$numberOfButtons) {
                ForEach(0 ..< 8, id: \.self) { index in
                    Text("\(index + 1)").tag(index + 1)
                }
            }
                        
            Toggle("Use FioriToolbar", isOn: self.$useFioriToolbar)
            
            Picker("Button Type", selection: self.$buttonType) {
                Text("Fiori Button").tag(ItemStyle.fiori)
                Text("Icon").tag(ItemStyle.icon)
                Text("SiwftUI Button").tag(ItemStyle.button)
            }
            
            Picker("Helper Text", selection: self.$helperText) {
                Text("None").tag("")
                Text("Short").tag("Helper Text")
                Text("Long").tag("Long Long Long Long Long Helper Text")
                Text("Extra Long").tag("Extra Extra Extra Extra Extra Extra Extra Long Long Long Long Long Helper Text")
                Text("Extra Extra Long").tag("Extra Extra Extra Extra Extra Extra Extra Extra Extra Extra Extra Extra Long Long Long Long Long Helper Text")
            }
            
            Group {
                Toggle("Custom Helper Text Color & Font", isOn: self.$customHelperText)
                
                Toggle("Custom Overflow Icon", isOn: self.$customOverflowIcon)
            }
            
            Picker("Primary Button", selection: self.$primaryButton) {
                Text("None").tag("")
                Text("Long Primary Button").tag("Long Long Primary Button Title")
                Text("Extra Long Primary Button").tag("Extra Long Long Long Long Long Long Long Long Long Long Long Long Primary Button Title")
            }
            
            Picker("Secondary Button", selection: self.$secondaryButton) {
                Text("None").tag("")
                Text("Long Secondary Button").tag("Long Secondary Button Title")
                Text("Extra Long Secondary Button").tag("Extra Long Long Long Long Long Long Long LongLong Long Secondary Button Title")
            }
            
            Picker("3rd Button", selection: self.$thirdButton) {
                Text("None").tag("")
                Text("Long 3rd Button").tag("Long Long Long Button Title")
                Text("Extra Long 3rd Button").tag("Extra Long Long Long Long Long Long Long LongLong Long Long Button Title")
            }
            
            Section {
                HStack {
                    Text("Special example that toolbar filled with items")
                    Spacer()
                }
                .contentShape(Rectangle())
                .onTapGesture {
                    self.isPresented2.toggle()
                }
                .sheet(isPresented: self.$isPresented2) {
                    NavigationStack {
                        Color.preferredColor(.grey7)
                            .overlay {
                                Text("This is an example that toolbar filled with expandable buttons")
                            }
                            .fioriToolbar {
                                HStack {
                                    FioriButton { _ in
                                        Text("Save")
                                            .frame(maxWidth: .infinity)
                                    }
                                    FioriButton { _ in
                                        Text("Submit")
                                            .frame(maxWidth: .infinity)
                                    }
                                }
                            }
                    }
                }
            }
        }
    }
}

#Preview {
    NavigationStack {
        ToolbarExample()
    }
}
