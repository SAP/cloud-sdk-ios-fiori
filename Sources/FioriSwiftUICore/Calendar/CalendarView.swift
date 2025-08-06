import FioriThemeManager
import SwiftUI

struct ScrollOffsetKey: PreferenceKey {
    static var defaultValue: CGFloat = 0
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = nextValue()
    }
}

public struct CalendarView: View {
    let style: CalendarStyle
    
    @State private var offset: CGFloat = 0
    @State private var scrollPosition: Int? = 0
    
    @State private var weekContainerHeight: CGFloat = 0
    
    /// The week displayed when the change from month view to week view
    @State private var targetWeekNumber: Int = 0
    
    /// The start date of the calendar. Default is current year's first day.
    let startDate: Date
    /// The end date of the calendar. Default is next year's last day.
    let endDate: Date
    /// The display date at startup. Default is today.
    let displayDateAtStartup: Date
    
    @State private var totalMonths = 0
    @State private var pageHeights: [CGFloat] = [0]
    @State private var lastPageHeight: CGFloat = 0
    @State private var weeks: [WeekInfo] = []
    
    private let calendar = Calendar.autoupdatingCurrent
    
    @State private var isExpanded = true {
        didSet {
            self.handleExpanded()
        }
    }
    
    public var body: some View {
        GeometryReader { proxy in
            let availableWidth = proxy.size.width
            let paddingOffset: CGFloat = 8
            VStack(spacing: 0, content: {
                WeekContainerView()
                    .padding(EdgeInsets(top: 0, leading: paddingOffset, bottom: 0, trailing: paddingOffset))
                
                if self.style == .week || (self.style == .expandable && !self.isExpanded) {
                    ScrollView(.horizontal, showsIndicators: false, content: {
                        HStack {
                            ForEach(0 ..< self.weeks.count, id: \.self) { index in
                                let info = self.weeks[index]
                                WeekView(weekInfo: info, startDate: self.startDate, endDate: self.endDate)
                                    .frame(width: availableWidth - paddingOffset * 2)
                                    .sizeReader(size: {
                                        self.pageHeights[index] = $0.height
                                        if let scrollPosition, scrollPosition == index {
                                            self.lastPageHeight = $0.height
                                        }
                                    })
                                    .id(index)
                            }
                        }
                        .scrollTargetLayout()
                    })
                    .scrollPosition(id: self.$scrollPosition)
                    .scrollTargetBehavior(.viewAligned(limitBehavior: .always))
                    .scrollBounceBehavior(.always)
                    .background(
                        RoundedRectangle(cornerRadius: 8.0)
                            .fill(self.fillBackgroundColor)
                    )
                    .ifApply(self.scrollPosition != nil, content: {
                        $0.frame(height: self.pageHeights[self.scrollPosition!])
                    })
                    .ifApply(self.scrollPosition == nil, content: {
                        $0.frame(height: self.lastPageHeight)
                    })
                    .padding(EdgeInsets(top: 0, leading: paddingOffset, bottom: paddingOffset, trailing: paddingOffset))
                } else {
                    ScrollView(.vertical, showsIndicators: false, content: {
                        VStack {
                            ForEach(0 ..< self.totalMonths, id: \.self) { index in
                                if let nextDate = calendar.date(byAdding: .month, value: index, to: startDate) {
                                    let startComponents = self.calendar.dateComponents([.year, .month], from: nextDate)
                                    if let year = startComponents.year, let month = startComponents.month {
                                        MonthView(year: year, month: month, startDate: self.startDate, endDate: self.endDate)
                                            .sizeReader(size: {
                                                self.pageHeights[index] = $0.height
                                                if let scrollPosition, scrollPosition == index {
                                                    self.lastPageHeight = $0.height
                                                }
                                            })
                                            .id(index)
                                    }
                                }
                            }
                        }
                        .scrollTargetLayout()
                    })
                    .scrollPosition(id: self.$scrollPosition)
                    .scrollTargetBehavior(.viewAligned(limitBehavior: .always))
                    .scrollBounceBehavior(.always)
                    .background(
                        RoundedRectangle(cornerRadius: 8.0)
                            .fill(self.fillBackgroundColor)
                    )
                    .ifApply(self.scrollPosition != nil, content: {
                        $0.frame(height: self.pageHeights[self.scrollPosition!])
                    })
                    .ifApply(self.scrollPosition == nil, content: {
                        $0.frame(height: self.lastPageHeight)
                    })
                    .padding(EdgeInsets(top: 0, leading: paddingOffset, bottom: paddingOffset, trailing: paddingOffset))
                }
                
                if self.style == .expandable {
                    CalendarDragView()
                        .simultaneousGesture(
                            DragGesture()
                                .onChanged { value in
                                    print("drag gesture value\(value)")
                                }
                                .onEnded { _ in
                                    self.isExpanded.toggle()
                                }
                        )
                }
                
                Spacer()
                
            })
            .ifApply(self.scrollPosition != nil, content: {
                $0.animation(.spring, value: self.isExpanded)
            })
        }
        .background(Color.preferredColor(.primaryBackground))
        .onAppear {
            self.handleExpanded()
        }
    }
    
    var scrollDirection: Axis.Set {
        (self.style == .week || (self.style == .expandable && !self.isExpanded)) ? .horizontal : .vertical
    }
    
    func handleExpanded() {
        if self.style == .week || (self.style == .expandable && !self.isExpanded) {
            self.weeks = self.handleWeekInfo()
            self.scrollPosition = self.weeksOffsetBetweenDates(start: self.startDate, end: self.displayDateAtStartup)
            self.pageHeights = Array(repeating: 0, count: self.weeks.count)
        } else {
            self.totalMonths = self.monthsBetweenDates(start: self.startDate, end: self.endDate) + 1
            self.scrollPosition = self.monthsBetweenDates(start: self.startDate, end: self.displayDateAtStartup)
            self.pageHeights = Array(repeating: 0, count: self.totalMonths)
        }
    }
    
    var fillBackgroundColor: Color {
        if [.rangeSelection, .datesSelection].contains(self.style) {
            Color.preferredColor(.secondaryGroupedBackground)
        } else {
            Color.preferredColor(.tertiaryGroupedBackground)
        }
    }
    
    public init(style: CalendarStyle = .fullScreenMonth, startDate: Date? = nil, endDate: Date? = nil, displayDateAtStartup: Date? = nil) {
        self.style = style
        
        let components: Set<Calendar.Component> = [.day, .month, .year]
        let formatter: DateFormatter = {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy MM dd"
            return dateFormatter
        }()
        
        var result: (startDate: Date, endDate: Date, displayDateAtStartup: Date) = (Date.now, Date.now, Date.now)
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
            let components = self.calendar.dateComponents(components, from: Date())
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
        if let displayDateAtStartup {
            result.displayDateAtStartup = displayDateAtStartup
        }
        
        self.startDate = result.startDate
        self.endDate = result.endDate
        self.displayDateAtStartup = result.displayDateAtStartup
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
}

#Preview {
    let style: CalendarStyle = .week
    
    CalendarView(style: style)
        .environment(\.showWeekNumber, true)
}
