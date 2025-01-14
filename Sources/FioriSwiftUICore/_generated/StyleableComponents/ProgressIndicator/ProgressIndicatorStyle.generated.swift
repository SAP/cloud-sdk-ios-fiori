// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import FioriThemeManager
import Foundation
import SwiftUI

public protocol ProgressIndicatorStyle: DynamicProperty {
    associatedtype Body: View

    func makeBody(_ configuration: ProgressIndicatorConfiguration) -> Body
}

struct AnyProgressIndicatorStyle: ProgressIndicatorStyle {
    let content: (ProgressIndicatorConfiguration) -> any View

    init(@ViewBuilder _ content: @escaping (ProgressIndicatorConfiguration) -> any View) {
        self.content = content
    }

    public func makeBody(_ configuration: ProgressIndicatorConfiguration) -> some View {
        self.content(configuration).typeErased
    }
}

public struct ProgressIndicatorConfiguration {
    public let contentIdentifier = "FioriProgressIndicator_content"
    public let progressIndicatorProtocolIdentifier = "FioriProgressIndicator_progressIndicatorProtocol"

    public var componentIdentifier: String = "fiori_progressindicator_component"
    @Binding public var progress: Double
}

extension ProgressIndicatorConfiguration {
    func isDirectChild(_ componentIdentifier: String) -> Bool {
        componentIdentifier == self.componentIdentifier
    }
}

public struct ProgressIndicatorFioriStyle: ProgressIndicatorStyle {
    public func makeBody(_ configuration: ProgressIndicatorConfiguration) -> some View {
        ProgressIndicator(configuration)
            .progressIndicatorProtocolStyle(ProgressIndicatorProtocolFioriStyle(progressIndicatorConfiguration: configuration))
    }
}

public struct ProgressIndicatorNSSStyle: ProgressIndicatorStyle {
    var isGlobal: Bool = false
    var data: NSSStyleData {
        self.isGlobal ? NSSTool.globalNSSStyle : NSSTool.mergeNSSStyle
    }

    public func makeBody(_ configuration: ProgressIndicatorConfiguration) -> some View {
        ProgressIndicator(configuration)
            .progressIndicatorProtocolStyle(ProgressIndicatorProtocolNSSStyle(progressIndicatorConfiguration: configuration, nssData: self.data.value(configuration.progressIndicatorProtocolIdentifier)))
            .progressIndicatorStyle(ContentNSSStyle(progressIndicatorConfiguration: configuration, nssData: self.data.value(configuration.contentIdentifier)))
    }
}
