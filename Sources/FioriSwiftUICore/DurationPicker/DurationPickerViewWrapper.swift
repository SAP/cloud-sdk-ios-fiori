import FioriThemeManager
import SwiftUI

struct DurationPickerViewWrapper: UIViewRepresentable {
    @Environment(\.layoutDirection) var layoutDirection
    var pickerView = UIPickerView()
    @Binding var selection: Int
    
    var maximumMinutes: Int
    var minimumMinutes: Int
    var minuteInterval: Int
    var measurementFormatter: MeasurementFormatter
    
    var hourText: String {
        self.measurementFormatter.string(from: UnitDuration.hours)
    }

    var minuteText: String {
        self.measurementFormatter.string(from: UnitDuration.minutes)
    }
    
    init(selection: Binding<Int>,
         maximumMinutes: Int,
         minimumMinutes: Int,
         minuteInterval: Int,
         measurementFormatter: MeasurementFormatter)
    {
        _selection = selection
        self.maximumMinutes = min(maximumMinutes, 1439)
        self.minimumMinutes = max(minimumMinutes, 0)
        self.minuteInterval = max(minuteInterval, 1)
        self.measurementFormatter = measurementFormatter
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {}
    
    func makeUIView(context: Context) -> some UIView {
        self.pickerView.dataSource = context.coordinator
        self.pickerView.delegate = context.coordinator
        self.pickerView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        self.pickerView.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
        self.pickerView.setContentCompressionResistancePriority(.defaultLow, for: .vertical)
        self.pickerView.addSubview(context.coordinator.hourLabel)
        self.pickerView.addSubview(context.coordinator.minuteLabel)
        
        let hour = self.selection / 60
        let minute = self.selection % 60
        
        if let hourIndex = hours.firstIndex(of: hour) {
            self.pickerView.selectRow(hourIndex, inComponent: 0, animated: false)
        }
        if let minuteIndex = minutesForHour().firstIndex(of: minute) {
            self.pickerView.selectRow(minuteIndex, inComponent: 1, animated: false)
        }
        
        let padding: CGFloat = 4
        let hourLabel = context.coordinator.hourLabel
        hourLabel.centerYAnchor.constraint(equalTo: self.pickerView.centerYAnchor).isActive = true
        hourLabel.heightAnchor.constraint(equalToConstant: context.coordinator.hourSize.height).isActive = true
        hourLabel.widthAnchor.constraint(equalToConstant: context.coordinator.hourSize.width).isActive = true
        let constant = context.coordinator.hourSize.width + context.coordinator.hourTrailingOffset() + padding
        hourLabel.trailingAnchor.constraint(equalTo: self.pickerView.centerXAnchor, constant: constant).isActive = true
        
        let minuteLabel = context.coordinator.minuteLabel
        minuteLabel.centerYAnchor.constraint(equalTo: self.pickerView.centerYAnchor).isActive = true
        minuteLabel.heightAnchor.constraint(equalToConstant: context.coordinator.minuteSize.height).isActive = true
        minuteLabel.widthAnchor.constraint(equalToConstant: context.coordinator.minuteSize.width).isActive = true
        let offset: CGFloat = self.layoutDirection == .leftToRight ? 0 : 8
        minuteLabel.leadingAnchor.constraint(equalTo: self.pickerView.centerXAnchor, constant: context.coordinator.componentValueWidth + padding + 8 + offset).isActive = true
        return self.pickerView
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    class Coordinator: NSObject, UIPickerViewDelegate, UIPickerViewDataSource {
        var parent: DurationPickerViewWrapper
        let pickerFont = UIFont.preferredFioriFont(fixedSize: 22)
        
        init(_ parent: DurationPickerViewWrapper) {
            self.parent = parent
        }
        
        func numberOfComponents(in pickerView: UIPickerView) -> Int {
            2
        }
        
        func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
            switch component {
            case 0:
                return self.parent.hours.count
            case 1:
                return self.parent.minutesForHour().count
            default:
                return 0
            }
        }
        
        func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
            switch component {
            case 0:
                return self.parent.hours[row].description
            case 1:
                return self.parent.minutesForHour()[row].description
            default:
                return ""
            }
        }
        
        func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
            if component == 0 {
                pickerView.reloadComponent(1)
            }
            let hourIndex = pickerView.selectedRow(inComponent: 0)
            let minuteIndex = pickerView.selectedRow(inComponent: 1)
            guard hourIndex < self.parent.hours.count, minuteIndex < self.parent.minutesForHour().count else { return }
            self.parent.selection = self.parent.hours[hourIndex] * 60 + self.parent.minutesForHour()[minuteIndex]
        }
        
        func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
            36
        }
        
        func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
            let text = self.pickerView(pickerView, titleForRow: row, forComponent: component)
            let label = UILabel()
            label.font = self.pickerFont
            label.text = text
            label.textAlignment = self.parent.layoutDirection == .leftToRight ? .right : .left
            if component == 0 {
                return self.setupHourView(label, forComponent: component)
            } else {
                return self.setupMinuteView(label, forComponent: component)
            }
        }
        
        func setupHourView(_ label: UILabel, forComponent component: Int) -> UIView {
            let view = UIView()
            view.addSubview(label)
            label.translatesAutoresizingMaskIntoConstraints = false
            let labelSize = label.sizeThatFits(.zero)
            label.heightAnchor.constraint(equalToConstant: labelSize.height).isActive = true
            label.widthAnchor.constraint(equalToConstant: labelSize.width).isActive = true
            label.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
            label.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: self.hourTrailingOffset()).isActive = true
            view.heightAnchor.constraint(greaterThanOrEqualToConstant: labelSize.height).isActive = true
            view.widthAnchor.constraint(greaterThanOrEqualToConstant: labelSize.width).isActive = true
            return view
        }
        
        func setupMinuteView(_ label: UILabel, forComponent component: Int) -> UIView {
            let view = UIView()
            view.addSubview(label)
            label.translatesAutoresizingMaskIntoConstraints = false
            let labelSize = label.sizeThatFits(.zero)
            label.heightAnchor.constraint(equalToConstant: labelSize.height).isActive = true
            label.widthAnchor.constraint(equalToConstant: self.componentValueWidth).isActive = true
            label.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
            label.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 4).isActive = true
            view.heightAnchor.constraint(greaterThanOrEqualToConstant: labelSize.height).isActive = true
            view.widthAnchor.constraint(greaterThanOrEqualToConstant: labelSize.width).isActive = true
            return view
        }
        
        func hourTrailingOffset() -> CGFloat {
            -(self.hourSize.width + 17)
        }
        
        lazy var hourSize: CGSize = {
            let size = hourLabel.sizeThatFits(.zero)
            return CGSize(width: ceil(size.width), height: ceil(size.height))
        }()
        
        lazy var minuteSize: CGSize = {
            let size = minuteLabel.sizeThatFits(.zero)
            return CGSize(width: ceil(size.width), height: ceil(size.height))
        }()
        
        lazy var hourLabel: UILabel = {
            let label = UILabel()
            label.text = parent.hourText
            label.font = UIFont.preferredFioriFont(fixedSize: 17)
            label.textColor = UIColor.label
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()
        
        lazy var minuteLabel: UILabel = {
            let label = UILabel()
            label.text = parent.minuteText
            label.font = UIFont.preferredFioriFont(fixedSize: 17)
            label.textColor = UIColor.label
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()
        
        lazy var componentValueWidth: CGFloat = {
            let label = UILabel()
            label.font = pickerFont
            var maxWidth: CGFloat = 0
            for item in 0 ... 59 {
                label.text = item.description
                maxWidth = max(label.sizeThatFits(.zero).width, maxWidth)
            }
            return maxWidth
        }()
    }
}

extension DurationPickerViewWrapper {
    var hours: [Int] {
        guard self.maximumMinutes >= self.minimumMinutes else {
            fatalError("Fiori Error: minimum should be not be less than maximum minutes")
        }
        let maxHour = self.maximumMinutes / 60
        let minHour = self.minimumMinutes / 60
        if minHour == maxHour {
            return [minHour]
        } else {
            return Array(minHour ... maxHour)
        }
    }
    
    func minutesForHour(_ hour: Int? = nil) -> [Int] {
        guard self.maximumMinutes >= self.minimumMinutes else {
            fatalError("Fiori Error: minimum should be not be less than maximum minutes")
        }
        var searchHour: Int {
            if let hour = hour {
                return hour
            } else {
                let hourIndex = self.pickerView.selectedRow(inComponent: 0)
                
                return self.hours[hourIndex]
            }
        }
        let start: Int
        let end: Int
        if searchHour == self.hours.first {
            start = self.minimumMinutes % 60
            end = min(60, self.maximumMinutes - self.minimumMinutes + 1)
        } else if searchHour == self.hours.last {
            start = 0
            end = self.maximumMinutes % 60 + 1
        } else {
            start = 0
            end = 60
        }
        return Array(stride(from: start, to: end, by: self.minuteInterval))
    }
}
