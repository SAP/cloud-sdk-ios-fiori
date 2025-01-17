// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import FioriThemeManager
import Foundation
import SwiftUI

public protocol ProgressStyle: DynamicProperty {
    associatedtype Body: View

    func makeBody(_ configuration: ProgressConfiguration) -> Body
}

struct AnyProgressStyle: ProgressStyle {
    let content: (ProgressConfiguration) -> any View

    init(@ViewBuilder _ content: @escaping (ProgressConfiguration) -> any View) {
        self.content = content
    }

    public func makeBody(_ configuration: ProgressConfiguration) -> some View {
        self.content(configuration).typeErased
    }
}

public struct ProgressConfiguration {
    public var componentIdentifier: String = "fiori_progress_component"
    public let progress: Progress

    public typealias Progress = ConfigurationViewWrapper
}

public extension ProgressConfiguration {
    var progressIdentifier: String {
        self.componentIdentifier + "_progress"
    }
}

extension ProgressConfiguration {
    func isDirectChild(_ componentIdentifier: String) -> Bool {
        componentIdentifier == self.componentIdentifier
    }
}
