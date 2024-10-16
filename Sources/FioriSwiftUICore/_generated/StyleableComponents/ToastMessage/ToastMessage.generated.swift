// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

public struct ToastMessage {
    let icon: any View
    let title: any View
    /// The duration in seconds for which the toast message is shown. The default is `1`.
    let duration: Double

    @Environment(\.toastMessageStyle) var style

    fileprivate var _shouldApplyDefaultStyle = true

    public init(@ViewBuilder icon: () -> any View = { EmptyView() },
                @ViewBuilder title: () -> any View,
                duration: Double = 1)
    {
        self.icon = Icon(icon: icon)
        self.title = Title(title: title)
        self.duration = duration
    }
}

public extension ToastMessage {
    init(icon: Image? = nil,
         title: AttributedString,
         duration: Double = 1)
    {
        self.init(icon: { icon }, title: { Text(title) }, duration: duration)
    }
}

public extension ToastMessage {
    init(_ configuration: ToastMessageConfiguration) {
        self.init(configuration, shouldApplyDefaultStyle: false)
    }

    internal init(_ configuration: ToastMessageConfiguration, shouldApplyDefaultStyle: Bool) {
        self.icon = configuration.icon
        self.title = configuration.title
        self.duration = configuration.duration
        self._shouldApplyDefaultStyle = shouldApplyDefaultStyle
    }
}

extension ToastMessage: View {
    public var body: some View {
        if self._shouldApplyDefaultStyle {
            self.defaultStyle()
        } else {
            self.style.resolve(configuration: .init(icon: .init(self.icon), title: .init(self.title), duration: self.duration)).typeErased
                .transformEnvironment(\.toastMessageStyleStack) { stack in
                    if !stack.isEmpty {
                        stack.removeLast()
                    }
                }
        }
    }
}

private extension ToastMessage {
    func shouldApplyDefaultStyle(_ bool: Bool) -> some View {
        var s = self
        s._shouldApplyDefaultStyle = bool
        return s
    }

    func defaultStyle() -> some View {
        ToastMessage(.init(icon: .init(self.icon), title: .init(self.title), duration: self.duration))
            .shouldApplyDefaultStyle(false)
            .toastMessageStyle(ToastMessageFioriStyle.ContentFioriStyle())
            .typeErased
    }
}
