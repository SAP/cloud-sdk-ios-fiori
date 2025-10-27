@testable import FioriSwiftUICore
import SwiftUI
import XCTest

final class TextInputFieldTests: XCTestCase {
    func testBasicRendering() {
        let textBinding = Binding<String>(get: { "" }, set: { _ in })

        let config = TextInputFieldConfiguration(
            text: textBinding,
            isSecureEnabled: false,
            formatter: nil
        )
        
        let style = TextInputFieldGenericTextStyle()
        let view = style.makeBody(config)
        
        XCTAssertNotNil(view)
        XCTAssertEqual(config.isSecureEnabled, false)
    }
    
    func testFormatterIntegration() {
        var phoneNumberformatter: PhoneNumberFormatter {
            let formatter = PhoneNumberFormatter()
            return formatter
        }
        
        let phoneString1 = phoneNumberformatter.string(for: "1234567890", cursorPosition: 0)?.formattedString
        XCTAssertEqual(phoneString1, "(123) 456-7890")
        
        let phoneString2 = phoneNumberformatter.string(for: "123", cursorPosition: 0)?.formattedString
        XCTAssertEqual(phoneString2, "(123")

        let phoneString3 = phoneNumberformatter.string(for: "aa", cursorPosition: 0)?.formattedString
        XCTAssertEqual(phoneString3, "")
        
        var phoneNumberformatter2: PhoneNumberFormatter {
            let formatter = PhoneNumberFormatter()
            formatter.isSwiftUIInputField = true
            return formatter
        }
        let phoneString4 = phoneNumberformatter2.string(for: "123", cursorPosition: 0)?.formattedString
        XCTAssertEqual(phoneString4, "(123) ")
        
        var priceNumberformatter: CustomNumberFormatter {
            let formatter = CustomNumberFormatter()
            formatter.numberStyle = .currency
            formatter.locale = Locale(identifier: "en_US")
            return formatter
        }
        
        let priceString1 = priceNumberformatter.string(for: "123456", cursorPosition: 0)?.formattedString
        XCTAssertEqual(priceString1, "$123,456")
        
        var numberFormatter: CustomNumberFormatter {
            let formatter = CustomNumberFormatter()
            formatter.numberStyle = .decimal
            formatter.maximumFractionDigits = 3
            formatter.positiveSuffix = "lbs"
            return formatter
        }
        
        let numberString = numberFormatter.string(for: "123", cursorPosition: 0)?.formattedString
        XCTAssertEqual(numberString, "123lbs")
        
        var formatter: GenericTextFormatter {
            let formatter = GenericTextFormatter()
            formatter.format = "+AA NNN NNNS X YYYY/MM/DD \\A\\*"
            return formatter
        }
        
        var storedText = "AA123456#a20250101"
        let textBinding = Binding<String>(
            get: { storedText },
            set: { newValue in
                storedText = newValue
            }
        )
        
        let config = TextInputFieldConfiguration(
            text: textBinding,
            isSecureEnabled: false,
            formatter: formatter
        )
        
        let formattedString1 = formatter.formatString(for: "AA123456#a20250101", cursorPosition: 0)
        XCTAssertEqual(formattedString1, "+AA 123 456# a 2025/01/01 A*")
        
        let formattedString2 = formatter.formatString(for: "123", cursorPosition: 0)
        XCTAssertEqual(formattedString2, "")
        
        let formattedString3 = formatter.formatString(for: "aa", cursorPosition: 0)
        XCTAssertEqual(formattedString3, "+aa ")
        
        let style = TextInputFieldGenericTextStyle()
        _ = style.makeBody(config)
        
        XCTAssertEqual(textBinding.wrappedValue, storedText)
    }
    
    func testTextFieldFormView() {
        var formatter: GenericTextFormatter {
            let formatter = GenericTextFormatter()
            formatter.format = "+AA NNN NNNS X YYYY/MM/DD \\A\\*"
            return formatter
        }
        
        var storedText = "+AA 123 456# a 2025/01/01 A*"
        let textBinding = Binding<String>(
            get: { storedText },
            set: { newValue in
                storedText = newValue
            }
        )
        
        let tf = TextFieldFormView(title: { Text("generic text") }, text: textBinding, formatter: formatter, placeholder: { Text("placeholder") }, maxTextLength: 13, allowsBeyondLimit: true)
        XCTAssertNotNil(tf)
        XCTAssertNotNil(tf.formatter)
        XCTAssertEqual((tf.formatter as? GenericTextFormatter)?.format, "+AA NNN NNNS X YYYY/MM/DD \\A\\*")
        XCTAssertEqual(tf.maxTextLength, 13)
        XCTAssertEqual(tf.text, storedText)
    }
}
