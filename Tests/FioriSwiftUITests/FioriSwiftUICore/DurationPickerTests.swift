@testable import FioriSwiftUICore
import SwiftUI
import XCTest

final class DurationPickerTests: XCTestCase {
    func testPrimaryInitializer() {
        var selectionValue = 3
        let selectionBinding = Binding<Int>(get: { selectionValue }, set: { newValue in selectionValue = newValue })
        
        var visibilityValue = false
        let visibilityBinding = Binding<Bool>(get: { visibilityValue }, set: { newValue in visibilityValue = newValue })
        let errorMessage = AttributedString("Error date")
        
        let picker = DurationPicker(title: { Text("Test Title") },
                                    valueLabel: { Text("Test Value") },
                                    controlState: .selected,
                                    errorMessage: errorMessage,
                                    selection: selectionBinding,
                                    maximumMinutes: 60,
                                    minimumMinutes: 30,
                                    minuteInterval: 1,
                                    measurementFormatter: MeasurementFormatter(),
                                    pickerVisible: visibilityBinding,
                                    componentIdentifier: nil)
        XCTAssertNotNil(picker.title)
        XCTAssertNotNil(picker.valueLabel)
        XCTAssertEqual(picker.controlState, .selected)
        XCTAssertEqual(picker.errorMessage, errorMessage)
        
        XCTAssertEqual(picker.selection, 3)
        selectionBinding.wrappedValue = 2
        XCTAssertEqual(selectionValue, 2)
        XCTAssertEqual(picker.selection, 2)
        
        XCTAssertEqual(picker.maximumMinutes, 60)
        XCTAssertEqual(picker.minimumMinutes, 30)
        XCTAssertEqual(picker.minuteInterval, 1)
        
        XCTAssertFalse(picker.pickerVisible)
        visibilityBinding.wrappedValue = true
        XCTAssertTrue(picker.pickerVisible)
    }
}
