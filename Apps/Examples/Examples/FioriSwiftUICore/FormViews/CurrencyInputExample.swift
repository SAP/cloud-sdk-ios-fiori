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
    
    var body: some View {
        ScrollView {
            VStack(spacing: 24) {
                Text("Currency Input Examples")
                    .font(.title)
                    .padding(.top, 20)
                
                VStack(alignment: .leading, spacing: 8) {
                    Text("Different Currency Codes and Formats")
                        .font(.headline)
                    
                    // USD input - using symbol display style
                    TextFieldFormView(
                        title: "Price(USD)",
                        text: self.$usdAmount,
                        placeholder: "Enter amount",
                        isRequired: true
                    )
                    .textFieldFormViewStyle(.currency(
                        currencyCode: "USD",
                        displayStyle: .symbol
                    ))
                    
                    // EUR input - using suffix position
                    TextFieldFormView(
                        title: "Price(EUR)",
                        text: self.$eurAmount,
                        placeholder: "Enter amount",
                        errorMessage: "Please enter a valid amount"
                    )
                    .textFieldFormViewStyle(.currency(
                        currencyCode: "EUR",
                        position: .suffix
                    ))
                    
                    // JPY input - no decimal places
                    TextFieldFormView(
                        title: "Price(JPY)",
                        text: self.$jpyAmount,
                        placeholder: "Enter amount"
                    )
                    .textFieldFormViewStyle(.currency(
                        currencyCode: "JPY",
                        maxFractionDigits: 0
                    ))
                    
                    // HUF input - using short name format
                    TextFieldFormView(
                        title: "Price(HUF)",
                        text: self.$hufAmount,
                        placeholder: "Enter amount",
                        maxTextLength: 15
                    )
                    .textFieldFormViewStyle(.currency(
                        currencyCode: "HUF",
                        displayStyle: .shortName,
                        maxFractionDigits: 0
                    ))
                    
                    // CNY input - no decimal places
                    TextFieldFormView(
                        title: "Price(CNY)",
                        text: self.$cnyAmount,
                        placeholder: "Enter amount"
                    )
                    .textFieldFormViewStyle(.currency(
                        currencyCode: "CNY",
                        maxFractionDigits: 0
                    ))
                }
                .padding()
                
                Spacer()
            }
            .padding(.horizontal)
        }
    }
}

#Preview {
    CurrencyInputExampleView()
        .preferredColorScheme(.light)
}
