import SwiftUI

struct CalendarView: View {
    var body: some View {
        ScrollView {
            VStack {
                MonthView(year: 2025, month: 6)
                MonthView(year: 2025, month: 7)
                MonthView(year: 2025, month: 8)
            }
        }
    }
}

#Preview {
    CalendarView()
}
