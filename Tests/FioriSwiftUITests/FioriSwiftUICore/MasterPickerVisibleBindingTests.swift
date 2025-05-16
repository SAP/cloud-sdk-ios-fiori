import SwiftUI
import XCTest

class MasterPickerVisibleBindingTests: XCTestCase {
    class TestHost {
        var pickerVisible = false
        var pickerVisible1 = false
        var pickerVisible2 = false
        var pickerVisible3 = false
        var pickerVisible4 = false
        var pickerVisible5 = false
        
        var masterPickerVisibleBinding: Binding<Bool> {
            Binding {
                [self.pickerVisible, self.pickerVisible1, self.pickerVisible2,
                 self.pickerVisible3, self.pickerVisible4, self.pickerVisible5]
                    .allSatisfy { $0 }
            } set: { newValue in
                self.pickerVisible = newValue
                self.pickerVisible1 = newValue
                self.pickerVisible2 = newValue
                self.pickerVisible3 = newValue
                self.pickerVisible4 = newValue
                self.pickerVisible5 = newValue
            }
        }
    }

    func testMasterPickerVisibleBindingGet() {
        let host = TestHost()
        host.pickerVisible = true
        host.pickerVisible1 = true
        
        XCTAssertFalse(host.masterPickerVisibleBinding.wrappedValue)
        
        host.pickerVisible5 = true
        XCTAssertFalse(host.masterPickerVisibleBinding.wrappedValue)
    }

    func testMasterPickerVisibleBindingSet() {
        let host = TestHost()
        host.masterPickerVisibleBinding.wrappedValue = true
        
        XCTAssertTrue(host.pickerVisible)
        XCTAssertTrue(host.pickerVisible1)
        XCTAssertTrue(host.pickerVisible5)
    }
}
