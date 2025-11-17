import Foundation

/// The date model of the calendar.
@Observable
public class CalendarModel {
    /// The ID of the language to be used when displaying the `CalendarView`.
    var customLanguageId: String? {
        didSet {
            if oldValue != self.customLanguageId {
                self.updateTitle()
            }
        }
    }
    
    /// The calendar style. The default is `.month`.
    public var calendarStyle: CalendarStyle {
        didSet {
            if oldValue != self.calendarStyle {
                self.updateScrollPosition()
                if oldValue == .month || self.calendarStyle == .month {
                    self.handleMonthInfo()
                }
            }
        }
    }
    
    /// The start date of the calendar. Default is current year's first day.
    let startDate: Date
    
    /// The end date of the calendar. Default is next year's last day.
    let endDate: Date
    
    /// The display date at startup.
    let displayDateAtStartup: Date?
    
    /// This property indicates whether the month header should display. It's false by default.
    let showsMonthHeader: Bool
    
    /// The first day of the week for the calendar, default confirms system setting. The weekday units are one-based. For Gregorian and ISO 8601 calendars, 1 is Sunday, 2 is Monday, 3 is Tuesday, 4 is Wednesday, 5 is Thursday, 6 is Friday and 7 is Saturday.
    public var firstWeekday: Int {
        didSet {
            self.calendar.firstWeekday = self.firstWeekday
            self.handleWeekInfo()
            self.handleMonthInfo()
        }
    }
    
    /// The selected date in the calendar, used to single select, when the style is `.month`, `.fullScreenMonth`, `.week` or `.expandable`.
    public var selectedDate: Date? {
        didSet {
            if let oldSelectedDate = oldValue,
               let newSelectedDate = selectedDate,
               calendar.compare(oldSelectedDate, to: newSelectedDate, toGranularity: .day) != .orderedSame
            {
                self.updateScrollToDate()
                self.updateTitle()
            }
        }
    }
    
    /// The selected dates in the calendar, used to multi select, when the style is `.datesSelection`.
    public var selectedDates: Set<Date>? {
        didSet {
            self.updateTitle()
        }
    }
    
    /// The selected range in the calendar, used to range select, when the style is `.rangeSelection`.
    public var selectedRange: ClosedRange<Date>? {
        didSet {
            self.updateTitle()
        }
    }
    
    /// The disabled dates. Default is nil, which means all in month displayed dates are selectable.
    public var disabledDates: CalendarDisabledDates?
    
    /// Boolean indicates whether or not a selected date stays selected when the user scrolls away to another set of dates.
    ///
    /// The default is false for `month`, `week`, and `expandable` styles except for `rangeSelection` and `datesSelection` styles, which is always true (hence, if the developer sets `isPersistentSelection` to false, it will have no effect).
    /// In `month` style, the default behavior is that the first date of every month is selected when the month is displayed. (If the particular month contains today's date, then it is selected instead.) Also, the selection is not persistent. For example, on startup of the calendar, assume that January is displayed with Jan 1st selected. Then, if a user clicks on another date, for example Jan 25th, it is selected now. If the user then scrolls to Feb, then Feb 1st shows as selected. Scrolling back to January, the 1st of January is selected now and not the 25th as the user had previously selected.
    /// In the case where `isPersistentSelection` is true, then the behavior is as follows: No date is selected when the calendar is displayed or scrolled to another month, except if a date was set by the `selectDate`: (for month, week, expandable, and `datesSelection`) or `selectDateRange`:(for `multipleSelection View`) by the developer. When the user then selects another date, then this date is now selected, regardless of whether the user scrolls to any other month.
    let isPersistentSelection: Bool
    
    /// The property is used to scroll to customize date. Developer can use this property to display whatever date in the available date range.
    public var scrollToDate: Date {
        didSet {
            self.checkScrollToDate()
            if self.calendar.compare(oldValue, to: self.scrollToDate, toGranularity: .day) != .orderedSame {
                self.updateScrollPosition()
            }
        }
    }
    
    var calendar = Calendar.autoupdatingCurrent
    
    // swiftlint:disable cyclomatic_complexity
    /// Public initializer for CalendarModel.
    /// - Parameters:
    ///   - calendarStyle: The calendar style. The default is `.month`.
    ///   - startDate: The start date of the calendar. Default is current year's first day.
    ///   - endDate: The end date of the calendar. Default is next year's last day.
    ///   - displayDateAtStartup: The display date at startup.
    ///   - selectedDate: The selected date in the calendar, used to single select, when the style is `.month`, `.fullScreenMonth`, `.week` or `.expandable`.
    ///   - selectedDates: The selected dates in the calendar, used to multi select, when the style is `.datesSelection`.
    ///   - selectedRange: The selected range in the calendar, used to range select, when the style is `.rangeSelection`.
    ///   - disabledDates: The disabled dates. Default is nil, which means all in month displayed dates are selectable.
    ///   - isPersistentSelection: Boolean indicates whether or not a selected date stays selected when the user scrolls away to another set of dates. The default is false.
    ///   - scrollToDate: The property is used to scroll to customize date. Developer can use this property to display whatever date in the available date range.
    ///   - firstWeekday: The first day of the week for the calendar, default confirms system setting. The weekday units are one-based. For Gregorian and ISO 8601 calendars, 1 is Sunday, 2 is Monday, 3 is Tuesday, 4 is Wednesday, 5 is Thursday, 6 is Friday and 7 is Saturday.
    ///   - showsMonthHeader: This property indicates whether the month header should display.
    ///   - expandableStyleInWeekMode: This property indicates whether the expandable style in week mode first. Default is false. Only available when style is `.expandable`.
    public init(calendarStyle: CalendarStyle = .month, startDate: Date? = nil, endDate: Date? = nil, displayDateAtStartup: Date? = nil, selectedDate: Date? = nil, selectedDates: Set<Date>? = nil, selectedRange: ClosedRange<Date>? = nil, disabledDates: CalendarDisabledDates? = nil, isPersistentSelection: Bool = false, scrollToDate: Date? = nil, firstWeekday: Int? = nil, showsMonthHeader: Bool? = nil, expandableStyleInWeekMode: Bool = false) {
        self.calendarStyle = calendarStyle
        self.displayDateAtStartup = displayDateAtStartup
        self.selectedDate = selectedDate
        self.selectedDates = selectedDates
        self.selectedRange = selectedRange
        self.disabledDates = disabledDates
        self.isPersistentSelection = [.rangeSelection, .datesSelection].contains(calendarStyle) ? true : isPersistentSelection
        self.scrollToDate = scrollToDate ?? displayDateAtStartup ?? .now
        self.firstWeekday = firstWeekday ?? Calendar.current.firstWeekday
        
        let components: Set<Calendar.Component> = [.day, .month, .year]
        let formatter: DateFormatter = {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy MM dd"
            return dateFormatter
        }()
        
        var result: (startDate: Date, endDate: Date) = (Date.now, Date.now)
        let calendar = Calendar.autoupdatingCurrent
        if let startDate {
            result.startDate = startDate
        } else if let endDate {
            let dateComponents = calendar.dateComponents(components, from: endDate)
            if let endDateYear = dateComponents.year {
                let startYear = String(endDateYear - 1)
                let startYearStr = startYear + " 01 01"
                if let date = formatter.date(from: startYearStr) {
                    result.startDate = date
                }
            }
        }
        
        if let endDate {
            result.endDate = endDate
        } else if let startDate {
            let dateComponents = calendar.dateComponents(components, from: startDate)
            if let startDateYear = dateComponents.year {
                let endYear = String(startDateYear + 1)
                let endYearStr = endYear + " 12 31"
                if let date = formatter.date(from: endYearStr) {
                    result.endDate = date
                }
            }
        }
        
        var compareResult: ComparisonResult = .orderedSame
        if let startDate, let endDate {
            compareResult = startDate.compare(endDate)
        }
        
        // startDate must be smaller than endDate, otherwise the default dates will be used.
        if (startDate == nil && endDate == nil) || compareResult == .orderedDescending {
            let components = calendar.dateComponents(components, from: displayDateAtStartup ?? .now)
            if let currentYear = components.year {
                let startYear = String(currentYear)
                let startYearStr = startYear + " 01 01"
                
                let endYear = String(currentYear + 1)
                let endYearStr = endYear + " 12 31"
                
                if let date = formatter.date(from: startYearStr) {
                    result.startDate = date
                }
                if let date = formatter.date(from: endYearStr) {
                    result.endDate = date
                }
            }
        }
        
        self.startDate = result.startDate
        self.endDate = result.endDate
        
        self.showsMonthHeader = showsMonthHeader ?? false
        self.isExpanded = !expandableStyleInWeekMode
        
        self.handleWeekInfo()
        self.handleMonthInfo()
        self.checkScrollToDate()
        
        self.updateScrollPosition()
        self.updateTitle()
    }
    
    var weeks: [CalendarWeekInfo] = []
    var months: [CalendarMonthModel] = []
    
    var monthViewHeight: CGFloat = 300 {
        didSet {
            if oldValue != self.monthViewHeight {
                self.currentMonthOriginHeight = self.monthViewHeight
            }
        }
    }

    var currentMonthOriginHeight: CGFloat = 0
    
    var scrollPosition: Int? = 0 {
        didSet {
            if oldValue != self.scrollPosition {
                self.handleScrollPositionChange()
            }
        }
    }

    var weekViewScrollPosition: Int? = 0 {
        didSet {
            if oldValue != self.weekViewScrollPosition {
                self.handleWeekScrollPositionChange(oldValue, self.weekViewScrollPosition)
            }
        }
    }
    
    var title: String?
    
    var isDragging = false
    var isExpanded = true {
        didSet {
            self.updateScrollPosition()
        }
    }
    
    /*
     Make sure the display date in the available range.
     * If the display date in not in the range, check today.
     * If today is in the range, show today.
     * Otherwise show the startDate.
     */
    func checkScrollToDate() {
        if !checkDateRangeContainsDate(self.startDate ... self.endDate, date: self.scrollToDate) {
            if checkDateRangeContainsDate(self.startDate ... self.endDate, date: .now) {
                self.scrollToDate = .now
            } else {
                self.scrollToDate = self.startDate
            }
        }
    }
    
    func handleWeekInfo() {
        // Get the first Day of the week
        guard var firstDayOfWeek = self.calendar.date(from: self.calendar.dateComponents([.yearForWeekOfYear, .weekOfYear], from: startDate)) else { return }
        
        let totalWeeksNumber = self.weeksOffsetBetweenDates(start: self.startDate, end: self.endDate) + 1
        
        var weeks: [CalendarWeekInfo] = []
        for _ in 0 ..< totalWeeksNumber {
            let weekNumber = self.calendar.component(.weekOfYear, from: firstDayOfWeek)
            var dates: [Date] = []
            for dayOffset in 0 ..< 7 {
                if let date = calendar.date(byAdding: .day, value: dayOffset, to: firstDayOfWeek) {
                    dates.append(date)
                }
            }
            let weekInfo = CalendarWeekInfo(weekNumber: weekNumber, dates: dates)
            weeks.append(weekInfo)
            
            guard let nextFirstDayOfWeek = self.calendar.date(byAdding: .day, value: 7, to: firstDayOfWeek) else { return }
            firstDayOfWeek = nextFirstDayOfWeek
        }
        self.weeks = weeks
    }
    
    func handleMonthInfo() {
        var months: [CalendarMonthModel] = []
        let total = self.monthsBetweenDates(start: self.startDate, end: self.endDate) + 1
        for index in 0 ..< total {
            if let nextDate = self.calendar.date(byAdding: .month, value: index, to: self.startDate) {
                let startComponents = self.calendar.dateComponents([.year, .month], from: nextDate)
                if let year = startComponents.year, let month = startComponents.month {
                    var components = DateComponents()
                    components.year = year
                    components.month = month
                    
                    guard let startDate = self.calendar.date(from: components) else { return }
                    
                    // Get the first Day of the week
                    guard var firstDayOfWeek = self.calendar.date(from: self.calendar.dateComponents([.yearForWeekOfYear, .weekOfYear], from: startDate)) else { return }
                    
                    guard let range = self.calendar.range(of: .weekOfMonth, in: .month, for: startDate) else { return }
                    
                    var weeks: [CalendarWeekInfo] = []
                    
                    let weeksCountInMonth = [.month, .expandable].contains(self.calendarStyle) ? 6 : range.count
                    
                    for _ in 0 ..< weeksCountInMonth {
                        let weekNumber = self.calendar.component(.weekOfYear, from: firstDayOfWeek)
                        var dates: [Date] = []
                        for dayOffset in 0 ..< 7 {
                            if let date = self.calendar.date(byAdding: .day, value: dayOffset, to: firstDayOfWeek) {
                                dates.append(date)
                            }
                        }
                        let weekInfo = CalendarWeekInfo(year: year, month: month, weekNumber: weekNumber, dates: dates)
                        weeks.append(weekInfo)
                        
                        guard let nextFirstDayOfWeek = self.calendar.date(byAdding: .day, value: 7, to: firstDayOfWeek) else { return }
                        firstDayOfWeek = nextFirstDayOfWeek
                    }
                    let monthModel = CalendarMonthModel(year: year, month: month, weeks: weeks)
                    months.append(monthModel)
                }
            }
        }
        self.months = months
    }
    
    func weeksOffsetBetweenDates(start: Date, end: Date) -> Int {
        let weekComponents = self.calendar.dateComponents([.weekOfYear], from: start, to: end)
        
        var additionalOffset = 0
        if let startWeekDay = calendar.dateComponents([.weekday], from: start).weekday,
           let endWeekDay = calendar.dateComponents([.weekday], from: end).weekday
        {
            additionalOffset = endWeekDay < startWeekDay ? 1 : 0
        }
        
        return abs(weekComponents.weekOfYear ?? 0) + additionalOffset
    }
    
    func monthsBetweenDates(start: Date, end: Date) -> Int {
        let startComponents = self.calendar.dateComponents([.year, .month], from: start)
        let endComponents = self.calendar.dateComponents([.year, .month], from: end)
        
        var total = 0
        
        if let endYear = endComponents.year, let startYear = startComponents.year,
           let endMonth = endComponents.month, let startMonth = startComponents.month
        {
            let yearOffset = endYear - startYear
            let monthOffset = endMonth - startMonth
            total = yearOffset * 12 + monthOffset
        }
        return total
    }
    
    // swiftlint:disable cyclomatic_complexity
    func updateTitle() {
        let fm = DateFormatter()
        if let customLanguageId {
            fm.locale = Locale(identifier: customLanguageId)
        } else {
            fm.locale = Calendar.current.locale
        }
        fm.setLocalizedDateFormatFromTemplate("yyyy MMM")
        
        var title = ""
        
        if self.calendarStyle == .week || (self.calendarStyle == .expandable && !self.isExpanded && !self.isDragging) {
            if let index = self.weekViewScrollPosition,
               index < self.weeks.count
            {
                if let selectedDate,
                   self.weeks[index].containsDate(selectedDate)
                {
                    title = fm.string(from: selectedDate)
                } else if let firstDate = self.weeks[index].dates.first {
                    title = fm.string(from: firstDate)
                }
            }
        } else if let index = scrollPosition {
            if let nextDate = self.calendar.date(byAdding: .month, value: index, to: startDate) {
                title = fm.string(from: nextDate)
            }
        }
        
        if self.calendarStyle == .rangeSelection {
            fm.setLocalizedDateFormatFromTemplate("yyyy MMM dd")
            if let lowerBound = self.selectedRange?.lowerBound,
               let upperBound = self.selectedRange?.upperBound
            {
                title = "\(fm.string(from: lowerBound)) - \(fm.string(from: upperBound))"
            } else if let selectedDate {
                title = fm.string(from: selectedDate)
            }
        } else if self.calendarStyle == .datesSelection {
            if let dates = selectedDates,
               !dates.isEmpty
            {
                if dates.count == 1 {
                    title = String(format: "%d Date Selected".localizedFioriString(), 1)
                } else {
                    title = String(format: "%d Dates Selected".localizedFioriString(), dates.count)
                }
            }
        }
        self.title = title
    }
    
    func updateScrollPosition() {
        if self.calendarStyle == .week || (self.calendarStyle == .expandable && !self.isExpanded && !self.isDragging) {
            if !self.weeks.isEmpty {
                self.weekViewScrollPosition = self.weeksOffsetBetweenDates(start: self.startDate, end: self.scrollToDate)
            }
        } else if !self.months.isEmpty {
            self.scrollPosition = self.monthsBetweenDates(start: self.startDate, end: self.scrollToDate)
        }
    }
    
    func handleScrollPositionChange() {
        if !self.isPersistentSelection,
           self.calendarStyle != .week,
           let value = self.scrollPosition,
           let nextDate = self.calendar.date(byAdding: .month, value: value, to: self.startDate)
        {
            if let selectedDate = self.selectedDate, self.calendar.compare(selectedDate, to: nextDate, toGranularity: .month) == .orderedSame {
                // do nothing
            } else {
                let startComponents = self.calendar.dateComponents([.year, .month], from: nextDate)
                let currentComponents = self.calendar.dateComponents([.year, .month], from: Date())
                if let year = startComponents.year,
                   let month = startComponents.month,
                   let currentYear = currentComponents.year,
                   let currentMonth = currentComponents.month
                {
                    if year == currentYear, month == currentMonth {
                        self.selectedDate = Date()
                    } else {
                        let dateFormatter = DateFormatter()
                        dateFormatter.dateFormat = "yyyy MM dd"
                        let preSelectDate = dateFormatter.date(from: "\(year) \(month) 01")
                        self.selectedDate = preSelectDate
                    }
                }
            }
        }
        self.updateTitle()
        self.updateScrollToDate()
    }
    
    func handleWeekScrollPositionChange(_ oldValue: Int?, _ newValue: Int?) {
        if !self.isPersistentSelection,
           let oldValue,
           let newValue,
           oldValue != newValue
        {
            if let selectedDate {
                if oldValue < self.weeks.count, self.weeks[oldValue].containsDate(selectedDate) {
                    let nextDate = self.calendar.date(byAdding: .day, value: (newValue - oldValue) * 7, to: selectedDate)
                    self.selectedDate = nextDate
                }
            } else if newValue < self.weeks.count {
                for date in self.weeks[newValue].dates {
                    if self.calendar.compare(date, to: Date(), toGranularity: .day) == .orderedSame {
                        self.selectedDate = date
                        break
                    }
                }
            }
        }
        self.updateTitle()
        self.updateScrollToDate()
    }

    /*
     In .expandable style, the view can transit between weekView and monthView
     */
    func updateScrollToDate() {
        if self.calendarStyle == .week || (self.calendarStyle == .expandable && !self.isExpanded && !self.isDragging) {
            if let index = self.weekViewScrollPosition,
               index < self.weeks.count
            {
                if let selectedDate,
                   self.weeks[index].containsDate(selectedDate)
                {
                    self.scrollToDate = selectedDate
                } else if let firstDate = self.weeks[index].dates.first {
                    self.scrollToDate = firstDate
                }
            }
        } else if let index = scrollPosition {
            if let nextDate = self.calendar.date(byAdding: .month, value: index, to: startDate) {
                if let selectedDate,
                   self.calendar.compare(selectedDate, to: nextDate, toGranularity: .month) == .orderedSame
                {
                    self.scrollToDate = selectedDate
                } else {
                    self.scrollToDate = nextDate
                }
            }
        }
    }
    
    var showsOutOfMonthDates: Bool {
        let notIncludeConditions: [CalendarStyle] = [
            .datesSelection,
            .rangeSelection,
            .fullScreenMonth
        ]
        return !notIncludeConditions.contains(self.calendarStyle)
    }

    var showFullScreen: Bool {
        let conditions: [CalendarStyle] = [
            .fullScreenMonth,
            .datesSelection,
            .rangeSelection
        ]
        return conditions.contains(self.calendarStyle)
    }
}
