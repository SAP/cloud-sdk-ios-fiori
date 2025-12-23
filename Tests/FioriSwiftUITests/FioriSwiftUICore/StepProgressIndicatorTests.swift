@testable import FioriSwiftUICore
import SwiftUI
import XCTest

final class StepProgressIndicatorTests: XCTestCase {
    // MARK: - Helper Test Model
    
    private struct TestStepItem: StepItem {
        var id: String
        var title: String?
        var state: StepProgressIndicatorState
        var substeps: [StepItem]
        var node: TextOrIcon?
        
        init(
            id: String = UUID().uuidString,
            title: String? = nil,
            state: StepProgressIndicatorState = .normal,
            substeps: [StepItem] = [],
            node: TextOrIcon? = nil
        ) {
            self.id = id
            self.title = title
            self.state = state
            self.substeps = substeps
            self.node = node
        }
    }
    
    private func makeSteps(withSubsteps: Bool = true) -> [StepItem] {
        let sub1 = TestStepItem(title: "Step 1.1", state: .completed)
        let sub2 = TestStepItem(title: "Step 1.2", state: .error)
        let s1 = TestStepItem(title: "Step 1", state: .completed, substeps: withSubsteps ? [sub1, sub2] : [])
        let s2 = TestStepItem(title: "Step 2", state: .normal)
        let s3 = TestStepItem(title: "Step 3", state: .disabled)
        return [s1, s2, s3]
    }
    
    // MARK: - Generated Identifier
    
    func testIdentifierConstant() {
        XCTAssertEqual(StepProgressIndicator.identifier, "fiori_stepprogressindicator_component")
    }
    
    // MARK: - Initializers (builder + steps container)
    
    func testPrimaryInitializerWithBuilders() {
        // Given
        var selectionValue = ""
        let selection = Binding<String>(get: { selectionValue }, set: { selectionValue = $0 })
        let steps = self.makeSteps()
        
        // When
        let spi = StepProgressIndicator(
            title: { Text("Current Step") },
            action: { Button("All Steps") {} },
            cancelAction: { FioriButton(title: "Cancel") },
            selection: selection,
            steps: { StepsStack(steps, selection: selection) }
        )
        
        // Then
        XCTAssertEqual(spi.componentIdentifier, StepProgressIndicator.identifier)
        // binding round trip
        XCTAssertEqual(spi.selection, "")
        selection.wrappedValue = "abc"
        XCTAssertEqual(spi.selection, "abc")
        // steps container should not be empty (actual count depends on container implementation)
        XCTAssertGreaterThan(spi.steps.count, 0)
        
        // sanity: title/action/cancelAction exist (type-erased any View)
        _ = spi.title
        _ = spi.action
        _ = spi.cancelAction
    }
    
    func testInitWithAttributedTitleAndStepItems() {
        // Given
        var selectionValue = "sel"
        let selection = Binding<String>(get: { selectionValue }, set: { selectionValue = $0 })
        let steps = self.makeSteps()
        let title = AttributedString("Process")
        let action = FioriButton(title: "All Steps")
        
        // When: convenience init from _FioriStyles extension using [StepItem]
        let spi = StepProgressIndicator(
            title: title,
            action: action,
            cancelAction: FioriButton(title: "Cancel"),
            selection: selection,
            steps: steps
        )
        
        // Then
        XCTAssertEqual(spi.componentIdentifier, StepProgressIndicator.identifier)
        XCTAssertEqual(spi.selection, "sel")
        XCTAssertGreaterThan(spi.steps.count, 0)
        selection.wrappedValue = "new"
        XCTAssertEqual(spi.selection, "new")
    }
    
    // MARK: - Configuration based init and styles
    
    private func makeConfiguration(steps: [StepItem]? = nil) -> StepProgressIndicatorConfiguration {
        var selectionValue = ""
        let selection = Binding<String>(get: { selectionValue }, set: { selectionValue = $0 })
        let cfgSteps: any IndexedViewContainer = StepsStack(steps ?? self.makeSteps(), selection: selection)
        return StepProgressIndicatorConfiguration(
            componentIdentifier: StepProgressIndicator.identifier,
            title: StepProgressIndicatorConfiguration.Title(Text("Title")),
            action: StepProgressIndicatorConfiguration.Action(Button("Action") {}),
            cancelAction: StepProgressIndicatorConfiguration.CancelAction(FioriButton(title: "Cancel")),
            selection: selection,
            steps: cfgSteps
        )
    }
    
    func testConfigurationInitializer() {
        // Given
        let configuration = self.makeConfiguration()
        
        // When
        let spi = StepProgressIndicator(configuration)
        
        // Then
        XCTAssertEqual(spi.componentIdentifier, StepProgressIndicator.identifier)
        XCTAssertGreaterThan(spi.steps.count, 0)
        XCTAssertEqual(spi.selection, "")
    }
    
    func testFioriAndBaseStylesMakeBody() {
        // Given
        let configuration = self.makeConfiguration()
        
        // When
        let fioriStyle = StepProgressIndicatorFioriStyle()
        let fioriView = fioriStyle.makeBody(configuration)
        let baseStyle = StepProgressIndicatorBaseStyle()
        let baseView = baseStyle.makeBody(configuration)
        
        // Then (sanity compile-time, non-nil type-erased views)
        XCTAssertNotNil(fioriView)
        XCTAssertNotNil(baseView)
    }
    
    func testSubStylesMakeBody() {
        // Given
        let configuration = self.makeConfiguration()
        
        // Title style
        let titleCfg = TitleConfiguration(title: configuration.title)
        let titleStyle = StepProgressIndicatorFioriStyle.TitleFioriStyle(stepProgressIndicatorConfiguration: configuration)
        let titleView = titleStyle.makeBody(titleCfg)
        XCTAssertNotNil(titleView)
        
        // Action style
        let actionCfg = ActionConfiguration(action: configuration.action)
        let actionStyle = StepProgressIndicatorFioriStyle.ActionFioriStyle(stepProgressIndicatorConfiguration: configuration)
        let actionView = actionStyle.makeBody(actionCfg)
        XCTAssertNotNil(actionView)
        
        // CancelAction style
        let cancelCfg = CancelActionConfiguration(cancelAction: configuration.cancelAction)
        let cancelStyle = StepProgressIndicatorFioriStyle.CancelActionFioriStyle(stepProgressIndicatorConfiguration: configuration)
        let cancelView = cancelStyle.makeBody(cancelCfg)
        XCTAssertNotNil(cancelView)
    }
    
    // MARK: - State semantics
    
    func testStepProgressIndicatorStateSupport() {
        XCTAssertTrue(StepProgressIndicatorState.normal.isSupported)
        XCTAssertTrue(StepProgressIndicatorState.completed.isSupported)
        XCTAssertTrue(StepProgressIndicatorState.error.isSupported)
        XCTAssertTrue(StepProgressIndicatorState.disabled.isSupported)
        
        // Unsupported custom flag
        let custom = StepProgressIndicatorState(rawValue: 1 << 7)
        XCTAssertFalse(custom.isSupported)
        
        // OptionSet combinations are allowed, but isSupported only true for specific single states or empty set
        let combo = StepProgressIndicatorState([.completed, .error])
        XCTAssertFalse(combo.isSupported)
    }
    
    // MARK: - Convenience inits routing through [StepItem]
    
    func testConvenienceInitWithStepItemsVariants() {
        var selectionValue = ""
        let selection = Binding<String>(get: { selectionValue }, set: { selectionValue = $0 })
        let steps = self.makeSteps()
        
        // title + action
        let spi1 = StepProgressIndicator(selection: selection, stepItems: steps, title: { Text("T") }, action: { Button("A") {} })
        XCTAssertGreaterThan(spi1.steps.count, 0)
        
        // title only
        let spi2 = StepProgressIndicator(selection: selection, stepItems: steps, title: { Text("T") })
        XCTAssertGreaterThan(spi2.steps.count, 0)
        
        // action only
        let spi3 = StepProgressIndicator(selection: selection, stepItems: steps, action: { Button("A") {} })
        XCTAssertGreaterThan(spi3.steps.count, 0)
        
        // neither
        let spi4 = StepProgressIndicator(selection: selection, stepItems: steps)
        XCTAssertGreaterThan(spi4.steps.count, 0)
    }
}
