// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import FioriThemeManager
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
    public let contentIdentifier = "FioriProcessingIndicator_content"
    public let optionalTitleIdentifier = "FioriProcessingIndicator_optionalTitle"

    public let optionalTitle: OptionalTitle

    public typealias OptionalTitle = ConfigurationViewWrapper
}

public struct ProcessingIndicatorFioriStyle: ProcessingIndicatorStyle {
    public func makeBody(_ configuration: ProcessingIndicatorConfiguration) -> some View {
        ProcessingIndicator(configuration)
            .optionalTitleStyle(OptionalTitleFioriStyle(processingIndicatorConfiguration: configuration))
    }
}

public struct ProcessingIndicatorNSSStyle: ProcessingIndicatorStyle {
    var isGlobal: Bool = false
    var data: NSSStyleData {
        self.isGlobal ? NSSTool.globalNSSStyle : NSSTool.mergeNSSStyle
    }

    public func makeBody(_ configuration: ProcessingIndicatorConfiguration) -> some View {
        ProcessingIndicator(configuration)
            .optionalTitleStyle(OptionalTitleNSSStyle(processingIndicatorConfiguration: configuration, nssData: self.data.value(configuration.optionalTitleIdentifier)))
            .processingIndicatorStyle(ContentNSSStyle(processingIndicatorConfiguration: configuration, nssData: self.data.value(configuration.contentIdentifier)))
    }
}
