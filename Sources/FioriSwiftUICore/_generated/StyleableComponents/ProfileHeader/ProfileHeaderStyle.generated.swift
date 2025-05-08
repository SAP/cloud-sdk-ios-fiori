// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

public protocol ProfileHeaderStyle: DynamicProperty {
    associatedtype Body: View

    func makeBody(_ configuration: ProfileHeaderConfiguration) -> Body
}

struct AnyProfileHeaderStyle: ProfileHeaderStyle {
    let content: (ProfileHeaderConfiguration) -> any View

    init(@ViewBuilder _ content: @escaping (ProfileHeaderConfiguration) -> any View) {
        self.content = content
    }

    public func makeBody(_ configuration: ProfileHeaderConfiguration) -> some View {
        self.content(configuration).typeErased
    }
}

public struct ProfileHeaderConfiguration {
    public var componentIdentifier: String = "fiori_profileheader_component"
    public let detailImage: DetailImage
    public let title: Title
    public let subtitle: Subtitle
    public let description: Description
    public let animatable: Bool
    public let detailContent: DetailContent

    public typealias DetailImage = ConfigurationViewWrapper
    public typealias Title = ConfigurationViewWrapper
    public typealias Subtitle = ConfigurationViewWrapper
    public typealias Description = ConfigurationViewWrapper
    public typealias DetailContent = ConfigurationViewWrapper
}

extension ProfileHeaderConfiguration {
    func isDirectChild(_ componentIdentifier: String) -> Bool {
        componentIdentifier == self.componentIdentifier
    }
}

public struct ProfileHeaderFioriStyle: ProfileHeaderStyle {
    public func makeBody(_ configuration: ProfileHeaderConfiguration) -> some View {
        ProfileHeader(configuration)
            .detailImageStyle(DetailImageFioriStyle(profileHeaderConfiguration: configuration))
            .titleStyle(TitleFioriStyle(profileHeaderConfiguration: configuration))
            .subtitleStyle(SubtitleFioriStyle(profileHeaderConfiguration: configuration))
            .descriptionStyle(DescriptionFioriStyle(profileHeaderConfiguration: configuration))
    }
}
