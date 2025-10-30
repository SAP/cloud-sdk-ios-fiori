import SwiftUI
import XCTest

@testable import FioriSwiftUICore

final class CalendarMonthViewTests: XCTestCase {
    var fm: DateFormatter {
        let fm = DateFormatter()
        fm.timeZone = Calendar.current.timeZone
        fm.locale = Calendar.current.locale
        fm.dateFormat = "yyyy MM dd"
        return fm
    }
    
    func testMonthView_DefaultInitialization() {
        let year = 2025
        let month = 10
        let startDate = self.fm.date(from: "2025 01 01")!
        let endDate = self.fm.date(from: "2025 12 31")!
        let view = CalendarMonthView(calendarStyle: .month, year: year, month: month, startDate: startDate, endDate: endDate)
        
        XCTAssertNotNil(view)
        XCTAssertEqual(view.calendarStyle, .month)
        XCTAssertEqual(view.year, 2025)
        XCTAssertEqual(view.month, 10)
        XCTAssertEqual(view.startDate, startDate)
        XCTAssertEqual(view.endDate, endDate)
        XCTAssertFalse(view.showMonthHeader)
        XCTAssertTrue(view.showOutOfMonth)
        XCTAssertNil(view.selectedDate)
        XCTAssertNil(view.selectedDates)
        XCTAssertNil(view.selectedRange)
        XCTAssertNil(view.disabledDates)
        XCTAssertNil(view.dayTappedCallback)
        XCTAssertTrue(view.customEventView(startDate).isEmpty)
    }
    
    func testMonthView_FullInitialization() {
        let year = 2025
        let month = 10
        let startDate = self.fm.date(from: "2025 01 01")!
        let endDate = self.fm.date(from: "2025 12 31")!
        let selectedDate = self.fm.date(from: "2025 10 27")!
        let disabledDates = CalendarDisabledDates(weekdays: [1, 2])
        let dayTappedCallback: (Date, CalendarDayState) -> Void = { date, state in
            print("Tapped date:\(date), state:\(state)")
        }
        let view = CalendarMonthView(calendarStyle: .month, year: year, month: month, startDate: startDate, endDate: endDate, showMonthHeader: true, selectedDate: selectedDate, disabledDates: disabledDates, dayTappedCallback: dayTappedCallback) { _ in
            Circle()
        }
        
        XCTAssertNotNil(view)
        XCTAssertEqual(view.calendarStyle, .month)
        XCTAssertEqual(view.year, 2025)
        XCTAssertEqual(view.month, 10)
        XCTAssertEqual(view.startDate, startDate)
        XCTAssertEqual(view.endDate, endDate)
        XCTAssertTrue(view.showMonthHeader)
        XCTAssertTrue(view.showOutOfMonth)
        XCTAssertEqual(view.selectedDate, selectedDate)
        XCTAssertNil(view.selectedDates)
        XCTAssertNil(view.selectedRange)
        XCTAssertTrue(disabledDates.isDisabled(self.fm.date(from: "2025 10 26")!))
        XCTAssertTrue(disabledDates.isDisabled(self.fm.date(from: "2025 10 27")!))
        XCTAssertNotNil(view.dayTappedCallback)
        XCTAssertFalse(view.customEventView(startDate).isEmpty)
    }
    
    func testMonthViewConfiguration() {
        let year = 2025
        let month = 10
        let startDate = self.fm.date(from: "2025 01 01")!
        let endDate = self.fm.date(from: "2025 12 31")!
        let selectedDate = self.fm.date(from: "2025 10 27")!
        let disabledDates = CalendarDisabledDates(weekdays: [1, 2])
        let dayTappedCallback: (Date, CalendarDayState) -> Void = { date, state in
            print("Tapped date:\(date), state:\(state)")
        }
        let configuration = CalendarMonthViewConfiguration(calendarStyle: .month, year: year, month: month, startDate: startDate, endDate: endDate, showMonthHeader: true, showOutOfMonth: true, selectedDate: selectedDate, selectedDates: nil, selectedRange: nil, disabledDates: disabledDates, dayTappedCallback: dayTappedCallback) { _ in
            Circle()
        }
        
        XCTAssertNotNil(configuration)
        XCTAssertEqual(configuration.calendarStyle, .month)
        XCTAssertEqual(configuration.year, 2025)
        XCTAssertEqual(configuration.month, 10)
        XCTAssertEqual(configuration.startDate, startDate)
        XCTAssertEqual(configuration.endDate, endDate)
        XCTAssertTrue(configuration.showMonthHeader)
        XCTAssertTrue(configuration.showOutOfMonth)
        XCTAssertEqual(configuration.selectedDate, selectedDate)
        XCTAssertNil(configuration.selectedDates)
        XCTAssertNil(configuration.selectedRange)
        XCTAssertTrue(disabledDates.isDisabled(self.fm.date(from: "2025 10 26")!))
        XCTAssertTrue(disabledDates.isDisabled(self.fm.date(from: "2025 10 27")!))
        XCTAssertNotNil(configuration.dayTappedCallback)
        XCTAssertFalse(configuration.customEventView(startDate).isEmpty)
        
        let style = CalendarMonthViewBaseStyle()
        
        XCTAssertEqual(style.monthText(configuration), "October")
        let weeks = style.weeks(configuration)
        XCTAssertEqual(weeks.count, 6)
        
        if let weekNumber = weeks.first?.weekNumber {
            if Calendar.autoupdatingCurrent.firstWeekday == 1 {
                XCTAssertEqual(weekNumber, 39)
            } else if Calendar.autoupdatingCurrent.firstWeekday == 2 {
                XCTAssertEqual(weekNumber, 40)
            }
        }
        
        if let firstDay = weeks.first?.dates.first {
            XCTAssertTrue(Calendar.current.compare(firstDay, to: self.fm.date(from: "2025 09 28")!, toGranularity: .day) == .orderedSame)
        }
        if let lastDay = weeks.last?.dates.last {
            XCTAssertTrue(Calendar.current.compare(lastDay, to: self.fm.date(from: "2025 11 08")!, toGranularity: .day) == .orderedSame)
        }
    }
}
