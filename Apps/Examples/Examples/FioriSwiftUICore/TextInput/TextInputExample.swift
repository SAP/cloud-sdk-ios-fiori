import FioriSwiftUICore
import SwiftUI

struct TextInputExample: View {
    @State var showsCharCount = true
    @State var allowsBeyondLimit = true
    
    @State private var phoneNumber: String = ""
    @State private var date: String = ""
    @State private var numeric: String = ""
    @State private var genericText: String = ""
    @State private var genericText2: String = ""
    
    @State private var valueText: String = ""
        
    // the below ids used to scroll to related items
    private var phoneNumberId = UUID()
    private var dateId = UUID()
    private var numericId = UUID()
    private var genericTextId = UUID()
    private var genericText2Id = UUID()
    private var valueTextId = UUID()
    
    var body: some View {
        ScrollViewReader { _ in
            List {
                Section {
                    TextFieldFormView(title: "Phone Number", text: self.$phoneNumber, formatter: self.phoneNumberFormatter, placeholder: "+12 3456-7890", errorMessage: AttributedString(""), maxTextLength: 13, hintText: AttributedString("+NN NNNN-NNNN"), isCharCountEnabled: self.showsCharCount, allowsBeyondLimit: self.allowsBeyondLimit, isRequired: false, actionIcon: nil, action: nil)
                        .id(self.phoneNumberId)
                    
                    TextFieldFormView(title: "Date", text: self.$date, formatter: self.dateFormatter, placeholder: "AA 2025/01/01", errorMessage: AttributedString(""), maxTextLength: 13, hintText: AttributedString("AA YYYY/MM/DD"), isCharCountEnabled: self.showsCharCount, allowsBeyondLimit: self.allowsBeyondLimit, isRequired: false, actionIcon: nil, action: nil)
                        .id(self.dateId)
                    
                    TextFieldFormView(title: "Numeric", text: self.$numeric, formatter: self.numericFormatter, placeholder: "+A* 123 456 A*", errorMessage: AttributedString(""), maxTextLength: 14, hintText: AttributedString("+A* NNN NNN A*"), isCharCountEnabled: self.showsCharCount, allowsBeyondLimit: self.allowsBeyondLimit, isRequired: false, actionIcon: nil, action: nil)
                        .id(self.numericId)
                    
                    TextFieldFormView(title: "Generic Text", text: self.$genericText, formatter: self.genericTextFormatter, placeholder: "+AA 123 456# a 2025/01/01 A*", errorMessage: AttributedString(""), maxTextLength: 28, hintText: AttributedString("+AA NNN NNNS X YYYY/MM/DD A*"), isCharCountEnabled: self.showsCharCount, allowsBeyondLimit: self.allowsBeyondLimit, isRequired: false, actionIcon: nil, action: nil)
                        .id(self.genericTextId)
                    
                    TextFieldFormView(title: "Generic Text2", text: self.$genericText2, formatter: self.genericText2Formatter, placeholder: "123+A* 456 789 A*", errorMessage: AttributedString(""), maxTextLength: 18, hintText: AttributedString("NNN+A* NNN NNN A*"), isCharCountEnabled: self.showsCharCount, allowsBeyondLimit: self.allowsBeyondLimit, isRequired: false, actionIcon: nil, action: nil)
                        .id(self.genericText2Id)
                    
                } header: {
                    Text("Text field form view")
                        .font(.fiori(forTextStyle: .subheadline))
                        .foregroundStyle(Color.preferredColor(.secondaryLabel))
                }
                Section {
                    TitleFormView(text: self.$valueText, formatter: self.genericTextFormatter, placeholder: "+AA 123 456# a 2025/01/01 A*", hintText: AttributedString("+AA NNN NNNS X YYYY/MM/DD A*"), isCharCountEnabled: self.showsCharCount, allowsBeyondLimit: self.allowsBeyondLimit)
                        .padding(.leading, -4)
                        .padding(.trailing, -4)
                        .id(self.valueTextId)
                } header: {
                    Text("Title form view")
                        .font(.fiori(forTextStyle: .subheadline))
                        .foregroundStyle(Color.preferredColor(.secondaryLabel))
                }
                .listRowSeparator(.hidden, edges: .bottom)
                .environment(\.defaultMinListRowHeight, 0)
                .environment(\.defaultMinListHeaderHeight, 0)
            }
        }
    }
    
    var phoneNumberFormatter: GenericTextFormatter {
        let formatter = GenericTextFormatter()
        formatter.format = "+NN NNNN-NNNN"
        return formatter
    }
    
    var dateFormatter: GenericTextFormatter {
        let formatter = GenericTextFormatter()
        formatter.format = "AA YYYY/MM/DD"
        formatter.yearMinium = 1000
        formatter.yearMaximum = 3000
        return formatter
    }
    
    var numericFormatter: GenericTextFormatter {
        let formatter = GenericTextFormatter()
        formatter.format = "+\\A\\* NNN NNN \\A\\*"
        return formatter
    }
    
    var genericTextFormatter: GenericTextFormatter {
        let formatter = GenericTextFormatter()
        formatter.format = "+AA NNN NNNS X YYYY/MM/DD \\A\\*"
        return formatter
    }
    
    var genericText2Formatter: GenericTextFormatter {
        let formatter = GenericTextFormatter()
        formatter.format = "NNN+\\A\\* NNN NNN \\A\\*"
        return formatter
    }
}
