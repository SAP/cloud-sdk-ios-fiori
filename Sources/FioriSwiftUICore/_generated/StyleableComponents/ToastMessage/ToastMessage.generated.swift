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

    var componentIdentifier: String = ToastMessage.identifier

    fileprivate var _shouldApplyDefaultStyle = true

    public init(@ViewBuilder icon: () -> any View = { EmptyView() },
                @ViewBuilder title: () -> any View,
                duration: Double = 1,
                componentIdentifier: String? = ToastMessage.identifier)
    {
        self.icon = Icon(icon: icon, componentIdentifier: componentIdentifier)
        self.title = Title(title: title, componentIdentifier: componentIdentifier)
        self.duration = duration
        self.componentIdentifier = componentIdentifier ?? ToastMessage.identifier
    }
}

public extension ToastMessage {
    static let identifier = "fiori_toastmessage_component"
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
        self.componentIdentifier = configuration.componentIdentifier
    }
}

extension ToastMessage: View {
    public var body: some View {
        if self._shouldApplyDefaultStyle {
            self.defaultStyle()
        } else {
            self.style.resolve(configuration: .init(componentIdentifier: self.componentIdentifier, icon: .init(self.icon), title: .init(self.title), duration: self.duration)).typeErased
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
        ToastMessage(.init(componentIdentifier: self.componentIdentifier, icon: .init(self.icon), title: .init(self.title), duration: self.duration))
            .shouldApplyDefaultStyle(false)
            .toastMessageStyle(ToastMessageFioriStyle.ContentFioriStyle())
            .typeErased
    }
}
