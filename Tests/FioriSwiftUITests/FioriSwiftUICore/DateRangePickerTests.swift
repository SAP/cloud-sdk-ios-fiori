@testable import FioriSwiftUICore
import SwiftUI
import XCTest

final class DateRangePickerTests: XCTestCase {
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testDatePickerConfigurations() {
        let title = AttributedString("Range Selection")
        let selectedRange: ClosedRange<Date>? = Date.now ... Date.now
        let range: Range<Date>? = Date.now ..< Date(timeIntervalSinceNow: 24 * 60 * 60 * 3)
        let visible = true
        let rangeFormatter = DateFormatter()
        rangeFormatter.dateFormat = "yyyy/mm/dd"
        let noRangeSelectedString = "Please select range"
        
        let picker = DateRangePicker(
            title: title,
            range: range,
            selectedRange: .constant(selectedRange),
            rangeFormatter: rangeFormatter,
            noRangeSelectedString: noRangeSelectedString,
            pickerVisible: .constant(visible)
        )
        
        XCTAssertEqual(picker.selectedRange, selectedRange)
        XCTAssertEqual(picker.pickerVisible, visible)
        XCTAssertEqual(picker.rangeFormatter, rangeFormatter)
        XCTAssertEqual(picker.noRangeSelectedString, noRangeSelectedString)
        if let range = picker.range {
            XCTAssertTrue(range.contains(Date(timeIntervalSinceNow: 24 * 60 * 60 * 1)))
        }
        XCTAssertEqual(picker.controlState, .normal)
    }
    
    func testDatePickerBaseStyle() {
        let title = AttributedString("Range Selection")
        var selectedRange: ClosedRange<Date>? = nil
        let range: Range<Date>? = Date.now ..< Date(timeIntervalSinceNow: 24 * 60 * 60 * 3)
        let visible = true
        let rangeFormatter = DateFormatter()
        rangeFormatter.dateFormat = "yyyy/mm/dd"
        let noRangeSelectedString = "Please select range"
        
        let configuration = DateRangePickerConfiguration(title: DateRangePickerConfiguration.Title(Text(title)), valueLabel: DateRangePickerConfiguration.ValueLabel(Text("")), controlState: .normal, errorMessage: nil, range: range, selectedRange: Binding(get: {
            selectedRange
        }, set: {
            selectedRange = $0
        }), rangeFormatter: rangeFormatter, noRangeSelectedString: noRangeSelectedString, pickerVisible: .constant(visible))
        
        let modelObject = DateRangePickerModelObject()
        modelObject.getDateComponentsFromDates(configuration)
        XCTAssert(modelObject.tapCount == 0)
        XCTAssert(modelObject.selectedDates.count == 0)
        XCTAssertEqual(configuration.selectedRange, nil)
        
        let startDate = Date.now
        let endDate = Date(timeIntervalSinceNow: 24 * 60 * 60 * 4)

        let startNewSelection = Calendar.current.dateComponents(
            modelObject.components, from: startDate
        )
        
        modelObject.handleDateSelection(configuration, newSelection: [startNewSelection])
        XCTAssert(modelObject.tapCount == 1)
        XCTAssert(modelObject.selectedDates.count == 1)
        XCTAssertEqual(configuration.selectedRange, nil)
        
        let endNewSelection = Calendar.current.dateComponents(
            modelObject.components, from: endDate
        )
        
        modelObject.handleDateSelection(configuration, newSelection: [startNewSelection, endNewSelection])
        XCTAssert(modelObject.tapCount == 2)
        XCTAssert(modelObject.selectedDates.count == 5)
        if let selectedRange = configuration.selectedRange {
            let rangeFormatter = DateFormatter()
            XCTAssertEqual(rangeFormatter.string(from: selectedRange.lowerBound), rangeFormatter.string(from: startDate))
            XCTAssertEqual(rangeFormatter.string(from: selectedRange.upperBound), rangeFormatter.string(from: endDate))
        }
        
        // click any day to cancel the selection
        modelObject.handleDateSelection(configuration, newSelection: [endNewSelection])
        XCTAssert(modelObject.tapCount == 0)
        XCTAssert(modelObject.selectedDates.count == 0)
        XCTAssertEqual(configuration.selectedRange, nil)
        
        // select range in one day
        modelObject.handleDateSelection(configuration, newSelection: [startNewSelection])
        modelObject.handleDateSelection(configuration, newSelection: [startNewSelection])
        XCTAssert(modelObject.selectedDates.count == 1)
        if let selectedRange = configuration.selectedRange {
            let rangeFormatter = DateFormatter()
            XCTAssertEqual(rangeFormatter.string(from: selectedRange.lowerBound), rangeFormatter.string(from: startDate))
            XCTAssertEqual(rangeFormatter.string(from: selectedRange.upperBound), rangeFormatter.string(from: startDate))
        }
    }
}
