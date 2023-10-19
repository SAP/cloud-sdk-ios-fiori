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
        }
    }
    
    func json(item: PickerItem) -> String {
        "SortFilterCFG: {name: \(item.name), value: \(item.value)}"
    }

    func json(item: SliderItem) -> String {
        "SortFilterCFG: {name: \(item.name), value: \(String(describing: item.value))}"
    }
    
    func json(item: DateTimeItem) -> String {
        "SortFilterCFG: {name: \(item.name), value: \(String(describing: item.value))}"
    }
    
    func json(item: SwitchItem) -> String {
        "SortFilterCFG: {name: \(item.name), value: \(String(describing: item.value))}"
    }
}
