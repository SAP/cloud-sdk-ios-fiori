// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

public struct LoadingIndicatorView {
    let title: any View
    /// The duration in seconds for which the loading indicator is shown. If set to 0, the loading indicator will be displayed continuously. The default is `0`.
    let duration: Double
    @Binding var isPresented: Bool

    @Environment(\.loadingIndicatorViewStyle) var style

    fileprivate var _shouldApplyDefaultStyle = true

    public init(@ViewBuilder title: () -> any View,
                duration: Double = 0,
                isPresented: Binding<Bool>)
    {
        self.title = Title(title: title)
        self.duration = duration
        self._isPresented = isPresented
    }
}

public extension LoadingIndicatorView {
    init(title: AttributedString,
         duration: Double = 0,
         isPresented: Binding<Bool>)
    {
        self.init(title: { Text(title) }, duration: duration, isPresented: isPresented)
    }
}

public extension LoadingIndicatorView {
    init(_ configuration: LoadingIndicatorViewConfiguration) {
        self.init(configuration, shouldApplyDefaultStyle: false)
    }

    internal init(_ configuration: LoadingIndicatorViewConfiguration, shouldApplyDefaultStyle: Bool) {
        self.title = configuration.title
        self.duration = configuration.duration
        self._isPresented = configuration.$isPresented
        self._shouldApplyDefaultStyle = shouldApplyDefaultStyle
    }
}

extension LoadingIndicatorView: View {
    public var body: some View {
        if self._shouldApplyDefaultStyle {
            self.defaultStyle()
        } else {
            self.style.resolve(configuration: .init(title: .init(self.title), duration: self.duration, isPresented: self.$isPresented)).typeErased
                .transformEnvironment(\.loadingIndicatorViewStyleStack) { stack in
                    if !stack.isEmpty {
                        stack.removeLast()
                    }
                }
        }
    }
}

private extension LoadingIndicatorView {
    func shouldApplyDefaultStyle(_ bool: Bool) -> some View {
        var s = self
        s._shouldApplyDefaultStyle = bool
        return s
    }

    func defaultStyle() -> some View {
        LoadingIndicatorView(.init(title: .init(self.title), duration: self.duration, isPresented: self.$isPresented))
            .shouldApplyDefaultStyle(false)
            .loadingIndicatorViewStyle(LoadingIndicatorViewFioriStyle.ContentFioriStyle())
            .typeErased
    }
}
