import FioriSwiftUICore
import FioriThemeManager
import SwiftUI

/// Currency input example view
struct CurrencyInputExampleView: View {
    @State private var usdAmount: String = ""
    @State private var eurAmount: String = ""
    @State private var jpyAmount: String = ""
    @State private var hufAmount: String = ""
    @State private var cnyAmount: String = ""
    @State private var deEurAmount: String = ""
    @State private var inrAmount: String = ""
    var localCode: String {
        "Price(\(Locale.current.currency?.identifier ?? ""))"
    }

    var body: some View {
        List {
            VStack(spacing: 24) {
                Text("Currency Input Examples")
                    .font(.title)
                    .padding(.top, 20)
                
                VStack(alignment: .leading, spacing: 8) {
                    Text("Different Currency Codes and Formats")
                        .font(.headline)
                    
                    // USD input - US Dollar example
                    TextFieldFormView(
                        title: "price(USD)",
                        text: self.$usdAmount,
                        placeholder: "Enter amount",
                        isRequired: true
                    )
                    .currencyField(formatter: NumberFormatter(localeIdentifier: "en_US", maxFractionDigits: 2))
                    
                    TextFieldFormView(
                        title: AttributedString(self.localCode),
                        text: self.$eurAmount,
                        placeholder: "0.00",
                        errorMessage: "Please enter a valid amount"
                    )
                    .currencyField()
                    
                    // EUR input - Euro example (German locale)
                    TextFieldFormView(
                        title: "Price(EUR)",
                        text: self.$deEurAmount,
                        placeholder: "Enter amount",
                        maxTextLength: 15
                    )
                    .currencyField(formatter: NumberFormatter(localeIdentifier: "de_DE", maxFractionDigits: 2))
                    
                    // JPY input - Japanese Yen (no decimal places)
                    TextFieldFormView(
                        title: "Price(JPY)",
                        text: self.$jpyAmount,
                        placeholder: "Enter amount"
                    )
                    .currencyField(formatter: NumberFormatter(localeIdentifier: "ja_JP", maxFractionDigits: 0))
                    
                    Text("max Text Length:15")
                        .font(.headline)
                    // HUF input - Hungarian Forint (no decimal places)
                    TextFieldFormView(
                        title: "Price(HUF)",
                        text: self.$hufAmount,
                        placeholder: "Enter amount",
                        maxTextLength: 15
                    )
                    .currencyField(formatter: NumberFormatter(localeIdentifier: "hu_HU", maxFractionDigits: 0))
                    
                    Text("Support separators and decimal points for specific regions")
                        .font(.headline)
                    // CNY input - Chinese Yuan
                    TextFieldFormView(
                        title: "Price(CNY)",
                        text: self.$cnyAmount,
                        placeholder: "Enter amount"
                    )
                    .currencyField(formatter: self.customizeFormatter1())
                    
                    Text("Customize NumberFormatter")
                        .font(.headline)
                    // INR input - Indian Rupee
                    TextFieldFormView(
                        title: "Price(INR)",
                        text: self.$inrAmount,
                        placeholder: "Enter amount"
                    )
                    .currencyField(formatter: self.customizeFormatter())
                }
                .padding()
            }
            .padding(.horizontal)
        }
    }
    
    func customizeFormatter() -> NumberFormatter {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.locale = Locale(identifier: "en_IN")
        formatter.currencyCode = "INR"
        formatter.maximumFractionDigits = 0
        
        return formatter
    }
    
    func customizeFormatter1() -> NumberFormatter {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.locale = Locale(identifier: "zh_CN")
        formatter.currencyCode = "CNY"

        // Set special symbols
        formatter.currencyDecimalSeparator = "^"
        formatter.currencyGroupingSeparator = "*"
        
        return formatter
    }
}

#Preview {
    CurrencyInputExampleView()
        .preferredColorScheme(.light)
}
