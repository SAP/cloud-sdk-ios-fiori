// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

public struct LeadingAccessory {
    let leadingAccessory: any View

    @Environment(\.leadingAccessoryStyle) var style

    var componentIdentifier: String = LeadingAccessory.identifier

    fileprivate var _shouldApplyDefaultStyle = true

    public init(@ViewBuilder leadingAccessory: () -> any View = { EmptyView() },
                componentIdentifier: String? = LeadingAccessory.identifier)
    {
        self.leadingAccessory = leadingAccessory()
        self.componentIdentifier = componentIdentifier ?? LeadingAccessory.identifier
    }
}

public extension LeadingAccessory {
    static let identifier = "fiori_leadingaccessory_component"
}

public extension LeadingAccessory {
    init(_ configuration: LeadingAccessoryConfiguration) {
        self.init(configuration, shouldApplyDefaultStyle: false)
    }

    internal init(_ configuration: LeadingAccessoryConfiguration, shouldApplyDefaultStyle: Bool) {
        self.leadingAccessory = configuration.leadingAccessory
        self._shouldApplyDefaultStyle = shouldApplyDefaultStyle
        self.componentIdentifier = configuration.componentIdentifier
    }
}

extension LeadingAccessory: View {
    public var body: some View {
        if self._shouldApplyDefaultStyle {
            self.defaultStyle()
        } else {
            self.style.resolve(configuration: .init(componentIdentifier: self.componentIdentifier, leadingAccessory: .init(self.leadingAccessory))).typeErased
                .transformEnvironment(\.leadingAccessoryStyleStack) { stack in
                    if !stack.isEmpty {
                        stack.removeLast()
                    }
                }
        }
    }
}

private extension LeadingAccessory {
    func shouldApplyDefaultStyle(_ bool: Bool) -> some View {
        var s = self
        s._shouldApplyDefaultStyle = bool
        return s
    }

    func defaultStyle() -> some View {
        LeadingAccessory(.init(componentIdentifier: self.componentIdentifier, leadingAccessory: .init(self.leadingAccessory)))
            .shouldApplyDefaultStyle(false)
            .leadingAccessoryStyle(.fiori)
            .typeErased
    }
}
