// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

public struct LoadingIndicator {
    let title: any View
    let progress: any View
    /// The duration in seconds for which the loading indicator is shown. If set to 0, the loading indicator will be displayed continuously. The default is `0`.
    let duration: Double
    @Binding var isPresented: Bool

    @Environment(\.loadingIndicatorStyle) var style

    var componentIdentifier: String = LoadingIndicator.identifier

    fileprivate var _shouldApplyDefaultStyle = true

    public init(@ViewBuilder title: () -> any View,
                @ViewBuilder progress: () -> any View,
                duration: Double = 0,
                isPresented: Binding<Bool>,
                componentIdentifier: String? = LoadingIndicator.identifier)
    {
        self.title = Title(title: title, componentIdentifier: componentIdentifier)
        self.progress = Progress(progress: progress, componentIdentifier: componentIdentifier)
        self.duration = duration
        self._isPresented = isPresented
        self.componentIdentifier = componentIdentifier ?? LoadingIndicator.identifier
    }
}

public extension LoadingIndicator {
    static let identifier = "fiori_loadingindicator_component"
}

public extension LoadingIndicator {
    init(title: AttributedString,
         progress: ProgressView<EmptyView, EmptyView> = ProgressView(),
         duration: Double = 0,
         isPresented: Binding<Bool>)
    {
        self.init(title: { Text(title) }, progress: { progress }, duration: duration, isPresented: isPresented)
    }
}

public extension LoadingIndicator {
    init(_ configuration: LoadingIndicatorConfiguration) {
        self.init(configuration, shouldApplyDefaultStyle: false)
    }

    internal init(_ configuration: LoadingIndicatorConfiguration, shouldApplyDefaultStyle: Bool) {
        self.title = configuration.title
        self.progress = configuration.progress
        self.duration = configuration.duration
        self._isPresented = configuration.$isPresented
        self._shouldApplyDefaultStyle = shouldApplyDefaultStyle
        self.componentIdentifier = configuration.componentIdentifier
    }
}

extension LoadingIndicator: View {
    public var body: some View {
        if self._shouldApplyDefaultStyle {
            self.defaultStyle()
        } else {
            self.style.resolve(configuration: .init(componentIdentifier: self.componentIdentifier, title: .init(self.title), progress: .init(self.progress), duration: self.duration, isPresented: self.$isPresented)).typeErased
                .transformEnvironment(\.loadingIndicatorStyleStack) { stack in
                    if !stack.isEmpty {
                        stack.removeLast()
                    }
                }
        }
    }
}

private extension LoadingIndicator {
    func shouldApplyDefaultStyle(_ bool: Bool) -> some View {
        var s = self
        s._shouldApplyDefaultStyle = bool
        return s
    }

    func defaultStyle() -> some View {
        LoadingIndicator(.init(componentIdentifier: self.componentIdentifier, title: .init(self.title), progress: .init(self.progress), duration: self.duration, isPresented: self.$isPresented))
            .shouldApplyDefaultStyle(false)
            .loadingIndicatorStyle(LoadingIndicatorFioriStyle.ContentFioriStyle())
            .typeErased
    }
}
