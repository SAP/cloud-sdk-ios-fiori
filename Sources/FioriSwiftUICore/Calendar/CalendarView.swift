import FioriThemeManager
import SwiftUI

public struct CalendarView: View {
    @Binding var selectedDate: Date?
    @Binding var selectedDates: Set<Date>?
    @Binding var selectedRange: ClosedRange<Date>?
    let disabledDates: CalendarDisabledDates?
    
    let customEventView: (Date) -> any View
    
    @State var customCalendarBackgroundColor: Color?
    
    private let calendar = Calendar.autoupdatingCurrent
    /// The title change callback when the current visible month and year of the calendar is displaying.
    let titleChangeCallback: ((String) -> Void)?
    /// The start date of the calendar. Default is current year's first day.
    let startDate: Date
    /// The end date of the calendar. Default is next year's last day.
    let endDate: Date
    /// The display date at startup. Default is today. When calendar scrolls, this property's will change to visible date.
    @Binding var displayDateAtStartup: Date?
    @Binding var style: CalendarStyle
    
    /**
     Boolean indicates whether or not a selected date stays selected when the user scrolls away to another set of dates.

     The default is false for `month`, `week`, and `expandable` styles except for `rangeSelection` and `datesSelection` styles, which is always true (hence, if the developer sets `isPersistentSelection` to false, it will have no effect).
     
     In `month` style, the default behavior is that the first date of every month is selected when the month is displayed. (If the particular month contains today's date, then it is selected instead.) Also, the selection is not persistent. For example, on startup of the calendar, assume that January is displayed with Jan 1st selected. Then, if a user clicks on another date, for example Jan 25th, it is selected now. If the user then scrolls to Feb, then Feb 1st shows as selected. Scrolling back to January, the 1st of January is selected now and not the 25th as the user had previously selected.
     
     In the case where `isPersistentSelection` is true, then the behavior is as follows: No date is selected when the calendar is displayed or scrolled to another month, except if a date was set by the `selectDate`: (for month, week, expandable, and `datesSelection`) or `selectDateRange`:(for `multipleSelection View`) by the developer. When the user then selects another date, then this date is now selected, regardless of whether the user scrolls to any other month.
     
     The value cannot be changed after it is set during initialization of the `calendarView`.
     */
    let isPersistentSelection: Bool
    
    @State private var offset: CGFloat = 0
    @State private var scrollPosition: Int? = 0

    @State private var weekViewScrollPosition: Int? = 0
    
    @State private var weekContainerHeight: CGFloat = 0
    
    /// The week displayed when the change from month view to week view
    @State private var targetWeekNumber: Int = 0
    
    private var totalMonths = 0
    
    @State private var pageHeights: [CGFloat] = [0] {
        didSet {
            if let scrollPosition, scrollPosition < pageHeights.count {
                self.currentMonthOriginHeight = self.pageHeights[scrollPosition]
            }
        }
    }

    @State private var weekViewHeight: CGFloat = 60
    @State private var lastPageHeight: CGFloat = 0
    private var weeks: [WeekInfo] = []
    
    @State private var isDragging = false
    @State private var dragGestureOffsetY: CGFloat = 0
    @State private var currentMonthOriginHeight: CGFloat = 0
    
    @State private var isExpanded = true
    
    @Environment(\.customLanguageId) var customLanguageId

    public var body: some View {
//        let _ = Self._printChanges()
        
        ZStack(alignment: .bottom, content: {
            let paddingOffset: CGFloat = 8
            
            VStack(spacing: 0, content: {
                WeekContainerView()
                    .padding(EdgeInsets(top: 0, leading: paddingOffset, bottom: 0, trailing: paddingOffset))
                
                if self.style == .week || (self.style == .expandable && !self.isExpanded && !self.isDragging) {
                    ScrollView(.horizontal, showsIndicators: false, content: {
                        LazyHStack {
                            ForEach(0 ..< self.weeks.count, id: \.self) { index in
                                let info = self.weeks[index]
                                WeekView(style: self.style, weekInfo: info, startDate: self.startDate, endDate: self.endDate, selectedDate: self.selectedDateRecord, disabledDates: self.disabledDates, dayTappedCallback: { date, dayViewState in
                                    self.handleDayViewTapGesture(date, state: dayViewState)
                                })
                                .frame(width: self.availableWidth - paddingOffset * 2)
                                .fioriSizeReader { size in
                                    DispatchQueue.main.async {
                                        self.weekViewHeight = size.height
                                    }
                                }
                            }
                        }
                        .scrollTargetLayout()
                    })
                    .scrollPosition(id: self.$weekViewScrollPosition, anchor: .leading)
                    .scrollTargetBehavior(.viewAligned(limitBehavior: .always))
                    .scrollBounceBehavior(.always)
                    .background(
                        RoundedRectangle(cornerRadius: 8.0)
                            .fill(self.fillBackgroundColor)
                    )
                    .frame(width: self.availableWidth - paddingOffset * 2, height: self.weekViewHeight)
                    .padding(EdgeInsets(top: 0, leading: paddingOffset, bottom: paddingOffset, trailing: paddingOffset))
                    .onAppear {
                        DispatchQueue.main.async {
                            self.updateScrollPosition()
                        }
                    }
                } else if self.style == .expandable {
                    ScrollView(.horizontal, showsIndicators: false, content: {
                        LazyHStack {
                            ForEach(0 ..< self.totalMonths, id: \.self) { index in
                                if let nextDate = calendar.date(byAdding: .month, value: index, to: startDate) {
                                    let startComponents = self.calendar.dateComponents([.year, .month], from: nextDate)
                                    if let year = startComponents.year, let month = startComponents.month {
                                        MonthView(style: self.style, year: year, month: month, startDate: self.startDate, endDate: self.endDate, showMonthHeader: false, showOutOfMonth: self.showOutOfMonth, selectedDate: self.selectedDateRecord, selectedDates: self.selectedDatesRecord, selectedRange: self.selectedRangeRecord, disabledDates: self.disabledDates, dayTappedCallback: { date, dayViewState in
                                            self.handleDayViewTapGesture(date, state: dayViewState)
                                        }, customEventView: self.customEventView)
                                            .frame(width: self.availableWidth - paddingOffset * 2)
                                            .fioriSizeReader { newValue in
                                                DispatchQueue.main.async { self.pageHeights[index] = newValue.height
                                                }
                                            }
                                    }
                                }
                            }
                        }
                        .scrollTargetLayout()
                    })
                    .scrollPosition(id: self.$scrollPosition, anchor: .leading)
                    .scrollTargetBehavior(.viewAligned(limitBehavior: .always))
                    .scrollBounceBehavior(.always)
                    .frame(width: self.availableWidth - paddingOffset * 2)
                    .ifApply(self.scrollPosition != nil, content: {
                        if self.isDragging, self.currentMonthOriginHeight > 0 {
                            return $0.frame(height: self.currentMonthOriginHeight)
                        } else {
                            return $0.frame(height: max(self.pageHeights[self.scrollPosition!], 300))
                        }
                    })
                    .ifApply(self.scrollPosition == nil, content: {
                        if self.isDragging, self.currentMonthOriginHeight > 0 {
                            return $0.frame(height: self.currentMonthOriginHeight)
                        } else {
                            return $0.frame(height: max(self.lastPageHeight, 300))
                        }
                    })
                    .clipped()
                    .background(
                        RoundedRectangle(cornerRadius: 8.0)
                            .fill(self.fillBackgroundColor)
                    )
                    .padding(EdgeInsets(top: 0, leading: paddingOffset, bottom: paddingOffset, trailing: paddingOffset))
                    .onAppear {}
                } else if self.style == .month || self.showFullScreen {
                    ScrollView(.vertical, showsIndicators: false, content: {
                        LazyVStack {
                            ForEach(0 ..< self.totalMonths, id: \.self) { index in
                                if let nextDate = calendar.date(byAdding: .month, value: index, to: startDate) {
                                    let startComponents = self.calendar.dateComponents([.year, .month], from: nextDate)
                                    if let year = startComponents.year, let month = startComponents.month {
                                        MonthView(style: self.style, year: year, month: month, startDate: self.startDate, endDate: self.endDate, showMonthHeader: true, showOutOfMonth: self.showOutOfMonth, selectedDate: self.selectedDateRecord, selectedDates: self.selectedDatesRecord, selectedRange: self.selectedRangeRecord, disabledDates: self.disabledDates, dayTappedCallback: { date, dayViewState in
                                            self.handleDayViewTapGesture(date, state: dayViewState)
                                        }, customEventView: self.customEventView)
                                            .fioriSizeReader { newValue in
                                                DispatchQueue.main.async { self.pageHeights[index] = newValue.height
                                                }
                                            }
                                    }
                                }
                            }
                        }
                        .scrollTargetLayout()
                    })
                    .scrollPosition(id: self.$scrollPosition, anchor: .top)
                    .scrollTargetBehavior(.viewAligned(limitBehavior: .always))
                    .scrollBounceBehavior(.always)
                    .background(
                        RoundedRectangle(cornerRadius: 8.0)
                            .fill(self.fillBackgroundColor)
                    )
                    .ifApply(self.scrollPosition != nil && self.style == .month, content: {
                        $0.frame(height: max(self.pageHeights[self.scrollPosition!], 300))
                    })
                    .ifApply(self.scrollPosition == nil && self.style == .month, content: {
                        $0.frame(height: max(self.lastPageHeight, 300))
                    })
                    .padding(EdgeInsets(
                        top: 0,
                        leading: paddingOffset,
                        bottom: self.showFullScreen ? -1 * self.safeAreaInsets.bottom : paddingOffset,
                        trailing: paddingOffset
                    ))
                    .onAppear {}
                }
                
                if self.style == .expandable {
                    CalendarDragView()
                        .gesture(
                            DragGesture()
                                .onChanged { value in
                                    self.isDragging = true
                                    self.dragGestureOffsetY = value.translation.height
                                    self.currentMonthOriginHeight += self.dragGestureOffsetY
                                    if let scrollPosition, scrollPosition < pageHeights.count {
                                        self.currentMonthOriginHeight = min(self.currentMonthOriginHeight, self.pageHeights[scrollPosition])
                                    }
                                }
                                .onEnded { _ in
                                    self.isDragging = false
                                    self.isExpanded.toggle()
                                    print("drag end, style:\(self.style), isDragging:\(self.isDragging), isExpanded:\(self.isExpanded)")
                                }
                        )
                }
                
            })
            .ifApply(self.scrollPosition != nil, content: {
                $0.animation(.spring, value: self.isExpanded)
            })
            .onAppear {
                DispatchQueue.main.async {
                    self.updateScrollPosition()
                    self.updateTitle()
                }
            }
            .onChange(of: self.selectedRange) { _, _ in
                if let dateRange = selectedRange,
                   let disabledDates,
                   disabledDates.isDisabled(dateRange.lowerBound) || disabledDates.isDisabled(dateRange.upperBound)
                {
                    self.selectedRangeRecord = nil
                } else {
                    self.selectedRangeRecord = self.selectedRange
                }
            }
            .onChange(of: self.selectedDates) { _, _ in
                self.selectedDatesRecord = self.selectedDates
            }
            .onChange(of: self.selectedDate) { _, _ in
                
                if let selectedDateRecord,
                   let selectedDate,
                   self.calendar.compare(selectedDateRecord, to: selectedDate, toGranularity: .day) != .orderedSame
                {
                    self.selectedDateRecord = self.selectedDate
                }
            }
            .onChange(of: self.scrollPosition) { _, _ in
                print("scrollPosition onChange:\(self.scrollPosition ?? 0)")
                self.handleScrollPositionChange()
                
                DispatchQueue.main.async {
                    if let scrollPosition, scrollPosition < self.pageHeights.count {
                        self.lastPageHeight = self.pageHeights[scrollPosition]
                    }
                }
            }
            .onChange(of: self.weekViewScrollPosition) { oldValue, newValue in
                self.handleWeekScrollPositionChange(oldValue, newValue)
            }
            .onChange(of: self.selectedDateRecord) { _, _ in
                self.updateTitle()
            }
            .onChange(of: self.selectedDatesRecord) { _, _ in
                self.updateTitle()
            }
            .onChange(of: self.selectedRangeRecord) { _, _ in
                self.updateTitle()
            }
            .onChange(of: self.style) { _, _ in
                self.updateScrollPosition()
            }
            .onChange(of: self.isExpanded) { _, _ in
                self.updateScrollPosition()
            }
            .onChange(of: self.displayDateAtStartup) {
                self.displayDateAtStartupRecord = self.displayDateAtStartup ?? .now
                if let date1 = $0,
                   let date2 = $1,
                   self.calendar.compare(date1, to: date2, toGranularity: .day) != .orderedSame
                {
                    self.updateScrollPosition()
                }
            }
            .fioriSizeReader { size in
                DispatchQueue.main.async {
                    self.availableWidth = max(paddingOffset * 2, size.width)
                }
            }
            .onGeometryChange(for: EdgeInsets.self, of: { proxy in
                proxy.safeAreaInsets
            }, action: { newValue in
                if self.safeAreaInsets != newValue, self.safeAreaInsets.bottom >= 0.0 {
                    DispatchQueue.main.async {
                        self.safeAreaInsets = newValue
                        print("self.safeAreaInsets:\(self.safeAreaInsets)")
                    }
                }
            })
            
            if self.style == .datesSelection, self.showBannerMessage {
                CalendarBannerView(title: "DatesSelectionBannerMessageKey".localizedFioriString(), bottomPadding: self.safeAreaInsets.bottom) {
                    self.showBannerMessage = false
                }
            }
        })
    }
    
    @State var availableWidth: CGFloat = 16
    @State var safeAreaInsets: EdgeInsets = .init(.zero)
    
    @State private var showBannerMessage: Bool = true
//    @State private var withToolBar: Bool = false
    
    var showOutOfMonth: Bool {
        let notIncludeConditions: [CalendarStyle] = [
            .datesSelection,
            .rangeSelection,
            .fullScreenMonth
        ]
        return !notIncludeConditions.contains(self.style)
    }

    var showFullScreen: Bool {
        let conditions: [CalendarStyle] = [
            .fullScreenMonth,
            .datesSelection,
            .rangeSelection
        ]
        return conditions.contains(self.style)
    }
    
    var scrollDirection: Axis.Set {
        (self.style == .week || (self.style == .expandable && !self.isExpanded)) ? .horizontal : .vertical
    }
    
    var fillBackgroundColor: Color {
        if [.rangeSelection, .datesSelection].contains(self.style) {
            self.customCalendarBackgroundColor ?? .preferredColor(.secondaryGroupedBackground)
        } else {
            self.customCalendarBackgroundColor ?? .preferredColor(.tertiaryGroupedBackground)
        }
    }
    
    @State var selectedDateRecord: Date? {
        didSet {
            self.selectedDate = self.selectedDateRecord
        }
    }

    @State var selectedDatesRecord: Set<Date>? {
        didSet {
            self.selectedDates = self.selectedDatesRecord
        }
    }

    @State var selectedRangeRecord: ClosedRange<Date>? {
        didSet {
            self.selectedRange = self.selectedRangeRecord
        }
    }
    
    @State var displayDateAtStartupRecord: Date = .now {
        didSet {
            self.displayDateAtStartup = self.displayDateAtStartupRecord
        }
    }
    
    public init(style: Binding<CalendarStyle> = .constant(.month), startDate: Date? = nil, endDate: Date? = nil, displayDateAtStartup: Binding<Date?> = .constant(nil), selectedDate: Binding<Date?> = .constant(nil), selectedDates: Binding<Set<Date>?> = .constant(nil), selectedRange: Binding<ClosedRange<Date>?> = .constant(nil), disabledDates: CalendarDisabledDates? = nil, isPersistentSelection: Bool = false, titleChangeCallback: ((String) -> Void)? = nil, customCalendarBackgroundColor: Color? = nil, @ViewBuilder customEventView: @escaping (Date) -> any View = { _ in EmptyView() }) {
        _style = style
        _selectedDate = selectedDate
        _selectedDateRecord = State(initialValue: selectedDate.wrappedValue)
        _selectedDates = selectedDates
        _selectedDatesRecord = State(initialValue: selectedDates.wrappedValue)
        _selectedRange = selectedRange
        _selectedRangeRecord = State(wrappedValue: selectedRange.wrappedValue)
        _displayDateAtStartup = displayDateAtStartup
        _displayDateAtStartupRecord = State(wrappedValue: displayDateAtStartup.wrappedValue ?? .now)
        self.disabledDates = disabledDates
        self.isPersistentSelection = [.rangeSelection, .datesSelection].contains(style.wrappedValue) ? true : isPersistentSelection
        self.titleChangeCallback = titleChangeCallback
        self.customCalendarBackgroundColor = customCalendarBackgroundColor
        
        let components: Set<Calendar.Component> = [.day, .month, .year]
        let formatter: DateFormatter = {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy MM dd"
            return dateFormatter
        }()
        
        var result: (startDate: Date, endDate: Date) = (Date.now, Date.now)
        if let startDate {
            result.startDate = startDate
        } else if let endDate {
            let dateComponents = self.calendar.dateComponents(components, from: endDate)
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
            let dateComponents = self.calendar.dateComponents(components, from: startDate)
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
            let components = self.calendar.dateComponents(components, from: _displayDateAtStartupRecord.wrappedValue)
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
        
        self.customEventView = customEventView
        
        self.weeks = self.handleWeekInfo()
        self.totalMonths = self.monthsBetweenDates(start: self.startDate, end: self.endDate) + 1
        
        _pageHeights = State(initialValue: Array(repeating: 0, count: self.totalMonths))
        
        if !checkDateRangeContainsDate(self.startDate ... self.endDate, date: _displayDateAtStartupRecord.wrappedValue) {
            // displayDateAtStartup is not within the calendar range.
            if checkDateRangeContainsDate(self.startDate ... self.endDate, date: Date()) {
                _displayDateAtStartupRecord.wrappedValue = Date()
            } else {
                _displayDateAtStartupRecord.wrappedValue = self.startDate
            }
        }
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
    
    @Environment(\.firstWeekday) var firstWeekday
    func handleWeekInfo() -> [WeekInfo] {
        // Get the first Day of the week
        guard var firstDayOfWeek = calendar.date(from: calendar.dateComponents([.yearForWeekOfYear, .weekOfYear], from: startDate)) else { return [] }
        
        let totalWeeksNumber = self.weeksOffsetBetweenDates(start: self.startDate, end: self.endDate) + 1
        
        var weeks: [WeekInfo] = []
        for _ in 0 ..< totalWeeksNumber {
            let weekNumber = self.calendar.component(.weekOfYear, from: firstDayOfWeek)
            var dates: [Date] = []
            for dayOffset in 0 ..< 7 {
                if let date = calendar.date(byAdding: .day, value: dayOffset, to: firstDayOfWeek) {
                    dates.append(date)
                }
            }
            let weekInfo = WeekInfo(weekNumber: weekNumber, dates: dates)
            weeks.append(weekInfo)
            
            guard let nextFirstDayOfWeek = calendar.date(byAdding: .day, value: 7, to: firstDayOfWeek) else { return [] }
            firstDayOfWeek = nextFirstDayOfWeek
        }
        return weeks
    }
    
    func handleDayViewTapGesture(_ date: Date, state: DayViewState) {
        if self.style == .datesSelection {
            if let checkDates = selectedDatesRecord, checkDates.contains(date) {
                self.selectedDatesRecord?.remove(date)
            } else {
                self.selectedDatesRecord?.insert(date)
            }
        } else {
            let calendar = Calendar.autoupdatingCurrent
            if self.style == .rangeSelection {
                if let checkRange = selectedRangeRecord {
                    if calendar.compare(date, to: checkRange.upperBound, toGranularity: .day) != .orderedDescending,
                       calendar.compare(date, to: checkRange.lowerBound, toGranularity: .day) != .orderedAscending
                    {
                        self.selectedRangeRecord = checkRange.lowerBound ... date
                    } else {
                        self.selectedRangeRecord = nil
                    }
                    self.selectedDateRecord = nil
                } else if let boundDate = selectedDateRecord {
                    let bounds = [boundDate, date].sorted()
                    if let first = bounds.first, let last = bounds.last {
                        self.selectedRangeRecord = first ... last
                    }
                    self.selectedDateRecord = nil
                } else {
                    self.selectedDateRecord = state.isSelected ? nil : date
                }
            } else {
                self.selectedDateRecord = state.isSelected ? nil : date
            }
        }
        self.updateTitle()
        self.updateDisplayDateAtStartup()
    }
    
    func handleScrollPositionChange() {
        if !self.isPersistentSelection,
           self.style != .week,
           let value = self.scrollPosition,
           let nextDate = self.calendar.date(byAdding: .month, value: value, to: self.startDate)
        {
            if let selectedDateRecord, self.calendar.compare(selectedDateRecord, to: nextDate, toGranularity: .month) == .orderedSame {
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
                        self.selectedDateRecord = Date()
                    } else {
                        let dateFormatter = DateFormatter()
                        dateFormatter.dateFormat = "yyyy MM dd"
                        let preSelectDate = dateFormatter.date(from: "\(year) \(month) 01")
                        self.selectedDateRecord = preSelectDate
                    }
                }
            }
        }
        self.updateTitle()
        self.updateDisplayDateAtStartup()
    }
    
    func handleWeekScrollPositionChange(_ oldValue: Int?, _ newValue: Int?) {
        if !self.isPersistentSelection,
           let oldValue,
           let newValue
        {
            if let lastSelectedDateRecord = self.selectedDateRecord {
                if oldValue < self.weeks.count, self.weeks[oldValue].containsDate(lastSelectedDateRecord) {
                    let nextDate = self.calendar.date(byAdding: .day, value: (newValue - oldValue) * 7, to: lastSelectedDateRecord)
                    self.selectedDateRecord = nextDate
                }
            } else if newValue < self.weeks.count {
                for date in self.weeks[newValue].dates {
                    if self.calendar.compare(date, to: Date(), toGranularity: .day) == .orderedSame {
                        self.selectedDateRecord = date
                        break
                    }
                }
            }
        }
        self.updateTitle()
        self.updateDisplayDateAtStartup()
    }
    
    func updateScrollPosition() {
        if self.style == .week || (self.style == .expandable && !self.isExpanded && !self.isDragging) {
            self.weekViewScrollPosition = self.weeksOffsetBetweenDates(start: self.startDate, end: self.displayDateAtStartupRecord)
        } else {
            print("self.displayDateAtStartupRecord:\(self.displayDateAtStartupRecord)")
            self.scrollPosition = self.monthsBetweenDates(start: self.startDate, end: self.displayDateAtStartupRecord)
        }
    }
    
    /*
     In .expandable style, the view can transit between weekView and monthView
     */
    func updateDisplayDateAtStartup() {
        if self.style == .week || (self.style == .expandable && !self.isExpanded && !self.isDragging) {
            if let index = self.weekViewScrollPosition,
               index < self.weeks.count
            {
                if let selectedDateRecord,
                   self.weeks[index].containsDate(selectedDateRecord)
                {
                    _displayDateAtStartupRecord.wrappedValue = selectedDateRecord
                } else if let firstDate = self.weeks[index].dates.first {
                    _displayDateAtStartupRecord.wrappedValue = firstDate
                }
            }
        } else if let index = scrollPosition {
            if let nextDate = self.calendar.date(byAdding: .month, value: index, to: startDate) {
                if let selectedDateRecord,
                   self.calendar.compare(selectedDateRecord, to: nextDate, toGranularity: .month) == .orderedSame
                {
                    _displayDateAtStartupRecord.wrappedValue = selectedDateRecord
                } else {
                    _displayDateAtStartupRecord.wrappedValue = nextDate
                }
            }
        }
    }
    
    func updateTitle() {
        let fm = DateFormatter()
        if let customLanguageId {
            fm.locale = Locale(identifier: customLanguageId)
        } else {
            fm.locale = Calendar.current.locale
        }
        fm.setLocalizedDateFormatFromTemplate("yyyy MMM")
        
        var title = ""
        
        if self.style == .week || (self.style == .expandable && !self.isExpanded && !self.isDragging) {
            if let index = self.weekViewScrollPosition,
               index < self.weeks.count
            {
                if let selectedDateRecord,
                   self.weeks[index].containsDate(selectedDateRecord)
                {
                    title = fm.string(from: selectedDateRecord)
                } else if let firstDate = self.weeks[index].dates.first {
                    title = fm.string(from: firstDate)
                }
            }
        } else if let index = scrollPosition {
            if let nextDate = self.calendar.date(byAdding: .month, value: index, to: startDate) {
                title = fm.string(from: nextDate)
            }
        }
        
        if self.style == .rangeSelection {
            fm.setLocalizedDateFormatFromTemplate("yyyy MMM dd")
            if let lowerBound = self.selectedRangeRecord?.lowerBound,
               let upperBound = self.selectedRangeRecord?.upperBound
            {
                title = "\(fm.string(from: lowerBound)) - \(fm.string(from: upperBound))"
            } else if let selectedDateRecord {
                title = fm.string(from: selectedDateRecord)
            }
        } else if self.style == .datesSelection {
            if let dates = selectedDatesRecord,
               dates.count > 0
            {
                if dates.count == 1 {
                    title = String(format: "%d Date Selected".localizedFioriString(), 1)
                } else {
                    title = String(format: "%d Dates Selected", dates.count)
                }
            }
        }
        
        self.titleChangeCallback?(title)
    }
}

//           let nextDate = self.calendar.date(byAdding: .day, value: (newValue - oldValue) * 7, to: selectedDateRecord)

#Preview {
    CalendarView(style: .constant(.month))
        .environment(\.showsWeekNumbers, true)
        .environment(\.alternateCalendarType, .chinese)
}
