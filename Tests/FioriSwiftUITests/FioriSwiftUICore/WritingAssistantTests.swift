@testable import FioriSwiftUICore
import SwiftUI
import XCTest

final class WATextInputModifierTests: XCTestCase {
    var textValue: String = "Initial"
    let menus = [[WAMenu(title: "Test")]]
    let menuHandler: (WAMenu, String) async -> WAResult = { _, _ in .success("result") }
    let feedbackHandler: (AIUserFeedbackVoteState, [String]) async -> WAFeedbackResult = { _, _ in .success }
    var text: Binding<String> {
        Binding<String>(get: { self.textValue },
                        set: { newValue in self.textValue = newValue })
    }

    func testKeyboardPublisher() {
        let modifier = WATextInputModifier(
            text: text,
            menus: menus,
            menuHandler: menuHandler,
            feedbackOptions: [],
            feedbackHandler: feedbackHandler
        )
        
        let expectation = XCTestExpectation(description: "Keyboard publisher emits")
        let cancellable = modifier.keyboardPublisher.sink { value in
            XCTAssertNotNil(value)
            expectation.fulfill()
        }
        NotificationCenter.default.post(name: UIResponder.keyboardWillShowNotification, object: nil)
        wait(for: [expectation], timeout: 1)
        cancellable.cancel()
    }
    
    func testShowPanel() {
        let textInput = TestTextInputView(showPanel: .constant(false))
        XCTAssertFalse(textInput.modifier.context.isInWAFlow)
        
        let textInput2 = TestTextInputView(showPanel: .constant(true))
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            XCTAssertTrue(textInput2.modifier.context.isInWAFlow)
        }
    }
}

private struct TestTextInputView: View {
    @State var text: String = "Initial"
    let menus = [[WAMenu(title: "Test")]]
    let menuHandler: (WAMenu, String) async -> WAResult = { _, _ in .success("result") }
    let feedbackHandler: (AIUserFeedbackVoteState, [String]) async -> WAFeedbackResult = { _, _ in .success }
    var modifier: WATextInputModifier {
        WATextInputModifier(
            text: self.$text,
            menus: self.menus,
            menuHandler: self.menuHandler,
            feedbackOptions: [],
            feedbackHandler: self.feedbackHandler
        )
    }
    
    var showPanel: Binding<Bool>
    
    init(showPanel: Binding<Bool>) {
        self.showPanel = showPanel
    }
    
    var body: some View {
        NoteFormView(text: self.$text)
            .modifier(self.modifier)
            .waShowPanel(self.showPanel)
    }
}

final class WritingAssistantContextTests: XCTestCase {
    func testInitAndBasicProperties() {
        let menu = WAMenu(title: "Test Menu")
        let menus = [[menu]]
        let menuHandler: (WAMenu, String) async -> WAResult = { _, _ in .success("result") }
        let feedbackHandler: (AIUserFeedbackVoteState, [String]) async -> WAFeedbackResult = { _, _ in .success }
        let context = WritingAssistantContext(
            originalValue: "Hello",
            menus: menus,
            menuHandler: menuHandler,
            feedbackOptions: ["A", "B"],
            feedbackHandler: feedbackHandler
        )
        
        XCTAssertEqual(context.originalValue, "Hello")
        XCTAssertEqual(context.displayedValue, "Hello")
        XCTAssertEqual(context.menus.count, 1)
        XCTAssertFalse(context.inProgress)
        XCTAssertFalse(context.isPresented)
        XCTAssertFalse(context.showCancelAlert)
        XCTAssertFalse(context.showFeedbackSuccessToast)
        XCTAssertNil(context.customDestination)
        XCTAssertTrue(context.textIsChanged == false)
    }
    
    func testSetError() {
        let menuHandler: (WAMenu, String) async -> WAResult = { _, _ in .success("result") }
        let context = WritingAssistantContext(
            originalValue: "",
            menus: [],
            menuHandler: menuHandler,
            feedbackOptions: [],
            feedbackHandler: nil
        )
        let error = WAError(title: "Test error")
        context.setError(error, isFeedbackError: true, isInMenuView: false)
        XCTAssertTrue(context.errorModel.isFeedbackError)
        XCTAssertFalse(context.errorModel.isInMenuView)
    }
    
    func testRevertAndForwardValue() {
        let menuHandler: (WAMenu, String) async -> WAResult = { _, _ in .success("result") }
        let context = WritingAssistantContext(
            originalValue: "A",
            menus: [],
            menuHandler: menuHandler,
            feedbackOptions: [],
            feedbackHandler: nil
        )
        context.addNewValue("B", for: nil)
        context.addNewValue("C", for: nil)
        XCTAssertEqual(context.displayedValue, "C")
        context.revertToPreviousValue()
        XCTAssertEqual(context.displayedValue, "B")
        context.revertToPreviousValue()
        XCTAssertEqual(context.displayedValue, "A")
        context.forwardToNextValue()
        XCTAssertEqual(context.displayedValue, "B")
    }
}
