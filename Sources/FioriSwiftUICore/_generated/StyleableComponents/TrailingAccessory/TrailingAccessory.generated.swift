// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

public struct TrailingAccessory {
    let trailingAccessory: any View

    @Environment(\.trailingAccessoryStyle) var style

    var componentIdentifier: String = TrailingAccessory.identifier

    fileprivate var _shouldApplyDefaultStyle = true

    public init(@ViewBuilder trailingAccessory: () -> any View = { EmptyView() },
                componentIdentifier: String? = TrailingAccessory.identifier)
    {
        self.trailingAccessory = trailingAccessory()
        self.componentIdentifier = componentIdentifier ?? TrailingAccessory.identifier
    }
}

public extension TrailingAccessory {
    static let identifier = "fiori_trailingaccessory_component"
}

public extension TrailingAccessory {
    init(_ configuration: TrailingAccessoryConfiguration) {
        self.init(configuration, shouldApplyDefaultStyle: false)
    }

    internal init(_ configuration: TrailingAccessoryConfiguration, shouldApplyDefaultStyle: Bool) {
        self.trailingAccessory = configuration.trailingAccessory
        self._shouldApplyDefaultStyle = shouldApplyDefaultStyle
        self.componentIdentifier = configuration.componentIdentifier
    }
}

extension TrailingAccessory: View {
    public var body: some View {
        if self._shouldApplyDefaultStyle {
            self.defaultStyle()
        } else {
            self.style.resolve(configuration: .init(componentIdentifier: self.componentIdentifier, trailingAccessory: .init(self.trailingAccessory))).typeErased
                .transformEnvironment(\.trailingAccessoryStyleStack) { stack in
                    if !stack.isEmpty {
                        stack.removeLast()
                    }
                }
        }
    }
}

private extension TrailingAccessory {
    func shouldApplyDefaultStyle(_ bool: Bool) -> some View {
        var s = self
        s._shouldApplyDefaultStyle = bool
        return s
    }

    func defaultStyle() -> some View {
        TrailingAccessory(.init(componentIdentifier: self.componentIdentifier, trailingAccessory: .init(self.trailingAccessory)))
            .shouldApplyDefaultStyle(false)
            .trailingAccessoryStyle(.fiori)
            .typeErased
    }
}
