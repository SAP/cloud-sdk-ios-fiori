// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

public protocol LoadingIndicatorStyle: DynamicProperty {
    associatedtype Body: View

    func makeBody(_ configuration: LoadingIndicatorConfiguration) -> Body
}

struct AnyLoadingIndicatorStyle: LoadingIndicatorStyle {
    let content: (LoadingIndicatorConfiguration) -> any View

    init(@ViewBuilder _ content: @escaping (LoadingIndicatorConfiguration) -> any View) {
        self.content = content
    }

    public func makeBody(_ configuration: LoadingIndicatorConfiguration) -> some View {
        self.content(configuration).typeErased
    }
}

public struct LoadingIndicatorConfiguration {
    public let title: Title
    public let duration: Double
    @Binding public var isPresented: Bool

    public typealias Title = ConfigurationViewWrapper
}

public struct LoadingIndicatorFioriStyle: LoadingIndicatorStyle {
    public func makeBody(_ configuration: LoadingIndicatorConfiguration) -> some View {
        LoadingIndicator(configuration)
            .titleStyle(TitleFioriStyle(loadingIndicatorConfiguration: configuration))
    }
}
