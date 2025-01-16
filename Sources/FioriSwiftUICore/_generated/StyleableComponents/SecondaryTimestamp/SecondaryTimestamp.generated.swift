// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

public struct SecondaryTimestamp {
    let secondaryTimestamp: any View

    @Environment(\.secondaryTimestampStyle) var style

    var componentIdentifier: String = SecondaryTimestamp.identifier

    fileprivate var _shouldApplyDefaultStyle = true

    public init(@ViewBuilder secondaryTimestamp: () -> any View = { EmptyView() },
                componentIdentifier: String? = SecondaryTimestamp.identifier)
    {
        self.secondaryTimestamp = secondaryTimestamp()
        self.componentIdentifier = componentIdentifier ?? SecondaryTimestamp.identifier
    }
}

public extension SecondaryTimestamp {
    static let identifier = "fiori_secondarytimestamp_component"
}

public extension SecondaryTimestamp {
    init(secondaryTimestamp: TextOrIcon? = nil) {
        self.init(secondaryTimestamp: { TextOrIconView(secondaryTimestamp) })
    }
}

public extension SecondaryTimestamp {
    init(_ configuration: SecondaryTimestampConfiguration) {
        self.init(configuration, shouldApplyDefaultStyle: false)
    }

    internal init(_ configuration: SecondaryTimestampConfiguration, shouldApplyDefaultStyle: Bool) {
        self.secondaryTimestamp = configuration.secondaryTimestamp
        self._shouldApplyDefaultStyle = shouldApplyDefaultStyle
        self.componentIdentifier = configuration.componentIdentifier
    }
}

extension SecondaryTimestamp: View {
    public var body: some View {
        if self._shouldApplyDefaultStyle {
            self.defaultStyle()
        } else {
            self.style.resolve(configuration: .init(componentIdentifier: self.componentIdentifier, secondaryTimestamp: .init(self.secondaryTimestamp))).typeErased
                .transformEnvironment(\.secondaryTimestampStyleStack) { stack in
                    if !stack.isEmpty {
                        stack.removeLast()
                    }
                }
        }
    }
}

private extension SecondaryTimestamp {
    func shouldApplyDefaultStyle(_ bool: Bool) -> some View {
        var s = self
        s._shouldApplyDefaultStyle = bool
        return s
    }

    func defaultStyle() -> some View {
        SecondaryTimestamp(.init(componentIdentifier: self.componentIdentifier, secondaryTimestamp: .init(self.secondaryTimestamp)))
            .shouldApplyDefaultStyle(false)
            .secondaryTimestampStyle(.fiori)
            .typeErased
    }
}
