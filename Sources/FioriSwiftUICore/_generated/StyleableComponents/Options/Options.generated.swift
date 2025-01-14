// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

public struct Options {
    let options: [AttributedString]

    @Environment(\.optionsStyle) var style

    var componentIdentifier: String = Options.identifier

    fileprivate var _shouldApplyDefaultStyle = true

    public init(options: [AttributedString] = [],
                componentIdentifier: String? = Options.identifier)
    {
        self.options = options
        self.componentIdentifier = componentIdentifier ?? Options.identifier
    }
}

public extension Options {
    static let identifier = "fiori_options_component"
}

public extension Options {
    init(_ configuration: OptionsConfiguration) {
        self.init(configuration, shouldApplyDefaultStyle: false)
    }

    internal init(_ configuration: OptionsConfiguration, shouldApplyDefaultStyle: Bool) {
        self.options = configuration.options
        self._shouldApplyDefaultStyle = shouldApplyDefaultStyle
        self.componentIdentifier = configuration.componentIdentifier
    }
}

extension Options: View {
    public var body: some View {
        if self._shouldApplyDefaultStyle {
            self.defaultStyle()
        } else {
            self.style.resolve(configuration: .init(componentIdentifier: self.componentIdentifier, options: self.options)).typeErased
                .transformEnvironment(\.optionsStyleStack) { stack in
                    if !stack.isEmpty {
                        stack.removeLast()
                    }
                }
        }
    }
}

private extension Options {
    func shouldApplyDefaultStyle(_ bool: Bool) -> some View {
        var s = self
        s._shouldApplyDefaultStyle = bool
        return s
    }

    func defaultStyle() -> some View {
        Options(.init(componentIdentifier: self.componentIdentifier, options: self.options))
            .shouldApplyDefaultStyle(false)
            .optionsStyle(.fiori)
            .typeErased
    }
}
