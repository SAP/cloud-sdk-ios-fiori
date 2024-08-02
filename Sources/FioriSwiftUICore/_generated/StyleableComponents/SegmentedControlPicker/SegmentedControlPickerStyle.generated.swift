// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
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
    public let options: [AttributedString]
    @Binding public var selectedIndex: Int
}

public struct SegmentedControlPickerFioriStyle: SegmentedControlPickerStyle {
    public func makeBody(_ configuration: SegmentedControlPickerConfiguration) -> some View {
        SegmentedControlPicker(configuration)
            .optionsStyle(OptionsFioriStyle(segmentedControlPickerConfiguration: configuration))
    }
}
