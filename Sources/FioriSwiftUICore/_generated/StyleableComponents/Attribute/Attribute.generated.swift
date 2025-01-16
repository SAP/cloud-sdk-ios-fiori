// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

public struct Attribute {
    let attribute: any View

    @Environment(\.attributeStyle) var style

    var componentIdentifier: String = Attribute.identifier

    fileprivate var _shouldApplyDefaultStyle = true

    public init(@ViewBuilder attribute: () -> any View = { EmptyView() },
                componentIdentifier: String? = Attribute.identifier)
    {
        self.attribute = attribute()
        self.componentIdentifier = componentIdentifier ?? Attribute.identifier
    }
}

public extension Attribute {
    static let identifier = "fiori_attribute_component"
}

public extension Attribute {
    init(attribute: AttributedString? = nil,
         componentIdentifier: String? = Attribute.identifier)
    {
        self.init(attribute: { OptionalText(attribute) }, componentIdentifier: componentIdentifier)
    }
}

public extension Attribute {
    init(_ configuration: AttributeConfiguration) {
        self.init(configuration, shouldApplyDefaultStyle: false)
    }

    internal init(_ configuration: AttributeConfiguration, shouldApplyDefaultStyle: Bool) {
        self.attribute = configuration.attribute
        self._shouldApplyDefaultStyle = shouldApplyDefaultStyle
        self.componentIdentifier = configuration.componentIdentifier
    }
}

extension Attribute: View {
    public var body: some View {
        if self._shouldApplyDefaultStyle {
            self.defaultStyle()
        } else {
            self.style.resolve(configuration: .init(componentIdentifier: self.componentIdentifier, attribute: .init(self.attribute))).typeErased
                .transformEnvironment(\.attributeStyleStack) { stack in
                    if !stack.isEmpty {
                        stack.removeLast()
                    }
                }
        }
    }
}

private extension Attribute {
    func shouldApplyDefaultStyle(_ bool: Bool) -> some View {
        var s = self
        s._shouldApplyDefaultStyle = bool
        return s
    }

    func defaultStyle() -> some View {
        Attribute(.init(componentIdentifier: self.componentIdentifier, attribute: .init(self.attribute)))
            .shouldApplyDefaultStyle(false)
            .attributeStyle(.fiori)
            .typeErased
    }
}
