// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import FioriThemeManager
import Foundation
import SwiftUI

public protocol LoadingIndicatorStyle: DynamicProperty {
    associatedtype Body: View

    func makeBody(_ configuration: LoadingIndicatorConfiguration) -> Body
}

struct AnyLoadingIndicatorStyle: LoadingIndicatorStyle {
    let content: (LoadingIndicatorConfiguration) -> any View

    init(@ViewBuilder _ content: @escaping (LoadingIndicatorConfiguration) -> any View) {
        self.content = content
    }

    public func makeBody(_ configuration: LoadingIndicatorConfiguration) -> some View {
        self.content(configuration).typeErased
    }
}

public struct LoadingIndicatorConfiguration {
    public let contentIdentifier = "FioriLoadingIndicator_content"
    public let titleIdentifier = "FioriLoadingIndicator_title"
    public let progressIdentifier = "FioriLoadingIndicator_progress"

    public var componentIdentifier: String = "fiori_loadingindicator_component"
    public let title: Title
    public let progress: Progress
    public let duration: Double
    @Binding public var isPresented: Bool

    public typealias Title = ConfigurationViewWrapper
    public typealias Progress = ConfigurationViewWrapper
}

extension LoadingIndicatorConfiguration {
    func isDirectChild(_ componentIdentifier: String) -> Bool {
        componentIdentifier == self.componentIdentifier
    }
}

public struct LoadingIndicatorFioriStyle: LoadingIndicatorStyle {
    public func makeBody(_ configuration: LoadingIndicatorConfiguration) -> some View {
        LoadingIndicator(configuration)
            .titleStyle(TitleFioriStyle(loadingIndicatorConfiguration: configuration))
            .progressStyle(ProgressFioriStyle(loadingIndicatorConfiguration: configuration))
    }
}

public struct LoadingIndicatorNSSStyle: LoadingIndicatorStyle {
    var isGlobal: Bool = false
    var data: NSSStyleData {
        self.isGlobal ? NSSTool.globalNSSStyle : NSSTool.mergeNSSStyle
    }

    public func makeBody(_ configuration: LoadingIndicatorConfiguration) -> some View {
        LoadingIndicator(configuration)
            .titleStyle(TitleNSSStyle(loadingIndicatorConfiguration: configuration, nssData: self.data.value(configuration.titleIdentifier)))
            .progressStyle(ProgressNSSStyle(loadingIndicatorConfiguration: configuration, nssData: self.data.value(configuration.progressIdentifier)))
            .loadingIndicatorStyle(ContentNSSStyle(loadingIndicatorConfiguration: configuration, nssData: self.data.value(configuration.contentIdentifier)))
    }
}
