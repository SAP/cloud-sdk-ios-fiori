@testable import FioriSwiftUICore
import SwiftUI
import XCTest

final class DateRangePickerPopViewTests: XCTestCase {
    var configuration: DateRangePickerConfiguration {
        let title = AttributedString("Range Selection")
        var selectedRange: ClosedRange<Date>? = Date.now ... Date.now
        let range: Range<Date>? = Date.now ..< Date(timeIntervalSinceNow: 24 * 60 * 60 * 30)
        let visible = true
        let rangeFormatter = DateFormatter()
        rangeFormatter.dateFormat = "yyyy/mm/dd"
        let noRangeSelectedString = "Please select range"
        
        return DateRangePickerConfiguration(title: DateRangePickerConfiguration.Title(Text(title)), valueLabel: DateRangePickerConfiguration.ValueLabel(Text("")), controlState: .normal, errorMessage: nil, range: range, selectedRange: Binding(get: {
            selectedRange
        }, set: {
            selectedRange = $0
        }), rangeFormatter: rangeFormatter, noRangeSelectedString: noRangeSelectedString, pickerVisible: .constant(visible))
    }
    
    func testDateRangePickerPopView() {
        let dateRangePickerPopView = DateRangePickerPopView(startDate: configuration.range?.lowerBound, endDate: self.configuration.range?.upperBound, selectedRange: self.configuration.selectedRange, applyActionCallback: { selectedRange in
            print("selectedRange:\(selectedRange)")
        })
        
        let view = dateRangePickerPopView.body
        XCTAssertNotNil(view)
    }
}
