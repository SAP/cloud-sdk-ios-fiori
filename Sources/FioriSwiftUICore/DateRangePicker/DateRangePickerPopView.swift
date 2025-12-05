import SwiftUI

struct DateRangePickerPopView: View {
    @State var model: CalendarModel
    
    let dateFormatter: DateFormatter?
    let applyActionCallback: ((ClosedRange<Date>?) -> Void)?
    let cancelActionCallback: (() -> Void)?
    
    /**
     The ID of the language to be used when displaying the `CalendarView`.
     */
    let customLanguageID: String?
    
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    @Environment(\.layoutDirection) var layoutDirection
    
    /// The initializer of DateRangePickerPopView.
    /// - Parameters:
    ///   - startDate: The start date of the calendar. Default is current year's first day.
    ///   - endDate: The end date of the calendar. Default is next year's last day.
    ///   - selectedRange: The range of selected dates. Default is nil. It's continuous in ascending order.
    ///   - dateFormatter: The end date of the calendar. Default is next year's last day.
    ///   - customLanguageID: The ID of the language to be used when displaying the `CalendarView`.
    ///   - applyActionCallback: The callback when tap apply action.
    ///   - cancelActionCallback: The callback when tap cancel action.
    public init(startDate: Date? = nil,
                endDate: Date? = nil,
                selectedRange: ClosedRange<Date>? = nil,
                dateFormatter: DateFormatter? = nil,
                customLanguageID: String? = nil,
                applyActionCallback: ((ClosedRange<Date>?) -> Void)? = nil,
                cancelActionCallback: (() -> Void)? = nil)
    {
        self.model = CalendarModel(calendarStyle: .rangeSelection, startDate: startDate, endDate: endDate, selectedRange: selectedRange, showsMonthHeader: true)
        self.dateFormatter = dateFormatter
        self.customLanguageID = customLanguageID
        self.applyActionCallback = applyActionCallback
        self.cancelActionCallback = cancelActionCallback
    }
    
    var selectedRangeDesc: String {
        var valueDescDateFormatter = DateFormatter()
        if let customizedDateFormatter = self.dateFormatter {
            valueDescDateFormatter = customizedDateFormatter
        } else {
            valueDescDateFormatter.timeZone = Calendar.current.timeZone
            valueDescDateFormatter.locale = Calendar.current.locale
            valueDescDateFormatter.dateStyle = self.horizontalSizeClass == .regular ? .full : .medium
            valueDescDateFormatter.timeStyle = .none
        }
        
        var startDateStr = "Start Date".localizedFioriString()
        var endDateStr = "End Date".localizedFioriString()
        if let startDate = model.selectedRange?.lowerBound {
            startDateStr = valueDescDateFormatter.string(from: startDate)
        } else if let selectedDate = model.selectedDate {
            startDateStr = valueDescDateFormatter.string(from: selectedDate)
        }
        
        if let endDate = model.selectedRange?.upperBound {
            endDateStr = valueDescDateFormatter.string(from: endDate)
        }
        
        var selectedInfoStr = "\(startDateStr) – \(endDateStr)"
        if self.layoutDirection == .rightToLeft {
            selectedInfoStr = "\(endDateStr) – \(startDateStr)"
        }
        return selectedInfoStr
    }
    
    public var body: some View {
        NavigationView {
            VStack(spacing: 0, content: {
                HStack {
                    Text("\(self.selectedRangeDesc)")
                        .foregroundStyle(Color.preferredColor(.primaryLabel))
                        .font(.fiori(forTextStyle: .title2, weight: .bold))
                        .multilineTextAlignment(.leading)
                    Spacer(minLength: 0)
                }
                .padding([.leading, .trailing], 16)
                .padding(.top, 10)
                
                Divider()
                    .frame(height: 0.33)
                    .background(Color.preferredColor(.separator))
                    .padding(.top, 10)
                
                CalendarView(model: self.model)
                    .environment(\.monthHeaderDateFormat, "yyyy MMM")
                    .environment(\.customLanguageId, self.customLanguageID)
                    .environment(\.hasEventIndicator, false)
                
                Divider()
                    .frame(height: 0.33)
                    .background(Color.preferredColor(.separator))
                    .padding(.bottom, 1)
            })
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        self.applyActionCallback?(self.model.selectedRange)
                    } label: {
                        Text("Apply".localizedFioriString())
                            .foregroundStyle(Color.preferredColor(self.model.selectedRange != nil ? .tintColor : .quaternaryLabel))
                            .font(.fiori(forTextStyle: .headline, weight: .bold))
                    }
                    .disabled(self.model.selectedRange == nil)
                }
                ToolbarItem(placement: .topBarLeading) {
                    Button {
                        self.cancelActionCallback?()
                    } label: {
                        Text("Cancel".localizedFioriString())
                            .foregroundStyle(Color.preferredColor(.tintColor))
                            .font(.fiori(forTextStyle: .headline, weight: .bold))
                    }
                }
                ToolbarItem(placement: .bottomBar) {
                    Button {
                        self.model.selectedRange = nil
                        self.model.selectedDate = nil
                    } label: {
                        Text("Clear".localizedFioriString())
                            .foregroundStyle(Color.preferredColor(self.clearButtonDisabled ? .quaternaryLabel : .tintColor))
                            .font(.fiori(forTextStyle: .headline, weight: .semibold))
                    }
                    .disabled(self.clearButtonDisabled)
                }
            }
            .navigationTitle("Select Range".localizedFioriString())
            .navigationBarTitleDisplayMode(.inline)
        }
    }
    
    var clearButtonDisabled: Bool {
        self.model.selectedRange == nil && self.model.selectedDate == nil
    }
}
