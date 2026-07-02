// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

@MainActor @preconcurrency public protocol WritingAssistantActionStyle: DynamicProperty {
    associatedtype Body: View

    @MainActor @ViewBuilder @preconcurrency func makeBody(_ configuration: WritingAssistantActionConfiguration) -> Body
}

struct AnyWritingAssistantActionStyle: WritingAssistantActionStyle {
    let content: (WritingAssistantActionConfiguration) -> any View

    init(@ViewBuilder _ content: @escaping (WritingAssistantActionConfiguration) -> any View) {
        self.content = content
    }

    public func makeBody(_ configuration: WritingAssistantActionConfiguration) -> some View {
        self.content(configuration).typeErased
    }
}

public struct WritingAssistantActionConfiguration {
    public var componentIdentifier: String = "fiori_writingassistantaction_component"
    public let writingAssistantAction: WritingAssistantAction

    public typealias WritingAssistantAction = ConfigurationViewWrapper
}

extension WritingAssistantActionConfiguration {
    func isDirectChild(_ componentIdentifier: String) -> Bool {
        componentIdentifier == self.componentIdentifier
    }
}

struct WritingAssistantActionDefaultStyle: WritingAssistantActionStyle {
    nonisolated init() {}

    func makeBody(_ configuration: WritingAssistantActionConfiguration) -> some View {
        WritingAssistantAction(configuration)
            .writingAssistantActionStyle(WritingAssistantActionBaseStyle())
    }
}
