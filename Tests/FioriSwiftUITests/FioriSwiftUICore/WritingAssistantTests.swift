@testable import FioriSwiftUICore
import SwiftUI
import XCTest

final class WATextInputModifierTests: XCTestCase {
    var textValue: String = "Initial"
    
    func testKeyboardPublisher() {
        let menus = [[WAMenu(title: "Test")]]
        let menuHandler: (WAMenu, String) async -> WAResult = { _, _ in .success("result") }
        let feedbackHandler: (AIUserFeedbackVoteState, [String]) async -> WAFeedbackResult = { _, _ in .success }
        let text = Binding<String>(get: { self.textValue },
                                   set: { newValue in self.textValue = newValue })
        
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
