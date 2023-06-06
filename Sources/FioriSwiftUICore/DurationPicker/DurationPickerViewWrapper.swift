import FioriThemeManager
import SwiftUI

struct DurationPickerViewWrapper: UIViewRepresentable {
    @Binding var selection: Int
    var maximumMinutes: Int
    var minimumMinutes: Int
    var minuteInterval: Int
    var measurementFormatter: MeasurementFormatter
    
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
        let pickerView = DurationPickerContainer(selection: $selection,
                                                 maximumMinutes: maximumMinutes,
                                                 minimumMinutes: minimumMinutes,
                                                 minuteInterval: minuteInterval,
                                                 measurementFormatter: measurementFormatter)
        pickerView.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
        pickerView.setContentCompressionResistancePriority(.defaultLow, for: .vertical)
        return pickerView
    }
}

class DurationPickerContainer: UIView, UIPickerViewDelegate, UIPickerViewDataSource {
    var maximumMinutes: Int
    var minimumMinutes: Int
    var minuteInterval: Int
    var measurementFormatter: MeasurementFormatter
    var pickerView = UIPickerView()
    let pickerFont = UIFont.preferredFioriFont(fixedSize: 22)
    @Binding var selection: Int
    
    init(selection: Binding<Int>,
         maximumMinutes: Int,
         minimumMinutes: Int,
         minuteInterval: Int,
         measurementFormatter: MeasurementFormatter)
    {
        self._selection = selection
        self.maximumMinutes = maximumMinutes
        self.minimumMinutes = minimumMinutes
        self.minuteInterval = minuteInterval
        self.measurementFormatter = measurementFormatter
        super.init(frame: .zero)
        self.setup()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup() {
        self.pickerView.dataSource = self
        self.pickerView.delegate = self
        self.pickerView.addSubview(self.hourLabel)
        self.pickerView.addSubview(self.minuteLabel)
        self.addSubview(self.pickerView)
        
        self.pickerView.leadingAnchor.constraint(equalTo: self.layoutMarginsGuide.leadingAnchor).isActive = true
        self.pickerView.topAnchor.constraint(equalTo: self.layoutMarginsGuide.topAnchor).isActive = true
        self.pickerView.bottomAnchor.constraint(equalTo: self.layoutMarginsGuide.bottomAnchor).isActive = true
        self.pickerView.trailingAnchor.constraint(equalTo: self.layoutMarginsGuide.trailingAnchor).isActive = true
        self.pickerView.translatesAutoresizingMaskIntoConstraints = false
        
        let hour = self.selection / 60
        let minute = self.selection % 60
        
        if let hourIndex = hours.firstIndex(of: hour) {
            self.pickerView.selectRow(hourIndex, inComponent: 0, animated: false)
        }
        if let minuteIndex = minutesForHour().firstIndex(of: minute) {
            self.pickerView.selectRow(minuteIndex, inComponent: 1, animated: false)
        }
        
        let padding: CGFloat = 4
        self.hourLabel.centerYAnchor.constraint(equalTo: self.pickerView.centerYAnchor).isActive = true
        self.hourLabel.heightAnchor.constraint(equalToConstant: self.hourSize.height).isActive = true
        self.hourLabel.widthAnchor.constraint(equalToConstant: self.hourSize.width).isActive = true
        let constant = self.hourSize.width + self.hourTrailingOffset() + padding
        self.hourLabel.trailingAnchor.constraint(equalTo: self.pickerView.centerXAnchor, constant: constant).isActive = true
        
        self.minuteLabel.centerYAnchor.constraint(equalTo: self.pickerView.centerYAnchor).isActive = true
        self.minuteLabel.heightAnchor.constraint(equalToConstant: self.minuteSize.height).isActive = true
        self.minuteLabel.widthAnchor.constraint(equalToConstant: self.minuteSize.width).isActive = true
        
        let offset: CGFloat = self.traitCollection.layoutDirection == .leftToRight ? 0 : 8
        self.minuteLabel.leadingAnchor.constraint(equalTo: self.pickerView.centerXAnchor, constant: self.componentValueWidth + padding + 8 + offset).isActive = true
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        2
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch component {
        case 0:
            return hours.count
        case 1:
            return minutesForHour().count
        default:
            return 0
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch component {
        case 0:
            return hours[row].description
        case 1:
            return minutesForHour()[row].description
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
        guard hourIndex < self.hours.count, minuteIndex < self.minutesForHour().count else { return }
        self.selection = self.hours[hourIndex] * 60 + self.minutesForHour()[minuteIndex]
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
        label.textAlignment = self.traitCollection.layoutDirection == .leftToRight ? .right : .left
        if component == 0 {
            let view = self.setupHourView(label, forComponent: component)
            view.accessibilityLabel = hours[row].description + hourText
            return view
        } else {
            let view = self.setupMinuteView(label, forComponent: component)
            view.accessibilityLabel = minutesForHour()[row].description + minuteText
            return view
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
        label.text = hourText
        label.font = UIFont.preferredFioriFont(fixedSize: 17)
        label.textColor = Color.preferredColor(.base1).uiColor()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var minuteLabel: UILabel = {
        let label = UILabel()
        label.text = minuteText
        label.font = UIFont.preferredFioriFont(fixedSize: 17)
        label.textColor = Color.preferredColor(.base1).uiColor()
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

extension DurationPickerContainer {
    var hourText: String {
        self.measurementFormatter.string(from: UnitDuration.hours)
    }

    var minuteText: String {
        self.measurementFormatter.string(from: UnitDuration.minutes)
    }
    
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
