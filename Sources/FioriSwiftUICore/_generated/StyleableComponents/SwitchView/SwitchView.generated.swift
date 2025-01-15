// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

/// `SwitchView`provides a Fiori style title and`Toggle`.
///
/// ## Usage
/// ```swift
/// @State var isOn: Bool = true
///
/// SwitchView(title: "Switch", isOn: self.$isOn)
/// ```
public struct SwitchView {
    let title: any View
    @Binding var isOn: Bool

    @Environment(\.switchViewStyle) var style

    var componentIdentifier: String = SwitchView.identifier

    fileprivate var _shouldApplyDefaultStyle = true

    public init(@ViewBuilder title: () -> any View,
                isOn: Binding<Bool>,
                componentIdentifier: String? = SwitchView.identifier)
    {
        self.title = Title(title: title, componentIdentifier: componentIdentifier)
        self._isOn = isOn
        self.componentIdentifier = componentIdentifier ?? SwitchView.identifier
    }
}

public extension SwitchView {
    static let identifier = "fiori_switchview_component"
}

public extension SwitchView {
    init(title: AttributedString,
         isOn: Binding<Bool>)
    {
        self.init(title: { Text(title) }, isOn: isOn)
    }
}

public extension SwitchView {
    init(_ configuration: SwitchViewConfiguration) {
        self.init(configuration, shouldApplyDefaultStyle: false)
    }

    internal init(_ configuration: SwitchViewConfiguration, shouldApplyDefaultStyle: Bool) {
        self.title = configuration.title
        self._isOn = configuration.$isOn
        self._shouldApplyDefaultStyle = shouldApplyDefaultStyle
        self.componentIdentifier = configuration.componentIdentifier
    }
}

extension SwitchView: View {
    public var body: some View {
        if self._shouldApplyDefaultStyle {
            self.defaultStyle()
        } else {
            self.style.resolve(configuration: .init(componentIdentifier: self.componentIdentifier, title: .init(self.title), isOn: self.$isOn)).typeErased
                .transformEnvironment(\.switchViewStyleStack) { stack in
                    if !stack.isEmpty {
                        stack.removeLast()
                    }
                }
        }
    }
}

private extension SwitchView {
    func shouldApplyDefaultStyle(_ bool: Bool) -> some View {
        var s = self
        s._shouldApplyDefaultStyle = bool
        return s
    }

    func defaultStyle() -> some View {
        SwitchView(.init(componentIdentifier: self.componentIdentifier, title: .init(self.title), isOn: self.$isOn))
            .shouldApplyDefaultStyle(false)
            .switchViewStyle(SwitchViewFioriStyle.ContentFioriStyle())
            .typeErased
    }
}
