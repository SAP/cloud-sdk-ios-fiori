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
    let separator: any View
    /// Provides a standard hairline for object header or not. The default value is `false`.
    let isSeparatorHidden: Bool

    @Environment(\.objectHeaderStyle) var style

    var componentIdentifier: String = ObjectHeader.identifier

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
                @ViewBuilder detailContent: () -> any View = { EmptyView() },
                @ViewBuilder separator: () -> any View = { Color.preferredColor(.separator) },
                isSeparatorHidden: Bool = false,
                componentIdentifier: String? = ObjectHeader.identifier)
    {
        self.title = Title(title: title, componentIdentifier: componentIdentifier)
        self.subtitle = Subtitle(subtitle: subtitle, componentIdentifier: componentIdentifier)
        self.tags = Tags(tags: tags, componentIdentifier: componentIdentifier)
        self.bodyText = BodyText(bodyText: bodyText, componentIdentifier: componentIdentifier)
        self.footnote = Footnote(footnote: footnote, componentIdentifier: componentIdentifier)
        self.descriptionText = DescriptionText(descriptionText: descriptionText, componentIdentifier: componentIdentifier)
        self.status = Status(status: status, componentIdentifier: componentIdentifier)
        self.substatus = Substatus(substatus: substatus, componentIdentifier: componentIdentifier)
        self.detailImage = DetailImage(detailImage: detailImage, componentIdentifier: componentIdentifier)
        self.detailContent = DetailContent(detailContent: detailContent, componentIdentifier: componentIdentifier)
        self.separator = Separator(separator: separator, componentIdentifier: componentIdentifier)
        self.isSeparatorHidden = isSeparatorHidden
        self.componentIdentifier = componentIdentifier ?? ObjectHeader.identifier
    }
}

public extension ObjectHeader {
    static let identifier = "fiori_objectheader_component"
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
         @ViewBuilder detailContent: () -> any View = { EmptyView() },
         separator: Color? = Color.preferredColor(.separator),
         isSeparatorHidden: Bool = false)
    {
        self.init(title: { Text(title) }, subtitle: { OptionalText(subtitle) }, tags: { TagStack(tags) }, bodyText: { OptionalText(bodyText) }, footnote: { OptionalText(footnote) }, descriptionText: { OptionalText(descriptionText) }, status: { TextOrIconView(status) }, substatus: { TextOrIconView(substatus) }, detailImage: { detailImage }, detailContent: detailContent, separator: { separator }, isSeparatorHidden: isSeparatorHidden)
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
        self.separator = configuration.separator
        self.isSeparatorHidden = configuration.isSeparatorHidden
        self._shouldApplyDefaultStyle = shouldApplyDefaultStyle
        self.componentIdentifier = configuration.componentIdentifier
    }
}

extension ObjectHeader: View {
    public var body: some View {
        if self._shouldApplyDefaultStyle {
            self.defaultStyle()
        } else {
            self.style.resolve(configuration: .init(componentIdentifier: self.componentIdentifier, title: .init(self.title), subtitle: .init(self.subtitle), tags: .init(self.tags), bodyText: .init(self.bodyText), footnote: .init(self.footnote), descriptionText: .init(self.descriptionText), status: .init(self.status), substatus: .init(self.substatus), detailImage: .init(self.detailImage), detailContent: .init(self.detailContent), separator: .init(self.separator), isSeparatorHidden: self.isSeparatorHidden)).typeErased
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
        ObjectHeader(.init(componentIdentifier: self.componentIdentifier, title: .init(self.title), subtitle: .init(self.subtitle), tags: .init(self.tags), bodyText: .init(self.bodyText), footnote: .init(self.footnote), descriptionText: .init(self.descriptionText), status: .init(self.status), substatus: .init(self.substatus), detailImage: .init(self.detailImage), detailContent: .init(self.detailContent), separator: .init(self.separator), isSeparatorHidden: self.isSeparatorHidden))
            .shouldApplyDefaultStyle(false)
            .objectHeaderStyle(ObjectHeaderFioriStyle.ContentFioriStyle())
            .typeErased
    }
}
