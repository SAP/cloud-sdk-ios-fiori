// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

public struct SingleStep {
    let title: any View
    let node: any View
    let line: any View
    let id: String
    let state: StepProgressIndicatorState
    let substeps: any IndexedViewContainer

    @Environment(\.singleStepStyle) var style

    fileprivate var _shouldApplyDefaultStyle = true

    public init(@ViewBuilder title: () -> any View,
                @ViewBuilder node: () -> any View = { EmptyView() },
                @ViewBuilder line: () -> any View = { Rectangle() },
                id: String = UUID().uuidString,
                state: StepProgressIndicatorState = .normal,
                @IndexedViewBuilder substeps: () -> any IndexedViewContainer = { EmptyView() })
    {
        self.title = Title(title: title)
        self.node = Node(node: node)
        self.line = Line(line: line)
        self.id = id
        self.state = state
        self.substeps = substeps()
    }
}

public extension SingleStep {
    init(title: AttributedString,
         node: TextOrIcon? = nil,
         @ViewBuilder line: () -> any View = { Rectangle() },
         id: String = UUID().uuidString,
         state: StepProgressIndicatorState = .normal,
         substeps: [StepItem] = [])
    {
        self.init(title: { Text(title) }, node: { TextOrIconView(node) }, line: line, id: id, state: state, substeps: { StepsStack(substeps) })
    }
}

public extension SingleStep {
    init(_ configuration: SingleStepConfiguration) {
        self.init(configuration, shouldApplyDefaultStyle: false)
    }

    internal init(_ configuration: SingleStepConfiguration, shouldApplyDefaultStyle: Bool) {
        self.title = configuration.title
        self.node = configuration.node
        self.line = configuration.line
        self.id = configuration.id
        self.state = configuration.state
        self.substeps = configuration.substeps
        self._shouldApplyDefaultStyle = shouldApplyDefaultStyle
    }
}

extension SingleStep: View {
    public var body: some View {
        if self._shouldApplyDefaultStyle {
            self.defaultStyle()
        } else {
            self.style.resolve(configuration: .init(title: .init(self.title), node: .init(self.node), line: .init(self.line), id: self.id, state: self.state, substeps: self.substeps)).typeErased
                .transformEnvironment(\.singleStepStyleStack) { stack in
                    if !stack.isEmpty {
                        stack.removeLast()
                    }
                }
        }
    }
}

private extension SingleStep {
    func shouldApplyDefaultStyle(_ bool: Bool) -> some View {
        var s = self
        s._shouldApplyDefaultStyle = bool
        return s
    }

    func defaultStyle() -> some View {
        SingleStep(.init(title: .init(self.title), node: .init(self.node), line: .init(self.line), id: self.id, state: self.state, substeps: self.substeps))
            .shouldApplyDefaultStyle(false)
            .singleStepStyle(SingleStepFioriStyle.ContentFioriStyle())
            .typeErased
    }
}
