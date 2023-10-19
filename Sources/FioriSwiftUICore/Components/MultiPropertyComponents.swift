import Foundation
import SwiftUI

/// use for component with a function and one (or more) properties
internal protocol _ComponentMultiPropGenerating {}

internal protocol _ActionItems: _ComponentMultiPropGenerating {
    var actionItems_: [ActivityItemDataType]? { get }
    // sourcery: no_view
    var didSelectActivityItem_: ((ActivityItemDataType) -> Void)? { get }
}

internal protocol _Action: _ComponentMultiPropGenerating {
    var actionText_: String? { get }
    // sourcery: no_view
    var didSelectAction_: (() -> Void)? { get }
}

internal protocol _TextInput: _ComponentMultiPropGenerating, AnyObject {
    // sourcery: bindingPropertyOptional = .constant("")
    var textInputValue_: String { get set }
    // sourcery: no_view
    var onCommit_: (() -> Void)? { get }
}

internal protocol _KpiProgress: KpiComponent, _ComponentMultiPropGenerating {
    // sourcery: no_view
    var fraction_: Double? { get }
}

internal protocol _ProgressIndicator: _ComponentMultiPropGenerating {
    var progressIndicatorText_: String? { get }
}

internal protocol _DurationPicker: _ComponentMultiPropGenerating, AnyObject {
    // sourcery: bindingProperty
    // sourcery: no_view
    var selection: Int { get set }
    
    // sourcery: no_view
    // sourcery: default.value = 1439
    var maximumMinutes: Int { get set }
    
    // sourcery: no_view
    // sourcery: default.value = 0
    var minimumMinutes: Int { get set }
    
    // sourcery: no_view
    // sourcery: default.value = 1
    var minuteInterval: Int { get set }
    
    // sourcery: no_view
    // sourcery: default.value = MeasurementFormatter()
    var measurementFormatter: MeasurementFormatter { get set }
}

internal protocol _SliderPicker: _ComponentMultiPropGenerating, AnyObject {
    // sourcery: bindingProperty
    // sourcery: no_view
    var value: Int? { get set }
    
    // sourcery: default.value = nil
    var formatter: String? { get }

    // sourcery: no_view
    // sourcery: default.value = 0.0
    var minimumValue: Int { get }
    
    // sourcery: no_view
    // sourcery: default.value = 100.0
    var maximumValue: Int { get }
    
    // sourcery: no_view
    // sourcery: default.value = nil
    var hint: String? { get }
}

internal protocol _SwitchPicker: _ComponentMultiPropGenerating, AnyObject {
    // sourcery: bindingProperty
    // sourcery: no_view
    var value: Bool? { get set }
    
    // sourcery: no_view
    // sourcery: default.value = nil
    var name: String? { get }

    // sourcery: no_view
    // sourcery: default.value = nil
    var hint: String? { get }
}

internal protocol _OptionListPicker: _ComponentMultiPropGenerating, AnyObject {
    // sourcery: bindingProperty
    // sourcery: no_view
    var value: [Int] { get set }
    
    // sourcery: no_view
    var valueOptions: [String] { get }
    
    // sourcery: no_view
    // sourcery: default.value = nil
    var hint: String? { get }
}
