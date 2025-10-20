@testable import FioriSwiftUICore
import SwiftUI
import XCTest

final class AlertConfigurationTests: XCTestCase {
    // MARK: - AlertConfiguration Initializers
    
    func testAlertConfigurationInitializersNonDeprecated() {
        // ViewBuilder message initializer
        let builderConfig = AlertConfiguration(title: Text("Title"), message: { Text("Builder Message") }, action: .init(label: "OK"), secondaryAction: .init(label: "Cancel"))
        XCTAssertNil(builderConfig.message_, "Builder-based initializer should not set message_")
        
        // String message nil
        let stringNilConfig = AlertConfiguration(title: "Title", message: nil, action: .init(label: "OK"), secondaryAction: .init(label: "Cancel"))
        XCTAssertNil(stringNilConfig.message_, "Nil string message should result in nil message_")
        
        // String message provided
        let stringProvidedConfig = AlertConfiguration(title: "Title", message: "Hello", action: .init(label: "OK"), secondaryAction: .init(label: "Cancel"))
        let providedDesc = stringProvidedConfig.message_.map { String(describing: $0) }
        XCTAssertNotNil(providedDesc)
        XCTAssertTrue(providedDesc!.contains("Hello"), "Non-nil string message should produce a Text containing 'Hello'")
        
        // Convenience init (no message argument)
        let convenienceConfig = AlertConfiguration(title: Text("Title"), action: .init(label: "OK"), secondaryAction: .init(label: "Cancel"))
        XCTAssertNil(convenienceConfig.message_, "Convenience initializer without message should yield nil message_")
    }
    
    func testDeprecatedTextMessageInitializers() {
        // These initializers are deprecated on iOS 15+/macOS 12+, skip when unavailable.
        let messageText = Text("Optional Message")
        let optionalMessageConfig = AlertConfiguration(title: Text("Title"), message: messageText, action: .init(label: "OK"), secondaryAction: .init(label: "Cancel"))
        let optionalDesc = optionalMessageConfig.message_.map(String.init(describing:))
        XCTAssertNotNil(optionalDesc)
        XCTAssertTrue(optionalDesc!.contains("Optional Message"), "Text initializer should contain its content literal")
        
        let nilMessageConfig = AlertConfiguration(title: Text("Title"), message: nil, action: .init(label: "OK"), secondaryAction: .init(label: "Cancel"))
        XCTAssertNil(nilMessageConfig.message_)
    }
    
    // MARK: - Action Initializers
    
    func testActionInitWithViewBuilderLabel() {
        let action = AlertConfiguration.Action(label: { Text("OK") })
        XCTAssertNil(action.label_, "label_ should be nil for view builder initializer")
        XCTAssertNil(action.didSelect, "didSelect should default to nil")
    }
    
    func testActionInitWithTextLabel() {
        let textLabel = Text("Proceed")
        let action = AlertConfiguration.Action(label: textLabel)
        XCTAssertNotNil(action.label_, "label_ should not be nil when initialized with a Text")
        XCTAssertTrue(String(describing: action.label_!).contains("Proceed"), "Underlying Text should contain 'Proceed'")
    }
    
    func testActionInitWithStringLabel() {
        let action = AlertConfiguration.Action(label: "Proceed")
        XCTAssertNotNil(action.label_)
        XCTAssertTrue(String(describing: action.label_!).contains("Proceed"), "String label should produce Text containing 'Proceed'")
    }
    
    func testActionDidSelectSetter() {
        var action = AlertConfiguration.Action(label: "OK")
        var called = false
        action._didSelectSetter { called = true }
        action.didSelect?()
        XCTAssertTrue(called, "didSelect closure should have been invoked")
    }
    
    func testActionDidSelectInitializerClosure() {
        var called = false
        let action = AlertConfiguration.Action(label: "OK") { called = true }
        action.didSelect?()
        XCTAssertTrue(called)
    }
    
    // MARK: - Additional Behavior Tests
    
    func testSecondaryActionIndependence() {
        var primaryCalled = false
        var secondaryCalled = false
        let config = AlertConfiguration(title: "Title", message: "Msg", action: .init(label: "Primary") { primaryCalled = true }, secondaryAction: .init(label: "Secondary") { secondaryCalled = true })
        config.action.didSelect?()
        XCTAssertTrue(primaryCalled)
        XCTAssertFalse(secondaryCalled)
        config.secondaryAction.didSelect?()
        XCTAssertTrue(secondaryCalled)
    }
    
    func testActionReplaceClosure() {
        var action = AlertConfiguration.Action(label: "Replace") { /* initial */ }
        var calledLater = false
        action._didSelectSetter { calledLater = true }
        action.didSelect?()
        XCTAssertTrue(calledLater, "Replaced closure should run")
    }
}
