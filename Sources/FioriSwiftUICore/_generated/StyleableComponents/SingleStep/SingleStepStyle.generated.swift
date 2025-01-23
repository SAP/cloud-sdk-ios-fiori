// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

public protocol SingleStepStyle: DynamicProperty {
    associatedtype Body: View

    func makeBody(_ configuration: SingleStepConfiguration) -> Body
}

struct AnySingleStepStyle: SingleStepStyle {
    let content: (SingleStepConfiguration) -> any View

    init(@ViewBuilder _ content: @escaping (SingleStepConfiguration) -> any View) {
        self.content = content
    }

    public func makeBody(_ configuration: SingleStepConfiguration) -> some View {
        self.content(configuration).typeErased
    }
}

public struct SingleStepConfiguration {
    public var componentIdentifier: String = "fiori_singlestep_component"
    public let title: Title
    public let node: Node
    public let line: Line
    public let id: String
    public let state: StepProgressIndicatorState
    public let substeps: Substeps

    public typealias Title = ConfigurationViewWrapper
    public typealias Node = ConfigurationViewWrapper
    public typealias Line = ConfigurationViewWrapper
    public typealias Substeps = any IndexedViewContainer
}

extension SingleStepConfiguration {
    func isDirectChild(_ componentIdentifier: String) -> Bool {
        componentIdentifier == self.componentIdentifier
    }
}

public struct SingleStepFioriStyle: SingleStepStyle {
    public func makeBody(_ configuration: SingleStepConfiguration) -> some View {
        SingleStep(configuration)
            .titleStyle(TitleFioriStyle(singleStepConfiguration: configuration))
            .nodeStyle(NodeFioriStyle(singleStepConfiguration: configuration))
            .lineStyle(LineFioriStyle(singleStepConfiguration: configuration))
    }
}
