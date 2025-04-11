import FioriSwiftUICore
import SwiftUI

extension View {
    func value(of item: SortFilterItem) -> String {
        switch item {
        case .picker(let v, _):
            return self.json(item: v)
        case .filterfeedback(let v):
            return self.json(item: v)
        case .slider(let v, _):
            return self.json(item: v)
        case .datetime(let v, _):
            return self.json(item: v)
        case .switch(let v, _):
            return self.json(item: v)
        case .stepper(let v, _):
            return self.json(item: v)
        case .title(let v, _):
            return self.json(item: v)
        case .note(let v, _):
            return self.json(item: v)
        case .durationPicker(let v, _):
            return self.json(item: v)
        }
    }
    
    func json(item: SortFilterItem.PickerItem) -> String {
        "{name: \(item.name), value: \(item.value)}"
    }

    func json(item: SortFilterItem.SliderItem) -> String {
        "{name: \(item.name), value: \(String(describing: item.value)), lowerValue: \(String(describing: item.lowerValue)), upperValue: \(String(describing: item.upperValue))}"
    }
    
    func json(item: SortFilterItem.DateTimeItem) -> String {
        "{name: \(item.name), value: \(String(describing: item.value))}"
    }
    
    func json(item: SortFilterItem.SwitchItem) -> String {
        "{name: \(item.name), value: \(String(describing: item.value))}"
    }
    
    func json(item: SortFilterItem.StepperItem) -> String {
        "{name: \(item.name), value: \(String(describing: item.value))}"
    }
    
    func json(item: SortFilterItem.TitleItem) -> String {
        "{name: \(item.name), value: \(item.text)}"
    }
    
    func json(item: SortFilterItem.NoteItem) -> String {
        "{name: \(item.name), value: \(item.text)}"
    }
    
    func json(item: SortFilterItem.DurationPickerItem) -> String {
        "{name: \(item.name), value: \(String(describing: item.value))}"
    }
}
