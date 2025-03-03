// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

/// `Attachment` provides thumbnail and information about an attachment.
///
/// ## Usage
/// ```swift
/// Attachment {
///   QuickLookThumbnail(physicalUrl: fileURL)
/// } title: {
///   Text("Leaf")
/// } subtitle: {
///   Text("15MB")
/// } timestamp: {
///   Text("Aug 15, 2024")
/// }
///
/// Attachment {
///   QuickLookThumbnail(thumbnailImage: : Image(systemName: "leaf"))
/// } title: {
///   Text("Leaf")
/// } subtitle: {
///   Text("15MB")
/// } timestamp: {
///   Text("Aug 15, 2024")
/// }
///
/// Attachment {
///   Image(systemName: "leaf")
///     .resizable()
/// } title: {
///   Text("Leaf")
/// } subtitle: {
///   Text("15MB")
/// } timestamp: {
///   Text("Aug 15, 2024")
/// }
/// ```
public struct Attachment {
    let title: any View
    let subtitle: any View
    let footnote: any View
    /// The collection of local attachment URLs, which are prepared by Apps.
    let url: URL
    /// The state of attachement group component
    let controlState: ControlState

    @Environment(\.attachmentStyle) var style

    fileprivate var _shouldApplyDefaultStyle = true

    public init(@ViewBuilder title: () -> any View,
                @ViewBuilder subtitle: () -> any View,
                @ViewBuilder footnote: () -> any View,
                url: URL,
                controlState: ControlState = .normal)
    {
        self.title = Title(title: title)
        self.subtitle = Subtitle(subtitle: subtitle)
        self.footnote = Footnote(footnote: footnote)
        self.url = url
        self.controlState = controlState
    }
}

public extension Attachment {
    init(title: AttributedString,
         subtitle: AttributedString,
         footnote: AttributedString,
         url: URL,
         controlState: ControlState = .normal)
    {
        self.init(title: { Text(title) }, subtitle: { Text(subtitle) }, footnote: { Text(footnote) }, url: url, controlState: controlState)
    }
}

public extension Attachment {
    init(_ configuration: AttachmentConfiguration) {
        self.init(configuration, shouldApplyDefaultStyle: false)
    }

    internal init(_ configuration: AttachmentConfiguration, shouldApplyDefaultStyle: Bool) {
        self.title = configuration.title
        self.subtitle = configuration.subtitle
        self.footnote = configuration.footnote
        self.url = configuration.url
        self.controlState = configuration.controlState
        self._shouldApplyDefaultStyle = shouldApplyDefaultStyle
    }
}

extension Attachment: View {
    public var body: some View {
        if self._shouldApplyDefaultStyle {
            self.defaultStyle()
        } else {
            self.style.resolve(configuration: .init(title: .init(self.title), subtitle: .init(self.subtitle), footnote: .init(self.footnote), url: self.url, controlState: self.controlState)).typeErased
                .transformEnvironment(\.attachmentStyleStack) { stack in
                    if !stack.isEmpty {
                        stack.removeLast()
                    }
                }
        }
    }
}

private extension Attachment {
    func shouldApplyDefaultStyle(_ bool: Bool) -> some View {
        var s = self
        s._shouldApplyDefaultStyle = bool
        return s
    }

    func defaultStyle() -> some View {
        Attachment(.init(title: .init(self.title), subtitle: .init(self.subtitle), footnote: .init(self.footnote), url: self.url, controlState: self.controlState))
            .shouldApplyDefaultStyle(false)
            .attachmentStyle(AttachmentFioriStyle.ContentFioriStyle())
            .typeErased
    }
}
