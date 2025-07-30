import SwiftUI

struct CalendarView: View {
    var body: some View {
        VStack {
            WeekContainerView()
            ScrollView {
                MonthView(year: 2025, month: 6)
                MonthView(year: 2025, month: 7)
                MonthView(year: 2025, month: 8)
            }
        }
    }
}

#Preview {
    CalendarView()
        .environment(\.showWeekNumber, true)
}
