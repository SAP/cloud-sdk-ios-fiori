// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

public struct Description {
    let description: any View

    @Environment(\.descriptionStyle) var style

    var componentIdentifier: String = Description.identifier

    fileprivate var _shouldApplyDefaultStyle = true

    public init(@ViewBuilder description: () -> any View = { EmptyView() },
                componentIdentifier: String? = Description.identifier)
    {
        self.description = description()
        self.componentIdentifier = componentIdentifier ?? Description.identifier
    }
}

public extension Description {
    static let identifier = "fiori_description_component"
}

public extension Description {
    init(description: AttributedString? = nil) {
        self.init(description: { OptionalText(description) })
    }
}

public extension Description {
    init(_ configuration: DescriptionConfiguration) {
        self.init(configuration, shouldApplyDefaultStyle: false)
    }

    internal init(_ configuration: DescriptionConfiguration, shouldApplyDefaultStyle: Bool) {
        self.description = configuration.description
        self._shouldApplyDefaultStyle = shouldApplyDefaultStyle
        self.componentIdentifier = configuration.componentIdentifier
    }
}

extension Description: View {
    public var body: some View {
        if self._shouldApplyDefaultStyle {
            self.defaultStyle()
        } else {
            self.style.resolve(configuration: .init(componentIdentifier: self.componentIdentifier, description: .init(self.description))).typeErased
                .transformEnvironment(\.descriptionStyleStack) { stack in
                    if !stack.isEmpty {
                        stack.removeLast()
                    }
                }
        }
    }
}

private extension Description {
    func shouldApplyDefaultStyle(_ bool: Bool) -> some View {
        var s = self
        s._shouldApplyDefaultStyle = bool
        return s
    }

    func defaultStyle() -> some View {
        Description(.init(componentIdentifier: self.componentIdentifier, description: .init(self.description)))
            .shouldApplyDefaultStyle(false)
            .descriptionStyle(.fiori)
            .typeErased
    }
}
