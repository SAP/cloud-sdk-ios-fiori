// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

public struct TextView {
    @Binding var text: String

    @Environment(\.textViewStyle) var style

    var componentIdentifier: String = TextView.identifier

    fileprivate var _shouldApplyDefaultStyle = true

    public init(text: Binding<String>,
                componentIdentifier: String? = TextView.identifier)
    {
        self._text = text
        self.componentIdentifier = componentIdentifier ?? TextView.identifier
    }
}

public extension TextView {
    static let identifier = "fiori_textview_component"
}

public extension TextView {
    init(_ configuration: TextViewConfiguration) {
        self.init(configuration, shouldApplyDefaultStyle: false)
    }

    internal init(_ configuration: TextViewConfiguration, shouldApplyDefaultStyle: Bool) {
        self._text = configuration.$text
        self._shouldApplyDefaultStyle = shouldApplyDefaultStyle
        self.componentIdentifier = configuration.componentIdentifier
    }
}

extension TextView: View {
    public var body: some View {
        if self._shouldApplyDefaultStyle {
            self.defaultStyle()
        } else {
            self.style.resolve(configuration: .init(componentIdentifier: self.componentIdentifier, text: self.$text)).typeErased
                .transformEnvironment(\.textViewStyleStack) { stack in
                    if !stack.isEmpty {
                        stack.removeLast()
                    }
                }
        }
    }
}

private extension TextView {
    func shouldApplyDefaultStyle(_ bool: Bool) -> some View {
        var s = self
        s._shouldApplyDefaultStyle = bool
        return s
    }

    func defaultStyle() -> some View {
        TextView(.init(componentIdentifier: self.componentIdentifier, text: self.$text))
            .shouldApplyDefaultStyle(false)
            .textViewStyle(.fiori)
            .typeErased
    }
}
