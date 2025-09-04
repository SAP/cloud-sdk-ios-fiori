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
        XCTAssertEqual(tf.formatter?.format, "+AA NNN NNNS X YYYY/MM/DD \\A\\*")
        XCTAssertEqual(tf.maxTextLength, 13)
        XCTAssertEqual(tf.text, storedText)
    }
}
