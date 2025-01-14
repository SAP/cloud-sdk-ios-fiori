// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

public struct Subtitle {
    let subtitle: any View

    @Environment(\.subtitleStyle) var style

    var componentIdentifier: String = Subtitle.identifier

    fileprivate var _shouldApplyDefaultStyle = true

    public init(@ViewBuilder subtitle: () -> any View = { EmptyView() },
                componentIdentifier: String? = Subtitle.identifier)
    {
        self.subtitle = subtitle()
        self.componentIdentifier = componentIdentifier ?? Subtitle.identifier
    }
}

public extension Subtitle {
    static let identifier = "fiori_subtitle_component"
}

public extension Subtitle {
    init(subtitle: AttributedString? = nil) {
        self.init(subtitle: { OptionalText(subtitle) })
    }
}

public extension Subtitle {
    init(_ configuration: SubtitleConfiguration) {
        self.init(configuration, shouldApplyDefaultStyle: false)
    }

    internal init(_ configuration: SubtitleConfiguration, shouldApplyDefaultStyle: Bool) {
        self.subtitle = configuration.subtitle
        self._shouldApplyDefaultStyle = shouldApplyDefaultStyle
        self.componentIdentifier = configuration.componentIdentifier
    }
}

extension Subtitle: View {
    public var body: some View {
        if self._shouldApplyDefaultStyle {
            self.defaultStyle()
        } else {
            self.style.resolve(configuration: .init(componentIdentifier: self.componentIdentifier, subtitle: .init(self.subtitle))).typeErased
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
        Subtitle(.init(componentIdentifier: self.componentIdentifier, subtitle: .init(self.subtitle)))
            .shouldApplyDefaultStyle(false)
            .subtitleStyle(.fiori)
            .typeErased
    }
}
