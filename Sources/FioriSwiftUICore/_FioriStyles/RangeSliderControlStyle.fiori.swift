import FioriThemeManager

// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

/**
 This file provides default fiori style for the component.
 
 1. Uncomment the following code.
 2. Implement layout and style in corresponding places.
 3. Delete `.generated` from file name.
 4. Move this file to `_FioriStyles` folder under `FioriSwiftUICore`.
 */

// Base Layout style
public struct RangeSliderControlBaseStyle: RangeSliderControlStyle {
    @Environment(\.layoutDirection) private var layoutDirection
    @Environment(\.isEnabled) private var isEnabled
    @Environment(\.roundValueFormat) private var roundValueFormat
    @Environment(\.rangeSliderAccessibility) private var rangeSliderAccessibility
    
    @State private var criticalValue: Double? // To stored the current lower/upper value during upper/lower thumb moving and make sure the lower/upper value can be exchanged.
    
    public func makeBody(_ configuration: RangeSliderControlConfiguration) -> some View {
        GeometryReader { geometry in
            ZStack {
                // Invisible element to allow accessibility focusing the whole track
                let accessibilityColorHStack = Color.clear
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .accessibilityElement()
                    .accessibilityLabel(self.rangeSliderAccessibility.label ?? "")
                    .accessibilityHint(self.rangeSliderAccessibility.hint ?? "")
                    .accessibilityValue(self.rangeSliderAccessibility.value ?? "")
                    .accessibilitySortPriority(self.rangeSliderAccessibility.sortPriority)
                
                if self.rangeSliderAccessibility.adjustable {
                    // Set it is .adjustable when there is only one thumb in enabled state
                    accessibilityColorHStack
                        .accessibilityAdjustableAction { direction in
                            configuration.adjustThumbAccessibilityAction(direction: direction)
                        }
                } else {
                    accessibilityColorHStack
                }
                
                let effectiveLowerValue = min(configuration.lowerValue, configuration.upperValue)
                let effectiveUpperValue = max(configuration.lowerValue, configuration.upperValue)
                
                let upperValueWidth = self.xOffsetFor(min(effectiveUpperValue, configuration.range.upperBound), in: geometry.size.width, configuration: configuration)
                let lowerValueWidth = self.xOffsetFor(max(effectiveLowerValue, configuration.range.lowerBound), in: geometry.size.width, configuration: configuration)
                
                let width = upperValueWidth >= lowerValueWidth ? (upperValueWidth - lowerValueWidth) : (lowerValueWidth - upperValueWidth)
                
                // Inactive track
                configuration.inactiveTrack
                
                // Active track
                configuration.activeTrack
                    .frame(width: width)
                    .position(
                        x: (self.xOffsetFor(max(effectiveLowerValue, configuration.range.lowerBound), in: geometry.size.width, configuration: configuration) + self.xOffsetFor(min(effectiveUpperValue, configuration.range.upperBound), in: geometry.size.width, configuration: configuration)) / 2,
                        y: geometry.size.height / 2
                    )
                
                if configuration.showsLowerThumb {
                    self.lowerThumb(effectiveLowerValue, allowedSize: geometry.size, configuration: configuration)
                }
                
                if configuration.showsUpperThumb {
                    self.upperThumb(effectiveUpperValue, allowedSize: geometry.size, configuration: configuration)
                }
            }
        }
        .frame(height: 44)
    }
    
    func xOffsetFor(_ value: Double, in width: CGFloat, offset: Bool = false, configuration: RangeSliderControlConfiguration) -> CGFloat {
        let rangeWidth = configuration.range.upperBound - configuration.range.lowerBound
        let valueOffset = value - configuration.range.lowerBound
        let offsetPadding: CGFloat = offset ? configuration.thumbHalfWidth : 0
        return CGFloat(valueOffset / rangeWidth) * (width - 2 * configuration.thumbHalfWidth) + offsetPadding
    }
    
    func valueFrom(x: CGFloat, in width: CGFloat, configuration: RangeSliderControlConfiguration) -> Double {
        // Invert the x position for RTL layout
        let adjustedX = self.layoutDirection == .rightToLeft ? width - x : x
        let proportion = max(0, min(1, (adjustedX - configuration.thumbHalfWidth) / (width - 2 * configuration.thumbHalfWidth)))
        let rawValue = Double(proportion) * (configuration.range.upperBound - configuration.range.lowerBound) + configuration.range.lowerBound
        if rawValue == configuration.range.upperBound || rawValue == configuration.range.lowerBound {
            return rawValue
        } else {
            return round(rawValue / configuration.step) * configuration.step // Stepped value
        }
    }
    
    func lowerThumb(_ effectiveLowerValue: Double, allowedSize: CGSize, configuration: RangeSliderControlConfiguration) -> some View {
        configuration.lowerThumb
            .position(
                x: self.xOffsetFor(max(effectiveLowerValue, configuration.range.lowerBound), in: allowedSize.width, offset: true, configuration: configuration),
                y: allowedSize.height / 2
            )
            .gesture(
                self.isEnabled ?
                    DragGesture()
                    .onEnded { _ in
                        self.criticalValue = nil
                        if let onRangeValueChange = configuration.onRangeValueChange {
                            onRangeValueChange(false, configuration.lowerValue, configuration.upperValue)
                        }
                    }
                    .onChanged { value in
                        if self.criticalValue == nil {
                            self.criticalValue = configuration.upperValue
                        }
                        
                        if let criticalValue = self.criticalValue {
                            let newValue = self.valueFrom(x: value.location.x, in: allowedSize.width, configuration: configuration)
                            if newValue <= criticalValue {
                                configuration.lowerValue = newValue
                                if configuration.upperValue != criticalValue {
                                    configuration.upperValue = criticalValue
                                }
                            } else {
                                configuration.upperValue = newValue
                                if configuration.lowerValue != criticalValue {
                                    configuration.lowerValue = criticalValue
                                }
                            }
                        }
                    }
                    : nil
            )
    }
    
    func upperThumb(_ effectiveUpperValue: Double, allowedSize: CGSize, configuration: RangeSliderControlConfiguration) -> some View {
        configuration.upperThumb
            .position(
                x: self.xOffsetFor(min(effectiveUpperValue, configuration.range.upperBound), in: allowedSize.width, offset: true, configuration: configuration),
                y: allowedSize.height / 2
            )
            .gesture(
                self.isEnabled ?
                    DragGesture()
                    .onEnded { _ in
                        self.criticalValue = nil
                        if let onRangeValueChange = configuration.onRangeValueChange {
                            onRangeValueChange(false, configuration.lowerValue, configuration.upperValue)
                        }
                    }
                    .onChanged { value in
                        if self.criticalValue == nil {
                            self.criticalValue = configuration.lowerValue
                        }
                        
                        if let criticalValue = self.criticalValue {
                            let newValue = self.valueFrom(x: value.location.x, in: allowedSize.width, configuration: configuration)
                            if newValue >= criticalValue {
                                configuration.upperValue = newValue
                                if configuration.lowerValue != criticalValue {
                                    configuration.lowerValue = criticalValue
                                }
                            } else {
                                configuration.lowerValue = newValue
                                if configuration.upperValue != criticalValue {
                                    configuration.upperValue = criticalValue
                                }
                            }
                        }
                    }
                    : nil
            )
    }
}

// Default fiori styles
extension RangeSliderControlFioriStyle {
    struct ContentFioriStyle: RangeSliderControlStyle {
        func makeBody(_ configuration: RangeSliderControlConfiguration) -> some View {
            RangeSliderControl(configuration)
        }
    }
    
    struct LowerThumbFioriStyle: LowerThumbStyle {
        let rangeSliderControlConfiguration: RangeSliderControlConfiguration
        @Environment(\.isEnabled) private var isEnabled
        
        func makeBody(_ configuration: LowerThumbConfiguration) -> some View {
            LowerThumb(configuration)
                .foregroundStyle(Color.white)
                .frame(width: self.rangeSliderControlConfiguration.thumbHalfWidth * 2, height: self.rangeSliderControlConfiguration.thumbHalfWidth * 2)
                .shadow(color: .black.opacity(0.2), radius: self.rangeSliderControlConfiguration.thumbHalfWidth * 0.4, x: 0, y: 3)
        }
    }
    
    struct UpperThumbFioriStyle: UpperThumbStyle {
        let rangeSliderControlConfiguration: RangeSliderControlConfiguration
        
        func makeBody(_ configuration: UpperThumbConfiguration) -> some View {
            UpperThumb(configuration)
                .frame(width: self.rangeSliderControlConfiguration.thumbHalfWidth * 2, height: self.rangeSliderControlConfiguration.thumbHalfWidth * 2)
                .foregroundStyle(Color.white)
                .shadow(color: .black.opacity(0.2), radius: self.rangeSliderControlConfiguration.thumbHalfWidth * 0.4, x: 0, y: 3)
        }
    }
    
    struct ActiveTrackFioriStyle: ActiveTrackStyle {
        let rangeSliderControlConfiguration: RangeSliderControlConfiguration
        @Environment(\.isEnabled) private var isEnabled
        
        func makeBody(_ configuration: ActiveTrackConfiguration) -> some View {
            ActiveTrack(configuration)
                .frame(height: 4)
                .foregroundStyle(self.isEnabled ? Color.preferredColor(.tintColor) : Color.preferredColor(.tintColor).opacity(0.5))
        }
    }
    
    struct InactiveTrackFioriStyle: InactiveTrackStyle {
        let rangeSliderControlConfiguration: RangeSliderControlConfiguration
        @Environment(\.isEnabled) private var isEnabled
        
        func makeBody(_ configuration: InactiveTrackConfiguration) -> some View {
            InactiveTrack(configuration)
                .frame(height: 4)
                .foregroundStyle(self.isEnabled ? Color.preferredColor(.secondaryFill) : Color.preferredColor(.secondaryFill).opacity(0.5))
        }
    }
}

extension RangeSliderControl {
    func accessibilityAdjustments(_ model: RangeSliderAccessibilityModel) -> some View {
        self.modifier(RangeSliderAccessibilityModifier(model: model))
    }
}

extension RangeSliderControlConfiguration {
    func adjustThumbAccessibilityAction(direction: AccessibilityAdjustmentDirection) {
        switch direction {
        case .decrement:
            if self.showsLowerThumb {
                self.lowerValue = max(self.lowerValue - self.step, self.range.lowerBound)
            } else {
                self.upperValue = max(self.upperValue - self.step, self.range.lowerBound)
            }
        case .increment:
            if self.showsLowerThumb {
                self.lowerValue = min(self.lowerValue + self.step, self.range.upperBound)
            } else {
                self.upperValue = min(self.upperValue + self.step, self.range.upperBound)
            }
        @unknown default:
            if self.showsLowerThumb {
                self.lowerValue = self.lowerValue
            } else {
                self.upperValue = self.upperValue
            }
        }
    }
}

struct RangeSliderAccessibilityModel {
    var label: String?
    var value: String?
    var hint: String?
    var adjustable: Bool = true
    var sortPriority: Double = 6
}

// To change the Range Slider accessibility
struct RangeSliderAccessibilityModifier: ViewModifier {
    var model: RangeSliderAccessibilityModel
    
    func body(content: Content) -> some View {
        content.environment(\.rangeSliderAccessibility, self.model)
    }
}

struct RangeSliderAccessibilityModelKey: EnvironmentKey {
    static let defaultValue: RangeSliderAccessibilityModel = .init()
}

extension EnvironmentValues {
    var rangeSliderAccessibility: RangeSliderAccessibilityModel {
        get { self[RangeSliderAccessibilityModelKey.self] }
        set { self[RangeSliderAccessibilityModelKey.self] = newValue }
    }
}
