// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

public struct Subtitle {
    let subtitle: any View

    @Environment(\.subtitleStyle) var style

    fileprivate var _shouldApplyDefaultStyle = true

    public init(@ViewBuilder subtitle: () -> any View = { EmptyView() }) {
        self.subtitle = subtitle()
    }
}

public extension Subtitle {
    init(subtitle: AttributedString? = nil) {
        self.init(subtitle: { OptionalText(subtitle) })
    }
}

public extension Subtitle {
    init(_ configuration: SubtitleConfiguration) {
        self.subtitle = configuration.subtitle
        self._shouldApplyDefaultStyle = false
    }
}

extension Subtitle: View {
    public var body: some View {
        if _shouldApplyDefaultStyle {
            self.defaultStyle()
        } else {
            style.resolve(configuration: .init(subtitle: .init(self.subtitle))).typeErased
                .transformEnvironment(\.subtitleStyleStack) { stack in
                    if !stack.isEmpty {
                        stack.removeLast()
                    }
                }
        }
    }
}

private extension Subtitle {
    func shouldApplyDefaultStyle(_ bool: Bool) -> some View {
        var s = self
        s._shouldApplyDefaultStyle = bool
        return s
    }
        
    func defaultStyle() -> some View {
        Subtitle(subtitle: { self.subtitle })
            .shouldApplyDefaultStyle(false)
            .subtitleStyle(.fiori)
            .typeErased
    }
}
