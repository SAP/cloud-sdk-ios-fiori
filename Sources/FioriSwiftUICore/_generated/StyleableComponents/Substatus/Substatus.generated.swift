// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

public struct Substatus {
    let substatus: any View

    @Environment(\.substatusStyle) var style

    var componentIdentifier: String = Substatus.identifier

    fileprivate var _shouldApplyDefaultStyle = true

    public init(@ViewBuilder substatus: () -> any View = { EmptyView() },
                componentIdentifier: String? = Substatus.identifier)
    {
        self.substatus = substatus()
        self.componentIdentifier = componentIdentifier ?? Substatus.identifier
    }
}

public extension Substatus {
    static let identifier = "fiori_substatus_component"
}

public extension Substatus {
    init(substatus: TextOrIcon? = nil,
         componentIdentifier: String? = Substatus.identifier)
    {
        self.init(substatus: { TextOrIconView(substatus) }, componentIdentifier: componentIdentifier)
    }
}

public extension Substatus {
    init(_ configuration: SubstatusConfiguration) {
        self.init(configuration, shouldApplyDefaultStyle: false)
    }

    internal init(_ configuration: SubstatusConfiguration, shouldApplyDefaultStyle: Bool) {
        self.substatus = configuration.substatus
        self._shouldApplyDefaultStyle = shouldApplyDefaultStyle
        self.componentIdentifier = configuration.componentIdentifier
    }
}

extension Substatus: View {
    public var body: some View {
        if self._shouldApplyDefaultStyle {
            self.defaultStyle()
        } else {
            self.style.resolve(configuration: .init(componentIdentifier: self.componentIdentifier, substatus: .init(self.substatus))).typeErased
                .transformEnvironment(\.substatusStyleStack) { stack in
                    if !stack.isEmpty {
                        stack.removeLast()
                    }
                }
        }
    }
}

private extension Substatus {
    func shouldApplyDefaultStyle(_ bool: Bool) -> some View {
        var s = self
        s._shouldApplyDefaultStyle = bool
        return s
    }

    func defaultStyle() -> some View {
        Substatus(.init(componentIdentifier: self.componentIdentifier, substatus: .init(self.substatus)))
            .shouldApplyDefaultStyle(false)
            .substatusStyle(.fiori)
            .typeErased
    }
}
