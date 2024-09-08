// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

public struct ProfileHeader {
    let detailImage: any View
    let title: any View
    let subtitle: any View
    let description: any View
    /// Indicate whether the profile header was animatable in scroll view. The default was false.
    let animatable: Bool
    /// The detail content for the profile header.
    let detailContent: any View

    @Environment(\.profileHeaderStyle) var style

    fileprivate var _shouldApplyDefaultStyle = true

    public init(@ViewBuilder detailImage: () -> any View = { EmptyView() },
                @ViewBuilder title: () -> any View,
                @ViewBuilder subtitle: () -> any View = { EmptyView() },
                @ViewBuilder description: () -> any View = { EmptyView() },
                animatable: Bool = false,
                @ViewBuilder detailContent: () -> any View = { EmptyView() })
    {
        self.detailImage = DetailImage(detailImage: detailImage)
        self.title = Title(title: title)
        self.subtitle = Subtitle(subtitle: subtitle)
        self.description = Description(description: description)
        self.animatable = animatable
        self.detailContent = detailContent()
    }
}

public extension ProfileHeader {
    init(detailImage: Image? = nil,
         title: AttributedString,
         subtitle: AttributedString? = nil,
         description: AttributedString? = nil,
         animatable: Bool = false,
         @ViewBuilder detailContent: () -> any View = { EmptyView() })
    {
        self.init(detailImage: { detailImage }, title: { Text(title) }, subtitle: { OptionalText(subtitle) }, description: { OptionalText(description) }, animatable: animatable, detailContent: detailContent)
    }
}

public extension ProfileHeader {
    init(_ configuration: ProfileHeaderConfiguration) {
        self.init(configuration, shouldApplyDefaultStyle: false)
    }

    internal init(_ configuration: ProfileHeaderConfiguration, shouldApplyDefaultStyle: Bool) {
        self.detailImage = configuration.detailImage
        self.title = configuration.title
        self.subtitle = configuration.subtitle
        self.description = configuration.description
        self.animatable = configuration.animatable
        self.detailContent = configuration.detailContent
        self._shouldApplyDefaultStyle = shouldApplyDefaultStyle
    }
}

extension ProfileHeader: View {
    public var body: some View {
        if self._shouldApplyDefaultStyle {
            self.defaultStyle()
        } else {
            self.style.resolve(configuration: .init(detailImage: .init(self.detailImage), title: .init(self.title), subtitle: .init(self.subtitle), description: .init(self.description), animatable: self.animatable, detailContent: .init(self.detailContent))).typeErased
                .transformEnvironment(\.profileHeaderStyleStack) { stack in
                    if !stack.isEmpty {
                        stack.removeLast()
                    }
                }
        }
    }
}

private extension ProfileHeader {
    func shouldApplyDefaultStyle(_ bool: Bool) -> some View {
        var s = self
        s._shouldApplyDefaultStyle = bool
        return s
    }

    func defaultStyle() -> some View {
        ProfileHeader(.init(detailImage: .init(self.detailImage), title: .init(self.title), subtitle: .init(self.subtitle), description: .init(self.description), animatable: self.animatable, detailContent: .init(self.detailContent)))
            .shouldApplyDefaultStyle(false)
            .profileHeaderStyle(ProfileHeaderFioriStyle.ContentFioriStyle())
            .typeErased
    }
}
