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
    @State private var isRequired: Bool = true
    @State private var isoCode: String = "USD"
    
    let currencyToLocale: [String: String] = [
        "USD": "en_US", // US Dollar - English (United States)
        "EUR": "de_DE", // Euro - German (Germany)
        "JPY": "ja_JP", // Japanese Yen - Japanese (Japan)
        "GBP": "en_GB", // British Pound - English (United Kingdom)
        "AUD": "en_AU", // Australian Dollar - English (Australia)
        "CAD": "en_CA", // Canadian Dollar - English (Canada)
        "CHF": "de_CH", // Swiss Franc - German (Switzerland)
        "CNY": "zh_CN", // Chinese Yuan - Chinese (Simplified)
        "SEK": "sv_SE", // Swedish Krona - Swedish (Sweden)
        "NZD": "en_NZ", // New Zealand Dollar - English (New Zealand)
        "BRL": "pt_BR", // Brazilian Real - Portuguese (Brazil)
        "INR": "en_IN", // Indian Rupee - English (India)
        "RUB": "ru_RU", // Russian Ruble - Russian (Russia)
        "ZAR": "en_ZA", // South African Rand - English (South Africa)
        "SGD": "en_SG", // Singapore Dollar - English (Singapore)
        "HKD": "en_HK", // Hong Kong Dollar - English (Hong Kong)
        "KRW": "ko_KR", // South Korean Won - Korean (South Korea)
        "MXN": "es_MX", // Mexican Peso - Spanish (Mexico)
        "TRY": "tr_TR" // Turkish Lira - Turkish (Turkey)
    ]
    
    var localCode: String {
        "Price(\(Locale.current.currency?.identifier ?? ""))"
    }

    var body: some View {
        VStack {
            Text("Currency Input Examples")
                .font(.title)
                .padding(.top, 20)
            
            List {
                HStack {
                    Text("Mandatory field")
                    Spacer()
                    Switch(isOn: self.$isRequired)
                }
                Picker("Currency Code", selection: self.$isoCode) {
                    ForEach(Array(self.currencyToLocale.keys), id: \.self) { code in
                        Text("\(code)").tag(code)
                    }
                }
                VStack(spacing: 24) {
                    VStack(alignment: .leading, spacing: 8) {
                        // USD input - US Dollar example
                        TextFieldFormView(
                            title: AttributedString("price(\(self.isoCode))"),
                            text: self.$usdAmount,
                            placeholder: "Enter amount",
                            isRequired: self.isRequired
                        )
                        .currencyField(formatter: NumberFormatter(localeIdentifier: self.currencyToLocale[self.isoCode]!, maxFractionDigits: 2))
                        .onChange(of: self.isoCode) {
                            self.usdAmount = ""
                        }
                        
                        Text("Default currencyField()")
                            .font(.headline)
                        TextFieldFormView(
                            title: AttributedString(self.localCode),
                            text: self.$eurAmount,
                            placeholder: "0.00"
                        )
                        .currencyField()
                        
                        Text("max Text Length:15")
                            .font(.headline)
                        // HUF input - Hungarian Forint (no decimal places)
                        TextFieldFormView(
                            title: "Price(HUF)",
                            text: self.$hufAmount,
                            placeholder: "Enter amount",
                            maxTextLength: 15
                        )
                        .currencyField(formatter: NumberFormatter(localeIdentifier: "hu_HU", maxFractionDigits: 2))
                        
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
                }
            }
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
