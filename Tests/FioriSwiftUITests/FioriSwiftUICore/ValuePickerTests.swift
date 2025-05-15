@testable import FioriSwiftUICore
import SwiftUI
import XCTest

final class ValuePickerTests: XCTestCase {
    func testPrimaryInitializer() {
        var selectionValue = 3
        let selectionBinding = Binding<Int>(get: { selectionValue }, set: { newValue in selectionValue = newValue })
        
        var visibilityValue = false
        let visibilityBinding = Binding<Bool>(get: { visibilityValue }, set: { newValue in visibilityValue = newValue })
        
        let picker = ValuePicker(title: { Text("Test Title") },
                                 valueLabel: { Text("Test Value") },
                                 options: [],
                                 selectedIndex: selectionBinding,
                                 alwaysShowPicker: false,
                                 controlState: .normal,
                                 pickerVisible: visibilityBinding)

        XCTAssertNotNil(picker.title)
        XCTAssertNotNil(picker.valueLabel)
        XCTAssertEqual(picker.controlState, .normal)
        
        XCTAssertEqual(picker.selectedIndex, 3)
        selectionBinding.wrappedValue = 2
        XCTAssertEqual(selectionValue, 2)
        XCTAssertEqual(picker.selectedIndex, 2)
        
        XCTAssertFalse(picker.alwaysShowPicker)
        
        XCTAssertFalse(picker.pickerVisible)
        visibilityBinding.wrappedValue = true
        XCTAssertTrue(picker.pickerVisible)
    }
}
