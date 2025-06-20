import FioriThemeManager
import SwiftUI

struct DurationPickerViewWrapper: UIViewRepresentable {
    @Environment(\.layoutDirection) var layoutDirection
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
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        for subView in uiView.subviews where subView is UIPickerView {
            if let pickerView = subView as? UIPickerView {
                let hour = self.selection / 60
                let minute = self.selection % 60

                if let hourIndex = hours.firstIndex(of: hour) {
                    pickerView.selectRow(hourIndex, inComponent: 0, animated: true)
                    if let minuteIndex = minutesForHour(hourIndex).firstIndex(of: minute) {
                        pickerView.selectRow(minuteIndex, inComponent: 1, animated: true)
                    }
                }
                break
            }
        }
    }
    
    func makeUIView(context: Context) -> some UIView {
        let container = UIView()
        container.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
        container.setContentCompressionResistancePriority(.defaultLow, for: .vertical)
        let pickerView = UIPickerView()
        pickerView.dataSource = context.coordinator
        pickerView.delegate = context.coordinator
        pickerView.addSubview(context.coordinator.hourLabel)
        pickerView.addSubview(context.coordinator.minuteLabel)
        container.addSubview(pickerView)
        pickerView.leadingAnchor.constraint(equalTo: container.leadingAnchor).isActive = true
        pickerView.topAnchor.constraint(equalTo: container.topAnchor).isActive = true
        pickerView.bottomAnchor.constraint(equalTo: container.bottomAnchor).isActive = true
        pickerView.trailingAnchor.constraint(equalTo: container.trailingAnchor).isActive = true
        pickerView.translatesAutoresizingMaskIntoConstraints = false

        let hour = self.selection / 60
        let minute = self.selection % 60
        
        if let hourIndex = hours.firstIndex(of: hour) {
            pickerView.selectRow(hourIndex, inComponent: 0, animated: false)
            if let minuteIndex = minutesForHour(hourIndex).firstIndex(of: minute) {
                pickerView.selectRow(minuteIndex, inComponent: 1, animated: false)
            }
        }

        let hourLabel = context.coordinator.hourLabel
        hourLabel.centerYAnchor.constraint(equalTo: pickerView.centerYAnchor).isActive = true
        hourLabel.heightAnchor.constraint(equalToConstant: context.coordinator.hourSize.height).isActive = true
        hourLabel.widthAnchor.constraint(equalToConstant: context.coordinator.hourSize.width).isActive = true
        hourLabel.trailingAnchor.constraint(equalTo: pickerView.centerXAnchor, constant: self.layoutDirection == .leftToRight ? -12 : 0).isActive = true
        let minuteLabel = context.coordinator.minuteLabel
        minuteLabel.centerYAnchor.constraint(equalTo: pickerView.centerYAnchor).isActive = true
        minuteLabel.heightAnchor.constraint(equalToConstant: context.coordinator.minuteSize.height).isActive = true
        minuteLabel.widthAnchor.constraint(equalToConstant: context.coordinator.minuteSize.width).isActive = true
        minuteLabel.leadingAnchor.constraint(equalTo: pickerView.centerXAnchor, constant: context.coordinator.componentValueWidth + 8 + (self.layoutDirection == .leftToRight ? 12 : 8)).isActive = true
        return container
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
                let hourIndex = pickerView.selectedRow(inComponent: 0)
                return self.parent.minutesForHour(hourIndex).count
            default:
                return 0
            }
        }
        
        func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
            switch component {
            case 0:
                return self.parent.hours[row].description
            case 1:
                let hourIndex = pickerView.selectedRow(inComponent: 0)
                if self.parent.minutesForHour(hourIndex).count > row {
                    return self.parent.minutesForHour(hourIndex)[row].description
                } else {
                    return ""
                }
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
            guard hourIndex < self.parent.hours.count else { return }
            if minuteIndex < self.parent.minutesForHour(hourIndex).count {
                self.parent.selection = self.parent.hours[hourIndex] * 60 + self.parent.minutesForHour(hourIndex)[minuteIndex]
            } else {
                self.parent.selection = self.parent.hours[hourIndex] * 60 + (self.parent.minutesForHour(hourIndex).last ?? 0)
            }
        }
        
        func pickerView(_ pickerView: UIPickerView, widthForComponent component: Int) -> CGFloat {
            let hourComponentWidth = self.componentValueWidth + self.hourSize.width + (self.parent.layoutDirection == .leftToRight ? 12 : 3) + 8
            let minComponentwidth = self.componentValueWidth + self.minuteSize.width + (self.parent.layoutDirection == .leftToRight ? 20 : 34)
            return max(hourComponentWidth, minComponentwidth)
        }
        
        func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
            36
        }
        
        func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
            let text = self.pickerView(pickerView, titleForRow: row, forComponent: component)
            let label = UILabel()
            label.font = self.pickerFont
            label.text = text
            label.textColor = Color.preferredColor(.base1).uiColor()
            label.textAlignment = self.parent.layoutDirection == .leftToRight ? .right : .left
            if component == 0 {
                let view = self.setupHourView(label, forComponent: component)
                view.accessibilityLabel = self.parent.hours[row].description + self.parent.hourText
                return view
            } else {
                let view = self.setupMinuteView(label, forComponent: component)
                let hourIndex = pickerView.selectedRow(inComponent: 0)
                if self.parent.minutesForHour(hourIndex).count > row {
                    view.accessibilityLabel = self.parent.minutesForHour(hourIndex)[row].description + self.parent.minuteText
                }
                return view
            }
        }
        
        func setupHourView(_ label: UILabel, forComponent component: Int) -> UIView {
            let view = UIView()
            view.addSubview(label)
            label.translatesAutoresizingMaskIntoConstraints = false
            let labelSize = label.sizeThatFits(.zero)
            label.heightAnchor.constraint(equalToConstant: labelSize.height).isActive = true
            label.widthAnchor.constraint(equalToConstant: self.componentValueWidth).isActive = true
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
            label.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 9).isActive = true
            view.heightAnchor.constraint(greaterThanOrEqualToConstant: labelSize.height).isActive = true
            view.widthAnchor.constraint(greaterThanOrEqualToConstant: labelSize.width).isActive = true
            return view
        }
        
        func hourTrailingOffset() -> CGFloat {
            -(self.hourSize.width + 17)
        }
        
        lazy var hourSize: CGSize = {
            let size = self.hourLabel.sizeThatFits(.zero)
            return CGSize(width: ceil(size.width), height: ceil(size.height))
        }()
        
        lazy var minuteSize: CGSize = {
            let size = self.minuteLabel.sizeThatFits(.zero)
            return CGSize(width: ceil(size.width), height: ceil(size.height))
        }()
        
        lazy var hourLabel: UILabel = {
            let label = UILabel()
            label.text = self.parent.hourText
            label.font = UIFont.preferredFioriFont(fixedSize: 17)
            label.textColor = Color.preferredColor(.base1).uiColor()
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()
        
        lazy var minuteLabel: UILabel = {
            let label = UILabel()
            label.text = self.parent.minuteText
            label.font = UIFont.preferredFioriFont(fixedSize: 17)
            label.textColor = Color.preferredColor(.base1).uiColor()
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()
        
        lazy var componentValueWidth: CGFloat = {
            let label = UILabel()
            label.font = self.pickerFont
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
            fatalError("Fiori Error: minimum should be less than maximum minutes")
        }
        let maxHour = self.maximumMinutes / 60
        let minHour = self.minimumMinutes / 60
        if minHour == maxHour {
            return [minHour]
        } else {
            return Array(minHour ... maxHour)
        }
    }
    
    func minutesForHour(_ hourIndex: Int) -> [Int] {
        guard self.maximumMinutes >= self.minimumMinutes else {
            fatalError("Fiori Error: minimum should be not be less than maximum minutes")
        }
        let selectedHour = self.hours[hourIndex]
        let start: Int
        let end: Int
        if selectedHour == self.hours.first {
            start = self.minimumMinutes % 60
            end = min(60, self.maximumMinutes - self.minimumMinutes + 1)
        } else if selectedHour == self.hours.last {
            start = 0
            end = self.maximumMinutes % 60 + 1
        } else {
            start = 0
            end = 60
        }
        return Array(stride(from: start, to: end, by: self.minuteInterval))
    }
}
