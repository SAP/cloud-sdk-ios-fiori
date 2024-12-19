// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

/// `StepProgressIndicator` is view support a list of `StepItem` in a  horizontal stack. Also customized steps is also supported.
/// ## Usage
/// ```swift
/// @State var selection: String = "id"
/// var steps: [StepItem] = []
/// StepProgressIndicator(selection: self.$selection,
///                       stepItems: self.steps)
/// Also indexed view builder is also supported.
/// StepProgressIndicator(title: <#T##() -> any View#>, action: <#T##() -> any View#>, cancelAction: <#T##() -> any View#>, selection: <#T##Binding<String>#>, steps: <#T##() -> any IndexedViewContainer#>)
/// ```
/// Only `stepStyle` will continue to be supported. And other legacy modifiers will be deprecated in the future. Please use latest modifiers.
/// `func titleStyle(_ style: some TitleStyle) -> some View`
/// `func actionStyle(_ style: some ActionStyle) -> some View`
/// `func cancelActionStyle(_ style: some CancelActionStyle) -> some View`
/// `func lineStyle(_ style: some LineStyle) -> some View`
/// `func nodeStyle(_ style: some NodeStyle) -> some View`
/// `func stepStyle(_ style: @escaping ((_ id: String) -> (some StepStyle)?)) -> some View`
public struct StepProgressIndicator {
    let title: any View
    let action: any View
    let cancelAction: any View
    @Binding var selection: String
    let steps: any IndexedViewContainer

    @Environment(\.stepProgressIndicatorStyle) var style

    fileprivate var _shouldApplyDefaultStyle = true

    public init(@ViewBuilder title: () -> any View,
                @ViewBuilder action: () -> any View = { EmptyView() },
                @ViewBuilder cancelAction: () -> any View = { FioriButton { _ in Text("Cancel".localizedFioriString()) } },
                selection: Binding<String>,
                @IndexedViewBuilder steps: () -> any IndexedViewContainer = { EmptyView() })
    {
        self.title = Title(title: title)
        self.action = Action(action: action)
        self.cancelAction = CancelAction(cancelAction: cancelAction)
        self._selection = selection
        self.steps = steps()
    }
}

public extension StepProgressIndicator {
    init(title: AttributedString,
         action: FioriButton? = nil,
         cancelAction: FioriButton? = FioriButton { _ in Text("Cancel".localizedFioriString()) },
         selection: Binding<String>,
         steps: [StepItem] = [])
    {
        self.init(title: { Text(title) }, action: { action }, cancelAction: { cancelAction }, selection: selection, steps: { StepsStack(steps) })
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
    }
}

extension StepProgressIndicator: View {
    public var body: some View {
        if self._shouldApplyDefaultStyle {
            self.defaultStyle()
        } else {
            self.style.resolve(configuration: .init(title: .init(self.title), action: .init(self.action), cancelAction: .init(self.cancelAction), selection: self.$selection, steps: self.steps)).typeErased
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
        StepProgressIndicator(.init(title: .init(self.title), action: .init(self.action), cancelAction: .init(self.cancelAction), selection: self.$selection, steps: self.steps))
            .shouldApplyDefaultStyle(false)
            .stepProgressIndicatorStyle(StepProgressIndicatorFioriStyle.ContentFioriStyle())
            .typeErased
    }
}
