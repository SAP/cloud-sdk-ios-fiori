import FioriSwiftUICore
import SwiftUI

struct CalendarProtocolTestDemo: View {
    var body: some View {
        let year = Calendar.autoupdatingCurrent.component(.year, from: Date())
        let month = Calendar.autoupdatingCurrent.component(.month, from: Date())
        CalendarMonthView(calendarStyle: .month, year: year, month: month, startDate: Date(), endDate: Date(), showMonthHeader: true)
            .environment(\.showsWeekNumbers, true)
    }
}

#Preview {
    CalendarProtocolTestDemo()
}
