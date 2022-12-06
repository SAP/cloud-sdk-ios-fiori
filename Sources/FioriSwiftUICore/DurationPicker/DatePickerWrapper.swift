import SwiftUI
import UIKit

public struct DatePickerWrapper: UIViewRepresentable {
    @Binding var selection: Date
    var range: ClosedRange<Date>?
    var partialRangeFrom: PartialRangeFrom<Date>?
    var partialRangeThrough: PartialRangeThrough<Date>?
    var datePickerMode: UIDatePicker.Mode
    var datePickerStyle: UIDatePickerStyle
    internal var locale: Locale?
    
    public init(selection: Binding<Date>,
                in range: ClosedRange<Date>? = nil,
                datePickerMode: UIDatePicker.Mode = .date,
                datePickerStyle: UIDatePickerStyle = .automatic,
                local: Locale? = nil)
    {
        _selection = selection
        self.range = range
        self.datePickerMode = datePickerMode
        self.datePickerStyle = datePickerStyle
        self.locale = local
    }
    
    public init(selection: Binding<Date>,
                in range: PartialRangeFrom<Date>,
                datePickerMode: UIDatePicker.Mode = .date,
                datePickerStyle: UIDatePickerStyle = .automatic,
                local: Locale? = nil)
    {
        _selection = selection
        self.partialRangeFrom = range
        self.datePickerMode = datePickerMode
        self.datePickerStyle = datePickerStyle
        self.locale = local
    }
    
    public init(selection: Binding<Date>,
                in range: PartialRangeThrough<Date>,
                datePickerMode: UIDatePicker.Mode = .date,
                datePickerStyle: UIDatePickerStyle = .automatic,
                local: Locale? = nil)
    {
        _selection = selection
        self.partialRangeThrough = range
        self.datePickerMode = datePickerMode
        self.datePickerStyle = datePickerStyle
        self.locale = local
    }
    
    public func makeUIView(context: Context) -> UIDatePicker {
        let datePicker = UIDatePicker()
        datePicker.datePickerMode = self.datePickerMode
        datePicker.preferredDatePickerStyle = self.datePickerStyle
        datePicker.locale = self.locale
        if let range = range {
            datePicker.minimumDate = range.lowerBound
            datePicker.maximumDate = range.upperBound
        } else {
            if let partialRangeFrom = partialRangeFrom {
                datePicker.minimumDate = partialRangeFrom.lowerBound
            }
            if let partialRangeThrough = partialRangeThrough {
                datePicker.maximumDate = partialRangeThrough.upperBound
            }
        }
        datePicker.addTarget(context.coordinator, action: #selector(Coordinator.valueChanged), for: .valueChanged)
        return datePicker
    }
    
    public func updateUIView(_ uiView: UIDatePicker, context: Context) {
        uiView.setDate(self.selection, animated: false)
    }
    
    public func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    public class Coordinator: NSObject {
        let parent: DatePickerWrapper

        init(_ parent: DatePickerWrapper) {
            self.parent = parent
        }
        
        @objc func valueChanged(datePicker: UIDatePicker) {
            self.parent.selection = datePicker.date
        }
    }
}
