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
    
    func testDateRangePickerConfiguration() {
        let title = AttributedString("Range Selection")
        var selectedRange: ClosedRange<Date>? = Date.now ... Date.now
        let range: Range<Date>? = Date.now ..< Date(timeIntervalSinceNow: 24 * 60 * 60 * 30)
        let visible = true
        let rangeFormatter = DateFormatter()
        rangeFormatter.dateFormat = "yyyy/mm/dd"
        let noRangeSelectedString = "Please select range"
        
        let configuration = DateRangePickerConfiguration(title: DateRangePickerConfiguration.Title(Text(title)), valueLabel: DateRangePickerConfiguration.ValueLabel(Text("")), controlState: .normal, errorMessage: nil, range: range, selectedRange: Binding(get: {
            selectedRange
        }, set: {
            selectedRange = $0
        }), rangeFormatter: rangeFormatter, noRangeSelectedString: noRangeSelectedString, pickerVisible: .constant(visible))
        XCTAssertNotNil(configuration.title)
        XCTAssertNotNil(configuration.valueLabel)
        XCTAssertEqual(configuration.controlState, .normal)
        XCTAssertNil(configuration.errorMessage)
        XCTAssertEqual(configuration.range, range)
        XCTAssertEqual(configuration.selectedRange, selectedRange)
        XCTAssertEqual(configuration.rangeFormatter, rangeFormatter)
        XCTAssertEqual(configuration.noRangeSelectedString, noRangeSelectedString)
        XCTAssertTrue(configuration.pickerVisible)
    }
    
    func testDateRangePickerFioriStyle_ContentFioriStyle() {
        let contentFioriStyle = DateRangePickerFioriStyle.ContentFioriStyle()
        let view = contentFioriStyle.makeBody(self.configuration)
        XCTAssertNotNil(view)
        
        let fioriStyle = DateRangePickerFioriStyle()
        let v2 = fioriStyle.makeBody(self.configuration)
        XCTAssertNotNil(v2)
    }
    
    func testDateRangePickerFioriStyle_TitleFioriStyle() {
        let contentFioriStyle = DateRangePickerFioriStyle.TitleFioriStyle(dateRangePickerConfiguration: self.configuration)
        let titleConfiguration = TitleConfiguration(title: self.configuration.title)
        let view = contentFioriStyle.makeBody(titleConfiguration)
        XCTAssertNotNil(view)
    }
    
    func testDateRangePickerFioriStyle_ValueLabelFioriStyle() {
        let contentFioriStyle = DateRangePickerFioriStyle.ValueLabelFioriStyle(dateRangePickerConfiguration: self.configuration)
        let valueLabelConfiguration = ValueLabelConfiguration(valueLabel: self.configuration.valueLabel)
        let view = contentFioriStyle.makeBody(valueLabelConfiguration)
        XCTAssertNotNil(view)
    }
    
    func testDateRangePickerFioriStyle_FormViewFioriStyle() {
        let contentFioriStyle = DateRangePickerFioriStyle.FormViewFioriStyle(dateRangePickerConfiguration: self.configuration)
        let formViewConfiguration = FormViewConfiguration(controlState: self.configuration.controlState, errorMessage: self.configuration.errorMessage)
        let view = contentFioriStyle.makeBody(formViewConfiguration)
        XCTAssertNotNil(view)
    }
    
    func testDateRangePickerBaseStyle() {
        let style = DateRangePickerBaseStyle()
        let view = style.makeBody(self.configuration)
        XCTAssertNotNil(view)
        
        var configurationWithoutSelectedRange: DateRangePickerConfiguration {
            let title = AttributedString("Range Selection")
            var selectedRange: ClosedRange<Date>? = nil
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
        
        let style1 = DateRangePickerBaseStyle()
        let view1 = style.makeBody(configurationWithoutSelectedRange)
        XCTAssertNotNil(view1)
    }
}
