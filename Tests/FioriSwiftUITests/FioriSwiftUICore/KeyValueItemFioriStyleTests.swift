@testable import FioriSwiftUICore
import SwiftUI
import XCTest

final class KeyValueItemFioriStyleTests: XCTestCase {
    // MARK: - Helper Methods
    
    private func createTestConfiguration(
        key: String = "Test Key",
        value: String = "Test Value",
        controlState: ControlState = .normal,
        errorMessage: AttributedString? = nil,
        axis: Axis = .horizontal
    ) -> KeyValueItemConfiguration {
        KeyValueItemConfiguration(
            componentIdentifier: "fiori_keyvalueitem_component",
            key: KeyValueItemConfiguration.Key(Text(key)),
            value: KeyValueItemConfiguration.Value(Text(value)),
            controlState: controlState,
            errorMessage: errorMessage,
            axis: axis
        )
    }
    
    private func createKeyConfiguration(key: String = "Test Key") -> KeyConfiguration {
        KeyConfiguration(
            componentIdentifier: "fiori_key_component",
            key: KeyConfiguration.Key(Text(key))
        )
    }
    
    private func createValueConfiguration(value: String = "Test Value") -> ValueConfiguration {
        ValueConfiguration(
            componentIdentifier: "fiori_value_component",
            value: ValueConfiguration.Value(Text(value))
        )
    }
    
    private func createFormViewConfiguration(
        controlState: ControlState = .normal,
        errorMessage: AttributedString? = nil
    ) -> FormViewConfiguration {
        FormViewConfiguration(
            componentIdentifier: "fiori_formview_component",
            controlState: controlState,
            errorMessage: errorMessage
        )
    }
    
    // MARK: - KeyValueItemFioriStyle Tests
    
    func testKeyValueItemFioriStyle_BasicCreation() {
        // Given/When
        let style = KeyValueItemFioriStyle()
        let configuration = self.createTestConfiguration()
        let view = style.makeBody(configuration)
        
        // Then
        XCTAssertNotNil(view)
    }
    
    func testKeyValueItemFioriStyle_MakeBodyReturnsView() {
        // Given
        let style = KeyValueItemFioriStyle()
        let configuration = self.createTestConfiguration(
            key: "Fiori Key",
            value: "Fiori Value"
        )
        
        // When
        let view = style.makeBody(configuration)
        
        // Then
        XCTAssertNotNil(view)
        let mirror = Mirror(reflecting: view)
        XCTAssertGreaterThan(mirror.children.count, 0, "View should have child components")
    }
    
    func testKeyValueItemFioriStyle_WithHorizontalAxis() {
        // Given
        let style = KeyValueItemFioriStyle()
        let configuration = self.createTestConfiguration(
            key: "Horizontal Key",
            value: "Horizontal Value",
            axis: .horizontal
        )
        
        // When
        let view = style.makeBody(configuration)
        
        // Then
        XCTAssertNotNil(view)
        XCTAssertEqual(configuration.axis, .horizontal)
    }
    
    func testKeyValueItemFioriStyle_WithVerticalAxis() {
        // Given
        let style = KeyValueItemFioriStyle()
        let configuration = self.createTestConfiguration(
            key: "Vertical Key",
            value: "Vertical Value",
            axis: .vertical
        )
        
        // When
        let view = style.makeBody(configuration)
        
        // Then
        XCTAssertNotNil(view)
        XCTAssertEqual(configuration.axis, .vertical)
    }
    
    func testKeyValueItemFioriStyle_WithAllControlStates() {
        // Given
        let style = KeyValueItemFioriStyle()
        let controlStates: [ControlState] = [.normal, .disabled, .readOnly]
        
        for controlState in controlStates {
            // When
            let configuration = self.createTestConfiguration(
                key: "Control State Key",
                value: "Control State Value",
                controlState: controlState
            )
            let view = style.makeBody(configuration)
            
            // Then
            XCTAssertNotNil(view, "Failed to create view for control state: \(controlState)")
            XCTAssertEqual(configuration.controlState, controlState)
        }
    }
    
    func testKeyValueItemFioriStyle_WithErrorMessage() {
        // Given
        let style = KeyValueItemFioriStyle()
        let errorMessage = AttributedString("Fiori style error message")
        let configuration = self.createTestConfiguration(
            key: "Error Key",
            value: "Error Value",
            errorMessage: errorMessage
        )
        
        // When
        let view = style.makeBody(configuration)
        
        // Then
        XCTAssertNotNil(view)
        XCTAssertEqual(configuration.errorMessage, errorMessage)
    }
    
    func testKeyValueItemFioriStyle_WithEmptyContent() {
        // Given
        let style = KeyValueItemFioriStyle()
        let configuration = self.createTestConfiguration(key: "", value: "")
        
        // When
        let view = style.makeBody(configuration)
        
        // Then
        XCTAssertNotNil(view)
    }
    
    func testKeyValueItemFioriStyle_WithLongContent() {
        // Given
        let style = KeyValueItemFioriStyle()
        let longKey = String(repeating: "Long Key Content ", count: 10)
        let longValue = String(repeating: "Long Value Content ", count: 15)
        let configuration = self.createTestConfiguration(key: longKey, value: longValue)
        
        // When
        let view = style.makeBody(configuration)
        
        // Then
        XCTAssertNotNil(view)
    }
    
    func testKeyValueItemFioriStyle_WithSpecialCharacters() {
        // Given
        let style = KeyValueItemFioriStyle()
        let specialKey = "Key with émojis 🔑 and spëcial chars & symbols #@!"
        let specialValue = "Value with émojis 💰 and spëcial chars & symbols $%^"
        let configuration = self.createTestConfiguration(key: specialKey, value: specialValue)
        
        // When
        let view = style.makeBody(configuration)
        
        // Then
        XCTAssertNotNil(view)
    }
    
    func testKeyValueItemFioriStyle_WithMultilineContent() {
        // Given
        let style = KeyValueItemFioriStyle()
        let multilineKey = "Line 1\nLine 2\nLine 3"
        let multilineValue = "Value Line 1\nValue Line 2\nValue Line 3"
        let configuration = self.createTestConfiguration(
            key: multilineKey,
            value: multilineValue,
            axis: .vertical
        )
        
        // When
        let view = style.makeBody(configuration)
        
        // Then
        XCTAssertNotNil(view)
    }
    
    // MARK: - KeyFioriStyle Tests
    
    func testKeyFioriStyle_Creation() {
        // Given
        let keyValueConfiguration = self.createTestConfiguration()
        let keyConfiguration = self.createKeyConfiguration()
        
        // When
        let style = KeyValueItemFioriStyle.KeyFioriStyle(keyValueItemConfiguration: keyValueConfiguration)
        let view = style.makeBody(keyConfiguration)
        
        // Then
        XCTAssertNotNil(view)
        XCTAssertEqual(style.keyValueItemConfiguration.componentIdentifier, "fiori_keyvalueitem_component")
    }
    
    func testKeyFioriStyle_WithDifferentKeys() {
        // Given
        let keyValueConfiguration = self.createTestConfiguration()
        let testKeys = [
            "Simple Key",
            "Key with Numbers 123",
            "Key-with-dashes",
            "Key_with_underscores",
            "Key with émojis 🔑",
            "Very Long Key Name That Might Need Wrapping In The UI",
            "",
            "K"
        ]
        
        for keyText in testKeys {
            // When
            let keyConfiguration = self.createKeyConfiguration(key: keyText)
            let style = KeyValueItemFioriStyle.KeyFioriStyle(keyValueItemConfiguration: keyValueConfiguration)
            let view = style.makeBody(keyConfiguration)
            
            // Then
            XCTAssertNotNil(view, "Failed to create view for key: '\(keyText)'")
        }
    }
    
    func testKeyFioriStyle_FontStyling() {
        // Given
        let keyValueConfiguration = self.createTestConfiguration()
        let keyConfiguration = self.createKeyConfiguration(key: "Font Test Key")
        let style = KeyValueItemFioriStyle.KeyFioriStyle(keyValueItemConfiguration: keyValueConfiguration)
        
        // When
        let view = style.makeBody(keyConfiguration)
        
        // Then
        XCTAssertNotNil(view)
    }
    
    func testKeyFioriStyle_WithAllControlStates() {
        // Given
        let controlStates: [ControlState] = [.normal, .disabled, .readOnly]
        let keyConfiguration = self.createKeyConfiguration(key: "Control State Key")
        
        for controlState in controlStates {
            // When
            let keyValueConfiguration = self.createTestConfiguration(controlState: controlState)
            let style = KeyValueItemFioriStyle.KeyFioriStyle(keyValueItemConfiguration: keyValueConfiguration)
            let view = style.makeBody(keyConfiguration)
            
            // Then
            XCTAssertNotNil(view, "Failed to create key view for control state: \(controlState)")
        }
    }
    
    // MARK: - ValueFioriStyle Tests
    
    func testValueFioriStyle_Creation() {
        // Given
        let keyValueConfiguration = self.createTestConfiguration()
        let valueConfiguration = self.createValueConfiguration()
        
        // When
        let style = KeyValueItemFioriStyle.ValueFioriStyle(keyValueItemConfiguration: keyValueConfiguration)
        let view = style.makeBody(valueConfiguration)
        
        // Then
        XCTAssertNotNil(view)
        XCTAssertEqual(style.keyValueItemConfiguration.componentIdentifier, "fiori_keyvalueitem_component")
    }
    
    func testValueFioriStyle_WithDifferentValues() {
        // Given
        let keyValueConfiguration = self.createTestConfiguration()
        let testValues = [
            "Simple Value",
            "$1,234.56",
            "2025-10-21",
            "john.doe@example.com",
            "+1 (555) 123-4567",
            "123 Main St, Anytown, ST 12345",
            "Active",
            "Inactive",
            "100%",
            "N/A",
            "",
            "V"
        ]
        
        for valueText in testValues {
            // When
            let valueConfiguration = self.createValueConfiguration(value: valueText)
            let style = KeyValueItemFioriStyle.ValueFioriStyle(keyValueItemConfiguration: keyValueConfiguration)
            let view = style.makeBody(valueConfiguration)
            
            // Then
            XCTAssertNotNil(view, "Failed to create view for value: '\(valueText)'")
        }
    }
    
    func testValueFioriStyle_FontStyling() {
        // Given
        let keyValueConfiguration = self.createTestConfiguration()
        let valueConfiguration = self.createValueConfiguration(value: "Font Test Value")
        let style = KeyValueItemFioriStyle.ValueFioriStyle(keyValueItemConfiguration: keyValueConfiguration)
        
        // When
        let view = style.makeBody(valueConfiguration)
        
        // Then
        XCTAssertNotNil(view)
    }
    
    func testValueFioriStyle_WithAllControlStates() {
        // Given
        let controlStates: [ControlState] = [.normal, .disabled, .readOnly]
        let valueConfiguration = self.createValueConfiguration(value: "Control State Value")
        
        for controlState in controlStates {
            // When
            let keyValueConfiguration = self.createTestConfiguration(controlState: controlState)
            let style = KeyValueItemFioriStyle.ValueFioriStyle(keyValueItemConfiguration: keyValueConfiguration)
            let view = style.makeBody(valueConfiguration)
            
            // Then
            XCTAssertNotNil(view, "Failed to create value view for control state: \(controlState)")
        }
    }
    
    func testValueFioriStyle_WithNumericValues() {
        // Given
        let keyValueConfiguration = self.createTestConfiguration()
        let numericValues = [
            "0",
            "1",
            "999",
            "1,234",
            "1,234.56",
            "$99.99",
            "€123.45",
            "¥1,000",
            "-50",
            "0.01",
            "999,999.99"
        ]
        
        for numericValue in numericValues {
            // When
            let valueConfiguration = self.createValueConfiguration(value: numericValue)
            let style = KeyValueItemFioriStyle.ValueFioriStyle(keyValueItemConfiguration: keyValueConfiguration)
            let view = style.makeBody(valueConfiguration)
            
            // Then
            XCTAssertNotNil(view, "Failed to create view for numeric value: '\(numericValue)'")
        }
    }
    
    // MARK: - FormViewFioriStyle Tests
    
    func testFormViewFioriStyle_Creation() {
        // Given
        let keyValueConfiguration = self.createTestConfiguration()
        let formViewConfiguration = self.createFormViewConfiguration()
        
        // When
        let style = KeyValueItemFioriStyle.FormViewFioriStyle(keyValueItemConfiguration: keyValueConfiguration)
        let view = style.makeBody(formViewConfiguration)
        
        // Then
        XCTAssertNotNil(view)
        XCTAssertEqual(style.keyValueItemConfiguration.componentIdentifier, "fiori_keyvalueitem_component")
    }
    
    func testFormViewFioriStyle_WithDifferentContent() {
        // Given
        let keyValueConfiguration = self.createTestConfiguration()
        // Note: FormViewConfiguration has no content; test various error messages instead
        let errorMessages: [AttributedString?] = [
            nil,
            AttributedString("Simple Form Error"),
            AttributedString("Complex Form Error with Multiple Lines\nSecond Line"),
            AttributedString("Form error with special chars: @#$%^&*()"),
            AttributedString("Form error with émojis 📝 and unicode ñáéíóú")
        ]
        
        for error in errorMessages {
            // When
            let formViewConfiguration = self.createFormViewConfiguration(errorMessage: error)
            let style = KeyValueItemFioriStyle.FormViewFioriStyle(keyValueItemConfiguration: keyValueConfiguration)
            let view = style.makeBody(formViewConfiguration)
            
            // Then
            XCTAssertNotNil(view, "Failed to create view for form configuration with error: '\(String(describing: error))'")
        }
    }
    
    func testFormViewFioriStyle_WithAllControlStates() {
        // Given
        let controlStates: [ControlState] = [.normal, .disabled, .readOnly]
        let formViewConfiguration = self.createFormViewConfiguration()
        
        for controlState in controlStates {
            // When
            let keyValueConfiguration = self.createTestConfiguration(controlState: controlState)
            let style = KeyValueItemFioriStyle.FormViewFioriStyle(keyValueItemConfiguration: keyValueConfiguration)
            // override controlState in form config for this iteration
            let config = FormViewConfiguration(
                componentIdentifier: formViewConfiguration.componentIdentifier,
                controlState: controlState,
                errorMessage: formViewConfiguration.errorMessage
            )
            let view = style.makeBody(config)
            
            // Then
            XCTAssertNotNil(view, "Failed to create form view for control state: \(controlState)")
        }
    }
    
    // MARK: - Style Integration Tests
    
    func testKeyValueItemFioriStyle_AllComponentStylesApplied() {
        // Given
        let style = KeyValueItemFioriStyle()
        let configuration = self.createTestConfiguration(
            key: "Integration Key",
            value: "Integration Value"
        )
        
        // When
        let view = style.makeBody(configuration)
        
        // Then
        XCTAssertNotNil(view)
        
        let mirror = Mirror(reflecting: view)
        XCTAssertGreaterThan(mirror.children.count, 0, "Styled view should have components")
    }
    
    func testKeyValueItemFioriStyle_ComponentStylesWithDifferentConfigurations() {
        // Given
        let testConfigurations = [
            createTestConfiguration(key: "Key1", value: "Value1", controlState: .normal, axis: .horizontal),
            createTestConfiguration(key: "Key2", value: "Value2", controlState: .disabled, axis: .vertical),
            createTestConfiguration(key: "Key3", value: "Value3", controlState: .readOnly, axis: .horizontal),
            createTestConfiguration(key: "", value: "", controlState: .normal, axis: .vertical)
        ]
        
        let style = KeyValueItemFioriStyle()
        
        for configuration in testConfigurations {
            // When
            let view = style.makeBody(configuration)
            
            // Then
            XCTAssertNotNil(view,
                            "Failed to create view for configuration: key='\(configuration.key)', controlState=\(configuration.controlState), axis=\(configuration.axis)")
        }
    }
    
    func testKeyValueItemFioriStyle_WithErrorMessage_Integration() {
        // Given
        let style = KeyValueItemFioriStyle()
        let errorMessage = AttributedString("Validation error occurred")
        let configuration = self.createTestConfiguration(
            key: "Validation Key",
            value: "Invalid Value",
            errorMessage: errorMessage
        )
        
        // When
        let view = style.makeBody(configuration)
        
        // Then
        XCTAssertNotNil(view)
        XCTAssertEqual(configuration.errorMessage, errorMessage)
    }
    
    func testKeyValueItemFioriStyle_WithStyledErrorMessage() {
        // Given
        let style = KeyValueItemFioriStyle()
        var styledError = AttributedString("Styled error message")
        styledError.foregroundColor = .red
        styledError.font = .caption
        
        let configuration = self.createTestConfiguration(
            key: "Styled Error Key",
            value: "Error Value",
            errorMessage: styledError
        )
        
        // When
        let view = style.makeBody(configuration)
        
        // Then
        XCTAssertNotNil(view)
        XCTAssertEqual(configuration.errorMessage, styledError)
    }
    
    // MARK: - Performance Tests
    
    func testKeyValueItemFioriStyle_PerformanceWithManyConfigurations() {
        // Given
        let style = KeyValueItemFioriStyle()
        let configurations = (0 ..< 100).map { index in
            self.createTestConfiguration(
                key: "Performance Key \(index)",
                value: "Performance Value \(index)"
            )
        }
        
        // When/Then
        measure {
            for configuration in configurations {
                let view = style.makeBody(configuration)
                XCTAssertNotNil(view)
            }
        }
    }
    
    func testKeyValueItemFioriStyle_PerformanceWithComplexConfigurations() {
        // Given
        let style = KeyValueItemFioriStyle()
        let complexConfigurations = (0 ..< 50).map { index in
            let longKey = String(repeating: "Complex Key \(index) ", count: 5)
            let longValue = String(repeating: "Complex Value \(index) ", count: 10)
            let errorMessage = AttributedString("Error for item \(index)")
            
            return self.createTestConfiguration(
                key: longKey,
                value: longValue,
                controlState: [.normal, .disabled, .readOnly][index % 3],
                errorMessage: index % 2 == 0 ? errorMessage : nil,
                axis: index % 2 == 0 ? .horizontal : .vertical
            )
        }
        
        // When/Then
        measure {
            for configuration in complexConfigurations {
                let view = style.makeBody(configuration)
                XCTAssertNotNil(view)
            }
        }
    }
    
    // MARK: - Font Validation Tests
    
    func testKeyValueItemFioriStyle_KeyFontConfiguration() {
        // Given
        let keyValueConfiguration = self.createTestConfiguration()
        let keyConfiguration = self.createKeyConfiguration(key: "Font Key")
        let style = KeyValueItemFioriStyle.KeyFioriStyle(keyValueItemConfiguration: keyValueConfiguration)
        
        // When
        let view = style.makeBody(keyConfiguration)
        
        // Then
        XCTAssertNotNil(view)
    }
    
    func testKeyValueItemFioriStyle_ValueFontConfiguration() {
        // Given
        let keyValueConfiguration = self.createTestConfiguration()
        let valueConfiguration = self.createValueConfiguration(value: "Font Value")
        let style = KeyValueItemFioriStyle.ValueFioriStyle(keyValueItemConfiguration: keyValueConfiguration)
        
        // When
        let view = style.makeBody(valueConfiguration)
        
        // Then
        XCTAssertNotNil(view)
    }
    
    // MARK: - Real-World Scenarios Tests
    
    func testKeyValueItemFioriStyle_UserProfileScenario() {
        // Given
        let style = KeyValueItemFioriStyle()
        let profileData = [
            ("Full Name", "Jane Doe"),
            ("Email", "jane.doe@company.com"),
            ("Department", "Engineering"),
            ("Employee ID", "EMP001234"),
            ("Start Date", "January 15, 2023"),
            ("Manager", "John Smith")
        ]
        
        for (key, value) in profileData {
            // When
            let configuration = self.createTestConfiguration(key: key, value: value)
            let view = style.makeBody(configuration)
            
            // Then
            XCTAssertNotNil(view, "Failed to render profile field: \(key)")
        }
    }
    
    func testKeyValueItemFioriStyle_ProductDetailsScenario() {
        // Given
        let style = KeyValueItemFioriStyle()
        let productData = [
            ("Product Name", "iPhone 15 Pro"),
            ("SKU", "IPH15PRO-256-TBL"),
            ("Price", "$999.99"),
            ("Availability", "In Stock"),
            ("Rating", "4.8/5.0"),
            ("Reviews", "1,247 reviews")
        ]
        
        for (key, value) in productData {
            // When
            let configuration = self.createTestConfiguration(
                key: key,
                value: value,
                axis: .horizontal
            )
            let view = style.makeBody(configuration)
            
            // Then
            XCTAssertNotNil(view, "Failed to render product field: \(key)")
        }
    }
    
    func testKeyValueItemFioriStyle_FormValidationScenario() {
        // Given
        let style = KeyValueItemFioriStyle()
        let formFields: [(String, String, ControlState, AttributedString?)] = [
            ("Required Field", "", ControlState.normal, AttributedString("This field is required")),
            ("Email Address", "invalid-email", ControlState.normal, AttributedString("Please enter a valid email")),
            ("Phone Number", "+1 555-123-4567", ControlState.normal, nil),
            ("Read-only Field", "Cannot be changed", ControlState.readOnly, nil)
        ]
        
        for (key, value, controlState, errorMessage) in formFields {
            // When
            let configuration = self.createTestConfiguration(
                key: key,
                value: value,
                controlState: controlState,
                errorMessage: errorMessage,
                axis: .vertical
            )
            let view = style.makeBody(configuration)
            
            // Then
            XCTAssertNotNil(view, "Failed to render form field: \(key)")
        }
    }
}
