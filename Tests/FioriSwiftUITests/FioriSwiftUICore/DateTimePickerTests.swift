@testable import FioriSwiftUICore
import SwiftUI
import XCTest

final class DateTimePickerTests: XCTestCase {
    func testPrimaryInitializer() {
        let dateBinding = Binding<Date>(get: { Date() }, set: { _ in })
        let visibilityBinding = Binding<Bool>(get: { false }, set: { _ in })
        
        let picker = DateTimePicker(
            title: { Text("Test Title") },
            selectedDate: dateBinding,
            pickerVisible: visibilityBinding
        )
        
        XCTAssertNotNil(picker.title)
        XCTAssertEqual(picker.controlState, .normal)
        XCTAssertEqual(picker.pickerComponents, [.date, .hourAndMinute])
    }
    
    func testStyleConfigurations() {
        let picker = DateTimePicker(
            title: AttributedString("Style Test"),
            selectedDate: .constant(Date()),
            pickerComponents: [.date],
            dateStyle: .long,
            timeStyle: .complete,
            pickerVisible: .constant(false)
        )
        
        XCTAssertEqual(picker.pickerComponents, [.date])
        XCTAssertEqual(picker.dateStyle, .long)
        XCTAssertEqual(picker.timeStyle, .complete)
    }
    
    func testErrorState() {
        let errorMessage = AttributedString("Invalid date")
        let picker = DateTimePicker(
            title: { Text("Error Test") },
            controlState: .disabled,
            errorMessage: errorMessage,
            selectedDate: .constant(Date()),
            pickerVisible: .constant(false)
        )
        
        XCTAssertEqual(picker.controlState, .disabled)
        XCTAssertEqual(picker.errorMessage, errorMessage)
    }
}
