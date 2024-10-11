import SwiftUI
import UIKit

/// UI control types supporeted by Sort and Filter configuration
public enum SortFilterItem: Identifiable, Hashable {
    /// :nodoc:
    public var id: String {
        switch self {
        case .picker(let item, _):
            return item.id
        case .filterfeedback(let item):
            return item.id
        case .switch(let item, _):
            return item.id
        case .slider(let item, _):
            return item.id
        case .datetime(let item, _):
            return item.id
        case .listPicker(let item, _):
            return item.id
        }
    }
    
    /// The type of UI control is used to build:
    ///
    /// 1. Sort & Filter's menu item associating with sub-menu items when the number of selectable options is less than 8,
    /// or a popover containing a collection of selectable buttons when the number of selectable options is greater than 7.
    ///
    /// 2. A section of view containing a collection of selectable buttons
    case picker(item: PickerItem, showsOnFilterFeedbackBar: Bool)
    
    /// The type of UI control is used to build:
    ///
    /// 1. Sort & Filter's menu items associated with one and another; the number of selectable items, mutual exclusion, and
    /// empty selection can be controlled
    ///
    /// 2. A section of view containing a collection of selectable buttons
    ///
    /// Note: `filterfeedback` is always to be shown on menu bar
    case filterfeedback(item: PickerItem)
    
    /// The type of UI control is used to build:
    ///
    /// 1. Sort & Filter's menu item to be toggled between selected and unselected states
    ///
    /// 2. A section of view containing a SwiftUI Toggle with Fiori style
    case `switch`(item: SwitchItem, showsOnFilterFeedbackBar: Bool)
    
    /// The type of UI control is used to build:
    ///
    /// 1. Sort & Filter's menu item associated with a popover containing a SwiftUI Toggle with Fiori style
    ///
    /// 2. A section of view containing a SwiftUI Toggle with Fiori style
    case slider(item: SliderItem, showsOnFilterFeedbackBar: Bool)
    
    /// The type of UI control is used to build:
    ///
    /// 1. Sort & Filter's menu item associated with a popover containing a SwiftUI Canlendar
    ///
    /// 2. A section of view containing a SwiftUI Canlendar
    case datetime(item: DateTimeItem, showsOnFilterFeedbackBar: Bool)
    
    case listPicker(item: ListPickerItem, showsOnFilterFeedbackBar: Bool)
    
    public var showsOnFilterFeedbackBar: Bool {
        switch self {
        case .picker(_, let showsOnFilterFeedbackBar):
            return showsOnFilterFeedbackBar
        case .filterfeedback:
            return true
        case .switch(_, let showsOnFilterFeedbackBar):
            return showsOnFilterFeedbackBar
        case .slider(_, let showsOnFilterFeedbackBar):
            return showsOnFilterFeedbackBar
        case .datetime(_, let showsOnFilterFeedbackBar):
            return showsOnFilterFeedbackBar
        case .listPicker(_, let showsOnFilterFeedbackBar):
            return showsOnFilterFeedbackBar
        }
    }
    
    /// :nodoc:
    public func hash(into hasher: inout Hasher) {
        switch self {
        case .picker(let item, _):
            hasher.combine(item.id)
            hasher.combine(item.originalValue)
            hasher.combine(item.workingValue)
            hasher.combine(item.value)
        case .filterfeedback(let item):
            hasher.combine(item.id)
            hasher.combine(item.originalValue)
            hasher.combine(item.workingValue)
            hasher.combine(item.value)
        case .switch(let item, _):
            hasher.combine(item.id)
            hasher.combine(item.originalValue)
            hasher.combine(item.workingValue)
            hasher.combine(item.value)
        case .slider(let item, _):
            hasher.combine(item.id)
            hasher.combine(item.originalValue)
            hasher.combine(item.workingValue)
            hasher.combine(item.value)
        case .datetime(let item, _):
            hasher.combine(item.id)
            hasher.combine(item.originalValue)
            hasher.combine(item.workingValue)
            hasher.combine(item.value)
        case .listPicker(let item, _):
            hasher.combine(item.id)
            hasher.combine(item.originalValue)
            hasher.combine(item.workingValue)
            hasher.combine(item.value)
        }
    }
}

extension SortFilterItem {
    var picker: PickerItem {
        get {
            switch self {
            case .picker(let item, _):
                return item
            default:
                fatalError("Unexpected value \(self)")
            }
        }
        
        set {
            switch self {
            case .picker(_, let showsOnFilterFeedbackBar):
                self = .picker(item: newValue, showsOnFilterFeedbackBar: showsOnFilterFeedbackBar)
            default:
                fatalError("Unexpected value \(self)")
            }
        }
    }
    
    var filterfeedback: PickerItem {
        get {
            switch self {
            case .filterfeedback(let item):
                return item
            default:
                fatalError("Unexpected value \(self)")
            }
        }
        
        set {
            switch self {
            case .filterfeedback:
                self = .filterfeedback(item: newValue)
            default:
                fatalError("Unexpected value \(self)")
            }
        }
    }
    
    var slider: SliderItem {
        get {
            switch self {
            case .slider(let item, _):
                return item
            default:
                fatalError("Unexpected value \(self)")
            }
        }
        
        set {
            switch self {
            case .slider(_, let showsOnFilterFeedbackBar):
                self = .slider(item: newValue, showsOnFilterFeedbackBar: showsOnFilterFeedbackBar)
            default:
                fatalError("Unexpected value \(self)")
            }
        }
    }
    
    var datetime: DateTimeItem {
        get {
            switch self {
            case .datetime(let item, _):
                return item
            default:
                fatalError("Unexpected value \(self)")
            }
        }
        
        set {
            switch self {
            case .datetime(_, let showsOnFilterFeedbackBar):
                self = .datetime(item: newValue, showsOnFilterFeedbackBar: showsOnFilterFeedbackBar)
            default:
                fatalError("Unexpected value \(self)")
            }
        }
    }
    
    var `switch`: SwitchItem {
        get {
            switch self {
            case .switch(let item, _):
                return item
            default:
                fatalError("Unexpected value \(self)")
            }
        }
        
        set {
            switch self {
            case .switch(_, let showsOnFilterFeedbackBar):
                self = .switch(item: newValue, showsOnFilterFeedbackBar: showsOnFilterFeedbackBar)
            default:
                fatalError("Unexpected value \(self)")
            }
        }
    }
    
    var listPicker: ListPickerItem {
        get {
            switch self {
            case .listPicker(let item, _):
                return item
            default:
                fatalError("Unexpected value \(self)")
            }
        }
        
        set {
            switch self {
            case .listPicker(_, let showsOnFilterFeedbackBar):
                self = .listPicker(item: newValue, showsOnFilterFeedbackBar: showsOnFilterFeedbackBar)
            default:
                fatalError("Unexpected value \(self)")
            }
        }
    }
    
    var isChanged: Bool {
        switch self {
        case .picker(let item, _):
            return item.isChanged
        case .filterfeedback(let item):
            return item.isChanged
        case .switch(let item, _):
            return item.isChanged
        case .datetime(let item, _):
            return item.isChanged
        case .slider(let item, _):
            return item.isChanged
        case .listPicker(let item, _):
            return item.isChanged
        }
    }
    
    var isOriginal: Bool {
        switch self {
        case .picker(let item, _):
            return item.isOriginal
        case .filterfeedback(let item):
            return item.isOriginal
        case .switch(let item, _):
            return item.isOriginal
        case .datetime(let item, _):
            return item.isOriginal
        case .slider(let item, _):
            return item.isOriginal
        case .listPicker(let item, _):
            return item.isOriginal
        }
    }
    
    mutating func cancel() {
        switch self {
        case .picker(var item, _):
            item.cancel()
            self.picker = item
        case .filterfeedback(var item):
            item.cancel()
            self.filterfeedback = item
        case .switch(var item, _):
            item.cancel()
            self.switch = item
        case .datetime(var item, _):
            item.cancel()
            self.datetime = item
        case .slider(var item, _):
            item.cancel()
            self.slider = item
        case .listPicker(var item, _):
            item.cancel()
            self.listPicker = item
        }
    }
    
    mutating func reset() {
        switch self {
        case .picker(var item, _):
            item.reset()
            self.picker = item
        case .filterfeedback(var item):
            item.reset()
            self.filterfeedback = item
        case .switch(var item, _):
            item.reset()
            self.switch = item
        case .datetime(var item, _):
            item.reset()
            self.datetime = item
        case .slider(var item, _):
            item.reset()
            self.slider = item
        case .listPicker(var item, _):
            item.reset()
            self.listPicker = item
        }
    }
    
    mutating func apply() {
        switch self {
        case .picker(var item, _):
            item.apply()
            self.picker = item
        case .filterfeedback(var item):
            item.apply()
            self.filterfeedback = item
        case .switch(var item, _):
            item.apply()
            self.switch = item
        case .datetime(var item, _):
            item.apply()
            self.datetime = item
        case .slider(var item, _):
            item.apply()
            self.slider = item
        case .listPicker(var item, _):
            item.apply()
            self.listPicker = item
        }
    }
}

public extension SortFilterItem {
    ///  Data structure for filter feedback, option list picker,
    struct PickerItem: Identifiable, Equatable {
        public let id: String
        public var name: String
        public var value: [Int]
        public var workingValue: [Int]
        let originalValue: [Int]
        
        var valueOptions: [String]
        public let allowsMultipleSelection: Bool
        public let allowsEmptySelection: Bool
        public var showsValueForSingleSelected: Bool = true
        public let icon: String?
        /// itemLayout is used when listPickerMode is filterFormCell, otherwise is ignored.
        public var itemLayout: OptionListPickerItemLayoutType = .fixed
        public var listPickerMode: OptionListPickerMode = .automatic
        
        public init(id: String = UUID().uuidString, name: String, value: [Int], valueOptions: [String], allowsMultipleSelection: Bool, allowsEmptySelection: Bool, showsValueForSingleSelected: Bool = true, icon: String? = nil, itemLayout: OptionListPickerItemLayoutType = .fixed, listPickerMode: OptionListPickerMode = .automatic) {
            self.id = id
            self.name = name
            self.value = value
            self.workingValue = value
            self.originalValue = value
            self.valueOptions = valueOptions
            self.allowsMultipleSelection = allowsMultipleSelection
            self.allowsEmptySelection = allowsEmptySelection
            self.showsValueForSingleSelected = showsValueForSingleSelected
            self.icon = icon
            self.itemLayout = itemLayout
            self.listPickerMode = listPickerMode
        }
        
        mutating func onTap(option: String) {
            guard let index = valueOptions.firstIndex(of: option) else { return }
            if self.workingValue.contains(index) {
                if self.workingValue.count > 1 {
                    self.workingValue = self.workingValue.filter { $0 != index }
                } else {
                    if self.allowsEmptySelection {
                        self.workingValue = []
                    } else {
                        self.workingValue = index == 1 ? [0] : [1]
                    }
                }
            } else {
                if self.allowsMultipleSelection {
                    self.workingValue.append(index)
                } else {
                    self.workingValue = [index]
                }
            }
        }
        
        mutating func optionOnTap(_ index: Int) {
            if self.workingValue.contains(index) {
                if self.workingValue.count > 1 {
                    self.workingValue = self.workingValue.filter { $0 != index }
                } else {
                    if self.allowsEmptySelection {
                        self.workingValue = []
                    } else {
                        self.workingValue = index == 1 ? [0] : [1]
                    }
                }
            } else {
                if self.allowsMultipleSelection {
                    self.workingValue.append(index)
                } else {
                    self.workingValue = [index]
                }
            }
        }
        
        mutating func cancel() {
            self.workingValue = self.value.map { $0 }
        }
        
        mutating func reset() {
            self.workingValue = self.originalValue.map { $0 }
        }
        
        mutating func apply() {
            self.value = self.workingValue.map { $0 }
        }
        
        func isOptionSelected(_ option: String) -> Bool {
            guard let idx = valueOptions.firstIndex(of: option) else { return false }
            return self.workingValue.contains(idx)
        }
        
        func isOptionSelected(index: Int) -> Bool {
            self.workingValue.contains(index)
        }
        
        mutating func selectAll(_ isAll: Bool) {
            self.workingValue.removeAll()
            if isAll {
                for i in 0 ..< self.valueOptions.count {
                    self.workingValue.append(i)
                }
            }
        }
        
        var isChecked: Bool {
            !self.value.isEmpty
        }
        
        var label: String {
            if self.allowsMultipleSelection, self.value.count >= 1 {
                if self.value.count == 1, self.showsValueForSingleSelected {
                    return self.valueOptions[self.value[0]]
                } else {
                    return "\(self.name) (\(self.value.count))"
                }
            } else {
                return self.name
            }
        }
        
        var isChanged: Bool {
            self.value != self.workingValue
        }
        
        var isOriginal: Bool {
            self.workingValue == self.originalValue
        }
    }
    
    /// Data structure for boolean type
    struct SwitchItem: Identifiable, Equatable {
        public var id: String
        public var name: String
        public var value: Bool?
        var workingValue: Bool?
        let originalValue: Bool?
        public let icon: String?
        public let hint: String?
        
        public init(id: String = UUID().uuidString, name: String, value: Bool?, icon: String? = nil, hint: String? = nil) {
            self.id = id
            self.name = name
            self.value = value
            self.workingValue = value
            self.originalValue = value
            self.icon = icon
            self.hint = hint
        }
        
        mutating func reset() {
            self.workingValue = self.originalValue
        }
        
        mutating func cancel() {
            self.workingValue = self.value
        }
        
        mutating func apply() {
            self.value = self.workingValue
        }
        
        var isChecked: Bool {
            self.value ?? false
        }
        
        var isChanged: Bool {
            self.value != self.workingValue
        }
        
        var isOriginal: Bool {
            self.workingValue == self.originalValue
        }
    }
    
    ///  Data structure for integer type slider
    struct SliderItem: Identifiable, Equatable {
        public let id: String
        public var name: String
        public var value: Int?
        var workingValue: Int?
        let originalValue: Int?
        public let minimumValue: Int
        public let maximumValue: Int
        let formatter: String?
        public let icon: String?
        public let hint: String?
        
        public init(id: String = UUID().uuidString, name: String, value: Int? = nil, minimumValue: Int, maximumValue: Int, formatter: String? = nil, icon: String? = nil, hint: String? = nil) {
            self.id = id
            self.name = name
            self.value = value
            self.workingValue = value
            self.originalValue = value
            self.minimumValue = minimumValue
            self.maximumValue = maximumValue
            self.formatter = formatter
            self.icon = icon
            self.hint = hint
        }
        
        mutating func reset() {
            self.workingValue = self.originalValue
        }
        
        mutating func cancel() {
            self.workingValue = self.value
        }
        
        mutating func apply() {
            self.value = self.workingValue
        }
        
        var isChecked: Bool {
            self.value != nil
        }
        
        var label: String {
            if let value = self.value {
                return "\(self.name): \(value)"
            }
            return self.name
        }
        
        mutating func setValue(newValue: SliderItem) {
            self.value = newValue.value
        }
        
        var isChanged: Bool {
            self.value != self.workingValue
        }
        
        var isOriginal: Bool {
            self.workingValue == self.originalValue
        }
    }
    
    /// Data structure for datetime data
    struct DateTimeItem: Equatable, Hashable {
        public let id: String
        public var name: String
        public var value: Date?
        var workingValue: Date?
        let originalValue: Date?
        public var icon: String?
        public let formatter: String?
        
        public init(id: String = UUID().uuidString, name: String, value: Date?, formatter: String? = nil, icon: String? = nil) {
            self.id = id
            self.name = name
            self.value = value
            self.workingValue = value
            self.originalValue = value
            self.formatter = formatter
            self.icon = icon
        }
        
        mutating func reset() {
            self.workingValue = self.originalValue
        }
        
        mutating func apply() {
            self.value = self.workingValue
        }
        
        mutating func cancel() {
            self.workingValue = self.value
        }
        
        var isChecked: Bool {
            self.value != nil
        }
        
        var label: String {
            if let value = self.value {
                if let format = self.formatter {
                    let formatter = DateFormatter()
                    formatter.dateFormat = format
                    return formatter.string(from: value)
                } else {
                    let dateFormatter = DateFormatter()
                    dateFormatter.dateStyle = .long
                    dateFormatter.timeStyle = .short
                    return dateFormatter.string(from: value)
                }
            } else {
                return self.name
            }
        }
        
        var isChanged: Bool {
            self.value != self.workingValue
        }
        
        var isOriginal: Bool {
            self.workingValue == self.originalValue
        }
    }
    
    ///  Data structure for filter feedback, option list picker,
    struct ListPickerItem: Identifiable, Equatable {
        public let id: String
        public var name: String
        public var value: [Int]
        public var workingValue: [Int]
        let originalValue: [Int]
        
        var valueOptions: [String]
        public let allowsMultipleSelection: Bool
        public let allowsEmptySelection: Bool
        public var showsValueForSingleSelected: Bool = true
        public let icon: String?
        
        public init(id: String = UUID().uuidString, name: String, value: [Int], valueOptions: [String], allowsMultipleSelection: Bool, allowsEmptySelection: Bool, showsValueForSingleSelected: Bool = true, icon: String? = nil) {
            self.id = id
            self.name = name
            self.value = value
            self.workingValue = value
            self.originalValue = value
            self.valueOptions = valueOptions
            self.allowsMultipleSelection = allowsMultipleSelection
            self.allowsEmptySelection = allowsEmptySelection
            self.showsValueForSingleSelected = showsValueForSingleSelected
            self.icon = icon
        }
        
        mutating func onTap(option: String) {
            guard let index = valueOptions.firstIndex(of: option) else { return }
            if self.workingValue.contains(index) {
                if self.workingValue.count > 1 {
                    self.workingValue = self.workingValue.filter { $0 != index }
                } else {
                    if self.allowsEmptySelection {
                        self.workingValue = []
                    } else {
                        self.workingValue = index == 1 ? [0] : [1]
                    }
                }
            } else {
                if self.allowsMultipleSelection {
                    self.workingValue.append(index)
                } else {
                    self.workingValue = [index]
                }
            }
        }
        
        mutating func optionOnTap(_ index: Int) {
            if self.workingValue.contains(index) {
                if self.workingValue.count > 1 {
                    self.workingValue = self.workingValue.filter { $0 != index }
                } else {
                    if self.allowsEmptySelection {
                        self.workingValue = []
                    } else {
                        self.workingValue = index == 1 ? [0] : [1]
                    }
                }
            } else {
                if self.allowsMultipleSelection {
                    self.workingValue.append(index)
                } else {
                    self.workingValue = [index]
                }
            }
        }
        
        mutating func cancel() {
            self.workingValue = self.value.map { $0 }
        }
        
        mutating func reset() {
            self.workingValue = self.originalValue.map { $0 }
        }
        
        mutating func apply() {
            self.value = self.workingValue.map { $0 }
        }
        
        func isOptionSelected(_ option: String) -> Bool {
            guard let idx = valueOptions.firstIndex(of: option) else { return false }
            return self.workingValue.contains(idx)
        }
        
        func isOptionSelected(index: Int) -> Bool {
            self.workingValue.contains(index)
        }
        
        mutating func selectAll(_ isAll: Bool) {
            self.workingValue.removeAll()
            if isAll {
                for i in 0 ..< self.valueOptions.count {
                    self.workingValue.append(i)
                }
            }
        }
        
        var isChecked: Bool {
            !self.value.isEmpty
        }
        
        var label: String {
            if self.allowsMultipleSelection, self.value.count >= 1 {
                if self.value.count == 1, self.showsValueForSingleSelected {
                    return self.valueOptions[self.value[0]]
                } else {
                    return "\(self.name) (\(self.value.count))"
                }
            } else {
                return self.name
            }
        }
        
        var isChanged: Bool {
            self.value != self.workingValue
        }
        
        var isOriginal: Bool {
            self.workingValue == self.originalValue
        }
    }
}
