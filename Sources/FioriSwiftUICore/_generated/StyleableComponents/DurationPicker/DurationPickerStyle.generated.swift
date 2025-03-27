// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

public protocol DurationPickerStyle: DynamicProperty {
    associatedtype Body: View

    func makeBody(_ configuration: DurationPickerConfiguration) -> Body
}

struct AnyDurationPickerStyle: DurationPickerStyle {
    let content: (DurationPickerConfiguration) -> any View

    init(@ViewBuilder _ content: @escaping (DurationPickerConfiguration) -> any View) {
        self.content = content
    }

    public func makeBody(_ configuration: DurationPickerConfiguration) -> some View {
        self.content(configuration).typeErased
    }
}

public struct DurationPickerConfiguration {
    public var componentIdentifier: String = "fiori_durationpicker_component"
    @Binding public var selection: Int
    public let maximumMinutes: Int
    public let minimumMinutes: Int
    public let minuteInterval: Int
    public let measurementFormatter: MeasurementFormatter
}

extension DurationPickerConfiguration {
    func isDirectChild(_ componentIdentifier: String) -> Bool {
        componentIdentifier == self.componentIdentifier
    }
}

public struct DurationPickerFioriStyle: DurationPickerStyle {
    public func makeBody(_ configuration: DurationPickerConfiguration) -> some View {
        DurationPicker(configuration)
    }
}
