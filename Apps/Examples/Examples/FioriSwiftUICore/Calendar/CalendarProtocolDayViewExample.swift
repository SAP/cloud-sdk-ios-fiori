import FioriSwiftUICore
import SwiftUI

struct CalendarProtocolDayViewExample: View {
    var calendarItemTintAttributes: [CalendarPropertyRef: [CalendarItemControlState: Color]] {
        let result: [CalendarPropertyRef: [CalendarItemControlState: Color]] = [
            .title: [
                .normal: Color(UIColor.blue),
                .disabled: Color(UIColor.red),
                .highlighted: Color(UIColor.green),
                .selected: Color(UIColor.yellow)
            ]
        ]
        return result
    }
    
    var body: some View {
        Group {
            CalendarDayView(title: "10", subtitle: "22", isEventIndicatorVisible: true, state: .singleSelectedAndToday, customEventView: Rectangle().foregroundStyle(Color.red))
                .environment(\.eventViewColor, .red)
                .environment(\.selectionSingleColor, .yellow)
                .environment(\.calendarItemTintAttributes, self.calendarItemTintAttributes)
            
            CalendarDayView(title: "10", subtitle: "22", isEventIndicatorVisible: true, state: .disabled)
                .environment(\.eventViewColorDisabled, .gray)
            
            CalendarDayView(title: "10", subtitle: "22", isEventIndicatorVisible: true, state: .multiSelectedStart)
                .environment(\.selectionRangeColor, .red)
        }
    }
}

#Preview {
    CalendarProtocolDayViewExample()
}
