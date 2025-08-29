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
        
        let tuple3 = formatter.string(for: "AA123456#a20250101", cursorPosition: 0)
        XCTAssertEqual(tuple3?.formattedString, "+AA 123 456# a 2025/01/01 A*")
        XCTAssertEqual(tuple3?.adjustedCursorPosition, 28)
        
        let tuple = formatter.string(for: "123", cursorPosition: 0)
        XCTAssertEqual(tuple?.formattedString, "")
        XCTAssertEqual(tuple?.adjustedCursorPosition, 0)
        
        let tuple2 = formatter.string(for: "aa", cursorPosition: 0)
        XCTAssertEqual(tuple2?.formattedString, "+aa ")
        XCTAssertEqual(tuple2?.adjustedCursorPosition, 4)
        
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
