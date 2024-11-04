// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

public protocol ProgressIndicatorViewStyle: DynamicProperty {
    associatedtype Body: View

    func makeBody(_ configuration: ProgressIndicatorViewConfiguration) -> Body
}

struct AnyProgressIndicatorViewStyle: ProgressIndicatorViewStyle {
    let content: (ProgressIndicatorViewConfiguration) -> any View

    init(@ViewBuilder _ content: @escaping (ProgressIndicatorViewConfiguration) -> any View) {
        self.content = content
    }

    public func makeBody(_ configuration: ProgressIndicatorViewConfiguration) -> some View {
        self.content(configuration).typeErased
    }
}

public struct ProgressIndicatorViewConfiguration {
    @Binding public var progress: Double
}

public struct ProgressIndicatorViewFioriStyle: ProgressIndicatorViewStyle {
    public func makeBody(_ configuration: ProgressIndicatorViewConfiguration) -> some View {
        ProgressIndicatorView(configuration)
            .progressIndicatorProtocolStyle(ProgressIndicatorProtocolFioriStyle(progressIndicatorViewConfiguration: configuration))
    }
}
