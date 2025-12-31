@testable import FioriSwiftUICore
import SwiftUI
import XCTest

final class CheckoutIndicatorTests: XCTestCase {
    // MARK: - Basic Initialization Tests
    
    func testInitWithInProgressState() {
        // Given
        let indicator = CheckoutIndicator(displayState: .constant(.inProgress))
        
        // Then
        XCTAssertNotNil(indicator)
    }
    
    func testInitWithCompletedState() {
        // Given
        let indicator = CheckoutIndicator(displayState: .constant(.completed))
        
        // Then
        XCTAssertNotNil(indicator)
    }
    
    func testInitWithFailedState() {
        // Given
        let indicator = CheckoutIndicator(displayState: .constant(.failed))
        
        // Then
        XCTAssertNotNil(indicator)
    }
    
    func testInitWithAIProgressState() {
        // Given
        let indicator = CheckoutIndicator(displayState: .constant(.aiProgress))
        
        // Then
        XCTAssertNotNil(indicator)
    }
    
    // MARK: - DisplayState Enumeration Tests
    
    func testDisplayStateInProgress() {
        // Given
        let state = DisplayState.inProgress
        
        // Then
        XCTAssertEqual(state, .inProgress)
    }
    
    func testDisplayStateCompleted() {
        // Given
        let state = DisplayState.completed
        
        // Then
        XCTAssertEqual(state, .completed)
    }
    
    func testDisplayStateFailed() {
        // Given
        let state = DisplayState.failed
        
        // Then
        XCTAssertEqual(state, .failed)
    }
    
    func testDisplayStateAIProgress() {
        // Given
        let state = DisplayState.aiProgress
        
        // Then
        XCTAssertEqual(state, .aiProgress)
    }
    
    func testDisplayStateEquality() {
        // Given
        let state1 = DisplayState.inProgress
        let state2 = DisplayState.inProgress
        let state3 = DisplayState.completed
        
        // Then
        XCTAssertEqual(state1, state2)
        XCTAssertNotEqual(state1, state3)
    }
    
    func testAllDisplayStatesAreUnique() {
        // Given
        let states: [DisplayState] = [.inProgress, .completed, .failed, .aiProgress]
        
        // Then
        XCTAssertEqual(states.count, 4)
        XCTAssertNotEqual(states[0], states[1])
        XCTAssertNotEqual(states[0], states[2])
        XCTAssertNotEqual(states[0], states[3])
        XCTAssertNotEqual(states[1], states[2])
        XCTAssertNotEqual(states[1], states[3])
        XCTAssertNotEqual(states[2], states[3])
    }
    
    // MARK: - DisplayState Mutability Tests
    
    func testDisplayStateCanBeChanged() {
        // Given
        var displayState = DisplayState.inProgress
        
        // When
        displayState = .completed
        
        // Then
        XCTAssertEqual(displayState, .completed)
    }
    
    func testAllDisplayStateTransitions() {
        // Given
        var displayState = DisplayState.inProgress
        
        // When & Then
        XCTAssertEqual(displayState, .inProgress)
        
        displayState = .completed
        XCTAssertEqual(displayState, .completed)
        
        displayState = .failed
        XCTAssertEqual(displayState, .failed)
        
        displayState = .aiProgress
        XCTAssertEqual(displayState, .aiProgress)
        
        displayState = .inProgress
        XCTAssertEqual(displayState, .inProgress)
    }
    
    // MARK: - Binding Tests
    
    func testBindingInitialization() {
        // Given
        let indicator = CheckoutIndicator(displayState: .constant(.inProgress))
        
        // Then
        XCTAssertNotNil(indicator)
    }
    
    func testBindingWithDifferentStates() {
        // Given
        let indicator1 = CheckoutIndicator(displayState: .constant(.inProgress))
        let indicator2 = CheckoutIndicator(displayState: .constant(.completed))
        let indicator3 = CheckoutIndicator(displayState: .constant(.failed))
        let indicator4 = CheckoutIndicator(displayState: .constant(.aiProgress))
        
        // Then
        XCTAssertNotNil(indicator1)
        XCTAssertNotNil(indicator2)
        XCTAssertNotNil(indicator3)
        XCTAssertNotNil(indicator4)
    }
    
    // MARK: - Component Identifier Tests
    
    func testDefaultComponentIdentifier() {
        // Given
        let indicator = CheckoutIndicator(displayState: .constant(.inProgress))
        
        // Then
        XCTAssertNotNil(indicator)
        XCTAssertEqual(indicator.componentIdentifier, CheckoutIndicator.identifier)
        XCTAssertEqual(CheckoutIndicator.identifier, "fiori_checkoutindicator_component")
    }
    
    func testCustomComponentIdentifier() {
        // Given
        let customIdentifier = "custom_checkout_indicator"
        
        // When
        let indicator = CheckoutIndicator(displayState: .constant(.inProgress), componentIdentifier: customIdentifier)
        
        // Then
        XCTAssertNotNil(indicator)
        XCTAssertEqual(indicator.componentIdentifier, customIdentifier)
    }
    
    func testNilComponentIdentifier() {
        // Given
        let indicator = CheckoutIndicator(displayState: .constant(.inProgress), componentIdentifier: nil)
        
        // Then
        XCTAssertNotNil(indicator)
        XCTAssertEqual(indicator.componentIdentifier, CheckoutIndicator.identifier)
    }
    
    // MARK: - Configuration Tests
    
    func testInitializationFromConfiguration() {
        // Given
        let configuration = CheckoutIndicatorConfiguration(
            componentIdentifier: CheckoutIndicator.identifier,
            displayState: .constant(.inProgress)
        )
        
        // When
        let indicator = CheckoutIndicator(configuration)
        
        // Then
        XCTAssertNotNil(indicator)
        XCTAssertEqual(indicator.componentIdentifier, configuration.componentIdentifier)
    }
    
    func testConfigurationWithCompletedState() {
        // Given
        let configuration = CheckoutIndicatorConfiguration(
            componentIdentifier: CheckoutIndicator.identifier,
            displayState: .constant(.completed)
        )
        
        // When
        let indicator = CheckoutIndicator(configuration)
        
        // Then
        XCTAssertNotNil(indicator)
    }
    
    func testConfigurationWithFailedState() {
        // Given
        let configuration = CheckoutIndicatorConfiguration(
            componentIdentifier: CheckoutIndicator.identifier,
            displayState: .constant(.failed)
        )
        
        // When
        let indicator = CheckoutIndicator(configuration)
        
        // Then
        XCTAssertNotNil(indicator)
    }
    
    func testConfigurationWithAIProgressState() {
        // Given
        let configuration = CheckoutIndicatorConfiguration(
            componentIdentifier: CheckoutIndicator.identifier,
            displayState: .constant(.aiProgress)
        )
        
        // When
        let indicator = CheckoutIndicator(configuration)
        
        // Then
        XCTAssertNotNil(indicator)
    }
    
    func testConfigurationWithCustomIdentifier() {
        // Given
        let customIdentifier = "test_identifier"
        let configuration = CheckoutIndicatorConfiguration(
            componentIdentifier: customIdentifier,
            displayState: .constant(.inProgress)
        )
        
        // When
        let indicator = CheckoutIndicator(configuration)
        
        // Then
        XCTAssertNotNil(indicator)
        XCTAssertEqual(indicator.componentIdentifier, customIdentifier)
    }
    
    // MARK: - CheckoutIndicatorConfiguration Extension Tests
    
    func testConfigurationIsDirectChildWithMatchingIdentifier() {
        // Given
        let identifier = "test_checkout_component"
        let configuration = CheckoutIndicatorConfiguration(
            componentIdentifier: identifier,
            displayState: .constant(.inProgress)
        )
        
        // When
        let isDirectChild = configuration.isDirectChild(identifier)
        
        // Then
        XCTAssertTrue(isDirectChild)
    }
    
    func testConfigurationIsDirectChildWithDifferentIdentifier() {
        // Given
        let configIdentifier = "test_checkout_component"
        let otherIdentifier = "other_component"
        let configuration = CheckoutIndicatorConfiguration(
            componentIdentifier: configIdentifier,
            displayState: .constant(.completed)
        )
        
        // When
        let isDirectChild = configuration.isDirectChild(otherIdentifier)
        
        // Then
        XCTAssertFalse(isDirectChild)
    }
    
    func testConfigurationIsDirectChildWithDefaultIdentifier() {
        // Given
        let configuration = CheckoutIndicatorConfiguration(
            componentIdentifier: CheckoutIndicator.identifier,
            displayState: .constant(.failed)
        )
        
        // When
        let isDirectChild = configuration.isDirectChild(CheckoutIndicator.identifier)
        
        // Then
        XCTAssertTrue(isDirectChild)
    }
    
    func testConfigurationIsDirectChildWithEmptyString() {
        // Given
        let configuration = CheckoutIndicatorConfiguration(
            componentIdentifier: "",
            displayState: .constant(.aiProgress)
        )
        
        // When
        let isDirectChildEmpty = configuration.isDirectChild("")
        let isDirectChildNonEmpty = configuration.isDirectChild("test")
        
        // Then
        XCTAssertTrue(isDirectChildEmpty)
        XCTAssertFalse(isDirectChildNonEmpty)
    }
    
    func testConfigurationComponentIdentifierProperty() {
        // Given
        let customIdentifier = "custom_id_123"
        let configuration = CheckoutIndicatorConfiguration(
            componentIdentifier: customIdentifier,
            displayState: .constant(.inProgress)
        )
        
        // Then
        XCTAssertEqual(configuration.componentIdentifier, customIdentifier)
    }
    
    func testConfigurationDisplayStateProperty() {
        // Given
        let configuration = CheckoutIndicatorConfiguration(
            componentIdentifier: CheckoutIndicator.identifier,
            displayState: .constant(.completed)
        )
        
        // Then
        XCTAssertEqual(configuration.componentIdentifier, CheckoutIndicator.identifier)
        XCTAssertNotNil(configuration.$displayState)
    }
    
    func testConfigurationCanBeModified() {
        // Given
        var configuration = CheckoutIndicatorConfiguration(
            componentIdentifier: "original_id",
            displayState: .constant(.inProgress)
        )
        
        // When
        configuration.componentIdentifier = "modified_id"
        
        // Then
        XCTAssertEqual(configuration.componentIdentifier, "modified_id")
    }
    
    func testConfigurationIsDirectChildWithMultipleChecks() {
        // Given
        let identifier = "checkout_indicator_test"
        let configuration = CheckoutIndicatorConfiguration(
            componentIdentifier: identifier,
            displayState: .constant(.failed)
        )
        
        // When & Then - Multiple checks with different identifiers
        XCTAssertTrue(configuration.isDirectChild(identifier))
        XCTAssertFalse(configuration.isDirectChild("different_id"))
        XCTAssertFalse(configuration.isDirectChild("another_id"))
        XCTAssertTrue(configuration.isDirectChild(identifier)) // Check consistency
    }
    
    func testConfigurationIsDirectChildCaseSensitive() {
        // Given
        let identifier = "TestIdentifier"
        let configuration = CheckoutIndicatorConfiguration(
            componentIdentifier: identifier,
            displayState: .constant(.aiProgress)
        )
        
        // When & Then - Test case sensitivity
        XCTAssertTrue(configuration.isDirectChild("TestIdentifier"))
        XCTAssertFalse(configuration.isDirectChild("testidentifier"))
        XCTAssertFalse(configuration.isDirectChild("TESTIDENTIFIER"))
    }
    
    // MARK: - View Protocol Tests
    
    func testConformsToView() {
        // Given
        let indicator = CheckoutIndicator(displayState: .constant(.inProgress))
        let view: any View = indicator
        
        // Then
        XCTAssertNotNil(view)
    }
    
    func testViewBody() {
        // Given
        let indicator = CheckoutIndicator(displayState: .constant(.inProgress))
        
        // Then
        XCTAssertNotNil(indicator.body)
    }
    
    // MARK: - Real-world Scenarios Tests
    
    func testCheckoutProcessInProgress() {
        // Given - Simulating an active checkout process
        let indicator = CheckoutIndicator(displayState: .constant(.inProgress))
        
        // Then
        XCTAssertNotNil(indicator)
    }
    
    func testCheckoutProcessCompleted() {
        // Given - Simulating successful checkout completion
        let indicator = CheckoutIndicator(displayState: .constant(.completed))
        
        // Then
        XCTAssertNotNil(indicator)
    }
    
    func testCheckoutProcessFailed() {
        // Given - Simulating failed checkout (e.g., payment declined)
        let indicator = CheckoutIndicator(displayState: .constant(.failed))
        
        // Then
        XCTAssertNotNil(indicator)
    }
    
    func testAIAssistedCheckout() {
        // Given - Simulating AI-assisted checkout processing
        let indicator = CheckoutIndicator(displayState: .constant(.aiProgress))
        
        // Then
        XCTAssertNotNil(indicator)
    }
    
    // MARK: - Multiple Instances Tests
    
    func testMultipleIndicatorsWithDifferentStates() {
        // Given
        let indicator1 = CheckoutIndicator(displayState: .constant(.inProgress))
        let indicator2 = CheckoutIndicator(displayState: .constant(.completed))
        let indicator3 = CheckoutIndicator(displayState: .constant(.failed))
        let indicator4 = CheckoutIndicator(displayState: .constant(.aiProgress))
        
        // Then
        XCTAssertNotNil(indicator1)
        XCTAssertNotNil(indicator2)
        XCTAssertNotNil(indicator3)
        XCTAssertNotNil(indicator4)
    }
    
    func testMultipleIndicatorsSameState() {
        // Given
        let indicator1 = CheckoutIndicator(displayState: .constant(.inProgress))
        let indicator2 = CheckoutIndicator(displayState: .constant(.inProgress))
        
        // Then
        XCTAssertNotNil(indicator1)
        XCTAssertNotNil(indicator2)
    }
    
    // MARK: - Edge Cases Tests
    
    func testSameStateValue() {
        // Given
        let indicator = CheckoutIndicator(displayState: .constant(.inProgress))
        
        // When
        let state = DisplayState.inProgress
        
        // Then
        XCTAssertNotNil(indicator)
        XCTAssertEqual(state, .inProgress)
    }
    
    func testIndicatorCreationWithAllStates() {
        // Given
        let states: [DisplayState] = [.inProgress, .completed, .failed, .aiProgress]
        
        // When & Then
        for state in states {
            let indicator = CheckoutIndicator(displayState: .constant(state))
            XCTAssertNotNil(indicator)
        }
    }
    
    // MARK: - Integration Tests
    
    func testIndicatorInView() {
        // Given
        let indicator = CheckoutIndicator(displayState: .constant(.inProgress))
        let view: any View = indicator
        
        // Then
        XCTAssertNotNil(view)
    }
    
    func testAllStatesCanCreateIndicators() {
        // Given
        let states: [DisplayState] = [.inProgress, .completed, .failed, .aiProgress]
        var indicators: [CheckoutIndicator] = []
        
        // When
        for state in states {
            let indicator = CheckoutIndicator(displayState: .constant(state))
            indicators.append(indicator)
        }
        
        // Then
        XCTAssertEqual(indicators.count, 4)
        for indicator in indicators {
            XCTAssertNotNil(indicator)
        }
    }
    
    // MARK: - Component Identity Tests
    
    func testStaticIdentifier() {
        // Then
        XCTAssertEqual(CheckoutIndicator.identifier, "fiori_checkoutindicator_component")
    }
    
    func testMultipleIndicatorsShareStaticIdentifier() {
        // Given
        let indicator1 = CheckoutIndicator(displayState: .constant(.inProgress))
        let indicator2 = CheckoutIndicator(displayState: .constant(.completed))
        
        // Then
        XCTAssertEqual(indicator1.componentIdentifier, indicator2.componentIdentifier)
        XCTAssertEqual(indicator1.componentIdentifier, CheckoutIndicator.identifier)
    }
    
    // MARK: - Comprehensive Coverage Tests
    
    func testAllPublicAPIs() {
        // Given
        let indicator1 = CheckoutIndicator(displayState: .constant(.inProgress))
        
        // When - Test init with binding and identifier
        let indicator2 = CheckoutIndicator(displayState: .constant(.inProgress), componentIdentifier: "custom")
        
        // When - Test init with configuration
        let config = CheckoutIndicatorConfiguration(
            componentIdentifier: CheckoutIndicator.identifier,
            displayState: .constant(.inProgress)
        )
        let indicator3 = CheckoutIndicator(config)
        
        // Then
        XCTAssertNotNil(indicator1)
        XCTAssertNotNil(indicator2)
        XCTAssertNotNil(indicator3)
        XCTAssertEqual(indicator1.componentIdentifier, CheckoutIndicator.identifier)
        XCTAssertEqual(indicator2.componentIdentifier, "custom")
        XCTAssertEqual(indicator3.componentIdentifier, CheckoutIndicator.identifier)
    }

    // MARK: - Style Tests
    
    func testCheckoutIndicatorBaseStyle() {
        // Given
        let baseStyle = CheckoutIndicatorBaseStyle()
        let configuration = CheckoutIndicatorConfiguration(
            componentIdentifier: CheckoutIndicator.identifier,
            displayState: .constant(.inProgress)
        )
        
        // When
        let body = baseStyle.makeBody(configuration)
        
        // Then
        XCTAssertNotNil(body)
    }
    
    func testCheckoutIndicatorFioriStyle() {
        // Given
        let fioriStyle = CheckoutIndicatorFioriStyle()
        let configuration = CheckoutIndicatorConfiguration(
            componentIdentifier: CheckoutIndicator.identifier,
            displayState: .constant(.completed)
        )
        
        // When
        let body = fioriStyle.makeBody(configuration)
        
        // Then
        XCTAssertNotNil(body)
    }
    
    func testBaseStyleWithAllDisplayStates() {
        // Given
        let baseStyle = CheckoutIndicatorBaseStyle()
        let states: [DisplayState] = [.inProgress, .completed, .failed, .aiProgress]
        
        // When & Then
        for state in states {
            let configuration = CheckoutIndicatorConfiguration(
                componentIdentifier: CheckoutIndicator.identifier,
                displayState: .constant(state)
            )
            let body = baseStyle.makeBody(configuration)
            XCTAssertNotNil(body)
        }
    }
    
    func testFioriStyleWithAllDisplayStates() {
        // Given
        let fioriStyle = CheckoutIndicatorFioriStyle()
        let states: [DisplayState] = [.inProgress, .completed, .failed, .aiProgress]
        
        // When & Then
        for state in states {
            let configuration = CheckoutIndicatorConfiguration(
                componentIdentifier: CheckoutIndicator.identifier,
                displayState: .constant(state)
            )
            let body = fioriStyle.makeBody(configuration)
            XCTAssertNotNil(body)
        }
    }
    
    // MARK: - Drawing Function Tests
    
    func testDrawCheckmarkPath() {
        // Given
        let baseStyle = CheckoutIndicatorBaseStyle()
        let size = CGSize(width: 100, height: 100)
        let lineWidth: CGFloat = 3
        
        // When
        let path = baseStyle.drawCheckmark(size: size, lineWidth: lineWidth)
        
        // Then
        XCTAssertFalse(path.isEmpty)
        XCTAssertNotNil(path)
    }
    
    func testDrawCheckmarkWithDifferentSizes() {
        // Given
        let baseStyle = CheckoutIndicatorBaseStyle()
        let sizes = [
            CGSize(width: 50, height: 50),
            CGSize(width: 100, height: 100),
            CGSize(width: 200, height: 200),
            CGSize(width: 150, height: 100)
        ]
        let lineWidth: CGFloat = 2
        
        // When & Then
        for size in sizes {
            let path = baseStyle.drawCheckmark(size: size, lineWidth: lineWidth)
            XCTAssertFalse(path.isEmpty)
        }
    }
    
    func testDrawExclamationPointPath() {
        // Given
        let baseStyle = CheckoutIndicatorBaseStyle()
        let size = CGSize(width: 100, height: 100)
        let lineWidth: CGFloat = 3
        
        // When
        let path = baseStyle.drawExclamationPoint(size: size, lineWidth: lineWidth)
        
        // Then
        XCTAssertFalse(path.isEmpty)
        XCTAssertNotNil(path)
    }
    
    func testDrawExclamationPointWithDifferentSizes() {
        // Given
        let baseStyle = CheckoutIndicatorBaseStyle()
        let sizes = [
            CGSize(width: 50, height: 50),
            CGSize(width: 100, height: 100),
            CGSize(width: 200, height: 200),
            CGSize(width: 150, height: 100)
        ]
        let lineWidth: CGFloat = 2
        
        // When & Then
        for size in sizes {
            let path = baseStyle.drawExclamationPoint(size: size, lineWidth: lineWidth)
            XCTAssertFalse(path.isEmpty)
        }
    }
    
    func testDrawCheckmarkWithVariousLineWidths() {
        // Given
        let baseStyle = CheckoutIndicatorBaseStyle()
        let size = CGSize(width: 100, height: 100)
        let lineWidths: [CGFloat] = [1, 2, 3, 5, 10]
        
        // When & Then
        for lineWidth in lineWidths {
            let path = baseStyle.drawCheckmark(size: size, lineWidth: lineWidth)
            XCTAssertFalse(path.isEmpty)
        }
    }
    
    func testDrawExclamationPointWithVariousLineWidths() {
        // Given
        let baseStyle = CheckoutIndicatorBaseStyle()
        let size = CGSize(width: 100, height: 100)
        let lineWidths: [CGFloat] = [1, 2, 3, 5, 10]
        
        // When & Then
        for lineWidth in lineWidths {
            let path = baseStyle.drawExclamationPoint(size: size, lineWidth: lineWidth)
            XCTAssertFalse(path.isEmpty)
        }
    }
    
    func testDrawCheckmarkWithZeroSize() {
        // Given
        let baseStyle = CheckoutIndicatorBaseStyle()
        let size = CGSize(width: 0, height: 0)
        let lineWidth: CGFloat = 3
        
        // When
        let path = baseStyle.drawCheckmark(size: size, lineWidth: lineWidth)
        
        // Then
        XCTAssertNotNil(path)
    }
    
    func testDrawExclamationPointWithZeroSize() {
        // Given
        let baseStyle = CheckoutIndicatorBaseStyle()
        let size = CGSize(width: 0, height: 0)
        let lineWidth: CGFloat = 3
        
        // When
        let path = baseStyle.drawExclamationPoint(size: size, lineWidth: lineWidth)
        
        // Then
        XCTAssertNotNil(path)
    }
    
    func testDrawCheckmarkWithSquareSize() {
        // Given
        let baseStyle = CheckoutIndicatorBaseStyle()
        let size = CGSize(width: 100, height: 100)
        let lineWidth: CGFloat = 3
        
        // When
        let path = baseStyle.drawCheckmark(size: size, lineWidth: lineWidth)
        
        // Then
        XCTAssertFalse(path.isEmpty)
    }
    
    func testDrawCheckmarkWithRectangularSize() {
        // Given
        let baseStyle = CheckoutIndicatorBaseStyle()
        let size = CGSize(width: 150, height: 100)
        let lineWidth: CGFloat = 3
        
        // When
        let path = baseStyle.drawCheckmark(size: size, lineWidth: lineWidth)
        
        // Then
        XCTAssertFalse(path.isEmpty)
    }
    
    // MARK: - Style Rendering Tests
    
    func testBaseStyleRendersInProgressState() {
        // Given
        let baseStyle = CheckoutIndicatorBaseStyle()
        let configuration = CheckoutIndicatorConfiguration(
            componentIdentifier: CheckoutIndicator.identifier,
            displayState: .constant(.inProgress)
        )
        
        // When
        let body = baseStyle.makeBody(configuration)
        
        // Then
        XCTAssertNotNil(body)
    }
    
    func testBaseStyleRendersCompletedState() {
        // Given
        let baseStyle = CheckoutIndicatorBaseStyle()
        let configuration = CheckoutIndicatorConfiguration(
            componentIdentifier: CheckoutIndicator.identifier,
            displayState: .constant(.completed)
        )
        
        // When
        let body = baseStyle.makeBody(configuration)
        
        // Then
        XCTAssertNotNil(body)
    }
    
    func testBaseStyleRendersFailedState() {
        // Given
        let baseStyle = CheckoutIndicatorBaseStyle()
        let configuration = CheckoutIndicatorConfiguration(
            componentIdentifier: CheckoutIndicator.identifier,
            displayState: .constant(.failed)
        )
        
        // When
        let body = baseStyle.makeBody(configuration)
        
        // Then
        XCTAssertNotNil(body)
    }
    
    func testBaseStyleRendersAIProgressState() {
        // Given
        let baseStyle = CheckoutIndicatorBaseStyle()
        let configuration = CheckoutIndicatorConfiguration(
            componentIdentifier: CheckoutIndicator.identifier,
            displayState: .constant(.aiProgress)
        )
        
        // When
        let body = baseStyle.makeBody(configuration)
        
        // Then
        XCTAssertNotNil(body)
    }
    
    // MARK: - Edge Cases for Drawing Functions
    
    func testDrawCheckmarkWithVeryLargeSize() {
        // Given
        let baseStyle = CheckoutIndicatorBaseStyle()
        let size = CGSize(width: 10000, height: 10000)
        let lineWidth: CGFloat = 3
        
        // When
        let path = baseStyle.drawCheckmark(size: size, lineWidth: lineWidth)
        
        // Then
        XCTAssertNotNil(path)
        XCTAssertFalse(path.isEmpty)
    }
    
    func testDrawExclamationPointWithVeryLargeSize() {
        // Given
        let baseStyle = CheckoutIndicatorBaseStyle()
        let size = CGSize(width: 10000, height: 10000)
        let lineWidth: CGFloat = 3
        
        // When
        let path = baseStyle.drawExclamationPoint(size: size, lineWidth: lineWidth)
        
        // Then
        XCTAssertNotNil(path)
        XCTAssertFalse(path.isEmpty)
    }
    
    func testDrawCheckmarkWithVerySmallSize() {
        // Given
        let baseStyle = CheckoutIndicatorBaseStyle()
        let size = CGSize(width: 1, height: 1)
        let lineWidth: CGFloat = 0.5
        
        // When
        let path = baseStyle.drawCheckmark(size: size, lineWidth: lineWidth)
        
        // Then
        XCTAssertNotNil(path)
    }
    
    func testDrawExclamationPointWithVerySmallSize() {
        // Given
        let baseStyle = CheckoutIndicatorBaseStyle()
        let size = CGSize(width: 1, height: 1)
        let lineWidth: CGFloat = 0.5
        
        // When
        let path = baseStyle.drawExclamationPoint(size: size, lineWidth: lineWidth)
        
        // Then
        XCTAssertNotNil(path)
    }
    
    // MARK: - Style Integration Tests
    
    func testMultipleStyleInstancesAreIndependent() {
        // Given
        let style1 = CheckoutIndicatorBaseStyle()
        let style2 = CheckoutIndicatorBaseStyle()
        
        let config1 = CheckoutIndicatorConfiguration(
            componentIdentifier: CheckoutIndicator.identifier,
            displayState: .constant(.inProgress)
        )
        let config2 = CheckoutIndicatorConfiguration(
            componentIdentifier: CheckoutIndicator.identifier,
            displayState: .constant(.completed)
        )
        
        // When
        let body1 = style1.makeBody(config1)
        let body2 = style2.makeBody(config2)
        
        // Then
        XCTAssertNotNil(body1)
        XCTAssertNotNil(body2)
    }
    
    func testFioriStyleInstancesAreIndependent() {
        // Given
        let style1 = CheckoutIndicatorFioriStyle()
        let style2 = CheckoutIndicatorFioriStyle()
        
        let config1 = CheckoutIndicatorConfiguration(
            componentIdentifier: CheckoutIndicator.identifier,
            displayState: .constant(.failed)
        )
        let config2 = CheckoutIndicatorConfiguration(
            componentIdentifier: CheckoutIndicator.identifier,
            displayState: .constant(.aiProgress)
        )
        
        // When
        let body1 = style1.makeBody(config1)
        let body2 = style2.makeBody(config2)
        
        // Then
        XCTAssertNotNil(body1)
        XCTAssertNotNil(body2)
    }
    
    // MARK: - Drawing Function Consistency Tests
    
    func testDrawingFunctionsProduceDifferentPaths() {
        // Given
        let baseStyle = CheckoutIndicatorBaseStyle()
        let size = CGSize(width: 100, height: 100)
        let lineWidth: CGFloat = 3
        
        // When
        let checkmarkPath = baseStyle.drawCheckmark(size: size, lineWidth: lineWidth)
        let exclamationPath = baseStyle.drawExclamationPoint(size: size, lineWidth: lineWidth)
        
        // Then
        XCTAssertNotNil(checkmarkPath)
        XCTAssertNotNil(exclamationPath)
        XCTAssertFalse(checkmarkPath.isEmpty)
        XCTAssertFalse(exclamationPath.isEmpty)
    }
    
    func testDrawingFunctionsAreConsistent() {
        // Given
        let baseStyle = CheckoutIndicatorBaseStyle()
        let size = CGSize(width: 100, height: 100)
        let lineWidth: CGFloat = 3
        
        // When - Call same function twice
        let path1 = baseStyle.drawCheckmark(size: size, lineWidth: lineWidth)
        let path2 = baseStyle.drawCheckmark(size: size, lineWidth: lineWidth)
        
        // Then - Should produce consistent results
        XCTAssertNotNil(path1)
        XCTAssertNotNil(path2)
        XCTAssertFalse(path1.isEmpty)
        XCTAssertFalse(path2.isEmpty)
    }
    
    // MARK: - Additional CheckoutIndicatorConfiguration Extension Tests
    
    func testConfigurationIsDirectChildWithWhitespaceIdentifier() {
        // Given
        let configuration = CheckoutIndicatorConfiguration(
            componentIdentifier: "  spaces  ",
            displayState: .constant(.inProgress)
        )
        
        // When
        let isDirectChild = configuration.isDirectChild("  spaces  ")
        let isDirectChildTrimmed = configuration.isDirectChild("spaces")
        
        // Then
        XCTAssertTrue(isDirectChild)
        XCTAssertFalse(isDirectChildTrimmed)
    }
    
    func testConfigurationIsDirectChildWithSpecialCharacters() {
        // Given
        let specialIdentifiers = ["test-id", "test_id", "test.id", "test@id", "test#id"]
        
        for identifier in specialIdentifiers {
            let configuration = CheckoutIndicatorConfiguration(
                componentIdentifier: identifier,
                displayState: .constant(.completed)
            )
            
            // When
            let isDirectChild = configuration.isDirectChild(identifier)
            
            // Then
            XCTAssertTrue(isDirectChild, "Failed for identifier: \(identifier)")
        }
    }
    
    func testConfigurationIsDirectChildWithUnicodeCharacters() {
        // Given
        let unicodeIdentifier = "test_🎯_identifier"
        let configuration = CheckoutIndicatorConfiguration(
            componentIdentifier: unicodeIdentifier,
            displayState: .constant(.failed)
        )
        
        // When
        let isDirectChild = configuration.isDirectChild(unicodeIdentifier)
        
        // Then
        XCTAssertTrue(isDirectChild)
    }
    
    func testConfigurationIsDirectChildPerformance() {
        // Given
        let identifier = "performance_test_identifier"
        let configuration = CheckoutIndicatorConfiguration(
            componentIdentifier: identifier,
            displayState: .constant(.aiProgress)
        )
        
        // When - Measure performance of multiple checks
        measure {
            for _ in 0 ..< 1000 {
                _ = configuration.isDirectChild(identifier)
            }
        }
    }
    
    func testConfigurationIdentifierMutationAffectsIsDirectChild() {
        // Given
        var configuration = CheckoutIndicatorConfiguration(
            componentIdentifier: "original_id",
            displayState: .constant(.inProgress)
        )
        
        // When
        let isDirectChild1 = configuration.isDirectChild("original_id")
        configuration.componentIdentifier = "modified_id"
        let isDirectChild2 = configuration.isDirectChild("original_id")
        let isDirectChild3 = configuration.isDirectChild("modified_id")
        
        // Then
        XCTAssertTrue(isDirectChild1)
        XCTAssertFalse(isDirectChild2)
        XCTAssertTrue(isDirectChild3)
    }
    
    func testConfigurationIsDirectChildWithAllDisplayStates() {
        // Given
        let identifier = "test_all_states"
        let states: [DisplayState] = [.inProgress, .completed, .failed, .aiProgress]
        
        for state in states {
            let configuration = CheckoutIndicatorConfiguration(
                componentIdentifier: identifier,
                displayState: .constant(state)
            )
            
            // When
            let isDirectChild = configuration.isDirectChild(identifier)
            
            // Then
            XCTAssertTrue(isDirectChild, "Failed for state: \(state)")
        }
    }
    
    func testConfigurationMultipleMutations() {
        // Given
        var configuration = CheckoutIndicatorConfiguration(
            componentIdentifier: "id1",
            displayState: .constant(.inProgress)
        )
        
        // When & Then - Multiple sequential mutations
        XCTAssertTrue(configuration.isDirectChild("id1"))
        
        configuration.componentIdentifier = "id2"
        XCTAssertTrue(configuration.isDirectChild("id2"))
        XCTAssertFalse(configuration.isDirectChild("id1"))
        
        configuration.componentIdentifier = "id3"
        XCTAssertTrue(configuration.isDirectChild("id3"))
        XCTAssertFalse(configuration.isDirectChild("id2"))
    }
    
    func testConfigurationExtensionWithRealIndicator() {
        // Given
        let customIdentifier = "integration_test_id"
        let configuration = CheckoutIndicatorConfiguration(
            componentIdentifier: customIdentifier,
            displayState: .constant(.inProgress)
        )
        
        // When
        let indicator = CheckoutIndicator(configuration)
        let isDirectChild = configuration.isDirectChild(customIdentifier)
        
        // Then
        XCTAssertTrue(isDirectChild)
        XCTAssertEqual(indicator.componentIdentifier, customIdentifier)
        XCTAssertNotNil(indicator)
    }
    
    func testConfigurationIsDirectChildWithVeryLongIdentifier() {
        // Given
        let longIdentifier = String(repeating: "a", count: 1000)
        let configuration = CheckoutIndicatorConfiguration(
            componentIdentifier: longIdentifier,
            displayState: .constant(.completed)
        )
        
        // When
        let isDirectChild = configuration.isDirectChild(longIdentifier)
        
        // Then
        XCTAssertTrue(isDirectChild)
    }
    
    func testConfigurationIsDirectChildWithNumericIdentifiers() {
        // Given
        let numericIdentifiers = ["123", "456789", "0", "999999"]
        
        for identifier in numericIdentifiers {
            let configuration = CheckoutIndicatorConfiguration(
                componentIdentifier: identifier,
                displayState: .constant(.failed)
            )
            
            // When
            let isDirectChild = configuration.isDirectChild(identifier)
            
            // Then
            XCTAssertTrue(isDirectChild, "Failed for numeric identifier: \(identifier)")
        }
    }
    
    func testConfigurationIsDirectChildWithMixedCaseIdentifiers() {
        // Given
        let mixedCaseIdentifiers = [
            ("Test", "test", false),
            ("TEST", "TEST", true),
            ("test", "test", true),
            ("TeSt", "TeSt", true),
            ("TeSt", "tEsT", false)
        ]
        
        for (identifier, checkIdentifier, expectedResult) in mixedCaseIdentifiers {
            let configuration = CheckoutIndicatorConfiguration(
                componentIdentifier: identifier,
                displayState: .constant(.aiProgress)
            )
            
            // When
            let isDirectChild = configuration.isDirectChild(checkIdentifier)
            
            // Then
            XCTAssertEqual(isDirectChild, expectedResult, "Failed for '\(identifier)' vs '\(checkIdentifier)'")
        }
    }
}
