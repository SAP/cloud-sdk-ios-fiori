import SwiftUI
import UIKit

public enum SortFilterItem: Identifiable, Hashable {
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
        }
    }
    
    case picker(item: PickerItem, isShownOnMenu: Bool)
    case filterfeedback(item: PickerItem)
    case `switch`(item: SwitchItem, isShownOnMenu: Bool)
    case slider(item: SliderItem, isShownOnMenu: Bool)
    case datetime(item: DateTimeItem, isShownOnMenu: Bool)
    
    public var isShownOnMenu: Bool {
        switch self {
        case .picker(_, let isShownOnMenu):
            return isShownOnMenu
        case .filterfeedback:
            return true
        case .switch(_, let isShownOnMenu):
            return isShownOnMenu
        case .slider(_, let isShownOnMenu):
            return isShownOnMenu
        case .datetime(_, let isShownOnMenu):
            return isShownOnMenu
        }
    }
    
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
        }
    }
}

///  (value: [Int], valueOptions: [String], keyName: String?, allowsMultipleSelection: Bool, allowsEmptySelection: Bool)
public struct PickerItem: Identifiable, Equatable {
    public var id = UUID().uuidString
    
    public var name: String

    public var value: [Int]
    public var workingValue: [Int]
    let originalValue: [Int]

    var valueOptions: [String]
    public let allowsMultipleSelection: Bool
    public let allowsEmptySelection: Bool
    public let icon: String?
    
    public init(value: [Int], valueOptions: [String], name: String, allowsMultipleSelection: Bool, allowsEmptySelection: Bool, icon: String? = nil) {
        self.value = value
        self.workingValue = value
        self.originalValue = value
        self.valueOptions = valueOptions
        self.name = name
        self.allowsMultipleSelection = allowsMultipleSelection
        self.allowsEmptySelection = allowsEmptySelection
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

    var isChecked: Bool {
        !self.value.isEmpty
    }
    
    var label: String {
        
        if allowsMultipleSelection && self.value.count >= 1 {
            if self.value.count == 1 {
                return valueOptions[value[0]]
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
}

/// (value: Bool, keyName: String)
public struct SwitchItem: Identifiable, Equatable {
    public var id = UUID().uuidString
    
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
}

///   (value: Float, minimumValue: Float, maximumValue: Float, keyName: String?)
public struct SliderItem: Identifiable, Equatable {
    public var id = UUID().uuidString
    
    public var name: String

    public var value: Int?
    var workingValue: Int?
    let originalValue: Int?
    public let minimumValue: Int
    public let maximumValue: Int
    let formatter: String?
    public let icon: String?
    public let hint: String?
    
    public init(value: Int? = nil, minimumValue: Int, maximumValue: Int, name: String, formatter: String? = nil, icon: String? = nil, hint: String? = nil) {
        self.value = value
        self.workingValue = value
        self.originalValue = value
        self.minimumValue = minimumValue
        self.maximumValue = maximumValue
        self.name = name
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
        if let formatter = formatter, let value = value {
            return String(format: formatter, value)
        }
        return name
    }
    
    mutating func setValue(newValue: SliderItem) {
        self.value = newValue.value
    }
    
    var isChanged: Bool {
        self.value != self.workingValue
    }
}

public struct DateTimeItem: Equatable, Hashable {
    public let id = UUID().uuidString
    
    public var name: String
    public var value: Date?
    var workingValue: Date?
    let originalValue: Date?
    public var icon: String?
    public let formatter: String?
    
    public init(value: Date?, name: String, formatter: String? = nil, icon: String? = nil) {
        self.value = value
        self.workingValue = value
        self.originalValue = value
        self.name = name
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
                let dateFormatter: DateFormatter = DateFormatter()
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
            case .picker(_, let isShownOnMenu):
                self = .picker(item: newValue, isShownOnMenu: isShownOnMenu)
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
            case .slider(_, let isShownOnMenu):
                self = .slider(item: newValue, isShownOnMenu: isShownOnMenu)
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
            case .datetime(_, let isShownOnMenu):
                self = .datetime(item: newValue, isShownOnMenu: isShownOnMenu)
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
            case .switch(_, let isShownOnMenu):
                self = .switch(item: newValue, isShownOnMenu: isShownOnMenu)
            default:
                fatalError("Unexpected value \(self)")
            }
        }
    }
    
    public var isChanged: Bool {
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
        }
    }
    
    public mutating func cancel() {
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
        }
    }
    
    public mutating func reset() {
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
        }
    }
    
    public mutating func apply() {
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
        }
    }
}

/*
 Notes:
 c. to resolve: keyName should not be nillable for menu item, but it can be nil for sheet
 e. make filter feedback configuraion a separate item type, instead of sharing FilterItem. ??
 */
