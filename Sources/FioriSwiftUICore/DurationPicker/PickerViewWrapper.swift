import SwiftUI

struct PickerViewWrapper<T: CustomStringConvertible>: UIViewRepresentable {
    var pickerView = UIPickerView()
    
    @Binding var selections: [Int]
    var dataSource: [[T]]
    
    init(dataSource: [[T]], selections: Binding<[Int]>) {
        self.dataSource = dataSource
        _selections = selections
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        for component in 0 ..< self.selections.count {
            self.pickerView.selectRow(self.selections[component], inComponent: component, animated: false)
        }
    }
    
    func makeUIView(context: Context) -> some UIView {
        self.pickerView.dataSource = context.coordinator
        self.pickerView.delegate = context.coordinator
        self.pickerView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        self.pickerView.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
        self.pickerView.setContentCompressionResistancePriority(.defaultLow, for: .vertical)
        self.pickerView.addSubview(context.coordinator.hourLabel)
        self.pickerView.addSubview(context.coordinator.minuteLabel)
        
        let padding: CGFloat = 4
        let hourLabel = context.coordinator.hourLabel
        hourLabel.centerYAnchor.constraint(equalTo: self.pickerView.centerYAnchor).isActive = true
        hourLabel.heightAnchor.constraint(equalToConstant: context.coordinator.hourSize.height).isActive = true
        hourLabel.widthAnchor.constraint(equalToConstant: context.coordinator.hourSize.width).isActive = true
        let constant = context.coordinator.hourSize.width + context.coordinator.trailingOffset(for: 0) + padding
        hourLabel.trailingAnchor.constraint(equalTo: self.pickerView.centerXAnchor, constant: constant).isActive = true
        
        let minuteLabel = context.coordinator.minuteLabel
        minuteLabel.centerYAnchor.constraint(equalTo: self.pickerView.centerYAnchor).isActive = true
        minuteLabel.heightAnchor.constraint(equalToConstant: context.coordinator.minuteSize.height).isActive = true
        minuteLabel.widthAnchor.constraint(equalToConstant: context.coordinator.minuteSize.width).isActive = true
        minuteLabel.leadingAnchor.constraint(equalTo: self.pickerView.centerXAnchor, constant: context.coordinator.componentValueWidth + padding).isActive = true
        return self.pickerView
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    class Coordinator: NSObject, UIPickerViewDelegate, UIPickerViewDataSource {
        var parent: PickerViewWrapper
        let pickerFont = UIFont.systemFont(ofSize: 22)
        var locale = Locale(identifier: Bundle.main.preferredLocalizations[0])
        
        init(_ parent: PickerViewWrapper) {
            self.parent = parent
        }
        
        func numberOfComponents(in pickerView: UIPickerView) -> Int {
            self.parent.dataSource.count
        }
        
        func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
            self.parent.dataSource[component].count
        }
        
        func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
            self.parent.dataSource[component][row].description
        }
        
        func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
            self.parent.selections[component] = row
        }
        
        func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
            36
        }
        
        func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
            let text = self.pickerView(pickerView, titleForRow: row, forComponent: component)
            let label = UILabel()
            label.font = self.pickerFont
            label.text = text
            label.textAlignment = .right
            return self.setupValueView(label, forComponent: component)
        }
        
        func setupValueView(_ label: UILabel, forComponent component: Int) -> UIView {
            let view = UIView()
            view.addSubview(label)
            label.translatesAutoresizingMaskIntoConstraints = false
            let labelSize = label.sizeThatFits(.zero)
            label.heightAnchor.constraint(equalToConstant: labelSize.height).isActive = true
            label.widthAnchor.constraint(equalToConstant: labelSize.width).isActive = true
            label.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
            let constant = self.trailingOffset(for: component)
            label.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: constant).isActive = true
            view.heightAnchor.constraint(greaterThanOrEqualToConstant: labelSize.height).isActive = true
            view.widthAnchor.constraint(greaterThanOrEqualToConstant: labelSize.width).isActive = true

            return view
        }
        
        func trailingOffset(for component: Int) -> CGFloat {
            if component == 0 {
                return -self.hourSize.width - 24
            } else {
                return -self.minuteSize.width - 20
            }
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
            label.text = "hour"
            label.font = UIFont.systemFont(ofSize: 17)
            label.textColor = UIColor.label
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()
        
        lazy var minuteLabel: UILabel = {
            let label = UILabel()
            label.text = "minutes"
            label.font = UIFont.systemFont(ofSize: 17)
            label.textColor = UIColor.label
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()
        
        lazy var componentValueWidth: CGFloat = {
            let label = UILabel()
            label.font = pickerFont
            label.textAlignment = .right
            var maxWidth: CGFloat = 0
            for item in parent.dataSource.flatMap({ $0 }) {
                label.text = item.description
                maxWidth = max(label.sizeThatFits(.zero).width, maxWidth)
            }
            return maxWidth
        }()
    }
}
