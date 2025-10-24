import FioriSwiftUICore
import SwiftUI

struct CalendarProtocolTestDemo: View {
    var body: some View {
        Text("")
        HStack(spacing: 28, content: {
            CalendarDayView(title: "7", isEventIndicatorVisible: true, state: .normal)
            CalendarDayView(title: "7", isEventIndicatorVisible: true, state: .today)
            CalendarDayView(title: "7", isEventIndicatorVisible: true, state: .outOfMonth)
            CalendarDayView(title: "7", isEventIndicatorVisible: true, state: .disabled)
            CalendarDayView(title: "7", isEventIndicatorVisible: true, state: .disabledAndToday)
        })
        HStack(spacing: 0, content: {
            CalendarDayView(title: "7", isEventIndicatorVisible: true, state: .multiSelectedStart)
                .frame(width: 50)
            CalendarDayView(title: "8", isEventIndicatorVisible: true, state: .disabledInMultiSelection)
                .frame(width: 50)
            CalendarDayView(title: "9", isEventIndicatorVisible: true, state: .multiSelectedMiddle)
                .frame(width: 50)
            CalendarDayView(title: "10", isEventIndicatorVisible: true, state: .disabledAndTodayInMultiSelection)
                .frame(width: 50)
            CalendarDayView(title: "11", isEventIndicatorVisible: true, state: .multiSelectedEnd)
                .frame(width: 50)
        })
        HStack(spacing: 0, content: {
            CalendarDayView(title: "7", subtitle: "13", isEventIndicatorVisible: true, state: .multiSelectedStart)
                .frame(width: 50)
            CalendarDayView(title: "8", subtitle: "14", isEventIndicatorVisible: true, state: .disabledInMultiSelection)
                .frame(width: 50)
            CalendarDayView(title: "9", subtitle: "15", isEventIndicatorVisible: true, state: .multiSelectedMiddle)
                .frame(width: 50)
            CalendarDayView(title: "10", subtitle: "16", isEventIndicatorVisible: true, state: .disabledAndTodayInMultiSelection)
                .frame(width: 50)
            CalendarDayView(title: "11", subtitle: "17", isEventIndicatorVisible: true, state: .multiSelectedEnd)
                .frame(width: 50)
        })
        
        HStack(spacing: 20) {
            CalendarDayView(title: "8", state: .singleSelectedAndToday)
            CalendarDayView(title: "9", isEventIndicatorVisible: true, state: .singleSelected)
            CalendarDayView(title: "10", subtitle: "13", isEventIndicatorVisible: true)
            CalendarDayView(title: "11", subtitle: "14", state: .singleSelectedAndToday)
            CalendarDayView(title: "12", subtitle: "15", isEventIndicatorVisible: true, state: .singleSelected)
        }
    }
}

#Preview {
    CalendarProtocolTestDemo()
}
