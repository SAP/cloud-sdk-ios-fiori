// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

public protocol ProcessingIndicatorStyle: DynamicProperty {
    associatedtype Body: View

    func makeBody(_ configuration: ProcessingIndicatorConfiguration) -> Body
}

struct AnyProcessingIndicatorStyle: ProcessingIndicatorStyle {
    let content: (ProcessingIndicatorConfiguration) -> any View

    init(@ViewBuilder _ content: @escaping (ProcessingIndicatorConfiguration) -> any View) {
        self.content = content
    }

    public func makeBody(_ configuration: ProcessingIndicatorConfiguration) -> some View {
        self.content(configuration).typeErased
    }
}

public struct ProcessingIndicatorConfiguration {
    public var componentIdentifier: String = "fiori_processingindicator_component"
    public let optionalTitle: OptionalTitle

    public typealias OptionalTitle = ConfigurationViewWrapper
}

extension ProcessingIndicatorConfiguration {
    func isDirectChild(_ componentIdentifier: String) -> Bool {
        componentIdentifier == self.componentIdentifier
    }
}

public struct ProcessingIndicatorFioriStyle: ProcessingIndicatorStyle {
    public func makeBody(_ configuration: ProcessingIndicatorConfiguration) -> some View {
        ProcessingIndicator(configuration)
            .optionalTitleStyle(OptionalTitleFioriStyle(processingIndicatorConfiguration: configuration))
    }
}
