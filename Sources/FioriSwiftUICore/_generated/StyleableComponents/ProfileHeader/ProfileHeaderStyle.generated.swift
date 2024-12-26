// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import FioriThemeManager
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
    public let contentIdentifier = "FioriProfileHeader_content"
    public let detailImageIdentifier = "FioriProfileHeader_detailImage"
    public let titleIdentifier = "FioriProfileHeader_title"
    public let subtitleIdentifier = "FioriProfileHeader_subtitle"
    public let descriptionIdentifier = "FioriProfileHeader_description"

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

public struct ProfileHeaderFioriStyle: ProfileHeaderStyle {
    public func makeBody(_ configuration: ProfileHeaderConfiguration) -> some View {
        ProfileHeader(configuration)
            .detailImageStyle(DetailImageFioriStyle(profileHeaderConfiguration: configuration))
            .titleStyle(TitleFioriStyle(profileHeaderConfiguration: configuration))
            .subtitleStyle(SubtitleFioriStyle(profileHeaderConfiguration: configuration))
            .descriptionStyle(DescriptionFioriStyle(profileHeaderConfiguration: configuration))
    }
}

public struct ProfileHeaderNSSStyle: ProfileHeaderStyle {
    var isGlobal: Bool = false
    var data: NSSStyleData {
        self.isGlobal ? NSSTool.globalNSSStyle : NSSTool.mergeNSSStyle
    }

    public func makeBody(_ configuration: ProfileHeaderConfiguration) -> some View {
        ProfileHeader(configuration)
            .detailImageStyle(DetailImageNSSStyle(profileHeaderConfiguration: configuration, nssData: self.data.value(configuration.detailImageIdentifier)))
            .titleStyle(TitleNSSStyle(profileHeaderConfiguration: configuration, nssData: self.data.value(configuration.titleIdentifier)))
            .subtitleStyle(SubtitleNSSStyle(profileHeaderConfiguration: configuration, nssData: self.data.value(configuration.subtitleIdentifier)))
            .descriptionStyle(DescriptionNSSStyle(profileHeaderConfiguration: configuration, nssData: self.data.value(configuration.descriptionIdentifier)))
            .profileHeaderStyle(ContentNSSStyle(profileHeaderConfiguration: configuration, nssData: self.data.value(configuration.contentIdentifier)))
    }
}
