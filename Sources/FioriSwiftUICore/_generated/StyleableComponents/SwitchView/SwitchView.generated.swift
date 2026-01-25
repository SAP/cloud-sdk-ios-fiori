// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

/// `SwitchView`provides a Fiori style title and`Toggle`.
///
/// /// Inputs
/// - title: A `ViewBuilder` closure that renders the title content (required).
/// - isOn: A binding to a Boolean value that controls the toggle state (required).
/// - stateLabel: An optional `ViewBuilder` closure for custom state text. It is only effective when the controlState is `.readOnly`.  It will replace the toggle which usually shows as On or Off .
/// - icon: An optional `ViewBuilder` closure for an icon in the informationView.
/// - description: An optional `ViewBuilder` closure for descriptive text in the informationView.
/// - controlState: The interaction state of the switch (default: .normal). Options: .normal, .disabled, .readOnly.
///
/// ## Usage
/// ```swift
/// @State var isOn: Bool = true
///
/// SwitchView(title: "Switch", isOn: self.$isOn)
///
/// SwitchView(title: "Switch", isOn: self.$isOn, stateLabel: self.isOn ? "Open" : "Close", description: "Locked by your organization", controlState: .readOnly)
///     .informationViewStyle(.warning)
/// ```
public struct SwitchView {
    let title: any View
    @Binding var isOn: Bool
    let stateLabel: any View
    let icon: any View
    let description: any View
    /// The control state that determines how the switchView element responds to user interaction.
    ///
    /// Possible values:
    /// - `.normal`: Fully interactive (default)
    /// - `.disabled`: Not interactive but visually unchanged
    /// - `.readOnly`: Not interactive and visually indicates read-only state
    let controlState: ControlState

    @Environment(\.switchViewStyle) var style

    var componentIdentifier: String = SwitchView.identifier

    fileprivate var _shouldApplyDefaultStyle = true

    public init(@ViewBuilder title: () -> any View,
                isOn: Binding<Bool>,
                @ViewBuilder stateLabel: () -> any View = { EmptyView() },
                @ViewBuilder icon: () -> any View = { EmptyView() },
                @ViewBuilder description: () -> any View = { EmptyView() },
                controlState: ControlState = .normal,
                componentIdentifier: String? = SwitchView.identifier)
    {
        self.title = Title(title: title, componentIdentifier: componentIdentifier)
        self._isOn = isOn
        self.stateLabel = StateLabel(stateLabel: stateLabel, componentIdentifier: componentIdentifier)
        self.icon = Icon(icon: icon, componentIdentifier: componentIdentifier)
        self.description = Description(description: description, componentIdentifier: componentIdentifier)
        self.controlState = controlState
        self.componentIdentifier = componentIdentifier ?? SwitchView.identifier
    }
}

public extension SwitchView {
    static let identifier = "fiori_switchview_component"
}

public extension SwitchView {
    init(title: AttributedString,
         isOn: Binding<Bool>,
         stateLabel: AttributedString? = nil,
         icon: Image? = nil,
         description: AttributedString? = nil,
         controlState: ControlState = .normal)
    {
        self.init(title: { Text(title) }, isOn: isOn, stateLabel: { OptionalText(stateLabel) }, icon: { icon }, description: { OptionalText(description) }, controlState: controlState)
    }
}

public extension SwitchView {
    init(_ configuration: SwitchViewConfiguration) {
        self.init(configuration, shouldApplyDefaultStyle: false)
    }

    internal init(_ configuration: SwitchViewConfiguration, shouldApplyDefaultStyle: Bool) {
        self.title = configuration.title
        self._isOn = configuration.$isOn
        self.stateLabel = configuration.stateLabel
        self.icon = configuration.icon
        self.description = configuration.description
        self.controlState = configuration.controlState
        self._shouldApplyDefaultStyle = shouldApplyDefaultStyle
        self.componentIdentifier = configuration.componentIdentifier
    }
}

extension SwitchView: View {
    public var body: some View {
        if self._shouldApplyDefaultStyle {
            self.defaultStyle()
        } else {
            self.style.resolve(configuration: .init(componentIdentifier: self.componentIdentifier, title: .init(self.title), isOn: self.$isOn, stateLabel: .init(self.stateLabel), icon: .init(self.icon), description: .init(self.description), controlState: self.controlState)).typeErased
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
        SwitchView(.init(componentIdentifier: self.componentIdentifier, title: .init(self.title), isOn: self.$isOn, stateLabel: .init(self.stateLabel), icon: .init(self.icon), description: .init(self.description), controlState: self.controlState))
            .shouldApplyDefaultStyle(false)
            .switchViewStyle(SwitchViewFioriStyle.ContentFioriStyle())
            .typeErased
    }
}
