import FioriSwiftUICore
import SwiftUI

struct CalendarProtocolTestDemo: View {
    @StateObject var model = CalendarModel(calendarStyle: .month)
    
    var body: some View {
        CalendarView(model: self.model)
            .environment(\.showsWeekNumbers, true)
            .environment(\.alternateCalendarType, .chinese)
    }
}

#Preview {
    CalendarProtocolTestDemo()
}
