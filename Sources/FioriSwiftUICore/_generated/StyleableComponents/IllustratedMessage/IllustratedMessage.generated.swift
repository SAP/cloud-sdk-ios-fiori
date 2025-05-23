// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

public struct IllustratedMessage {
    let detailImage: any View
    let title: any View
    let description: any View
    let action: any View
    let secondaryAction: any View
    /// Specifies the size of the detailImage. This value should be an enum from the DetailImageSize set.
    let detailImageSize: IllustratedMessage.DetailImageSize?
    /// Determines the layout of the action buttons. If set to true, the buttons will be arranged vertically. If set to false, they will be arranged horizontally. The default value is false.
    let isActionVerticallyAligned: Bool
    /// Determines the alignment of the title, description and the action buttons in the horizontal mode. The default value e is `.leading`.
    let contentAlignment: HorizontalAlignment

    @Environment(\.illustratedMessageStyle) var style

    var componentIdentifier: String = IllustratedMessage.identifier

    fileprivate var _shouldApplyDefaultStyle = true

    public init(@ViewBuilder detailImage: () -> any View = { EmptyView() },
                @ViewBuilder title: () -> any View,
                @ViewBuilder description: () -> any View = { EmptyView() },
                @ViewBuilder action: () -> any View = { EmptyView() },
                @ViewBuilder secondaryAction: () -> any View = { EmptyView() },
                detailImageSize: IllustratedMessage.DetailImageSize? = nil,
                isActionVerticallyAligned: Bool = false,
                contentAlignment: HorizontalAlignment = .leading,
                componentIdentifier: String? = IllustratedMessage.identifier)
    {
        self.detailImage = DetailImage(detailImage: detailImage, componentIdentifier: componentIdentifier)
        self.title = Title(title: title, componentIdentifier: componentIdentifier)
        self.description = Description(description: description, componentIdentifier: componentIdentifier)
        self.action = Action(action: action, componentIdentifier: componentIdentifier)
        self.secondaryAction = SecondaryAction(secondaryAction: secondaryAction, componentIdentifier: componentIdentifier)
        self.detailImageSize = detailImageSize
        self.isActionVerticallyAligned = isActionVerticallyAligned
        self.contentAlignment = contentAlignment
        self.componentIdentifier = componentIdentifier ?? IllustratedMessage.identifier
    }
}

public extension IllustratedMessage {
    static let identifier = "fiori_illustratedmessage_component"
}

public extension IllustratedMessage {
    init(detailImage: Image? = nil,
         title: AttributedString,
         description: AttributedString? = nil,
         action: FioriButton? = nil,
         secondaryAction: FioriButton? = nil,
         detailImageSize: IllustratedMessage.DetailImageSize? = nil,
         isActionVerticallyAligned: Bool = false,
         contentAlignment: HorizontalAlignment = .leading)
    {
        self.init(detailImage: { detailImage }, title: { Text(title) }, description: { OptionalText(description) }, action: { action }, secondaryAction: { secondaryAction }, detailImageSize: detailImageSize, isActionVerticallyAligned: isActionVerticallyAligned, contentAlignment: contentAlignment)
    }
}

public extension IllustratedMessage {
    init(_ configuration: IllustratedMessageConfiguration) {
        self.init(configuration, shouldApplyDefaultStyle: false)
    }

    internal init(_ configuration: IllustratedMessageConfiguration, shouldApplyDefaultStyle: Bool) {
        self.detailImage = configuration.detailImage
        self.title = configuration.title
        self.description = configuration.description
        self.action = configuration.action
        self.secondaryAction = configuration.secondaryAction
        self.detailImageSize = configuration.detailImageSize
        self.isActionVerticallyAligned = configuration.isActionVerticallyAligned
        self.contentAlignment = configuration.contentAlignment
        self._shouldApplyDefaultStyle = shouldApplyDefaultStyle
        self.componentIdentifier = configuration.componentIdentifier
    }
}

extension IllustratedMessage: View {
    public var body: some View {
        if self._shouldApplyDefaultStyle {
            self.defaultStyle()
        } else {
            self.style.resolve(configuration: .init(componentIdentifier: self.componentIdentifier, detailImage: .init(self.detailImage), title: .init(self.title), description: .init(self.description), action: .init(self.action), secondaryAction: .init(self.secondaryAction), detailImageSize: self.detailImageSize, isActionVerticallyAligned: self.isActionVerticallyAligned, contentAlignment: self.contentAlignment)).typeErased
                .transformEnvironment(\.illustratedMessageStyleStack) { stack in
                    if !stack.isEmpty {
                        stack.removeLast()
                    }
                }
        }
    }
}

private extension IllustratedMessage {
    func shouldApplyDefaultStyle(_ bool: Bool) -> some View {
        var s = self
        s._shouldApplyDefaultStyle = bool
        return s
    }

    func defaultStyle() -> some View {
        IllustratedMessage(.init(componentIdentifier: self.componentIdentifier, detailImage: .init(self.detailImage), title: .init(self.title), description: .init(self.description), action: .init(self.action), secondaryAction: .init(self.secondaryAction), detailImageSize: self.detailImageSize, isActionVerticallyAligned: self.isActionVerticallyAligned, contentAlignment: self.contentAlignment))
            .shouldApplyDefaultStyle(false)
            .illustratedMessageStyle(IllustratedMessageFioriStyle.ContentFioriStyle())
            .typeErased
    }
}
