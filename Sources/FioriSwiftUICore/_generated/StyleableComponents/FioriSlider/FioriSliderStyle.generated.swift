// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

public protocol FioriSliderStyle: DynamicProperty {
    associatedtype Body: View

    func makeBody(_ configuration: FioriSliderConfiguration) -> Body
}

struct AnyFioriSliderStyle: FioriSliderStyle {
    let content: (FioriSliderConfiguration) -> any View

    init(@ViewBuilder _ content: @escaping (FioriSliderConfiguration) -> any View) {
        self.content = content
    }

    public func makeBody(_ configuration: FioriSliderConfiguration) -> some View {
        self.content(configuration).typeErased
    }
}

public struct FioriSliderConfiguration {
    public let title: Title
    public let valueLabel: ValueLabel
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
    public let icon: Icon
    public let description: Description
    public let leadingAccessory: LeadingAccessory
    public let trailingAccessory: TrailingAccessory
    public let isRangeSlider: Bool
    public let valueFormat: String?
    public let rangeFormat: (String, String)?
    public let leadingValueFormat: String?
    public let trailingValueFormat: String?
    public let showsValueLabel: Bool
    public let showsLeadingAccessory: Bool
    public let showsTrailingAccessory: Bool
    public let onValueChange: ((Bool, Double) -> Void)?
    public let onEditFieldFocusStatusChange: ((Bool) -> Void)?

    public typealias Title = ConfigurationViewWrapper
    public typealias ValueLabel = ConfigurationViewWrapper
    public typealias LowerThumb = ConfigurationViewWrapper
    public typealias UpperThumb = ConfigurationViewWrapper
    public typealias ActiveTrack = ConfigurationViewWrapper
    public typealias InactiveTrack = ConfigurationViewWrapper
    public typealias Icon = ConfigurationViewWrapper
    public typealias Description = ConfigurationViewWrapper
    public typealias LeadingAccessory = ConfigurationViewWrapper
    public typealias TrailingAccessory = ConfigurationViewWrapper
}

public struct FioriSliderFioriStyle: FioriSliderStyle {
    public func makeBody(_ configuration: FioriSliderConfiguration) -> some View {
        FioriSlider(configuration)
            .titleStyle(TitleFioriStyle(fioriSliderConfiguration: configuration))
            .valueLabelStyle(ValueLabelFioriStyle(fioriSliderConfiguration: configuration))
            .lowerThumbStyle(LowerThumbFioriStyle(fioriSliderConfiguration: configuration))
            .upperThumbStyle(UpperThumbFioriStyle(fioriSliderConfiguration: configuration))
            .activeTrackStyle(ActiveTrackFioriStyle(fioriSliderConfiguration: configuration))
            .inactiveTrackStyle(InactiveTrackFioriStyle(fioriSliderConfiguration: configuration))
            .iconStyle(IconFioriStyle(fioriSliderConfiguration: configuration))
            .descriptionStyle(DescriptionFioriStyle(fioriSliderConfiguration: configuration))
            .leadingAccessoryStyle(LeadingAccessoryFioriStyle(fioriSliderConfiguration: configuration))
            .trailingAccessoryStyle(TrailingAccessoryFioriStyle(fioriSliderConfiguration: configuration))
            .rangeSliderControlStyle(RangeSliderControlFioriStyle(fioriSliderConfiguration: configuration))
            .informationViewStyle(InformationViewFioriStyle(fioriSliderConfiguration: configuration))
    }
}
