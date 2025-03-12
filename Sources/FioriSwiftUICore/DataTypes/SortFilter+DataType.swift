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
        case .stepper(let item, _):
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
    
    /// The type of UI control is used to build:
    ///
    /// 1. Sort & Filter's menu item associated with a popover containing a SwiftUI Stepper with Fiori style
    ///
    /// 2. A section of view containing a SwiftUI Stepper with Fiori style
    case stepper(item: StepperItem, showsOnFilterFeedbackBar: Bool)
        
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
        case .stepper(_, let showsOnFilterFeedbackBar):
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
        case .stepper(let item, _):
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
    
    var stepper: StepperItem {
        get {
            switch self {
            case .stepper(let item, _):
                return item
            default:
                fatalError("Unexpected value \(self)")
            }
        }
        
        set {
            switch self {
            case .stepper(_, let showsOnFilterFeedbackBar):
                self = .stepper(item: newValue, showsOnFilterFeedbackBar: showsOnFilterFeedbackBar)
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
        case .stepper(let item, _):
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
        case .stepper(let item, _):
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
        case .stepper(var item, _):
            item.cancel()
            self.stepper = item
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
        case .stepper(var item, _):
            item.reset()
            self.stepper = item
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
        case .stepper(var item, _):
            item.apply()
            self.stepper = item
        }
    }
}

/// FilterFeedbackBar ResetButton Configuration
public struct FilterFeedbackBarResetButtonConfiguration: Equatable {
    var type: FilterFeedbackBarResetButtonType
    var title: String
    var isHidden: Bool
    
    init(type: FilterFeedbackBarResetButtonType = .reset, title: String, isHidden: Bool = false) {
        self.type = type
        self.title = title
        self.isHidden = isHidden
    }
    
    /// Default FilterFeedbackBarResetButtonConfiguration
    public init() {
        self.init(type: .reset, title: NSLocalizedString("Reset", tableName: "FioriSwiftUICore", bundle: Bundle.accessor, comment: ""), isHidden: false)
    }
    
    /// Customize FilterFeedbackBarResetButtonConfiguration
    /// - Parameters:
    ///   - type: Reset button type
    ///   - title: Reset button title
    ///   - isHidden: A Boolean value that determines whether reset button is hidden.
    public init(with type: FilterFeedbackBarResetButtonType = .reset, title: String = "", isHidden: Bool = false) {
        self.init(type: type, title: title == "" ? NSLocalizedString("Reset", tableName: "FioriSwiftUICore", bundle: Bundle.accessor, comment: "") : title, isHidden: isHidden)
    }
    
    /// :nodoc:
    public static func == (lhs: FilterFeedbackBarResetButtonConfiguration, rhs: FilterFeedbackBarResetButtonConfiguration) -> Bool {
        lhs.type == rhs.type && lhs.title == rhs.title && lhs.isHidden == rhs.isHidden
    }
}

/// FilterFeedbackBar slider item value change handler
public struct SliderValueChangeHandler: Equatable {
    /// Slider description style type
    public enum SliderInformationType {
        case fiori
        case error
        case warning
        case informational
        case success
    }
    
    public var onValueChange: (Double, Double) -> (SliderInformationType, String)
    
    /// Create init a SliderValueChangeHandler object.
    /// - Parameter onValueChange: Call back for value changing.
    public init(onValueChange: @escaping (Double, Double) -> (SliderInformationType, String)) {
        self.onValueChange = onValueChange
    }
    
    /// :nodoc:
    public static func == (lhs: SliderValueChangeHandler, rhs: SliderValueChangeHandler) -> Bool {
        true
    }
}

public extension SortFilterItem {
    ///  Data structure for filter feedback, option list picker,
    struct PickerItem: Identifiable, Equatable {
        public let id: String
        public var name: String
        public var title: String?
        public var value: [Int]
        public var workingValue: [Int]
        let originalValue: [Int]
        
        var valueOptions: [String]
        public let allowsMultipleSelection: Bool
        public let allowsEmptySelection: Bool
        public var barItemDisplayMode: BarItemDisplayMode = .name
        public let icon: String?
        /// itemLayout is used when listPickerMode is filterFormCell, otherwise is ignored.
        public var itemLayout: OptionListPickerItemLayoutType = .fixed
        public var displayMode: DisplayMode = .automatic
        /// If searchBar in list picker is shown. Default is `false`.
        public var isSearchBarHidden: Bool = false
        var disableListEntriesSection: Bool = false
        var allowsDisplaySelectionCount: Bool = true
        var resetButtonConfiguration: FilterFeedbackBarResetButtonConfiguration = .init()
        
        var uuidValueOptions: [ValueOptionModel] = []
        var workingValueSet: Set<UUID> = []
        
        /// Available OptionListPicker modes. Use this enum to define picker mode  to present.
        public enum DisplayMode {
            /// Decided by options count
            case automatic
            /// FilterFormCell
            case filterFormCell
            /// Menu
            case menu
            /// List
            case list
        }
        
        /// Enum for display mode of the FilterFeedbackBar item when only one value is selected for that item.
        /// This is effective, regardless of that item allowing multiple selection or not
        ///  The default value is `.name`.
        public enum BarItemDisplayMode {
            /// To show the name
            case name
            /// To show the value
            case value
            /// To show both the name and value
            case nameAndValue
        }
        
        /// Enum for list show entries section
        ///  The default value is `.default`.
        public enum ListEntriesSectionMode {
            /// Depend on 'allowsMultipleSelection'
            case `default`
            /// Enable
            case enable
            /// Disable
            case disable
        }
        
        /// Model for valueOptions, add unique identifier and index for valueOptions
        struct ValueOptionModel: Identifiable, Equatable {
            let id = UUID()
            let index: Int
            let value: String
            init(index: Int, value: String) {
                self.index = index
                self.value = value
            }
        }
        
        /// Create PickerItem for filter feedback.
        /// When `displayMode` is `.filterFormCell`, the styles of options can be customized by some styles of FilterFormView, such as:
        /// filterFormOptionAttributes, filterFormOptionMinHeight, filterFormOptionMinTouchHeight, filterFormOptionCornerRadius, filterFormOptionPadding, filterFormOptionTitleSpacing, filterFormOptionsItemSpacing, filterFormOptionsLineSpacing.
        /// - Parameters:
        ///   - id: The unique identifier for PickerItem.
        ///   - name: Item name.
        ///   - title: Title label of the options.
        ///   - value: Item selected value.
        ///   - valueOptions: Item options.
        ///   - allowsMultipleSelection: A boolean value to indicate to allow multiple selections or not.
        ///   - allowsEmptySelection: A boolean value to indicate to allow empty selections or not.
        ///   - barItemDisplayMode: Name display mode for the bar.
        ///   - isSearchBarHidden: A boolean value to indicate to search bar hidden or not.
        ///   - icon: Icon at the leading side of the item.
        ///   - itemLayout: Options layout type when `displayMode` is  `.filterFormCell`.
        ///   - displayMode: Options display mode.
        ///   - listEntriesSectionMode: List entries section mode when `displayMode` is  `.list`.
        ///   - allowsDisplaySelectionCount: A boolean value to indicate to allow display selection count or not.
        ///   - resetButtonConfiguration: A configuration to customize the reset button.
        public init(id: String = UUID().uuidString, name: String, title: String? = nil, value: [Int], valueOptions: [String], allowsMultipleSelection: Bool, allowsEmptySelection: Bool, barItemDisplayMode: BarItemDisplayMode = .name, isSearchBarHidden: Bool = false, icon: String? = nil, itemLayout: OptionListPickerItemLayoutType = .fixed, displayMode: DisplayMode = .automatic, listEntriesSectionMode: ListEntriesSectionMode = .default, allowsDisplaySelectionCount: Bool = true, resetButtonConfiguration: FilterFeedbackBarResetButtonConfiguration = FilterFeedbackBarResetButtonConfiguration()) {
            self.id = id
            self.name = name
            self.title = title
            self.value = value
            self.workingValue = value
            self.originalValue = value
            self.valueOptions = valueOptions
            self.uuidValueOptions = valueOptions.enumerated().map { index, option in
                ValueOptionModel(index: index, value: option)
            }
            
            let workingValueSetArray: [UUID] = self.uuidValueOptions.filter { value.contains($0.index) }.map(\.id)
            self.workingValueSet = Set(workingValueSetArray)
            
            self.allowsMultipleSelection = allowsMultipleSelection
            self.allowsEmptySelection = allowsEmptySelection
            self.isSearchBarHidden = isSearchBarHidden
            self.barItemDisplayMode = barItemDisplayMode
            self.icon = icon
            self.itemLayout = itemLayout
            self.displayMode = displayMode
            
            switch listEntriesSectionMode {
            case .default:
                self.disableListEntriesSection = allowsMultipleSelection ? false : true
            case .disable:
                self.disableListEntriesSection = true
            case .enable:
                self.disableListEntriesSection = false
            }
            
            self.allowsDisplaySelectionCount = allowsDisplaySelectionCount
            self.resetButtonConfiguration = resetButtonConfiguration
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
            
            let workingValueArray = self.originalValue.flatMap { originalValue in
                self.uuidValueOptions.filter { $0.index == originalValue }.map(\.id)
            }
            self.workingValueSet = Set(workingValueArray)
        }
        
        mutating func clearAll() {
            self.workingValue.removeAll()
            self.workingValueSet.removeAll()
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
            if self.value.count == 1 {
                switch self.barItemDisplayMode {
                case .name:
                    return self.name
                case .value:
                    return self.valueOptions[self.value[0]]
                case .nameAndValue:
                    return self.name + ": " + self.valueOptions[self.value[0]]
                }
            } else {
                if self.allowsMultipleSelection, self.value.count >= 1 {
                    return "\(self.name) (\(self.value.count))"
                } else {
                    return self.name
                }
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
        public var value: Double?
        var workingValue: Double?
        let originalValue: Double?
        
        public var lowerValue: Double?
        public var upperValue: Double?
        var workingLowerValue: Double?
        var workingUpperValue: Double?
        let originalLowerValue: Double?
        let originalUpperValue: Double?

        let range: ClosedRange<Double>
        let step: Double
        let decimalPlaces: Int
        
        public let minimumValue: Double
        public let maximumValue: Double
        let formatter: String?
        public let icon: String?
        public let hint: String?
        
        public var onValueChange: SliderValueChangeHandler?
        
        let sliderMode: SliderMode
        /// Enum for slider mode of the FilterFeedbackBar SliderItem.
        /// The  value is inited in func init().
        enum SliderMode {
            case single
            case range
        }
        
        /// Create a single slider with Int type value and selection range
        /// - Parameters:
        ///   - id: Item id
        ///   - name: Item name
        ///   - value: Item selected value
        ///   - minimumValue: Lower bound for selection
        ///   - maximumValue: Upper bound for selection
        ///   - formatter: The title formatter of the slider
        ///   - icon: The icon image in the item bar
        ///   - hint: The hint text of the slider
        public init(id: String = UUID().uuidString, name: String, value: Int? = nil, minimumValue: Int, maximumValue: Int, formatter: String? = nil, icon: String? = nil, hint: String? = nil) {
            self.id = id
            self.name = name
            self.value = Double(value ?? minimumValue)
            self.workingValue = Double(value ?? minimumValue)
            self.originalValue = Double(value ?? minimumValue)
            self.minimumValue = Double(minimumValue)
            self.maximumValue = Double(maximumValue)
            self.formatter = formatter
            self.icon = icon
            self.hint = hint
            
            self.originalLowerValue = nil
            self.originalUpperValue = nil
            
            self.range = Double(minimumValue) ... Double(maximumValue)
            self.step = 1
            self.decimalPlaces = 0
            self.sliderMode = .single
            self.onValueChange = nil
        }
        
        /// Create a single slider with Double type value and selection range
        /// - Parameters:
        ///   - id: Item id
        ///   - name: Item name
        ///   - value: Item selected value
        ///   - range: Range for selection
        ///   - step: Incremental/decremental value when the thumb changes its position. The default is `1`.
        ///   - decimalPlaces: This property specifies the number of digits that should appear after the decimal point in the Double value for slider value. It controls the precision of the numerical representation by determining how many decimal places are displayed or used in calculations, rounding the Double accordingly. The default is `0`.
        ///   - formatter: The title formatter of the slider
        ///   - icon: The icon image in the item bar
        ///   - hint: The hint text of the slider
        public init(id: String = UUID().uuidString, name: String, value: Double? = nil, range: ClosedRange<Double> = 0 ... 100, step: Double = 1, decimalPlaces: Int = 0, formatter: String? = nil, icon: String? = nil, hint: String? = nil) {
            self.id = id
            self.name = name
            self.value = value
            self.workingValue = value
            self.originalValue = value
            self.minimumValue = range.lowerBound
            self.maximumValue = range.upperBound
            self.formatter = formatter
            self.icon = icon
            self.hint = hint
            self.onValueChange = nil
            
            self.originalLowerValue = nil
            self.originalUpperValue = nil
            
            self.range = range
            self.step = step
            self.decimalPlaces = decimalPlaces
            self.sliderMode = .single
        }
        
        /// Create a range slider with Double type value and selection range
        /// - Parameters:
        ///   - id: Item id
        ///   - name: Item name
        ///   - lowerValue: The lower value of range slider
        ///   - upperValue: The upper value of range slider
        ///   - range: Range for selection
        ///   - step: Incremental/decremental value when the thumb changes its position. The default is `1`.
        ///   - decimalPlaces: This property specifies the number of digits that should appear after the decimal point in the Double value for slider value. It controls the precision of the numerical representation by determining how many decimal places are displayed or used in calculations, rounding the Double accordingly. The default is `0`.
        ///   - formatter: The title formatter of the slider.
        ///   - icon: The icon image in the item bar
        ///   - hint: The hint text of the slider
        ///   - onValueChange: The call back for value changing, return a tuple (hint style type, hint description), if the hint description has value, the hint label will show this value in stead of hint.
        public init(id: String = UUID().uuidString, name: String, lowerValue: Double? = nil, upperValue: Double? = nil, range: ClosedRange<Double> = 0 ... 100, step: Double = 1, decimalPlaces: Int = 0, formatter: String? = nil, icon: String? = nil, hint: String? = nil, onValueChange: SliderValueChangeHandler? = nil) {
            self.id = id
            self.name = name
            self.lowerValue = lowerValue
            self.upperValue = upperValue
            
            self.workingLowerValue = lowerValue
            self.workingUpperValue = upperValue
            self.originalLowerValue = lowerValue
            self.originalUpperValue = upperValue
            
            self.minimumValue = range.lowerBound
            self.maximumValue = range.upperBound
            self.formatter = formatter
            self.icon = icon
            self.hint = hint
            self.onValueChange = onValueChange
            
            self.originalValue = nil
            
            self.range = range
            self.step = step
            self.decimalPlaces = decimalPlaces
            self.sliderMode = .range
        }
        
        mutating func reset() {
            if self.sliderMode == .single {
                self.workingValue = self.originalValue
            } else {
                self.workingLowerValue = self.originalLowerValue
                self.workingUpperValue = self.originalUpperValue
            }
        }
        
        mutating func cancel() {
            if self.sliderMode == .single {
                self.workingValue = self.value
            } else {
                self.workingLowerValue = self.lowerValue
                self.workingUpperValue = self.upperValue
            }
        }
        
        mutating func apply() {
            if self.sliderMode == .single {
                self.value = self.workingValue
            } else {
                self.lowerValue = self.workingLowerValue
                self.upperValue = self.workingUpperValue
            }
        }
        
        var isChecked: Bool {
            if self.sliderMode == .single {
                self.value != nil
            } else {
                self.lowerValue != nil && self.upperValue != nil
            }
        }
        
        var label: String {
            if self.sliderMode == .single {
                if let value = self.value {
                    return "\(self.name): \(String(format: "%.\(self.decimalPlaces)f", value))"
                }
                return self.name
            } else {
                if let lowerValue = self.lowerValue, let upperValue = self.upperValue {
                    return "\(self.name): (\(String(format: "%.\(self.decimalPlaces)f", lowerValue)) - \(String(format: "%.\(self.decimalPlaces)f", upperValue)))"
                }
                return self.name
            }
        }
        
        mutating func setValue(newValue: SliderItem) {
            if self.sliderMode == .single {
                self.value = newValue.value
            } else {
                self.lowerValue = newValue.lowerValue
                self.upperValue = newValue.upperValue
            }
        }
        
        var isChanged: Bool {
            if self.sliderMode == .single {
                self.value != self.workingValue
            } else {
                self.lowerValue != self.workingLowerValue || self.upperValue != self.workingUpperValue
            }
        }
        
        var isOriginal: Bool {
            if self.sliderMode == .single {
                self.workingValue == self.originalValue
            } else {
                self.workingLowerValue == self.originalLowerValue && self.workingUpperValue == self.originalUpperValue
            }
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
    
    ///  Data structure for integer type stepper
    struct StepperItem: Identifiable, Equatable {
        public let id: String
        public var name: String
        public var value: Double
        var workingValue: Double
        let originalValue: Double
        public let icon: String?

        public let stepperTitle: String
        /// The step value
        public let step: Double
        /// a range of values
        public let stepRange: ClosedRange<Double>
        /// Indicates whether the stepper field  supports decimal values. Default is false.
        public let isDecimalSupported: Bool
        public let incrementActionActive: Bool
        public let decrementActionActive: Bool
        public let stepperIcon: UIImage?
        public let description: String?
        
        public init(id: String = UUID().uuidString, name: String, stepperTitle: String, value: Double, step: Double = 1, stepRange: ClosedRange<Double>, isDecimalSupported: Bool = false, incrementActionActive: Bool = true, decrementActionActive: Bool = true, icon: String? = nil, stepperIcon: UIImage? = nil, description: String? = nil) {
            self.id = id
            self.name = name
            self.value = value
            self.workingValue = value
            self.originalValue = value
            self.stepperTitle = stepperTitle
            self.step = step
            self.stepRange = stepRange
            self.isDecimalSupported = isDecimalSupported
            self.incrementActionActive = incrementActionActive
            self.decrementActionActive = decrementActionActive
            self.icon = icon
            self.stepperIcon = stepperIcon
            self.description = description
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
            true
        }
        
        var label: String {
            if self.isDecimalSupported {
                return "\(self.name): \(String(describing: self.value))"
            } else {
                return "\(self.name): \(String(describing: Int(self.value)))"
            }
        }
        
        mutating func setValue(newValue: StepperItem) {
            self.value = newValue.value
        }
        
        var isChanged: Bool {
            self.value != self.workingValue
        }
        
        var isOriginal: Bool {
            self.workingValue == self.originalValue
        }
    }
}
