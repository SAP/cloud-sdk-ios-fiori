// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

public struct BannerMultiMessageSheet {
    let title: any View
    let closeAction: any View
    /// callback when this component want to dismiss itself
    let dismissAction: (() -> Void)?
    /// callback when category or single item is removed
    let removeAction: ((String, UUID?) -> Void)?
    /// callback when the link button is clicked
    let viewDetailAction: ((UUID) -> Void)?
    /// the mark to turn on section header or not
    let turnOnSectionHeader: Bool
    /// view for each item under the category
    let messageItemView: (UUID) -> any View
    /// the data source for banner multi-message sheet
    @Binding var bannerMultiMessages: [BannerMessageListModel]

    @Environment(\.bannerMultiMessageSheetStyle) var style

    var componentIdentifier: String = BannerMultiMessageSheet.identifier

    fileprivate var _shouldApplyDefaultStyle = true

    public init(@ViewBuilder title: () -> any View,
                @ViewBuilder closeAction: () -> any View = { FioriButton { _ in Image(systemName: "xmark") } },
                dismissAction: (() -> Void)? = nil,
                removeAction: ((String, UUID?) -> Void)? = nil,
                viewDetailAction: ((UUID) -> Void)? = nil,
                turnOnSectionHeader: Bool = true,
                @ViewBuilder messageItemView: @escaping (UUID) -> any View = { _ in EmptyView() },
                bannerMultiMessages: Binding<[BannerMessageListModel]>,
                componentIdentifier: String? = BannerMultiMessageSheet.identifier)
    {
        self.title = Title(title: title, componentIdentifier: componentIdentifier)
        self.closeAction = CloseAction(closeAction: closeAction, componentIdentifier: componentIdentifier)
        self.dismissAction = dismissAction
        self.removeAction = removeAction
        self.viewDetailAction = viewDetailAction
        self.turnOnSectionHeader = turnOnSectionHeader
        self.messageItemView = messageItemView
        self._bannerMultiMessages = bannerMultiMessages
        self.componentIdentifier = componentIdentifier ?? BannerMultiMessageSheet.identifier
    }
}

public extension BannerMultiMessageSheet {
    static let identifier = "fiori_bannermultimessagesheet_component"
}

public extension BannerMultiMessageSheet {
    init(title: AttributedString,
         closeAction: FioriButton? = FioriButton { _ in Image(systemName: "xmark") },
         dismissAction: (() -> Void)? = nil,
         removeAction: ((String, UUID?) -> Void)? = nil,
         viewDetailAction: ((UUID) -> Void)? = nil,
         turnOnSectionHeader: Bool = true,
         @ViewBuilder messageItemView: @escaping (UUID) -> any View = { _ in EmptyView() },
         bannerMultiMessages: Binding<[BannerMessageListModel]>,
         componentIdentifier: String? = BannerMultiMessageSheet.identifier)
    {
        self.init(title: { Text(title) }, closeAction: { closeAction }, dismissAction: dismissAction, removeAction: removeAction, viewDetailAction: viewDetailAction, turnOnSectionHeader: turnOnSectionHeader, messageItemView: messageItemView, bannerMultiMessages: bannerMultiMessages, componentIdentifier: componentIdentifier)
    }
}

public extension BannerMultiMessageSheet {
    init(_ configuration: BannerMultiMessageSheetConfiguration) {
        self.init(configuration, shouldApplyDefaultStyle: false)
    }

    internal init(_ configuration: BannerMultiMessageSheetConfiguration, shouldApplyDefaultStyle: Bool) {
        self.title = configuration.title
        self.closeAction = configuration.closeAction
        self.dismissAction = configuration.dismissAction
        self.removeAction = configuration.removeAction
        self.viewDetailAction = configuration.viewDetailAction
        self.turnOnSectionHeader = configuration.turnOnSectionHeader
        self.messageItemView = configuration.messageItemView
        self._bannerMultiMessages = configuration.$bannerMultiMessages
        self._shouldApplyDefaultStyle = shouldApplyDefaultStyle
        self.componentIdentifier = configuration.componentIdentifier
    }
}

extension BannerMultiMessageSheet: View {
    public var body: some View {
        if self._shouldApplyDefaultStyle {
            self.defaultStyle()
        } else {
            self.style.resolve(configuration: .init(componentIdentifier: self.componentIdentifier, title: .init(self.title), closeAction: .init(self.closeAction), dismissAction: self.dismissAction, removeAction: self.removeAction, viewDetailAction: self.viewDetailAction, turnOnSectionHeader: self.turnOnSectionHeader, messageItemView: self.messageItemView, bannerMultiMessages: self.$bannerMultiMessages)).typeErased
                .transformEnvironment(\.bannerMultiMessageSheetStyleStack) { stack in
                    if !stack.isEmpty {
                        stack.removeLast()
                    }
                }
        }
    }
}

private extension BannerMultiMessageSheet {
    func shouldApplyDefaultStyle(_ bool: Bool) -> some View {
        var s = self
        s._shouldApplyDefaultStyle = bool
        return s
    }

    func defaultStyle() -> some View {
        BannerMultiMessageSheet(.init(componentIdentifier: self.componentIdentifier, title: .init(self.title), closeAction: .init(self.closeAction), dismissAction: self.dismissAction, removeAction: self.removeAction, viewDetailAction: self.viewDetailAction, turnOnSectionHeader: self.turnOnSectionHeader, messageItemView: self.messageItemView, bannerMultiMessages: self.$bannerMultiMessages))
            .shouldApplyDefaultStyle(false)
            .bannerMultiMessageSheetStyle(BannerMultiMessageSheetFioriStyle.ContentFioriStyle())
            .typeErased
    }
}
