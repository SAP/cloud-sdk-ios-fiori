// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import FioriThemeManager
import Foundation
import SwiftUI

public protocol LinearProgressIndicatorViewStyle: DynamicProperty {
    associatedtype Body: View

    func makeBody(_ configuration: LinearProgressIndicatorViewConfiguration) -> Body
}

struct AnyLinearProgressIndicatorViewStyle: LinearProgressIndicatorViewStyle {
    let content: (LinearProgressIndicatorViewConfiguration) -> any View

    init(@ViewBuilder _ content: @escaping (LinearProgressIndicatorViewConfiguration) -> any View) {
        self.content = content
    }

    public func makeBody(_ configuration: LinearProgressIndicatorViewConfiguration) -> some View {
        self.content(configuration).typeErased
    }
}

public struct LinearProgressIndicatorViewConfiguration {
    public let contentIdentifier = "FioriLinearProgressIndicatorView_content"
    public let linearProgressIndicatorIdentifier = "FioriLinearProgressIndicatorView_linearProgressIndicator"
    public let iconIdentifier = "FioriLinearProgressIndicatorView_icon"
    public let descriptionIdentifier = "FioriLinearProgressIndicatorView_description"

    public var componentIdentifier: String = "fiori_linearprogressindicatorview_component"
    @Binding public var indicatorProgress: Double
    public let icon: Icon
    public let description: Description

    public typealias Icon = ConfigurationViewWrapper
    public typealias Description = ConfigurationViewWrapper
}

extension LinearProgressIndicatorViewConfiguration {
    func isDirectChild(_ componentIdentifier: String) -> Bool {
        componentIdentifier == self.componentIdentifier
    }
}

public struct LinearProgressIndicatorViewFioriStyle: LinearProgressIndicatorViewStyle {
    public func makeBody(_ configuration: LinearProgressIndicatorViewConfiguration) -> some View {
        LinearProgressIndicatorView(configuration)
            .linearProgressIndicatorStyle(LinearProgressIndicatorFioriStyle(linearProgressIndicatorViewConfiguration: configuration))
            .iconStyle(IconFioriStyle(linearProgressIndicatorViewConfiguration: configuration))
            .descriptionStyle(DescriptionFioriStyle(linearProgressIndicatorViewConfiguration: configuration))
    }
}

public struct LinearProgressIndicatorViewNSSStyle: LinearProgressIndicatorViewStyle {
    var isGlobal: Bool = false
    var data: NSSStyleData {
        self.isGlobal ? NSSTool.globalNSSStyle : NSSTool.mergeNSSStyle
    }

    public func makeBody(_ configuration: LinearProgressIndicatorViewConfiguration) -> some View {
        LinearProgressIndicatorView(configuration)
            .linearProgressIndicatorStyle(LinearProgressIndicatorNSSStyle(linearProgressIndicatorViewConfiguration: configuration, nssData: self.data.value(configuration.linearProgressIndicatorIdentifier)))
            .iconStyle(IconNSSStyle(linearProgressIndicatorViewConfiguration: configuration, nssData: self.data.value(configuration.iconIdentifier)))
            .descriptionStyle(DescriptionNSSStyle(linearProgressIndicatorViewConfiguration: configuration, nssData: self.data.value(configuration.descriptionIdentifier)))
            .linearProgressIndicatorViewStyle(ContentNSSStyle(linearProgressIndicatorViewConfiguration: configuration, nssData: self.data.value(configuration.contentIdentifier)))
    }
}
