// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

public protocol BannerMultiMessageSheetStyle: DynamicProperty {
    associatedtype Body: View

    func makeBody(_ configuration: BannerMultiMessageSheetConfiguration) -> Body
}

struct AnyBannerMultiMessageSheetStyle: BannerMultiMessageSheetStyle {
    let content: (BannerMultiMessageSheetConfiguration) -> any View

    init(@ViewBuilder _ content: @escaping (BannerMultiMessageSheetConfiguration) -> any View) {
        self.content = content
    }

    public func makeBody(_ configuration: BannerMultiMessageSheetConfiguration) -> some View {
        self.content(configuration).typeErased
    }
}

public struct BannerMultiMessageSheetConfiguration {
    public let title: Title
    public let closeAction: CloseAction
    public let dismissAction: (() -> Void)?
    public let removeAction: ((String, UUID?) -> Void)?
    public let viewDetailAction: ((UUID) -> Void)?
    public let turnOnSectionHeader: Bool
    public let messageItemView: (UUID) -> any View
    @Binding public var bannerMultiMessages: [BannerMessageListModel]

    public typealias Title = ConfigurationViewWrapper
    public typealias CloseAction = ConfigurationViewWrapper
}

public struct BannerMultiMessageSheetFioriStyle: BannerMultiMessageSheetStyle {
    public func makeBody(_ configuration: BannerMultiMessageSheetConfiguration) -> some View {
        BannerMultiMessageSheet(configuration)
            .titleStyle(TitleFioriStyle(bannerMultiMessageSheetConfiguration: configuration))
            .closeActionStyle(CloseActionFioriStyle(bannerMultiMessageSheetConfiguration: configuration))
    }
}
