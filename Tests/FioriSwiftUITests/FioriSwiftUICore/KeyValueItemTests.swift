@testable import FioriSwiftUICore
import SwiftUI
import XCTest

final class KeyValueItemTests: XCTestCase {
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
    
    // MARK: - KeyValueItem Initialization Tests
    
    func testKeyValueItem_BasicInitialization() {
        // Given/When
        let keyValueItem = KeyValueItem(
            key: { Text("Test Key") },
            value: { Text("Test Value") }
        )
        
        // Then
        XCTAssertNotNil(keyValueItem)
        XCTAssertEqual(keyValueItem.componentIdentifier, "fiori_keyvalueitem_component")
        XCTAssertEqual(keyValueItem.controlState, .normal)
        XCTAssertNil(keyValueItem.errorMessage)
        XCTAssertEqual(keyValueItem.axis, .horizontal)
    }
    
    func testKeyValueItem_InitializationWithAllParameters() {
        // Given
        let errorMessage = AttributedString("Error occurred")
        
        // When
        let keyValueItem = KeyValueItem(
            key: { Text("Key") },
            value: { Text("Value") },
            controlState: .disabled,
            errorMessage: errorMessage,
            axis: .vertical
        )
        
        // Then
        XCTAssertNotNil(keyValueItem)
        XCTAssertEqual(keyValueItem.controlState, .disabled)
        XCTAssertEqual(keyValueItem.errorMessage, errorMessage)
        XCTAssertEqual(keyValueItem.axis, .vertical)
    }
    
    func testKeyValueItem_InitializationWithEmptyValue() {
        // Given/When
        let keyValueItem = KeyValueItem(
            key: { Text("Key Only") }
        )
        
        // Then
        XCTAssertNotNil(keyValueItem)
        XCTAssertEqual(keyValueItem.axis, .horizontal)
        XCTAssertEqual(keyValueItem.controlState, .normal)
    }
    
    func testKeyValueItem_InitializationWithCustomComponentIdentifier() {
        // Given
        let customIdentifier = "custom_keyvalue_component"
        
        // When
        let keyValueItem = KeyValueItem(
            key: { Text("Key") },
            value: { Text("Value") },
            componentIdentifier: customIdentifier
        )
        
        // Then
        XCTAssertEqual(keyValueItem.componentIdentifier, customIdentifier)
    }
    
    // MARK: - ControlState Tests
    
    func testKeyValueItem_AllControlStates() {
        let controlStates: [ControlState] = [.normal, .disabled, .readOnly]
        
        for controlState in controlStates {
            // Given/When
            let keyValueItem = KeyValueItem(
                key: { Text("Key") },
                value: { Text("Value") },
                controlState: controlState
            )
            
            // Then
            XCTAssertEqual(keyValueItem.controlState, controlState)
        }
    }
    
    // MARK: - Axis Tests
    
    func testKeyValueItem_HorizontalAxis() {
        // Given/When
        let keyValueItem = KeyValueItem(
            key: { Text("Key") },
            value: { Text("Value") },
            axis: .horizontal
        )
        
        // Then
        XCTAssertEqual(keyValueItem.axis, .horizontal)
    }
    
    func testKeyValueItem_VerticalAxis() {
        // Given/When
        let keyValueItem = KeyValueItem(
            key: { Text("Key") },
            value: { Text("Value") },
            axis: .vertical
        )
        
        // Then
        XCTAssertEqual(keyValueItem.axis, .vertical)
    }
    
    // MARK: - Error Message Tests
    
    func testKeyValueItem_WithErrorMessage() {
        // Given
        let errorMessage = AttributedString("This field is required")
        
        // When
        let keyValueItem = KeyValueItem(
            key: { Text("Required Field") },
            value: { Text("") },
            controlState: .normal,
            errorMessage: errorMessage
        )
        
        // Then
        XCTAssertEqual(keyValueItem.errorMessage, errorMessage)
    }
    
    func testKeyValueItem_WithoutErrorMessage() {
        // Given/When
        let keyValueItem = KeyValueItem(
            key: { Text("Field") },
            value: { Text("Value") }
        )
        
        // Then
        XCTAssertNil(keyValueItem.errorMessage)
    }
    
    func testKeyValueItem_WithStyledErrorMessage() {
        // Given
        var errorMessage = AttributedString("Styled error message")
        errorMessage.foregroundColor = .red
        errorMessage.font = .caption
        
        // When
        let keyValueItem = KeyValueItem(
            key: { Text("Field") },
            value: { Text("Invalid Value") },
            errorMessage: errorMessage
        )
        
        // Then
        XCTAssertEqual(keyValueItem.errorMessage, errorMessage)
    }
    
    // MARK: - Complex Content Tests
    
    func testKeyValueItem_WithComplexKeyContent() {
        // Given/When
        let keyValueItem = KeyValueItem(
            key: {
                HStack {
                    Image(systemName: "person.fill")
                    Text("Name")
                        .font(.headline)
                        .foregroundColor(.blue)
                }
            },
            value: { Text("John Doe") }
        )
        
        // Then
        XCTAssertNotNil(keyValueItem)
    }
    
    func testKeyValueItem_WithComplexValueContent() {
        // Given/When
        let keyValueItem = KeyValueItem(
            key: { Text("Status") },
            value: {
                HStack {
                    Circle()
                        .fill(Color.green)
                        .frame(width: 8, height: 8)
                    Text("Active")
                        .font(.caption)
                }
            }
        )
        
        // Then
        XCTAssertNotNil(keyValueItem)
    }
    
    func testKeyValueItem_WithStyledContent() {
        // Given/When
        let keyValueItem = KeyValueItem(
            key: {
                Text("Price")
                    .font(.subheadline)
                    .fontWeight(.semibold)
            },
            value: {
                Text("$99.99")
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(.green)
            }
        )
        
        // Then
        XCTAssertNotNil(keyValueItem)
    }
    
    // MARK: - Edge Cases Tests
    
    func testKeyValueItem_WithEmptyStrings() {
        // Given/When
        let keyValueItem = KeyValueItem(
            key: { Text("") },
            value: { Text("") }
        )
        
        // Then
        XCTAssertNotNil(keyValueItem)
    }
    
    func testKeyValueItem_WithLongContent() {
        // Given
        let longKey = String(repeating: "Very Long Key Name ", count: 10)
        let longValue = String(repeating: "Very Long Value Content ", count: 20)
        
        // When
        let keyValueItem = KeyValueItem(
            key: { Text(longKey) },
            value: { Text(longValue) }
        )
        
        // Then
        XCTAssertNotNil(keyValueItem)
    }
    
    func testKeyValueItem_WithSpecialCharacters() {
        // Given/When
        let keyValueItem = KeyValueItem(
            key: { Text("Key with émojis 🔑 and spëcial chars") },
            value: { Text("Value with émojis 💰 and spëcial chars") }
        )
        
        // Then
        XCTAssertNotNil(keyValueItem)
    }
    
    func testKeyValueItem_WithMultilineContent() {
        // Given/When
        let keyValueItem = KeyValueItem(
            key: { Text("Multi\nLine\nKey") },
            value: { Text("Multi\nLine\nValue") },
            axis: .vertical
        )
        
        // Then
        XCTAssertNotNil(keyValueItem)
        XCTAssertEqual(keyValueItem.axis, .vertical)
    }
    
    // MARK: - Static Identifier Test
    
    func testKeyValueItem_StaticIdentifier() {
        // Given/When/Then
        XCTAssertEqual(KeyValueItem.identifier, "fiori_keyvalueitem_component")
    }
}

// MARK: - KeyValueItemConfiguration Tests

final class KeyValueItemConfigurationTests: XCTestCase {
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
    
    // MARK: - Configuration Tests
    
    func testKeyValueItemConfiguration_Creation() {
        // Given/When
        let configuration = self.createTestConfiguration()
        
        // Then
        XCTAssertNotNil(configuration)
        XCTAssertEqual(configuration.componentIdentifier, "fiori_keyvalueitem_component")
        XCTAssertNotNil(configuration.key)
        XCTAssertNotNil(configuration.value)
        XCTAssertEqual(configuration.controlState, .normal)
        XCTAssertNil(configuration.errorMessage)
        XCTAssertEqual(configuration.axis, .horizontal)
    }
    
    func testKeyValueItemConfiguration_IsDirectChild() {
        // Given
        let configuration = self.createTestConfiguration()
        
        // When/Then
        XCTAssertTrue(configuration.isDirectChild("fiori_keyvalueitem_component"))
        XCTAssertFalse(configuration.isDirectChild("other_component"))
        XCTAssertFalse(configuration.isDirectChild(""))
    }
    
    func testKeyValueItemConfiguration_AllControlStates() {
        let controlStates: [ControlState] = [.normal, .disabled, .readOnly]
        
        for controlState in controlStates {
            // Given/When
            let configuration = self.createTestConfiguration(controlState: controlState)
            
            // Then
            XCTAssertEqual(configuration.controlState, controlState)
        }
    }
    
    func testKeyValueItemConfiguration_AllAxes() {
        let axes: [Axis] = [.horizontal, .vertical]
        
        for axis in axes {
            // Given/When
            let configuration = self.createTestConfiguration(axis: axis)
            
            // Then
            XCTAssertEqual(configuration.axis, axis)
        }
    }
    
    func testKeyValueItemConfiguration_WithErrorMessage() {
        // Given
        let errorMessage = AttributedString("Configuration error")
        
        // When
        let configuration = self.createTestConfiguration(errorMessage: errorMessage)
        
        // Then
        XCTAssertEqual(configuration.errorMessage, errorMessage)
    }
    
    func testKeyValueItemConfiguration_WithCustomComponentIdentifier() {
        // Given
        let customIdentifier = "custom_identifier"
        
        // When
        let configuration = KeyValueItemConfiguration(
            componentIdentifier: customIdentifier,
            key: KeyValueItemConfiguration.Key(Text("Key")),
            value: KeyValueItemConfiguration.Value(Text("Value")),
            controlState: .normal,
            errorMessage: nil,
            axis: .horizontal
        )
        
        // Then
        XCTAssertEqual(configuration.componentIdentifier, customIdentifier)
        XCTAssertTrue(configuration.isDirectChild(customIdentifier))
    }
}

// MARK: - KeyValueItemStyle Tests

final class KeyValueItemStyleTests: XCTestCase {
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
    
    // MARK: - KeyValueItemBaseStyle Tests
    
    func testKeyValueItemBaseStyle_Creation() {
        // Given/When
        let style = KeyValueItemBaseStyle()
        let configuration = self.createTestConfiguration()
        let view = style.makeBody(configuration)
        
        // Then
        XCTAssertNotNil(view)
    }
    
    func testKeyValueItemBaseStyle_HorizontalAxis() {
        // Given
        let style = KeyValueItemBaseStyle()
        let configuration = self.createTestConfiguration(axis: .horizontal)
        
        // When
        let view = style.makeBody(configuration)
        
        // Then
        XCTAssertNotNil(view)
        XCTAssertEqual(configuration.axis, .horizontal)
    }
    
    func testKeyValueItemBaseStyle_VerticalAxis() {
        // Given
        let style = KeyValueItemBaseStyle()
        let configuration = self.createTestConfiguration(axis: .vertical)
        
        // When
        let view = style.makeBody(configuration)
        
        // Then
        XCTAssertNotNil(view)
        XCTAssertEqual(configuration.axis, .vertical)
    }
    
    func testKeyValueItemBaseStyle_AllControlStates() {
        let controlStates: [ControlState] = [.normal, .disabled, .readOnly]
        let style = KeyValueItemBaseStyle()
        
        for controlState in controlStates {
            // Given
            let configuration = self.createTestConfiguration(controlState: controlState)
            
            // When
            let view = style.makeBody(configuration)
            
            // Then
            XCTAssertNotNil(view, "Failed to render with control state: \(controlState)")
        }
    }
    
    func testKeyValueItemBaseStyle_WithErrorMessage() {
        // Given
        let style = KeyValueItemBaseStyle()
        let errorMessage = AttributedString("Base style error")
        let configuration = self.createTestConfiguration(errorMessage: errorMessage)
        
        // When
        let view = style.makeBody(configuration)
        
        // Then
        XCTAssertNotNil(view)
        XCTAssertEqual(configuration.errorMessage, errorMessage)
    }
    
    // MARK: - KeyValueItemFioriStyle Tests
    
    func testKeyValueItemFioriStyle_Creation() {
        // Given/When
        let style = KeyValueItemFioriStyle()
        let configuration = self.createTestConfiguration()
        let view = style.makeBody(configuration)
        
        // Then
        XCTAssertNotNil(view)
    }
    
    func testKeyValueItemFioriStyle_WithVariousContent() {
        // Given
        let style = KeyValueItemFioriStyle()
        let testCases = [
            ("Name", "John Doe"),
            ("Email", "john@example.com"),
            ("Phone", "+1 (555) 123-4567"),
            ("Address", "123 Main St, City, State 12345"),
            ("Price", "$99.99"),
            ("Quantity", "5"),
            ("Date", "2025-10-21"),
            ("", ""), // Edge case: empty strings
            ("Long Key Name That Might Wrap", "Short Value"),
            ("Short", "Very Long Value That Might Wrap To Multiple Lines And Take Up Space")
        ]
        
        for (key, value) in testCases {
            // When
            let configuration = self.createTestConfiguration(key: key, value: value)
            let view = style.makeBody(configuration)
            
            // Then
            XCTAssertNotNil(view, "Failed to render with key: '\(key)', value: '\(value)'")
        }
    }
    
    func testKeyValueItemFioriStyle_AllAxesAndControlStates() {
        // Given
        let style = KeyValueItemFioriStyle()
        let axes: [Axis] = [.horizontal, .vertical]
        let controlStates: [ControlState] = [.normal, .disabled, .readOnly]
        
        for axis in axes {
            for controlState in controlStates {
                // When
                let configuration = self.createTestConfiguration(
                    controlState: controlState,
                    axis: axis
                )
                let view = style.makeBody(configuration)
                
                // Then
                XCTAssertNotNil(view, "Failed to render with axis: \(axis), controlState: \(controlState)")
            }
        }
    }
    
    // MARK: - Component Specific Styles Tests
    
    func testKeyFioriStyle_Creation() {
        // Given
        let keyValueConfiguration = self.createTestConfiguration()
        let keyConfiguration = KeyConfiguration(
            componentIdentifier: "fiori_key_component",
            key: KeyConfiguration.Key(Text("Test Key"))
        )
        
        // When
        let style = KeyValueItemFioriStyle.KeyFioriStyle(keyValueItemConfiguration: keyValueConfiguration)
        let view = style.makeBody(keyConfiguration)
        
        // Then
        XCTAssertNotNil(view)
        XCTAssertEqual(style.keyValueItemConfiguration.componentIdentifier, "fiori_keyvalueitem_component")
    }
    
    func testValueFioriStyle_Creation() {
        // Given
        let keyValueConfiguration = self.createTestConfiguration()
        let valueConfiguration = ValueConfiguration(
            componentIdentifier: "fiori_value_component",
            value: ValueConfiguration.Value(Text("Test Value"))
        )
        
        // When
        let style = KeyValueItemFioriStyle.ValueFioriStyle(keyValueItemConfiguration: keyValueConfiguration)
        let view = style.makeBody(valueConfiguration)
        
        // Then
        XCTAssertNotNil(view)
        XCTAssertEqual(style.keyValueItemConfiguration.componentIdentifier, "fiori_keyvalueitem_component")
    }
    
    func testFormViewFioriStyle_Creation() {
        // Given
        let keyValueConfiguration = self.createTestConfiguration()
        let formViewConfiguration = FormViewConfiguration(
            componentIdentifier: "fiori_formview_component",
            controlState: .normal,
            errorMessage: nil
        )
        
        // When
        let style = KeyValueItemFioriStyle.FormViewFioriStyle(keyValueItemConfiguration: keyValueConfiguration)
        let view = style.makeBody(formViewConfiguration)
        
        // Then
        XCTAssertNotNil(view)
        XCTAssertEqual(style.keyValueItemConfiguration.componentIdentifier, "fiori_keyvalueitem_component")
    }
    
    // MARK: - AnyKeyValueItemStyle Tests
    
    func testAnyKeyValueItemStyle_Creation() {
        // Given/When
        let style = AnyKeyValueItemStyle { configuration in
            HStack {
                configuration.key
                Spacer()
                configuration.value
            }
        }
        let configuration = self.createTestConfiguration()
        let view = style.makeBody(configuration)
        
        // Then
        XCTAssertNotNil(view)
    }
    
    func testAnyKeyValueItemStyle_CustomVerticalLayout() {
        // Given
        let style = AnyKeyValueItemStyle { configuration in
            VStack(alignment: .leading, spacing: 4) {
                configuration.key
                    .font(.caption)
                    .foregroundColor(.secondary)
                configuration.value
                    .font(.headline)
                    .foregroundColor(.primary)
            }
        }
        let configuration = self.createTestConfiguration()
        
        // When
        let view = style.makeBody(configuration)
        
        // Then
        XCTAssertNotNil(view)
    }
    
    func testAnyKeyValueItemStyle_WithConditionalStyling() {
        // Given
        let style = AnyKeyValueItemStyle { configuration in
            HStack {
                configuration.key
                Spacer()
                configuration.value
                    .foregroundColor(
                        configuration.controlState == .disabled ? .secondary : .primary
                    )
            }
            .opacity(configuration.controlState == .disabled ? 0.6 : 1.0)
        }
        
        let normalConfiguration = self.createTestConfiguration(controlState: .normal)
        let disabledConfiguration = self.createTestConfiguration(controlState: .disabled)
        
        // When
        let normalView = style.makeBody(normalConfiguration)
        let disabledView = style.makeBody(disabledConfiguration)
        
        // Then
        XCTAssertNotNil(normalView)
        XCTAssertNotNil(disabledView)
    }
    
    func testAnyKeyValueItemStyle_WithErrorHandling() {
        // Given
        let errorMessage = AttributedString("Custom error message")
        let style = AnyKeyValueItemStyle { configuration in
            VStack(alignment: .leading) {
                HStack {
                    configuration.key
                    Spacer()
                    configuration.value
                }
                
                if let error = configuration.errorMessage {
                    Text(error)
                        .font(.caption)
                        .foregroundColor(.red)
                }
            }
        }
        let configuration = self.createTestConfiguration(errorMessage: errorMessage)
        
        // When
        let view = style.makeBody(configuration)
        
        // Then
        XCTAssertNotNil(view)
        XCTAssertEqual(configuration.errorMessage, errorMessage)
    }
    
    // MARK: - Performance Tests
    
    func testKeyValueItemStyle_PerformanceWithManyItems() {
        // Given
        let style = KeyValueItemFioriStyle()
        let configurations = (0 ..< 100).map { index in
            self.createTestConfiguration(key: "Key \(index)", value: "Value \(index)")
        }
        
        // When/Then
        measure {
            for configuration in configurations {
                let view = style.makeBody(configuration)
                XCTAssertNotNil(view)
            }
        }
    }
    
    func testKeyValueItemStyle_PerformanceWithComplexContent() {
        // Given
        let style = AnyKeyValueItemStyle { configuration in
            VStack(alignment: .leading, spacing: 8) {
                HStack {
                    configuration.key
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .foregroundColor(.secondary)
                    Spacer()
                }
                HStack {
                    configuration.value
                        .font(.title2)
                        .fontWeight(.bold)
                        .foregroundColor(.primary)
                    Spacer()
                }
            }
            .padding()
            .background(Color.gray.opacity(0.1))
            .cornerRadius(12)
        }
        let configuration = self.createTestConfiguration()
        
        // When/Then
        measure {
            for _ in 0 ..< 50 {
                let view = style.makeBody(configuration)
                XCTAssertNotNil(view)
            }
        }
    }
}

// MARK: - Integration Tests

final class KeyValueItemIntegrationTests: XCTestCase {
    func testKeyValueItemStyle_ProtocolConformance() {
        // Test that all styles conform to KeyValueItemStyle protocol
        let baseStyle: any KeyValueItemStyle = KeyValueItemBaseStyle()
        let fioriStyle: any KeyValueItemStyle = KeyValueItemFioriStyle()
        let anyStyle: any KeyValueItemStyle = AnyKeyValueItemStyle { _ in EmptyView() }
        
        XCTAssertNotNil(baseStyle)
        XCTAssertNotNil(fioriStyle)
        XCTAssertNotNil(anyStyle)
    }
    
    func testKeyValueItem_AllStylesRenderCorrectly() {
        // Given
        let styles: [any KeyValueItemStyle] = [
            KeyValueItemBaseStyle(),
            KeyValueItemFioriStyle()
        ]
        
        let testCases: [(String, String, ControlState, Axis)] = [
            ("Name", "John Doe", .normal, .horizontal),
            ("Email", "john@example.com", .normal, .vertical),
            ("Status", "Active", .disabled, .horizontal),
            ("Description", "Long description text", .readOnly, .vertical),
            ("", "", .normal, .horizontal), // Edge case
            ("Price", "$99.99", .normal, .horizontal),
            ("Multi\nLine\nKey", "Multi\nLine\nValue", .normal, .vertical)
        ]
        
        // When/Then
        for style in styles {
            for (key, value, controlState, axis) in testCases {
                let configuration = KeyValueItemConfiguration(
                    componentIdentifier: "fiori_keyvalueitem_component",
                    key: KeyValueItemConfiguration.Key(Text(key)),
                    value: KeyValueItemConfiguration.Value(Text(value)),
                    controlState: controlState,
                    errorMessage: nil,
                    axis: axis
                )
                
                let view = style.makeBody(configuration)
                XCTAssertNotNil(view,
                                "Style \(type(of: style)) failed to render with key: '\(key)', value: '\(value)', controlState: \(controlState), axis: \(axis)")
            }
        }
    }
    
    func testKeyValueItem_ComponentStylesRenderCorrectly() {
        // Given
        let keyValueConfiguration = KeyValueItemConfiguration(
            componentIdentifier: "fiori_keyvalueitem_component",
            key: KeyValueItemConfiguration.Key(Text("Test Key")),
            value: KeyValueItemConfiguration.Value(Text("Test Value")),
            controlState: .normal,
            errorMessage: nil,
            axis: .horizontal
        )
        
        let keyStyle = KeyValueItemFioriStyle.KeyFioriStyle(keyValueItemConfiguration: keyValueConfiguration)
        let valueStyle = KeyValueItemFioriStyle.ValueFioriStyle(keyValueItemConfiguration: keyValueConfiguration)
        let formViewStyle = KeyValueItemFioriStyle.FormViewFioriStyle(keyValueItemConfiguration: keyValueConfiguration)
        
        let keyConfiguration = KeyConfiguration(
            componentIdentifier: "fiori_key_component",
            key: KeyConfiguration.Key(Text("Test Key"))
        )
        
        let valueConfiguration = ValueConfiguration(
            componentIdentifier: "fiori_value_component",
            value: ValueConfiguration.Value(Text("Test Value"))
        )
        
        let formViewConfiguration = FormViewConfiguration(
            componentIdentifier: "fiori_formview_component",
            controlState: .normal,
            errorMessage: nil
        )
        
        // When
        let keyView = keyStyle.makeBody(keyConfiguration)
        let valueView = valueStyle.makeBody(valueConfiguration)
        let formView = formViewStyle.makeBody(formViewConfiguration)
        
        // Then
        XCTAssertNotNil(keyView)
        XCTAssertNotNil(valueView)
        XCTAssertNotNil(formView)
    }
    
    func testKeyValueItem_WithComplexConfiguration() {
        // Given
        let complexKey = Text("Complex Key")
            .font(.headline)
            .foregroundColor(.blue)
            .fontWeight(.bold)
        
        let complexValue = Text("Complex Value")
            .font(.subheadline)
            .foregroundColor(.green)
            .italic()
        
        let errorMessage = AttributedString("Complex error message with styling")
        
        let configuration = KeyValueItemConfiguration(
            componentIdentifier: "fiori_keyvalueitem_component",
            key: KeyValueItemConfiguration.Key(complexKey),
            value: KeyValueItemConfiguration.Value(complexValue),
            controlState: .normal,
            errorMessage: errorMessage,
            axis: .vertical
        )
        
        let styles: [any KeyValueItemStyle] = [
            KeyValueItemBaseStyle(),
            KeyValueItemFioriStyle()
        ]
        
        // When/Then
        for style in styles {
            let view = style.makeBody(configuration)
            XCTAssertNotNil(view, "Style \(type(of: style)) failed to render complex configuration")
        }
    }
    
    func testKeyValueItem_RealWorldScenarios() {
        // Given - Simulate real-world usage scenarios
        let scenarios: [(String, String, ControlState, AttributedString?, Axis)] = [
            // User profile
            ("Full Name", "John Smith", .normal, nil, .horizontal),
            ("Email Address", "john.smith@company.com", .normal, nil, .horizontal),
            ("Phone Number", "+1 (555) 123-4567", .disabled, nil, .horizontal),
            
            // Product details
            ("Product Name", "iPhone 15 Pro", .normal, nil, .vertical),
            ("Price", "$999.99", .normal, nil, .horizontal),
            ("Availability", "In Stock", .normal, nil, .horizontal),
            
            // Form with validation
            ("Required Field", "", .normal, AttributedString("This field is required"), .vertical),
            ("Optional Field", "Optional value", .normal, nil, .vertical),
            ("Read-only Field", "Cannot be changed", .readOnly, nil, .horizontal),
            
            // Long content
            ("Description", "This is a very long description that might wrap to multiple lines and needs to be handled gracefully by the component", .normal, nil, .vertical)
        ]
        
        let style = KeyValueItemFioriStyle()
        
        // When/Then
        for (key, value, controlState, errorMessage, axis) in scenarios {
            let configuration = KeyValueItemConfiguration(
                componentIdentifier: "fiori_keyvalueitem_component",
                key: KeyValueItemConfiguration.Key(Text(key)),
                value: KeyValueItemConfiguration.Value(Text(value)),
                controlState: controlState,
                errorMessage: errorMessage,
                axis: axis
            )
            
            let view = style.makeBody(configuration)
            XCTAssertNotNil(view, "Failed to render scenario: \(key)")
        }
    }
}
