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
    
    public init(style: CalendarStyle = .fullScreenMonth) {
        self.style = style
    }
    
    @State private var currentMonthHeight: CGFloat = 51 * 6
    @State private var offset: CGFloat = 0
    @State private var scrollPosition: Int? = 0
    
    public var body: some View {
        VStack {
            WeekContainerView()
            ScrollView {
                VStack {
                    MonthView(year: 2025, month: 6)
                        .sizeReader { size in
                            self.currentMonthHeight = size.height
                        }
                    MonthView(year: 2025, month: 7)
                    MonthView(year: 2025, month: 8)
                }
                .scrollTargetLayout()
            }
            .scrollPosition(id: self.$scrollPosition)
            .onChange(of: self.scrollPosition) {
                print("当前滚动位置: \($0 ?? 0)")
            }
            .background(
                RoundedRectangle(cornerRadius: 8.0)
                    .fill(self.fillBackgroundColor)
            )
            .frame(height: self.currentMonthHeight)
        }
        .padding(EdgeInsets(top: 0, leading: 8, bottom: 8, trailing: 8))
        .background(Color.preferredColor(.primaryBackground))
    }
    
    var fillBackgroundColor: Color {
        if [.rangeSelection, .datesSelection].contains(self.style) {
            Color.preferredColor(.secondaryGroupedBackground)
        } else {
            Color.preferredColor(.tertiaryGroupedBackground)
        }
    }
}

#Preview {
    CalendarView()
        .environment(\.showWeekNumber, true)
}
