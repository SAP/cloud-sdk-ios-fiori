// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import FioriThemeManager
import Foundation
import SwiftUI

public protocol StepProgressIndicatorStyle: DynamicProperty {
    associatedtype Body: View

    func makeBody(_ configuration: StepProgressIndicatorConfiguration) -> Body
}

struct AnyStepProgressIndicatorStyle: StepProgressIndicatorStyle {
    let content: (StepProgressIndicatorConfiguration) -> any View

    init(@ViewBuilder _ content: @escaping (StepProgressIndicatorConfiguration) -> any View) {
        self.content = content
    }

    public func makeBody(_ configuration: StepProgressIndicatorConfiguration) -> some View {
        self.content(configuration).typeErased
    }
}

public struct StepProgressIndicatorConfiguration {
    public var componentIdentifier: String = "fiori_stepprogressindicator_component"
    public let title: Title
    public let action: Action
    public let cancelAction: CancelAction
    @Binding public var selection: String
    public let steps: Steps

    public typealias Title = ConfigurationViewWrapper
    public typealias Action = ConfigurationViewWrapper
    public typealias CancelAction = ConfigurationViewWrapper
    public typealias Steps = any IndexedViewContainer
}

public extension StepProgressIndicatorConfiguration {
    var contentIdentifier: String {
        self.componentIdentifier + "_content"
    }

    var titleIdentifier: String {
        self.componentIdentifier + "_title"
    }

    var actionIdentifier: String {
        self.componentIdentifier + "_action"
    }

    var cancelActionIdentifier: String {
        self.componentIdentifier + "_cancelAction"
    }
}

extension StepProgressIndicatorConfiguration {
    func isDirectChild(_ componentIdentifier: String) -> Bool {
        componentIdentifier == self.componentIdentifier
    }
}

public struct StepProgressIndicatorFioriStyle: StepProgressIndicatorStyle {
    public func makeBody(_ configuration: StepProgressIndicatorConfiguration) -> some View {
        StepProgressIndicator(configuration)
            .titleStyle(TitleFioriStyle(stepProgressIndicatorConfiguration: configuration))
            .actionStyle(ActionFioriStyle(stepProgressIndicatorConfiguration: configuration))
            .cancelActionStyle(CancelActionFioriStyle(stepProgressIndicatorConfiguration: configuration))
    }
}

public struct StepProgressIndicatorNSSStyle: StepProgressIndicatorStyle {
    var isGlobal: Bool = false
    var data: NSSStyleData {
        self.isGlobal ? NSSTool.globalNSSStyle : NSSTool.mergeNSSStyle
    }

    public func makeBody(_ configuration: StepProgressIndicatorConfiguration) -> some View {
        StepProgressIndicator(configuration)
            .titleStyle(TitleNSSStyle(stepProgressIndicatorConfiguration: configuration, nssData: self.data.value(configuration.titleIdentifier)))
            .actionStyle(ActionNSSStyle(stepProgressIndicatorConfiguration: configuration, nssData: self.data.value(configuration.actionIdentifier)))
            .cancelActionStyle(CancelActionNSSStyle(stepProgressIndicatorConfiguration: configuration, nssData: self.data.value(configuration.cancelActionIdentifier)))
            .stepProgressIndicatorStyle(ContentNSSStyle(stepProgressIndicatorConfiguration: configuration, nssData: self.data.value(configuration.contentIdentifier)))
    }
}
