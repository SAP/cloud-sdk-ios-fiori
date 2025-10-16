import FioriSwiftUICore
import SwiftUI

struct TextInputExample: View {
    @State var showsCharCount = true
    @State var allowsBeyondLimit = true
    
    @State private var phoneNumber: String = ""
    @State private var price: String = ""
    @State private var numeric: String = ""
    @State private var date: String = ""
    @State private var genericText: String = ""
    @State private var genericText2: String = ""
    
    @State private var valueText: String = ""
        
    // the below ids used to scroll to related items
    private var phoneNumberId = UUID()
    private var priceId = UUID()
    private var numericId = UUID()
    private var dateId = UUID()
    private var genericTextId = UUID()
    private var genericText2Id = UUID()
    private var valueTextId = UUID()
    
    var body: some View {
        ScrollViewReader { _ in
            List {
                Section {
                    TextFieldFormView(title: "Phone Number", text: self.$phoneNumber, formatter: self.phoneNumberFormatter, placeholder: "(123) 456-7890", errorMessage: AttributedString(""), maxTextLength: 13, hintText: AttributedString("(###) ###-####"), isCharCountEnabled: self.showsCharCount, allowsBeyondLimit: self.allowsBeyondLimit, isRequired: false, actionIcon: nil, action: nil)
                        .id(self.phoneNumberId)
                } header: {
                    Text("Phone Number Formatter - Text field form view")
                        .font(.fiori(forTextStyle: .subheadline))
                        .foregroundStyle(Color.preferredColor(.secondaryLabel))
                }
                Section {
                    TextFieldFormView(title: "Price", text: self.$price, formatter: self.priceFormatter, placeholder: "$ 0.00", errorMessage: AttributedString(""), hintText: AttributedString(""), isCharCountEnabled: self.showsCharCount, allowsBeyondLimit: self.allowsBeyondLimit, isRequired: false, actionIcon: nil, action: nil)
                        .id(self.priceId)
                    
                    TextFieldFormView(title: "Number", text: self.$numeric, formatter: self.numberFormatter, placeholder: "1.234lbs", errorMessage: AttributedString(""), hintText: AttributedString(""), isCharCountEnabled: self.showsCharCount, allowsBeyondLimit: self.allowsBeyondLimit, isRequired: false, actionIcon: nil, action: nil)
                        .id(self.numericId)
                } header: {
                    Text("Custom Number Formatter - Text field form view")
                        .font(.fiori(forTextStyle: .subheadline))
                        .foregroundStyle(Color.preferredColor(.secondaryLabel))
                }
                Section {
                    TextFieldFormView(title: "Date", text: self.$date, formatter: self.dateFormatter, placeholder: "AA 2025/01/01", errorMessage: AttributedString(""), maxTextLength: 13, hintText: AttributedString("AA YYYY/MM/DD"), isCharCountEnabled: self.showsCharCount, allowsBeyondLimit: self.allowsBeyondLimit, isRequired: false, actionIcon: nil, action: nil)
                        .id(self.dateId)
                    
                    TextFieldFormView(title: "Generic Text", text: self.$genericText, formatter: self.genericTextFormatter, placeholder: "+AA 123 456# a 2025/01/01 A*", errorMessage: AttributedString(""), maxTextLength: 28, hintText: AttributedString("+AA NNN NNNS X YYYY/MM/DD A*"), isCharCountEnabled: self.showsCharCount, allowsBeyondLimit: self.allowsBeyondLimit, isRequired: false, actionIcon: nil, action: nil)
                        .id(self.genericTextId)
                    
                    TextFieldFormView(title: "Generic Text2", text: self.$genericText2, formatter: self.genericText2Formatter, placeholder: "123+A* 456 789 A*", errorMessage: AttributedString(""), maxTextLength: 18, hintText: AttributedString("NNN+A* NNN NNN A*"), isCharCountEnabled: self.showsCharCount, allowsBeyondLimit: self.allowsBeyondLimit, isRequired: false, actionIcon: nil, action: nil)
                        .id(self.genericText2Id)
                    
                } header: {
                    Text("Generic Text Formatter - Text field form view")
                        .font(.fiori(forTextStyle: .subheadline))
                        .foregroundStyle(Color.preferredColor(.secondaryLabel))
                }
                Section {
                    TitleFormView(text: self.$valueText, formatter: self.genericTextFormatter, placeholder: "+AA 123 456# a 2025/01/01 A*", hintText: AttributedString("+AA NNN NNNS X YYYY/MM/DD A*"), isCharCountEnabled: self.showsCharCount, allowsBeyondLimit: self.allowsBeyondLimit)
                        .padding(.leading, -4)
                        .padding(.trailing, -4)
                        .id(self.valueTextId)
                } header: {
                    Text("Generic Text Formatter - Title form view")
                        .font(.fiori(forTextStyle: .subheadline))
                        .foregroundStyle(Color.preferredColor(.secondaryLabel))
                }
                .listRowSeparator(.hidden, edges: .bottom)
                .environment(\.defaultMinListRowHeight, 0)
                .environment(\.defaultMinListHeaderHeight, 0)
            }
        }
    }
    
    var phoneNumberFormatter: PhoneNumberFormatter {
        let formatter = PhoneNumberFormatter()
        return formatter
    }
    
    var priceFormatter: CustomNumberFormatter {
        let formatter = CustomNumberFormatter()
        formatter.numberStyle = .currency
        return formatter
    }
    
    var numberFormatter: CustomNumberFormatter {
        let formatter = CustomNumberFormatter()
        formatter.numberStyle = .decimal
        formatter.maximumFractionDigits = 3
        formatter.positiveSuffix = "lbs"
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
