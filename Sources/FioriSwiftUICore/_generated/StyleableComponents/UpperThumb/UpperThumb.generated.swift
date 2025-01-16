// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

public struct UpperThumb {
    let upperThumb: any View

    @Environment(\.upperThumbStyle) var style

    var componentIdentifier: String = UpperThumb.identifier

    fileprivate var _shouldApplyDefaultStyle = true

    public init(@ViewBuilder upperThumb: () -> any View,
                componentIdentifier: String? = UpperThumb.identifier)
    {
        self.upperThumb = upperThumb()
        self.componentIdentifier = componentIdentifier ?? UpperThumb.identifier
    }
}

public extension UpperThumb {
    static let identifier = "fiori_upperthumb_component"
}

public extension UpperThumb {
    init(upperThumb: any Shape = Circle(),
         componentIdentifier: String? = UpperThumb.identifier)
    {
        self.init(upperThumb: { upperThumb }, componentIdentifier: componentIdentifier)
    }
}

public extension UpperThumb {
    init(_ configuration: UpperThumbConfiguration) {
        self.init(configuration, shouldApplyDefaultStyle: false)
    }

    internal init(_ configuration: UpperThumbConfiguration, shouldApplyDefaultStyle: Bool) {
        self.upperThumb = configuration.upperThumb
        self._shouldApplyDefaultStyle = shouldApplyDefaultStyle
        self.componentIdentifier = configuration.componentIdentifier
    }
}

extension UpperThumb: View {
    public var body: some View {
        if self._shouldApplyDefaultStyle {
            self.defaultStyle()
        } else {
            self.style.resolve(configuration: .init(componentIdentifier: self.componentIdentifier, upperThumb: .init(self.upperThumb))).typeErased
                .transformEnvironment(\.upperThumbStyleStack) { stack in
                    if !stack.isEmpty {
                        stack.removeLast()
                    }
                }
        }
    }
}

private extension UpperThumb {
    func shouldApplyDefaultStyle(_ bool: Bool) -> some View {
        var s = self
        s._shouldApplyDefaultStyle = bool
        return s
    }

    func defaultStyle() -> some View {
        UpperThumb(.init(componentIdentifier: self.componentIdentifier, upperThumb: .init(self.upperThumb)))
            .shouldApplyDefaultStyle(false)
            .upperThumbStyle(.fiori)
            .typeErased
    }
}
