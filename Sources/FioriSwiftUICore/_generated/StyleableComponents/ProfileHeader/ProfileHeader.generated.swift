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

    var componentIdentifier: String = ProfileHeader.identifier

    fileprivate var _shouldApplyDefaultStyle = true

    public init(@ViewBuilder detailImage: () -> any View = { EmptyView() },
                @ViewBuilder title: () -> any View,
                @ViewBuilder subtitle: () -> any View = { EmptyView() },
                @ViewBuilder description: () -> any View = { EmptyView() },
                animatable: Bool = false,
                @ViewBuilder detailContent: () -> any View = { EmptyView() },
                componentIdentifier: String? = ProfileHeader.identifier)
    {
        self.detailImage = DetailImage(detailImage: detailImage, componentIdentifier: componentIdentifier)
        self.title = Title(title: title, componentIdentifier: componentIdentifier)
        self.subtitle = Subtitle(subtitle: subtitle, componentIdentifier: componentIdentifier)
        self.description = Description(description: description, componentIdentifier: componentIdentifier)
        self.animatable = animatable
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
         animatable: Bool = false,
         @ViewBuilder detailContent: () -> any View = { EmptyView() },
         componentIdentifier: String? = ProfileHeader.identifier)
    {
        self.init(detailImage: { detailImage }, title: { Text(title) }, subtitle: { OptionalText(subtitle) }, description: { OptionalText(description) }, animatable: animatable, detailContent: detailContent, componentIdentifier: componentIdentifier)
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
        self.componentIdentifier = configuration.componentIdentifier
    }
}

extension ProfileHeader: View {
    public var body: some View {
        if self._shouldApplyDefaultStyle {
            self.defaultStyle()
        } else {
            self.style.resolve(configuration: .init(componentIdentifier: self.componentIdentifier, detailImage: .init(self.detailImage), title: .init(self.title), subtitle: .init(self.subtitle), description: .init(self.description), animatable: self.animatable, detailContent: .init(self.detailContent))).typeErased
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
        ProfileHeader(.init(componentIdentifier: self.componentIdentifier, detailImage: .init(self.detailImage), title: .init(self.title), subtitle: .init(self.subtitle), description: .init(self.description), animatable: self.animatable, detailContent: .init(self.detailContent)))
            .shouldApplyDefaultStyle(false)
            .profileHeaderStyle(ProfileHeaderFioriStyle.ContentFioriStyle())
            .typeErased
    }
}
