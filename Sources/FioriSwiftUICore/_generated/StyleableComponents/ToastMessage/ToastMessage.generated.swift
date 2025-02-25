// Generated using Sourcery 2.2.6 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

public struct ToastMessage {
    let icon: any View
    let title: any View
    /// The duration in seconds for which the toast message is shown. The default value is `1`.
    let duration: Double
    /// The position of the toast message relative to its parent view. `.center` puts the toast message in the center of its parent view, `.above` aligns it above the view, and `.below` aligns it below the view. The default value is `.center`.
    let position: ToastMessagePosition
    /// The amount of spacing to put in between the toast message and the frame of its parent view. This only applies to the `.above` and `.below` positions, and negative values are converted to `0`. The default value is `0`.
    let spacing: CGFloat

    @Environment(\.toastMessageStyle) var style

    var componentIdentifier: String = ToastMessage.identifier

    fileprivate var _shouldApplyDefaultStyle = true

    public init(@ViewBuilder icon: () -> any View = { EmptyView() },
                @ViewBuilder title: () -> any View,
                duration: Double = 1,
                position: ToastMessagePosition = .center,
                spacing: CGFloat = 0,
                componentIdentifier: String? = ToastMessage.identifier)
    {
        self.icon = Icon(icon: icon, componentIdentifier: componentIdentifier)
        self.title = Title(title: title, componentIdentifier: componentIdentifier)
        self.duration = duration
        self.position = position
        self.spacing = spacing
        self.componentIdentifier = componentIdentifier ?? ToastMessage.identifier
    }
}

public extension ToastMessage {
    static let identifier = "fiori_toastmessage_component"
}

public extension ToastMessage {
    init(icon: Image? = nil,
         title: AttributedString,
         duration: Double = 1,
         position: ToastMessagePosition = .center,
         spacing: CGFloat = 0)
    {
        self.init(icon: { icon }, title: { Text(title) }, duration: duration, position: position, spacing: spacing)
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
        self.position = configuration.position
        self.spacing = configuration.spacing
        self._shouldApplyDefaultStyle = shouldApplyDefaultStyle
        self.componentIdentifier = configuration.componentIdentifier
    }
}

extension ToastMessage: View {
    public var body: some View {
        if self._shouldApplyDefaultStyle {
            self.defaultStyle()
        } else {
            self.style.resolve(configuration: .init(componentIdentifier: self.componentIdentifier, icon: .init(self.icon), title: .init(self.title), duration: self.duration, position: self.position, spacing: self.spacing)).typeErased
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
        ToastMessage(.init(componentIdentifier: self.componentIdentifier, icon: .init(self.icon), title: .init(self.title), duration: self.duration, position: self.position, spacing: self.spacing))
            .shouldApplyDefaultStyle(false)
            .toastMessageStyle(ToastMessageFioriStyle.ContentFioriStyle())
            .typeErased
    }
}
