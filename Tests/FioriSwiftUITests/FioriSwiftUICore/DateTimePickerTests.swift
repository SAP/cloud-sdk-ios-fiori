@testable import FioriSwiftUICore
import SwiftUI
import XCTest

final class DateTimePickerTests: XCTestCase {
    func testPrimaryInitializer() {
        let dateBinding = Binding<Date?>(get: { Date() }, set: { _ in })
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
    
    func testSeparatorVisibility() {
        let dateBinding = Binding<Date?>(get: { Date() }, set: { _ in })
        let visibilityBinding = Binding<Bool>(get: { false }, set: { _ in })
        
        let picker = DateTimePicker(
            title: { Text("Test Title") },
            selectedDate: dateBinding,
            pickerVisible: visibilityBinding
        )
        XCTAssertFalse(picker.hidesSeparator)
        
        let picker2 = DateTimePicker(
            title: { Text("Test Title") },
            selectedDate: dateBinding,
            pickerVisible: visibilityBinding,
            hidesSeparator: true
        )
        XCTAssertTrue(picker2.hidesSeparator)
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
    
    // MARK: - DateTimePickerConfiguration Tests
    
    func testConfigurationDefaultValues() {
        let config = DateTimePickerConfiguration(
            title: .init(Text("Config Title")),
            valueLabel: .init(EmptyView()),
            controlState: .normal,
            errorMessage: nil,
            range: nil,
            selectedDate: .constant(nil),
            dateFormatter: nil,
            pickerComponents: [.date, .hourAndMinute],
            dateStyle: .abbreviated,
            timeStyle: .shortened,
            noDateSelectedString: nil,
            pickerVisible: .constant(false),
            hidesSeparator: false
        )
        
        XCTAssertEqual(config.controlState, .normal)
        XCTAssertNil(config.errorMessage)
        XCTAssertNil(config.range)
        XCTAssertNil(config.selectedDate)
        XCTAssertNil(config.dateFormatter)
        XCTAssertEqual(config.pickerComponents, [.date, .hourAndMinute])
        XCTAssertEqual(config.dateStyle, .abbreviated)
        XCTAssertEqual(config.timeStyle, .shortened)
        XCTAssertNil(config.noDateSelectedString)
        XCTAssertFalse(config.pickerVisible)
        XCTAssertFalse(config.hidesSeparator)
        XCTAssertFalse(config.showsClearAction)
    }
    
    func testConfigurationControlState() {
        let config = DateTimePickerConfiguration(
            title: .init(Text("Disabled")),
            valueLabel: .init(EmptyView()),
            controlState: .disabled,
            errorMessage: AttributedString("Error"),
            range: nil,
            selectedDate: .constant(nil),
            dateFormatter: nil,
            pickerComponents: [.date],
            dateStyle: .abbreviated,
            timeStyle: .shortened,
            noDateSelectedString: nil,
            pickerVisible: .constant(false),
            hidesSeparator: false
        )
        
        XCTAssertEqual(config.controlState, .disabled)
        XCTAssertEqual(config.errorMessage, AttributedString("Error"))
    }
    
    func testConfigurationPickerComponents() {
        let dateOnlyConfig = DateTimePickerConfiguration(
            title: .init(Text("Date Only")),
            valueLabel: .init(EmptyView()),
            controlState: .normal,
            errorMessage: nil,
            range: nil,
            selectedDate: .constant(nil),
            dateFormatter: nil,
            pickerComponents: [.date],
            dateStyle: .long,
            timeStyle: .omitted,
            noDateSelectedString: nil,
            pickerVisible: .constant(false),
            hidesSeparator: false
        )
        
        XCTAssertEqual(dateOnlyConfig.pickerComponents, [.date])
        XCTAssertEqual(dateOnlyConfig.dateStyle, .long)
        XCTAssertEqual(dateOnlyConfig.timeStyle, .omitted)
        
        let timeOnlyConfig = DateTimePickerConfiguration(
            title: .init(Text("Time Only")),
            valueLabel: .init(EmptyView()),
            controlState: .normal,
            errorMessage: nil,
            range: nil,
            selectedDate: .constant(nil),
            dateFormatter: nil,
            pickerComponents: [.hourAndMinute],
            dateStyle: .omitted,
            timeStyle: .complete,
            noDateSelectedString: nil,
            pickerVisible: .constant(false),
            hidesSeparator: false
        )
        
        XCTAssertEqual(timeOnlyConfig.pickerComponents, [.hourAndMinute])
        XCTAssertEqual(timeOnlyConfig.timeStyle, .complete)
    }
    
    func testConfigurationDateRange() {
        let start = Date(timeIntervalSince1970: 0)
        let end = Date(timeIntervalSince1970: 86400)
        let range = start ... end
        
        let config = DateTimePickerConfiguration(
            title: .init(Text("Range")),
            valueLabel: .init(EmptyView()),
            controlState: .normal,
            errorMessage: nil,
            range: range,
            selectedDate: .constant(start),
            dateFormatter: nil,
            pickerComponents: [.date],
            dateStyle: .abbreviated,
            timeStyle: .shortened,
            noDateSelectedString: nil,
            pickerVisible: .constant(false),
            hidesSeparator: false
        )
        
        XCTAssertEqual(config.range?.lowerBound, start)
        XCTAssertEqual(config.range?.upperBound, end)
        XCTAssertEqual(config.selectedDate, start)
    }
    
    func testConfigurationNoDateSelectedString() {
        let customString = "No date chosen"
        let config = DateTimePickerConfiguration(
            title: .init(Text("Custom Placeholder")),
            valueLabel: .init(EmptyView()),
            controlState: .normal,
            errorMessage: nil,
            range: nil,
            selectedDate: .constant(nil),
            dateFormatter: nil,
            pickerComponents: [.date, .hourAndMinute],
            dateStyle: .abbreviated,
            timeStyle: .shortened,
            noDateSelectedString: customString,
            pickerVisible: .constant(false),
            hidesSeparator: false
        )
        
        XCTAssertEqual(config.noDateSelectedString, customString)
    }
    
    func testConfigurationPickerVisibleBinding() {
        var isVisible = false
        let visibilityBinding = Binding<Bool>(
            get: { isVisible },
            set: { isVisible = $0 }
        )
        
        let config = DateTimePickerConfiguration(
            title: .init(Text("Visibility")),
            valueLabel: .init(EmptyView()),
            controlState: .normal,
            errorMessage: nil,
            range: nil,
            selectedDate: .constant(nil),
            dateFormatter: nil,
            pickerComponents: [.date, .hourAndMinute],
            dateStyle: .abbreviated,
            timeStyle: .shortened,
            noDateSelectedString: nil,
            pickerVisible: visibilityBinding,
            hidesSeparator: false
        )
        
        XCTAssertFalse(config.pickerVisible)
        config.pickerVisible = true
        XCTAssertTrue(isVisible)
    }
    
    func testConfigurationSelectedDateBinding() {
        let fixedDate = Date(timeIntervalSince1970: 1000000)
        var currentDate: Date? = nil
        let dateBinding = Binding<Date?>(
            get: { currentDate },
            set: { currentDate = $0 }
        )
        
        let config = DateTimePickerConfiguration(
            title: .init(Text("Date Binding")),
            valueLabel: .init(EmptyView()),
            controlState: .normal,
            errorMessage: nil,
            range: nil,
            selectedDate: dateBinding,
            dateFormatter: nil,
            pickerComponents: [.date, .hourAndMinute],
            dateStyle: .abbreviated,
            timeStyle: .shortened,
            noDateSelectedString: nil,
            pickerVisible: .constant(false),
            hidesSeparator: false
        )
        
        XCTAssertNil(config.selectedDate)
        config.selectedDate = fixedDate
        XCTAssertEqual(currentDate, fixedDate)
    }
    
    func testConfigurationComponentIdentifier() {
        let config = DateTimePickerConfiguration(
            title: .init(Text("ID Test")),
            valueLabel: .init(EmptyView()),
            controlState: .normal,
            errorMessage: nil,
            range: nil,
            selectedDate: .constant(nil),
            dateFormatter: nil,
            pickerComponents: [.date, .hourAndMinute],
            dateStyle: .abbreviated,
            timeStyle: .shortened,
            noDateSelectedString: nil,
            pickerVisible: .constant(false),
            hidesSeparator: false
        )
        
        XCTAssertEqual(config.componentIdentifier, DateTimePicker.identifier)
        XCTAssertEqual(config.componentIdentifier, "fiori_datetimepicker_component")
    }
    
    func testConfigurationIsDirectChild() {
        let config = DateTimePickerConfiguration(
            title: .init(Text("Direct Child")),
            valueLabel: .init(EmptyView()),
            controlState: .normal,
            errorMessage: nil,
            range: nil,
            selectedDate: .constant(nil),
            dateFormatter: nil,
            pickerComponents: [.date, .hourAndMinute],
            dateStyle: .abbreviated,
            timeStyle: .shortened,
            noDateSelectedString: nil,
            pickerVisible: .constant(false),
            hidesSeparator: false
        )
        
        XCTAssertTrue(config.isDirectChild(DateTimePicker.identifier))
        XCTAssertFalse(config.isDirectChild("other_component"))
    }
    
    func testConfigurationCustomDateFormatter() {
        let formatter = DateFormatter()
        formatter.dateFormat = "MM/dd/yyyy"
        
        let config = DateTimePickerConfiguration(
            title: .init(Text("Formatter")),
            valueLabel: .init(EmptyView()),
            controlState: .normal,
            errorMessage: nil,
            range: nil,
            selectedDate: .constant(nil),
            dateFormatter: formatter,
            pickerComponents: [.date],
            dateStyle: .abbreviated,
            timeStyle: .shortened,
            noDateSelectedString: nil,
            pickerVisible: .constant(false),
            hidesSeparator: false
        )
        
        XCTAssertNotNil(config.dateFormatter)
        XCTAssertEqual(config.dateFormatter?.dateFormat, "MM/dd/yyyy")
    }
}
