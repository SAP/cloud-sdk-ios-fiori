// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

/// `SegmentedControlPicker` provides a segmented style `Picker` with Fiori styling.
///
/// ## Usage
/// ```swift
/// @State var selectedIndex: Int = 0
///
/// SegmentedControlPicker(options: ["Segment 1", "Segment 2", "Segment 3"], selectedIndex: $selectedIndex)
/// ```
public struct SegmentedControlPicker {
    let options: [AttributedString]
    /// The selected value index of the Picker
    @Binding var selectedIndex: Int

    @Environment(\.segmentedControlPickerStyle) var style

    fileprivate var _shouldApplyDefaultStyle = true

    public init(options: [AttributedString] = [],
                selectedIndex: Binding<Int>)
    {
        self.options = options
        self._selectedIndex = selectedIndex
    }
}

public extension SegmentedControlPicker {
    init(_ configuration: SegmentedControlPickerConfiguration) {
        self.init(configuration, shouldApplyDefaultStyle: false)
    }

    internal init(_ configuration: SegmentedControlPickerConfiguration, shouldApplyDefaultStyle: Bool) {
        self.options = configuration.options
        self._selectedIndex = configuration.$selectedIndex
        self._shouldApplyDefaultStyle = shouldApplyDefaultStyle
    }
}

extension SegmentedControlPicker: View {
    public var body: some View {
        if self._shouldApplyDefaultStyle {
            self.defaultStyle()
        } else {
            self.style.resolve(configuration: .init(options: self.options, selectedIndex: self.$selectedIndex)).typeErased
                .transformEnvironment(\.segmentedControlPickerStyleStack) { stack in
                    if !stack.isEmpty {
                        stack.removeLast()
                    }
                }
        }
    }
}

private extension SegmentedControlPicker {
    func shouldApplyDefaultStyle(_ bool: Bool) -> some View {
        var s = self
        s._shouldApplyDefaultStyle = bool
        return s
    }

    func defaultStyle() -> some View {
        SegmentedControlPicker(.init(options: self.options, selectedIndex: self.$selectedIndex))
            .shouldApplyDefaultStyle(false)
            .segmentedControlPickerStyle(SegmentedControlPickerFioriStyle.ContentFioriStyle())
            .typeErased
    }
}
