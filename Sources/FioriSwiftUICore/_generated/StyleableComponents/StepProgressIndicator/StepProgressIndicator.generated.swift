// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

/// `StepProgressIndicator` is a view supporting a list of `StepItem` in a  horizontal stack. Also customized steps are also supported.
/// ## Usage
/// ```swift
/// @State var selection: String = "id"
/// var steps: [StepItem] = []
/// StepProgressIndicator(selection: self.$selection,
///                       stepItems: self.steps)
/// Also indexed view builder is also supported.
/// StepProgressIndicator(title: <#T##() -> any View#>, action: <#T##() -> any View#>, cancelAction: <#T##() -> any View#>, selection: <#T##Binding<String>#>, steps: <#T##() -> any IndexedViewContainer#>)
/// ```
/// You can also update step style for different states, if you created `StepProgressIndicator` by `[StepItem]`.
/// `func stepStyle(_ style: @escaping ((_ id: String) -> (some StepStyle)?)) -> some View`
public struct StepProgressIndicator {
    let title: any View
    let action: any View
    let cancelAction: any View
    @Binding var selection: String
    let steps: any IndexedViewContainer

    @Environment(\.stepProgressIndicatorStyle) var style

    var componentIdentifier: String = StepProgressIndicator.identifier

    fileprivate var _shouldApplyDefaultStyle = true

    public init(@ViewBuilder title: () -> any View,
                @ViewBuilder action: () -> any View = { EmptyView() },
                @ViewBuilder cancelAction: () -> any View = { FioriButton { _ in Text("Cancel".localizedFioriString()) } },
                selection: Binding<String>,
                @IndexedViewBuilder steps: () -> any IndexedViewContainer = { EmptyView() },
                componentIdentifier: String? = StepProgressIndicator.identifier)
    {
        self.title = Title(title: title, componentIdentifier: componentIdentifier)
        self.action = Action(action: action, componentIdentifier: componentIdentifier)
        self.cancelAction = CancelAction(cancelAction: cancelAction, componentIdentifier: componentIdentifier)
        self._selection = selection
        self.steps = steps()
        self.componentIdentifier = componentIdentifier ?? StepProgressIndicator.identifier
    }
}

public extension StepProgressIndicator {
    static let identifier = "fiori_stepprogressindicator_component"
}

public extension StepProgressIndicator {
    init(title: AttributedString,
         action: FioriButton? = nil,
         cancelAction: FioriButton? = FioriButton { _ in Text("Cancel".localizedFioriString()) },
         selection: Binding<String>,
         steps: [StepItem] = [],
         componentIdentifier: String? = StepProgressIndicator.identifier)
    {
        self.init(title: { Text(title) }, action: { action }, cancelAction: { cancelAction }, selection: selection, steps: { StepsStack(steps) }, componentIdentifier: componentIdentifier)
    }
}

public extension StepProgressIndicator {
    init(_ configuration: StepProgressIndicatorConfiguration) {
        self.init(configuration, shouldApplyDefaultStyle: false)
    }

    internal init(_ configuration: StepProgressIndicatorConfiguration, shouldApplyDefaultStyle: Bool) {
        self.title = configuration.title
        self.action = configuration.action
        self.cancelAction = configuration.cancelAction
        self._selection = configuration.$selection
        self.steps = configuration.steps
        self._shouldApplyDefaultStyle = shouldApplyDefaultStyle
        self.componentIdentifier = configuration.componentIdentifier
    }
}

extension StepProgressIndicator: View {
    public var body: some View {
        if self._shouldApplyDefaultStyle {
            self.defaultStyle()
        } else {
            self.style.resolve(configuration: .init(componentIdentifier: self.componentIdentifier, title: .init(self.title), action: .init(self.action), cancelAction: .init(self.cancelAction), selection: self.$selection, steps: self.steps)).typeErased
                .transformEnvironment(\.stepProgressIndicatorStyleStack) { stack in
                    if !stack.isEmpty {
                        stack.removeLast()
                    }
                }
        }
    }
}

private extension StepProgressIndicator {
    func shouldApplyDefaultStyle(_ bool: Bool) -> some View {
        var s = self
        s._shouldApplyDefaultStyle = bool
        return s
    }

    func defaultStyle() -> some View {
        StepProgressIndicator(.init(componentIdentifier: self.componentIdentifier, title: .init(self.title), action: .init(self.action), cancelAction: .init(self.cancelAction), selection: self.$selection, steps: self.steps))
            .shouldApplyDefaultStyle(false)
            .stepProgressIndicatorStyle(StepProgressIndicatorFioriStyle.ContentFioriStyle())
            .typeErased
    }
}
