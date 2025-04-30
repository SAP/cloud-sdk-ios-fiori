// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

public struct ProfileHeader {
    let detailImage: any View
    let title: any View
    let subtitle: any View
    let description: any View
    let separator: any View
    /// Indicate whether the profile header was animatable in scroll view. The default was false.
    let animatable: Bool
    /// Provides a standard hairline for profile header or not. The default value is `false`.
    let isSeparatorHidden: Bool
    /// The detail content for the profile header.
    let detailContent: any View

    @Environment(\.profileHeaderStyle) var style

    var componentIdentifier: String = ProfileHeader.identifier

    fileprivate var _shouldApplyDefaultStyle = true

    public init(@ViewBuilder detailImage: () -> any View = { EmptyView() },
                @ViewBuilder title: () -> any View,
                @ViewBuilder subtitle: () -> any View = { EmptyView() },
                @ViewBuilder description: () -> any View = { EmptyView() },
                @ViewBuilder separator: () -> any View = { Color.preferredColor(.separator) },
                animatable: Bool = false,
                isSeparatorHidden: Bool = false,
                @ViewBuilder detailContent: () -> any View = { EmptyView() },
                componentIdentifier: String? = ProfileHeader.identifier)
    {
        self.detailImage = DetailImage(detailImage: detailImage, componentIdentifier: componentIdentifier)
        self.title = Title(title: title, componentIdentifier: componentIdentifier)
        self.subtitle = Subtitle(subtitle: subtitle, componentIdentifier: componentIdentifier)
        self.description = Description(description: description, componentIdentifier: componentIdentifier)
        self.separator = Separator(separator: separator, componentIdentifier: componentIdentifier)
        self.animatable = animatable
        self.isSeparatorHidden = isSeparatorHidden
        self.detailContent = detailContent()
        self.componentIdentifier = componentIdentifier ?? ProfileHeader.identifier
    }
}

public extension ProfileHeader {
    static let identifier = "fiori_profileheader_component"
}

public extension ProfileHeader {
    init(detailImage: Image? = nil,
         title: AttributedString,
         subtitle: AttributedString? = nil,
         description: AttributedString? = nil,
         separator: Color? = Color.preferredColor(.separator),
         animatable: Bool = false,
         isSeparatorHidden: Bool = false,
         @ViewBuilder detailContent: () -> any View = { EmptyView() })
    {
        self.init(detailImage: { detailImage }, title: { Text(title) }, subtitle: { OptionalText(subtitle) }, description: { OptionalText(description) }, separator: { separator }, animatable: animatable, isSeparatorHidden: isSeparatorHidden, detailContent: detailContent)
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
        self.separator = configuration.separator
        self.animatable = configuration.animatable
        self.isSeparatorHidden = configuration.isSeparatorHidden
        self.detailContent = configuration.detailContent
        self._shouldApplyDefaultStyle = shouldApplyDefaultStyle
        self.componentIdentifier = configuration.componentIdentifier
    }
}

extension ProfileHeader: View {
    public var body: some View {
        if self._shouldApplyDefaultStyle {
            self.defaultStyle()
        } else {
            self.style.resolve(configuration: .init(componentIdentifier: self.componentIdentifier, detailImage: .init(self.detailImage), title: .init(self.title), subtitle: .init(self.subtitle), description: .init(self.description), separator: .init(self.separator), animatable: self.animatable, isSeparatorHidden: self.isSeparatorHidden, detailContent: .init(self.detailContent))).typeErased
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
        ProfileHeader(.init(componentIdentifier: self.componentIdentifier, detailImage: .init(self.detailImage), title: .init(self.title), subtitle: .init(self.subtitle), description: .init(self.description), separator: .init(self.separator), animatable: self.animatable, isSeparatorHidden: self.isSeparatorHidden, detailContent: .init(self.detailContent)))
            .shouldApplyDefaultStyle(false)
            .profileHeaderStyle(ProfileHeaderFioriStyle.ContentFioriStyle())
            .typeErased
    }
}
