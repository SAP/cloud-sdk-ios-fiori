import SwiftUI

struct WeekContainerView: View {
    @Environment(\.customLocale) var customLocale
    @Environment(\.customBundle) var customBundle
    @Environment(\.firstWeekday) var firstWeekday
    
    @Environment(\.showWeekNumber) var showWeekNumber
    
    let maxNumberOfDaysInWeek: Int = 7
    
    @State private var availableWidth: CGFloat = 0
    
    var body: some View {
        CalendarWeekContainerHStack(showWeekNumber: self.showWeekNumber) {
            Spacer()
            ForEach(self.symbols.indices, id: \.self) { index in
                Text(self.symbols[index])
                    .font(.fiori(forTextStyle: .caption2, weight: .bold))
                    .foregroundStyle(Color.preferredColor(.tertiaryLabel))
            }
        }
        .padding(.top, 8)
        .padding(.bottom, 4)
    }
    
    var symbols: [String] {
        var calendar = Calendar.autoupdatingCurrent
        calendar.locale = Locale.autoupdatingCurrent

        let formatter = DateFormatter()
        formatter.dateFormat = "EEE"
        formatter.timeZone = calendar.timeZone
        formatter.locale = self.customLocale ?? calendar.locale
        
        var preferredLang: String?
        
        if let customBundle {
            preferredLang = customBundle.preferredLocalizations[0]
        } else {
            preferredLang = Bundle.main.preferredLocalizations[0]
        }

        var symbols: [String] = []
        if preferredLang == "ar" {
            symbols = formatter.shortWeekdaySymbols
        } else {
            symbols = formatter.veryShortStandaloneWeekdaySymbols
        }
        
        let numForFirstDay = self.firstWeekday
        if numForFirstDay - 1 <= symbols.count,
           numForFirstDay - 1 >= 0
        {
            symbols = Array(symbols[numForFirstDay - 1 ..< symbols.count]) + symbols[0 ..< numForFirstDay - 1]
            return symbols
        } else {
            return []
        }
    }
}

struct CalendarWeekContainerHStack: Layout {
    let showWeekNumber: Bool
    
    func sizeThatFits(proposal: ProposedViewSize,
                      subviews: Subviews,
                      cache: inout ()) -> CGSize
    {
        guard !subviews.isEmpty else { return .zero }
        
        let maxHeight = subviews.map {
            $0.sizeThatFits(.unspecified).height
        }.max() ?? 0
        
        return CGSize(
            width: proposal.width ?? .infinity,
            height: maxHeight
        )
    }
    
    func placeSubviews(in bounds: CGRect,
                       proposal: ProposedViewSize,
                       subviews: Subviews,
                       cache: inout ())
    {
        var ratios: [CGFloat] = [
            7.0 / 140.0,
            19.0 / 140.0,
            19.0 / 140.0,
            19.0 / 140.0,
            19.0 / 140.0,
            19.0 / 140.0,
            19.0 / 140.0,
            19.0 / 140.0
        ]
        if !self.showWeekNumber {
            ratios = [
                0 / 140.0,
                20 / 140.0,
                20 / 140.0,
                20 / 140.0,
                20 / 140.0,
                20 / 140.0,
                20 / 140.0,
                20 / 140.0
            ]
        }
        
        let totalRatio = ratios.reduce(0, +)
        var xPosition = bounds.minX
        
        for (index, subview) in subviews.enumerated() {
            let ratio = index < ratios.count ? ratios[index] : 1.0
            let width = bounds.width * (ratio / totalRatio)
            
            subview.place(
                at: CGPoint(x: xPosition + width / 2, y: bounds.midY),
                anchor: .center,
                proposal: ProposedViewSize(width: width, height: bounds.height)
            )
            xPosition += width
        }
    }
}

#Preview {
    VStack {
        WeekContainerView()
            .environment(\.showWeekNumber, true)
        WeekContainerView()
            .environment(\.showWeekNumber, false)
    }
}
