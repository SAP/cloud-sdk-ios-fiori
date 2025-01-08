// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

/// `ObjectHeader` is a view that displays an object's title, subtitle, tags, body text, footnote, description, status, substatus, detail image and detail content.
/// ## Usage
/// ```swift
/// ObjectHeader {
///     Text("title")
/// } subtitle: {
///     Text("subtitle")
/// } tags: {
///     Text("tag01")
/// } bodyText: {
///     Text("body")
/// } footnote: {
///     Text("footnote")
/// } descriptionText: {
///     Text("description")
/// } status: {
///     Text("status")
/// } substatus: {
///     Text("substatus")
/// } detailImage: {
///     Image(systemName: "person")
/// } detailContent: {
///     Text("detail content")
/// }
/// ```
public struct ObjectHeader {
    let title: any View
    let subtitle: any View
    let tags: any View
    let bodyText: any View
    let footnote: any View
    let descriptionText: any View
    let status: any View
    let substatus: any View
    let detailImage: any View
    let detailContent: any View

    @Environment(\.objectHeaderStyle) var style

    fileprivate var _shouldApplyDefaultStyle = true

    public init(@ViewBuilder title: () -> any View,
                @ViewBuilder subtitle: () -> any View = { EmptyView() },
                @TagBuilder tags: () -> any View = { EmptyView() },
                @ViewBuilder bodyText: () -> any View = { EmptyView() },
                @ViewBuilder footnote: () -> any View = { EmptyView() },
                @ViewBuilder descriptionText: () -> any View = { EmptyView() },
                @ViewBuilder status: () -> any View = { EmptyView() },
                @ViewBuilder substatus: () -> any View = { EmptyView() },
                @ViewBuilder detailImage: () -> any View = { EmptyView() },
                @ViewBuilder detailContent: () -> any View = { EmptyView() })
    {
        self.title = Title(title: title)
        self.subtitle = Subtitle(subtitle: subtitle)
        self.tags = Tags(tags: tags)
        self.bodyText = BodyText(bodyText: bodyText)
        self.footnote = Footnote(footnote: footnote)
        self.descriptionText = DescriptionText(descriptionText: descriptionText)
        self.status = Status(status: status)
        self.substatus = Substatus(substatus: substatus)
        self.detailImage = DetailImage(detailImage: detailImage)
        self.detailContent = DetailContent(detailContent: detailContent)
    }
}

public extension ObjectHeader {
    init(title: AttributedString,
         subtitle: AttributedString? = nil,
         tags: [AttributedString] = [],
         bodyText: AttributedString? = nil,
         footnote: AttributedString? = nil,
         descriptionText: AttributedString? = nil,
         status: TextOrIcon? = nil,
         substatus: TextOrIcon? = nil,
         detailImage: Image? = nil,
         @ViewBuilder detailContent: () -> any View = { EmptyView() })
    {
        self.init(title: { Text(title) }, subtitle: { OptionalText(subtitle) }, tags: { TagStack(tags) }, bodyText: { OptionalText(bodyText) }, footnote: { OptionalText(footnote) }, descriptionText: { OptionalText(descriptionText) }, status: { TextOrIconView(status) }, substatus: { TextOrIconView(substatus) }, detailImage: { detailImage }, detailContent: detailContent)
    }
}

public extension ObjectHeader {
    init(_ configuration: ObjectHeaderConfiguration) {
        self.init(configuration, shouldApplyDefaultStyle: false)
    }

    internal init(_ configuration: ObjectHeaderConfiguration, shouldApplyDefaultStyle: Bool) {
        self.title = configuration.title
        self.subtitle = configuration.subtitle
        self.tags = configuration.tags
        self.bodyText = configuration.bodyText
        self.footnote = configuration.footnote
        self.descriptionText = configuration.descriptionText
        self.status = configuration.status
        self.substatus = configuration.substatus
        self.detailImage = configuration.detailImage
        self.detailContent = configuration.detailContent
        self._shouldApplyDefaultStyle = shouldApplyDefaultStyle
    }
}

extension ObjectHeader: View {
    public var body: some View {
        if self._shouldApplyDefaultStyle {
            self.defaultStyle()
        } else {
            self.style.resolve(configuration: .init(title: .init(self.title), subtitle: .init(self.subtitle), tags: .init(self.tags), bodyText: .init(self.bodyText), footnote: .init(self.footnote), descriptionText: .init(self.descriptionText), status: .init(self.status), substatus: .init(self.substatus), detailImage: .init(self.detailImage), detailContent: .init(self.detailContent))).typeErased
                .transformEnvironment(\.objectHeaderStyleStack) { stack in
                    if !stack.isEmpty {
                        stack.removeLast()
                    }
                }
        }
    }
}

private extension ObjectHeader {
    func shouldApplyDefaultStyle(_ bool: Bool) -> some View {
        var s = self
        s._shouldApplyDefaultStyle = bool
        return s
    }

    func defaultStyle() -> some View {
        ObjectHeader(.init(title: .init(self.title), subtitle: .init(self.subtitle), tags: .init(self.tags), bodyText: .init(self.bodyText), footnote: .init(self.footnote), descriptionText: .init(self.descriptionText), status: .init(self.status), substatus: .init(self.substatus), detailImage: .init(self.detailImage), detailContent: .init(self.detailContent)))
            .shouldApplyDefaultStyle(false)
            .objectHeaderStyle(ObjectHeaderFioriStyle.ContentFioriStyle())
            .typeErased
    }
}
