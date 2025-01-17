// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import FioriThemeManager
import Foundation
import SwiftUI

public protocol SegmentedControlPickerStyle: DynamicProperty {
    associatedtype Body: View

    func makeBody(_ configuration: SegmentedControlPickerConfiguration) -> Body
}

struct AnySegmentedControlPickerStyle: SegmentedControlPickerStyle {
    let content: (SegmentedControlPickerConfiguration) -> any View

    init(@ViewBuilder _ content: @escaping (SegmentedControlPickerConfiguration) -> any View) {
        self.content = content
    }

    public func makeBody(_ configuration: SegmentedControlPickerConfiguration) -> some View {
        self.content(configuration).typeErased
    }
}

public struct SegmentedControlPickerConfiguration {
    public var componentIdentifier: String = "fiori_segmentedcontrolpicker_component"
    public let options: [AttributedString]
    @Binding public var selectedIndex: Int
}

public extension SegmentedControlPickerConfiguration {
    var contentIdentifier: String {
        self.componentIdentifier + "_content"
    }

    var optionsIdentifier: String {
        self.componentIdentifier + "_options"
    }
}

extension SegmentedControlPickerConfiguration {
    func isDirectChild(_ componentIdentifier: String) -> Bool {
        componentIdentifier == self.componentIdentifier
    }
}

public struct SegmentedControlPickerFioriStyle: SegmentedControlPickerStyle {
    public func makeBody(_ configuration: SegmentedControlPickerConfiguration) -> some View {
        SegmentedControlPicker(configuration)
            .optionsStyle(OptionsFioriStyle(segmentedControlPickerConfiguration: configuration))
    }
}

public struct SegmentedControlPickerNSSStyle: SegmentedControlPickerStyle {
    var isGlobal: Bool = false
    var data: NSSStyleData {
        self.isGlobal ? NSSTool.globalNSSStyle : NSSTool.mergeNSSStyle
    }

    public func makeBody(_ configuration: SegmentedControlPickerConfiguration) -> some View {
        SegmentedControlPicker(configuration)
            .optionsStyle(OptionsNSSStyle(segmentedControlPickerConfiguration: configuration, nssData: self.data.value(configuration.optionsIdentifier)))
            .segmentedControlPickerStyle(ContentNSSStyle(segmentedControlPickerConfiguration: configuration, nssData: self.data.value(configuration.contentIdentifier)))
    }
}
