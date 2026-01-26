// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

public struct StateLabel {
    let stateLabel: any View

    @Environment(\.stateLabelStyle) var style

    var componentIdentifier: String = StateLabel.identifier

    fileprivate var _shouldApplyDefaultStyle = true

    public init(@ViewBuilder stateLabel: () -> any View = { EmptyView() },
                componentIdentifier: String? = StateLabel.identifier)
    {
        self.stateLabel = stateLabel()
        self.componentIdentifier = componentIdentifier ?? StateLabel.identifier
    }
}

public extension StateLabel {
    static let identifier = "fiori_statelabel_component"
}

public extension StateLabel {
    init(stateLabel: AttributedString? = nil) {
        self.init(stateLabel: { OptionalText(stateLabel) })
    }
}

public extension StateLabel {
    init(_ configuration: StateLabelConfiguration) {
        self.init(configuration, shouldApplyDefaultStyle: false)
    }

    internal init(_ configuration: StateLabelConfiguration, shouldApplyDefaultStyle: Bool) {
        self.stateLabel = configuration.stateLabel
        self._shouldApplyDefaultStyle = shouldApplyDefaultStyle
        self.componentIdentifier = configuration.componentIdentifier
    }
}

extension StateLabel: View {
    public var body: some View {
        if self._shouldApplyDefaultStyle {
            self.defaultStyle()
        } else {
            self.style.resolve(configuration: .init(componentIdentifier: self.componentIdentifier, stateLabel: .init(self.stateLabel))).typeErased
                .transformEnvironment(\.stateLabelStyleStack) { stack in
                    if !stack.isEmpty {
                        stack.removeLast()
                    }
                }
        }
    }
}

private extension StateLabel {
    func shouldApplyDefaultStyle(_ bool: Bool) -> some View {
        var s = self
        s._shouldApplyDefaultStyle = bool
        return s
    }

    func defaultStyle() -> some View {
        StateLabel(.init(componentIdentifier: self.componentIdentifier, stateLabel: .init(self.stateLabel)))
            .shouldApplyDefaultStyle(false)
            .stateLabelStyle(.fiori)
            .typeErased
    }
}
