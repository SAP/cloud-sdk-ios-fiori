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
            // Fill the week number blanks
            Spacer()
            
            ForEach(self.symbols.indices, id: \.self) { index in
                Text(self.symbols[index])
                    .font(.fiori(fixedSize: 11 * self.scaleForSizeChange, weight: .bold))
                    .foregroundStyle(Color.preferredColor(self.currentDayLocation == index ? .tintColor : .tertiaryLabel))
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
    
    @Environment(\.dynamicTypeSize) var dynamicTypeSize
    var scaleForSizeChange: Double {
        sizeEnumToValue(dynamicTypeSize: self.dynamicTypeSize, limitMaxTypeSize: .accessibility1)
    }
    
    var currentDayLocation: Int {
        let dayOfWeek = Calendar.autoupdatingCurrent.component(.weekday, from: Date())
        let position = dayOfWeek - self.firstWeekday
        return position >= 0 ? position : 7 + position
    }
}

struct CalendarWeekContainerHStack: Layout {
    let showWeekNumber: Bool
    
    let verticalGuide: VerticalAlignment?
    
    init(showWeekNumber: Bool, verticalGuide: VerticalAlignment? = nil) {
        self.showWeekNumber = showWeekNumber
        self.verticalGuide = verticalGuide
    }
    
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
            
            var guideYOffset: Double = 0
            if index == 0 {
                let dimensions = subview.dimensions(in: proposal)
                if let verticalGuide {
                    guideYOffset = dimensions[verticalGuide]
                }
            }
            
            subview.place(
                at: CGPoint(x: xPosition + width / 2, y: bounds.midY - guideYOffset / 2),
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
