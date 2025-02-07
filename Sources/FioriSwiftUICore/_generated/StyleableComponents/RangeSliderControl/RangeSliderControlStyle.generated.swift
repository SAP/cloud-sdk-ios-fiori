// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

public protocol RangeSliderControlStyle: DynamicProperty {
    associatedtype Body: View

    func makeBody(_ configuration: RangeSliderControlConfiguration) -> Body
}

struct AnyRangeSliderControlStyle: RangeSliderControlStyle {
    let content: (RangeSliderControlConfiguration) -> any View

    init(@ViewBuilder _ content: @escaping (RangeSliderControlConfiguration) -> any View) {
        self.content = content
    }

    public func makeBody(_ configuration: RangeSliderControlConfiguration) -> some View {
        self.content(configuration).typeErased
    }
}

public struct RangeSliderControlConfiguration {
    public var componentIdentifier: String = "fiori_rangeslidercontrol_component"
    public let lowerThumb: LowerThumb
    public let upperThumb: UpperThumb
    public let activeTrack: ActiveTrack
    public let inactiveTrack: InactiveTrack
    @Binding public var lowerValue: Double
    @Binding public var upperValue: Double
    public let range: ClosedRange<Double>
    public let step: Double
    public let decimalPlaces: Int
    public let thumbHalfWidth: CGFloat
    public let showsLowerThumb: Bool
    public let showsUpperThumb: Bool
    public let onRangeValueChange: ((Bool, Double, Double) -> Void)?

    public typealias LowerThumb = ConfigurationViewWrapper
    public typealias UpperThumb = ConfigurationViewWrapper
    public typealias ActiveTrack = ConfigurationViewWrapper
    public typealias InactiveTrack = ConfigurationViewWrapper
}

extension RangeSliderControlConfiguration {
    func isDirectChild(_ componentIdentifier: String) -> Bool {
        componentIdentifier == self.componentIdentifier
    }
}

public struct RangeSliderControlFioriStyle: RangeSliderControlStyle {
    public func makeBody(_ configuration: RangeSliderControlConfiguration) -> some View {
        RangeSliderControl(configuration)
            .lowerThumbStyle(LowerThumbFioriStyle(rangeSliderControlConfiguration: configuration))
            .upperThumbStyle(UpperThumbFioriStyle(rangeSliderControlConfiguration: configuration))
            .activeTrackStyle(ActiveTrackFioriStyle(rangeSliderControlConfiguration: configuration))
            .inactiveTrackStyle(InactiveTrackFioriStyle(rangeSliderControlConfiguration: configuration))
    }
}
