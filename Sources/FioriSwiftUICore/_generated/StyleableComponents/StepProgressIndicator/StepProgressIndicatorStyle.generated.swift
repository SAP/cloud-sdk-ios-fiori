// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
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

public struct StepProgressIndicatorFioriStyle: StepProgressIndicatorStyle {
    public func makeBody(_ configuration: StepProgressIndicatorConfiguration) -> some View {
        StepProgressIndicator(configuration)
            .titleStyle(TitleFioriStyle(stepProgressIndicatorConfiguration: configuration))
            .actionStyle(ActionFioriStyle(stepProgressIndicatorConfiguration: configuration))
            .cancelActionStyle(CancelActionFioriStyle(stepProgressIndicatorConfiguration: configuration))
    }
}
