// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

public protocol LoadingIndicatorViewStyle: DynamicProperty {
    associatedtype Body: View

    func makeBody(_ configuration: LoadingIndicatorViewConfiguration) -> Body
}

struct AnyLoadingIndicatorViewStyle: LoadingIndicatorViewStyle {
    let content: (LoadingIndicatorViewConfiguration) -> any View

    init(@ViewBuilder _ content: @escaping (LoadingIndicatorViewConfiguration) -> any View) {
        self.content = content
    }

    public func makeBody(_ configuration: LoadingIndicatorViewConfiguration) -> some View {
        self.content(configuration).typeErased
    }
}

public struct LoadingIndicatorViewConfiguration {
    public let title: Title
    public let duration: Double
    @Binding public var isPresented: Bool

    public typealias Title = ConfigurationViewWrapper
}

public struct LoadingIndicatorViewFioriStyle: LoadingIndicatorViewStyle {
    public func makeBody(_ configuration: LoadingIndicatorViewConfiguration) -> some View {
        LoadingIndicatorView(configuration)
            .titleStyle(TitleFioriStyle(loadingIndicatorViewConfiguration: configuration))
    }
}
