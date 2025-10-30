// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

/// CardMainHeader: Composite Component Protocol
///
/// The `_CardMainHeaderComponent` protocol defines the main header section of a card.
/// This protocol combines title, subtitle, icons, detail image, header action, counter, and flexible item components
/// to create a comprehensive header layout for card-based UI components.
///
/// ## Usage
///
/// This component is used to create the primary header section of a card, providing a structured layout for displaying key information and actions.
///
/// ```swift
/// CardMainHeader {
///     Text("Card Title")
/// } subtitle: {
///     Text("Card subtitle with additional information")
/// } icons: {
///     IconStack(icons: [TextOrIcon.icon(Image(systemName: "star.fill"))])
/// } detailImage: {
///     Image("profile-image")
///         .resizable()
///         .clipShape(Circle())
/// } headerAction: {
///     FioriButton(title: "Action")
/// } counter: {
///     Text("1 of 3")
/// } flexItem: {
///     Text("Flexible content")
/// } flexItemPosition: .aboveTitle
/// ```
///
/// ```swift
/// CardMainHeader(title: "Card Title",
///                subtitle: "Card subtitle with additional information",
///                icons: [TextOrIcon.icon(Image(systemName: "star.fill"))],
///                detailImage: Image("profile-image"),
///                headerAction: FioriButton(title: "Action"),
///                counter: "1 of 3",
///                flexItem: { Text("Flexible content") },
///                flexItemPosition: .aboveTitle)
/// ```
///
public struct CardMainHeader {
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

    @Environment(\.cardMainHeaderStyle) var style

    var componentIdentifier: String = CardMainHeader.identifier

    fileprivate var _shouldApplyDefaultStyle = true

    public init(@ViewBuilder title: () -> any View,
                @ViewBuilder subtitle: () -> any View = { EmptyView() },
                @IconBuilder icons: () -> any View = { EmptyView() },
                @ViewBuilder detailImage: () -> any View = { EmptyView() },
                @ViewBuilder headerAction: () -> any View = { EmptyView() },
                @ViewBuilder counter: () -> any View = { EmptyView() },
                @ViewBuilder flexItem: () -> any View = { EmptyView() },
                flexItemPosition: FlexItemPositionType? = nil,
                componentIdentifier: String? = CardMainHeader.identifier)
    {
        self.title = Title(title: title, componentIdentifier: componentIdentifier)
        self.subtitle = Subtitle(subtitle: subtitle, componentIdentifier: componentIdentifier)
        self.icons = Icons(icons: icons, componentIdentifier: componentIdentifier)
        self.detailImage = DetailImage(detailImage: detailImage, componentIdentifier: componentIdentifier)
        self.headerAction = HeaderAction(headerAction: headerAction, componentIdentifier: componentIdentifier)
        self.counter = Counter(counter: counter, componentIdentifier: componentIdentifier)
        self.flexItem = FlexItem(flexItem: flexItem, componentIdentifier: componentIdentifier)
        self.flexItemPosition = flexItemPosition
        self.componentIdentifier = componentIdentifier ?? CardMainHeader.identifier
    }
}

public extension CardMainHeader {
    static let identifier = "fiori_cardmainheader_component"
}

public extension CardMainHeader {
    init(title: AttributedString,
         subtitle: AttributedString? = nil,
         icons: [TextOrIcon] = [],
         detailImage: Image? = nil,
         headerAction: FioriButton? = nil,
         counter: AttributedString? = nil,
         @ViewBuilder flexItem: () -> any View = { EmptyView() },
         flexItemPosition: FlexItemPositionType? = nil)
    {
        self.init(title: { Text(title) }, subtitle: { OptionalText(subtitle) }, icons: { IconStack(icons) }, detailImage: { detailImage }, headerAction: { headerAction }, counter: { OptionalText(counter) }, flexItem: flexItem, flexItemPosition: flexItemPosition)
    }
}

public extension CardMainHeader {
    init(_ configuration: CardMainHeaderConfiguration) {
        self.init(configuration, shouldApplyDefaultStyle: false)
    }

    internal init(_ configuration: CardMainHeaderConfiguration, shouldApplyDefaultStyle: Bool) {
        self.title = configuration.title
        self.subtitle = configuration.subtitle
        self.icons = configuration.icons
        self.detailImage = configuration.detailImage
        self.headerAction = configuration.headerAction
        self.counter = configuration.counter
        self.flexItem = configuration.flexItem
        self.flexItemPosition = configuration.flexItemPosition
        self._shouldApplyDefaultStyle = shouldApplyDefaultStyle
        self.componentIdentifier = configuration.componentIdentifier
    }
}

extension CardMainHeader: View {
    public var body: some View {
        if self._shouldApplyDefaultStyle {
            self.defaultStyle()
        } else {
            self.style.resolve(configuration: .init(componentIdentifier: self.componentIdentifier, title: .init(self.title), subtitle: .init(self.subtitle), icons: .init(self.icons), detailImage: .init(self.detailImage), headerAction: .init(self.headerAction), counter: .init(self.counter), flexItem: .init(self.flexItem), flexItemPosition: self.flexItemPosition)).typeErased
                .transformEnvironment(\.cardMainHeaderStyleStack) { stack in
                    if !stack.isEmpty {
                        stack.removeLast()
                    }
                }
        }
    }
}

private extension CardMainHeader {
    func shouldApplyDefaultStyle(_ bool: Bool) -> some View {
        var s = self
        s._shouldApplyDefaultStyle = bool
        return s
    }

    func defaultStyle() -> some View {
        CardMainHeader(.init(componentIdentifier: self.componentIdentifier, title: .init(self.title), subtitle: .init(self.subtitle), icons: .init(self.icons), detailImage: .init(self.detailImage), headerAction: .init(self.headerAction), counter: .init(self.counter), flexItem: .init(self.flexItem), flexItemPosition: self.flexItemPosition))
            .shouldApplyDefaultStyle(false)
            .cardMainHeaderStyle(CardMainHeaderFioriStyle.ContentFioriStyle())
            .typeErased
    }
}
