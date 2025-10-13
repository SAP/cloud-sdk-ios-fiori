// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

public struct FlexItem {
    let flexItem: any View

    @Environment(\.flexItemStyle) var style

    var componentIdentifier: String = FlexItem.identifier

    fileprivate var _shouldApplyDefaultStyle = true

    public init(@ViewBuilder flexItem: () -> any View = { EmptyView() },
                componentIdentifier: String? = FlexItem.identifier)
    {
        self.flexItem = flexItem()
        self.componentIdentifier = componentIdentifier ?? FlexItem.identifier
    }
}

public extension FlexItem {
    static let identifier = "fiori_flexitem_component"
}

public extension FlexItem {
    init(_ configuration: FlexItemConfiguration) {
        self.init(configuration, shouldApplyDefaultStyle: false)
    }

    internal init(_ configuration: FlexItemConfiguration, shouldApplyDefaultStyle: Bool) {
        self.flexItem = configuration.flexItem
        self._shouldApplyDefaultStyle = shouldApplyDefaultStyle
        self.componentIdentifier = configuration.componentIdentifier
    }
}

extension FlexItem: View {
    public var body: some View {
        if self._shouldApplyDefaultStyle {
            self.defaultStyle()
        } else {
            self.style.resolve(configuration: .init(componentIdentifier: self.componentIdentifier, flexItem: .init(self.flexItem))).typeErased
                .transformEnvironment(\.flexItemStyleStack) { stack in
                    if !stack.isEmpty {
                        stack.removeLast()
                    }
                }
        }
    }
}

private extension FlexItem {
    func shouldApplyDefaultStyle(_ bool: Bool) -> some View {
        var s = self
        s._shouldApplyDefaultStyle = bool
        return s
    }

    func defaultStyle() -> some View {
        FlexItem(.init(componentIdentifier: self.componentIdentifier, flexItem: .init(self.flexItem)))
            .shouldApplyDefaultStyle(false)
            .flexItemStyle(.fiori)
            .typeErased
    }
}
