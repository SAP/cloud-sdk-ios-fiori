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
    
    @State private var offset: CGFloat = 0
    @State private var scrollPosition: Int? = 0
    
    @State private var weekContainerHeight: CGFloat = 0
    
    let year = 2025
    let targetScrollPosition = 7
    let months: [Int] = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12]
    @State private var pageHeights: [CGFloat] = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
    
    public var body: some View {
        VStack(spacing: 0, content: {
            WeekContainerView()
            ScrollView {
                VStack {
                    ForEach(0 ..< self.months.count, id: \.self) { index in
                        let month = self.months[index]
                        MonthView(year: self.year, month: month)
                            .sizeReader(size: {
                                self.pageHeights[index] = $0.height
                            })
                            .id(index)
                    }
                }
                .scrollTargetLayout()
            }
            .scrollPosition(id: self.$scrollPosition)
            .scrollTargetBehavior(.viewAligned(limitBehavior: .always))
            .scrollIndicators(.hidden)
            .scrollBounceBehavior(.always)
            .background(
                RoundedRectangle(cornerRadius: 8.0)
                    .fill(self.fillBackgroundColor)
            )
            .frame(height: self.pageHeights[self.scrollPosition!])
        })
        .padding(EdgeInsets(top: 0, leading: 8, bottom: 8, trailing: 8))
        .background(Color.preferredColor(.primaryBackground))
        .onAppear {
            self.scrollPosition = self.targetScrollPosition
        }
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
