// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

/// CardHeader: Composite Component Protocol
///
/// The `_CardHeaderComponent` protocol defines the complete header section of a card.
/// This protocol combines media, main header, and extended header components
/// to create a comprehensive header layout that can accommodate various content types and layouts.
///
/// ## Usage
///
/// This component serves as a container that combines all header-related components into a unified interface.
///
/// ```swift
/// CardHeader {
///     Image("productThumbnail")
///         .resizable()
///         .aspectRatio(contentMode: .fill)
///         .frame(height: 145)
/// } description: {
///     Text("Title")
/// } title: {
///     Text("Title that goes to two lines before truncating")
/// } subtitle: {
///     Text("Subtitle that goes to multiple lines before truncating")
/// } icons: {
///     IconStack(icons: [TextOrIcon.icon(Image(systemName: "circle.fill")),
///                      TextOrIcon.icon(Image(systemName: "paperclip")),
///                      TextOrIcon.text("1")])
/// } detailImage: {
///     Image("ProfilePic")
///         .resizable()
///         .clipShape(Circle())
/// } headerAction: {
///     FioriButton(title: "Action")
/// } counter: {
///     Text("1 of 3")
/// } row1: {
///     HStack {
///         LabelItem(icon: Image(systemName: "exclamationmark.triangle.fill"), title: "Negative")
///             .titleStyle { config in
///                 config.title.foregroundStyle(Color.preferredColor(.negativeLabel))
///             }
///         LabelItem(title: "Critical")
///             .titleStyle { config in
///                 config.title.foregroundStyle(Color.preferredColor(.criticalLabel))
///             }
///         LabelItem(icon: Image(systemName: "checkmark.circle"), title: "Positive")
///             .titleStyle { config in
///                 config.title.foregroundStyle(Color.preferredColor(.positiveLabel))
///             }
///     }
/// } row2: {
///     HStack {
///         Text("256 reviews")
///     }
/// } row3: {
///     HStack {
///         Tag(verbatim: "Tag")
///         Tag(verbatim: "Tag")
///         Tag(verbatim: "Tag")
///     }
/// } kpi: {
///     _KPIItem(KPIItemData.components([.icon(Image(systemName: "arrowtriangle.up.fill")),
///                                      .unit("$"),
///                                      .metric("26.9"),
///                                      .unit("M")]))
/// } kpiCaption: {
///     Text("Revenue")
/// }
/// ```
///
/// ```swift
/// CardHeader(mediaImage: Image("productThumbnail"),
///            description: "Title",
///            title: "Title",
///            subtitle: "Subtitle",
///            icons: [TextOrIcon.icon(Image(systemName: "circle.fill"))],
///            detailImage: Image("ProfilePic"),
///            headerAction: FioriButton(title: "Action"),
///            counter: "1 of 3",
///            kpi: KPIItemData.components([.unit("$"), .metric("26.9"), .unit("M")]),
///            kpiCaption: "Revenue")
/// ```
///
public struct CardHeader {
    let mediaImage: any View
    let description: any View
    let title: any View
    let subtitle: any View
    let icons: any View
    let detailImage: any View
    let headerAction: any View
    let counter: any View
    let flexItem: any View
    /// Determines the position of the flex item within the header layout.
    /// This property controls where flexible content is placed relative to other header elements.
    /// Available positions include: `.aboveMainHeader`, `.aboveTitle`, `.betweenTitleAndSubtitle`, `.belowSubtitle`
    var flexItemPosition: FlexItemPositionType?
    let row1: any View
    let row2: any View
    let row3: any View
    let kpi: any View
    let kpiCaption: any View

    @Environment(\.cardHeaderStyle) var style

    var componentIdentifier: String = CardHeader.identifier

    fileprivate var _shouldApplyDefaultStyle = true

    public init(@ViewBuilder mediaImage: () -> any View = { EmptyView() },
                @ViewBuilder description: () -> any View = { EmptyView() },
                @ViewBuilder title: () -> any View,
                @ViewBuilder subtitle: () -> any View = { EmptyView() },
                @IconBuilder icons: () -> any View = { EmptyView() },
                @ViewBuilder detailImage: () -> any View = { EmptyView() },
                @ViewBuilder headerAction: () -> any View = { EmptyView() },
                @ViewBuilder counter: () -> any View = { EmptyView() },
                @ViewBuilder flexItem: () -> any View = { EmptyView() },
                flexItemPosition: FlexItemPositionType? = nil,
                @ViewBuilder row1: () -> any View = { EmptyView() },
                @ViewBuilder row2: () -> any View = { EmptyView() },
                @ViewBuilder row3: () -> any View = { EmptyView() },
                @ViewBuilder kpi: () -> any View = { EmptyView() },
                @ViewBuilder kpiCaption: () -> any View = { EmptyView() },
                componentIdentifier: String? = CardHeader.identifier)
    {
        self.mediaImage = MediaImage(mediaImage: mediaImage, componentIdentifier: componentIdentifier)
        self.description = Description(description: description, componentIdentifier: componentIdentifier)
        self.title = Title(title: title, componentIdentifier: componentIdentifier)
        self.subtitle = Subtitle(subtitle: subtitle, componentIdentifier: componentIdentifier)
        self.icons = Icons(icons: icons, componentIdentifier: componentIdentifier)
        self.detailImage = DetailImage(detailImage: detailImage, componentIdentifier: componentIdentifier)
        self.headerAction = HeaderAction(headerAction: headerAction, componentIdentifier: componentIdentifier)
        self.counter = Counter(counter: counter, componentIdentifier: componentIdentifier)
        self.flexItem = FlexItem(flexItem: flexItem, componentIdentifier: componentIdentifier)
        self.flexItemPosition = flexItemPosition
        self.row1 = Row1(row1: row1, componentIdentifier: componentIdentifier)
        self.row2 = Row2(row2: row2, componentIdentifier: componentIdentifier)
        self.row3 = Row3(row3: row3, componentIdentifier: componentIdentifier)
        self.kpi = Kpi(kpi: kpi, componentIdentifier: componentIdentifier)
        self.kpiCaption = KpiCaption(kpiCaption: kpiCaption, componentIdentifier: componentIdentifier)
        self.componentIdentifier = componentIdentifier ?? CardHeader.identifier
    }
}

public extension CardHeader {
    static let identifier = "fiori_cardheader_component"
}

public extension CardHeader {
    init(mediaImage: Image? = nil,
         description: AttributedString? = nil,
         title: AttributedString,
         subtitle: AttributedString? = nil,
         icons: [TextOrIcon] = [],
         detailImage: Image? = nil,
         headerAction: FioriButton? = nil,
         counter: AttributedString? = nil,
         @ViewBuilder flexItem: () -> any View = { EmptyView() },
         flexItemPosition: FlexItemPositionType? = nil,
         @ViewBuilder row1: () -> any View = { EmptyView() },
         @ViewBuilder row2: () -> any View = { EmptyView() },
         @ViewBuilder row3: () -> any View = { EmptyView() },
         kpi: KPIItemData? = nil,
         kpiCaption: AttributedString? = nil)
    {
        self.init(mediaImage: { OptionalImage(mediaImage) }, description: { OptionalText(description) }, title: { Text(title) }, subtitle: { OptionalText(subtitle) }, icons: { IconStack(icons) }, detailImage: { detailImage }, headerAction: { headerAction }, counter: { OptionalText(counter) }, flexItem: flexItem, flexItemPosition: flexItemPosition, row1: row1, row2: row2, row3: row3, kpi: { OptionalKPIItem(kpi) }, kpiCaption: { OptionalText(kpiCaption) })
    }
}

public extension CardHeader {
    init(_ configuration: CardHeaderConfiguration) {
        self.init(configuration, shouldApplyDefaultStyle: false)
    }

    internal init(_ configuration: CardHeaderConfiguration, shouldApplyDefaultStyle: Bool) {
        self.mediaImage = configuration.mediaImage
        self.description = configuration.description
        self.title = configuration.title
        self.subtitle = configuration.subtitle
        self.icons = configuration.icons
        self.detailImage = configuration.detailImage
        self.headerAction = configuration.headerAction
        self.counter = configuration.counter
        self.flexItem = configuration.flexItem
        self.flexItemPosition = configuration.flexItemPosition
        self.row1 = configuration.row1
        self.row2 = configuration.row2
        self.row3 = configuration.row3
        self.kpi = configuration.kpi
        self.kpiCaption = configuration.kpiCaption
        self._shouldApplyDefaultStyle = shouldApplyDefaultStyle
        self.componentIdentifier = configuration.componentIdentifier
    }
}

extension CardHeader: View {
    public var body: some View {
        if self._shouldApplyDefaultStyle {
            self.defaultStyle()
        } else {
            self.style.resolve(configuration: .init(componentIdentifier: self.componentIdentifier, mediaImage: .init(self.mediaImage), description: .init(self.description), title: .init(self.title), subtitle: .init(self.subtitle), icons: .init(self.icons), detailImage: .init(self.detailImage), headerAction: .init(self.headerAction), counter: .init(self.counter), flexItem: .init(self.flexItem), flexItemPosition: self.flexItemPosition, row1: .init(self.row1), row2: .init(self.row2), row3: .init(self.row3), kpi: .init(self.kpi), kpiCaption: .init(self.kpiCaption))).typeErased
                .transformEnvironment(\.cardHeaderStyleStack) { stack in
                    if !stack.isEmpty {
                        stack.removeLast()
                    }
                }
        }
    }
}

private extension CardHeader {
    func shouldApplyDefaultStyle(_ bool: Bool) -> some View {
        var s = self
        s._shouldApplyDefaultStyle = bool
        return s
    }

    func defaultStyle() -> some View {
        CardHeader(.init(componentIdentifier: self.componentIdentifier, mediaImage: .init(self.mediaImage), description: .init(self.description), title: .init(self.title), subtitle: .init(self.subtitle), icons: .init(self.icons), detailImage: .init(self.detailImage), headerAction: .init(self.headerAction), counter: .init(self.counter), flexItem: .init(self.flexItem), flexItemPosition: self.flexItemPosition, row1: .init(self.row1), row2: .init(self.row2), row3: .init(self.row3), kpi: .init(self.kpi), kpiCaption: .init(self.kpiCaption)))
            .shouldApplyDefaultStyle(false)
            .cardHeaderStyle(CardHeaderFioriStyle.ContentFioriStyle())
            .typeErased
    }
}
