// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

public struct Title {
    let title: any View

    @Environment(\.titleStyle) var style

    var componentIdentifier: String = Title.identifier

    fileprivate var _shouldApplyDefaultStyle = true

    public init(@ViewBuilder title: () -> any View,
                componentIdentifier: String? = Title.identifier)
    {
        self.title = title()
        self.componentIdentifier = componentIdentifier ?? Title.identifier
    }
}

public extension Title {
    static let identifier = "fiori_title_component"
}

public extension Title {
    init(title: AttributedString,
         componentIdentifier: String? = Title.identifier)
    {
        self.init(title: { Text(title) }, componentIdentifier: componentIdentifier)
    }
}

public extension Title {
    init(_ configuration: TitleConfiguration) {
        self.init(configuration, shouldApplyDefaultStyle: false)
    }

    internal init(_ configuration: TitleConfiguration, shouldApplyDefaultStyle: Bool) {
        self.title = configuration.title
        self._shouldApplyDefaultStyle = shouldApplyDefaultStyle
        self.componentIdentifier = configuration.componentIdentifier
    }
}

extension Title: View {
    public var body: some View {
        if self._shouldApplyDefaultStyle {
            self.defaultStyle()
        } else {
            self.style.resolve(configuration: .init(componentIdentifier: self.componentIdentifier, title: .init(self.title))).typeErased
                .transformEnvironment(\.titleStyleStack) { stack in
                    if !stack.isEmpty {
                        stack.removeLast()
                    }
                }
        }
    }
}

private extension Title {
    func shouldApplyDefaultStyle(_ bool: Bool) -> some View {
        var s = self
        s._shouldApplyDefaultStyle = bool
        return s
    }

    func defaultStyle() -> some View {
        Title(.init(componentIdentifier: self.componentIdentifier, title: .init(self.title)))
            .shouldApplyDefaultStyle(false)
            .titleStyle(.fiori)
            .typeErased
    }
}
