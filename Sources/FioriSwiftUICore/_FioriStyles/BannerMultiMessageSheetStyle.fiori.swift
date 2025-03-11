import Combine
import FioriThemeManager
import Foundation
import SwiftUI

/**
 This file provides default fiori style for the component.

 1. Uncomment fhe following code.
 2. Implement layout and style in corresponding places.
 3. Delete `.generated` from file name.
 4. Move this file to `_FioriStyles` folder under `FioriSwiftUICore`.
 */

/// Single Banner Message Model
public struct BannerMessageItemModel: Identifiable {
    public var id: UUID
    /// Banner icon
    public var icon: (any View)?
    /// Banner title
    public var title: String
    /// Message Type
    public var messageType: BannerMultiMessageType
    /// Show detail link or not, default is true
    public var showDetailLink: Bool
    /// Show close action or not, default is true
    public var showCloseAction: Bool
    
    public var typeDesc: String {
        switch self.messageType {
        case .neutral:
            NSLocalizedString("message", tableName: "FioriSwiftUICore", bundle: Bundle.accessor, comment: "")
        case .informative:
            NSLocalizedString("information", tableName: "FioriSwiftUICore", bundle: Bundle.accessor, comment: "")
        case .positive:
            NSLocalizedString("confirmation", tableName: "FioriSwiftUICore", bundle: Bundle.accessor, comment: "")
        case .critical:
            NSLocalizedString("warning", tableName: "FioriSwiftUICore", bundle: Bundle.accessor, comment: "")
        case .negative:
            NSLocalizedString("error", tableName: "FioriSwiftUICore", bundle: Bundle.accessor, comment: "")
        }
    }
    
    public init(id: UUID = UUID(), icon: (any View)?, title: String, messageType: BannerMultiMessageType, showDetailLink: Bool = true, showCloseAction: Bool = true) {
        self.id = id
        self.icon = icon
        self.title = title
        self.messageType = messageType
        self.showDetailLink = showDetailLink
        self.showCloseAction = showCloseAction
    }
}

class CategorySelect: ObservableObject {
    @Published var categorySelectedIndex = 0
    
    init(categorySelectedIndex: Int = 0) {
        self.categorySelectedIndex = categorySelectedIndex
    }
}

public class BannerMessageListModel: Identifiable, Equatable, ObservableObject {
    public static func == (lhs: BannerMessageListModel, rhs: BannerMessageListModel) -> Bool {
        lhs.id == rhs.id
    }
    
    public var id: UUID
    // customized category, like "Errors", "Warnings", "Information", etc
    public let category: String
    @Published public var items: [BannerMessageItemModel]
    
    /// Public initializer for BannerMessageListModel
    /// - Parameters:
    ///   - id: the identification for the category
    ///   - category: category name
    ///   - items: the list under the category
    public init(id: UUID = UUID(), category: String, items: [BannerMessageItemModel]) {
        self.id = id
        self.category = category
        self.items = items
    }
}

// Base Layout style
public struct BannerMultiMessageSheetBaseStyle: BannerMultiMessageSheetStyle {
    @StateObject private var categorySelect = CategorySelect()
    @State private var dimensionSelector: DimensionSelector = {
        let all = NSLocalizedString("All", tableName: "FioriSwiftUICore", bundle: Bundle.accessor, comment: "")
        return DimensionSelector(segmentTitles: [all], selectedIndex: 0)
    }()

    @State private var timer: Timer?
    @State private var cancellableSet: Set<AnyCancellable> = []
    
    private func resetDimensionSelector(_ configuration: BannerMultiMessageSheetConfiguration) {
        var titles: [String] = []
        for element in configuration.bannerMultiMessages {
            titles.append(element.category)
        }
        let all = NSLocalizedString("All", tableName: "FioriSwiftUICore", bundle: Bundle.accessor, comment: "")
        self.dimensionSelector.titles = [all] + titles
        self.dimensionSelector.selectedIndex = 0
    }
    
    // List in popover will not expand automatically in iPad. Here, calculate the content height and resize its frame's height, the maximum of the popover height in iPad is 380.
    @State private var scrollContentHeight: CGFloat = 40
    @State private var dimensionSelectorHeight: CGFloat = 0
    @State private var messageCountHeight: CGFloat = 65
    
    // workaround for forcing list refresh when second layer array modified in bannerMultiMessage.
    @State private var refreshFlag = false
    
    private let viewDetailOpenUrlStr = "MultiMessageViewDetail"
    
    private var popoverHeight: CGFloat? {
        let contentHeight = self.messageCountHeight + self.dimensionSelectorHeight + self.scrollContentHeight
        return !self.isPhone ? min(contentHeight, 380.0) : nil
    }
    
    private var isPhone: Bool {
        UIDevice.current.userInterfaceIdiom == .phone
    }
    
    private func filteredBannerMultiMessages(_ configuration: BannerMultiMessageSheetConfiguration) -> [BannerMessageListModel] {
        let selectedCategory = self.dimensionSelector.titles[self.categorySelect.categorySelectedIndex]
        let filteredBannerMultiMessages = configuration.bannerMultiMessages.filter { model in
            if self.categorySelect.categorySelectedIndex == 0 {
                return true
            } else {
                return model.category == selectedCategory
            }
        }
        return filteredBannerMultiMessages
    }
    
    private func messageCountStr(_ configuration: BannerMultiMessageSheetConfiguration) -> String {
        var count = 0
        for element in configuration.bannerMultiMessages {
            count += element.items.count
        }
        return String(format: NSLocalizedString("Messages (%d)", tableName: "FioriSwiftUICore", bundle: Bundle.accessor, comment: ""), count)
    }
    
    private func attributedMessageTitle(title: String, typeDesc: String, showDetailLink: Bool) -> AttributedString {
        var attributedString = AttributedString(title)
        
        // show detail link to view message detail
        if !showDetailLink {
            return attributedString
        }
        
        let viewDetailStr = String(format: NSLocalizedString("View %@", tableName: "FioriSwiftUICore", bundle: Bundle.accessor, comment: ""), typeDesc)
        var viewDetail = AttributedString(" \(viewDetailStr)")
        viewDetail.foregroundColor = .preferredColor(.tintColor)
        viewDetail.link = URL(string: self.viewDetailOpenUrlStr)
        attributedString.append(viewDetail)
        return attributedString
    }
    
    private func removeItem(_ configuration: BannerMultiMessageSheetConfiguration, category: String, at id: UUID) {
        for i in 0 ..< configuration.bannerMultiMessages.count {
            let element = configuration.bannerMultiMessages[i]
            if element.category == category {
                for index in 0 ..< element.items.count where element.items[index].id == id {
                    configuration.bannerMultiMessages[i].items.remove(at: index)
                    refreshFlag.toggle()
                    break
                }
                
                if configuration.bannerMultiMessages[i].items.isEmpty {
                    self.handleRemoveCategory(configuration, category: category)
                }
                break
            }
        }
        configuration.removeAction?(category, id)
    }
    
    private func removeCategoryAction(_ configuration: BannerMultiMessageSheetConfiguration, category: String) {
        self.handleRemoveCategory(configuration, category: category)
        configuration.removeAction?(category, nil)
    }
    
    private func handleRemoveCategory(_ configuration: BannerMultiMessageSheetConfiguration, category: String) {
        for i in 0 ..< configuration.bannerMultiMessages.count {
            let element = configuration.bannerMultiMessages[i]
            if element.category == category {
                configuration.bannerMultiMessages.remove(at: i)
                self.refreshFlag.toggle()
                break
            }
        }
    }
    
    private func showItemDetail(_ configuration: BannerMultiMessageSheetConfiguration, category: String, at id: UUID) {
        configuration.viewDetailAction?(id)
        self.dismiss(configuration)
    }
    
    private func dismiss(_ configuration: BannerMultiMessageSheetConfiguration) {
        self.timer?.invalidate()
        self.timer = nil
        
        configuration.dismissAction?()
    }
    
    private func bannerMessageStyle(_ messageType: BannerMultiMessageType) -> any BannerMessageStyle {
        switch messageType {
        case .neutral:
            return BannerMessageNeutralStyle()
        case .negative:
            return BannerMessageNegativeStyle()
        case .critical:
            return BannerMessageCriticalStyle()
        case .positive:
            return BannerMessagePositiveStyle()
        case .informative:
            return BannerMessageInformativeStyle()
        }
    }
    
    func defaultIcon(_ messageType: BannerMultiMessageType) -> some View {
        switch messageType {
        case .neutral:
            Image(fioriName: "fiori.hint")
        case .informative:
            Image(fioriName: "fiori.hint")
        case .positive:
            Image(fioriName: "fiori.hint")
        case .critical:
            Image(fioriName: "fiori.warning2")
        case .negative:
            Image(fioriName: "fiori.notification.3")
        }
    }
    
    // swiftlint:disable:next function_body_length
    public func makeBody(_ configuration: BannerMultiMessageSheetConfiguration) -> some View {
        VStack(spacing: 0, content: {
            HStack {
                if !configuration.title.isEmpty {
                    configuration.title
                } else {
                    Text(self.messageCountStr(configuration))
                        .foregroundStyle(Color.preferredColor(.primaryLabel))
                        .font(.fiori(forTextStyle: .headline, weight: .bold))
                }
                
                if self.isPhone {
                    Spacer()
                    
                    if !configuration.closeAction.isEmpty {
                        configuration.closeAction
                    } else {
                        FioriButton(isSelectionPersistent: false, action: { _ in
                            self.dismiss(configuration)
                        }, image: { _ in
                            Image(fioriName: "fiori.error")
                        })
                        .fioriButtonStyle(FioriTertiaryButtonStyle(colorStyle: .normal))
                    }
                }
            }
            .padding(.leading, self.isPhone ? 16 : 0)
            .padding(.top, 27)
            .padding(.bottom, 16)
            .sizeReader { size in
                self.messageCountHeight = size.height
            }
            
            self.dimensionSelector
                .sizeReader { size in
                    self.dimensionSelectorHeight = size.height
                }
            
            List {
                ForEach(self.filteredBannerMultiMessages(configuration), id: \.id) { element in
                    Section {
                        if configuration.turnOnSectionHeader {
                            HStack {
                                Text("\(element.category) (\(element.items.count))")
                                    .font(.fiori(forTextStyle: .subheadline))
                                    .foregroundStyle(Color.preferredColor(.secondaryLabel))
                                Spacer()
                                
                                Button {
                                    self.removeCategoryAction(configuration, category: element.category)
                                } label: {
                                    Text(_ClearActionDefault().actionText ?? "")
                                }
                                .buttonStyle(PlainButtonStyle())
                                .font(.fiori(forTextStyle: .subheadline))
                                .foregroundStyle(Color.preferredColor(.tintColor))
                            }
                            .padding(EdgeInsets(top: 8, leading: 16, bottom: 8, trailing: 16))
                        }
                        
                        ForEach(element.items, id: \.id) { message in
                            
                            if !configuration.messageItemView(message.id).isEmpty {
                                AnyView(configuration.messageItemView(message.id))
                            } else {
                                BannerMessage(icon: {
                                    (message.icon ?? self.defaultIcon(message.messageType)).typeErased
                                }, title: {
                                    Text(self.attributedMessageTitle(title: message.title, typeDesc: message.typeDesc, showDetailLink: message.showDetailLink))
                                        .environment(\.openURL, OpenURLAction(handler: { url in
                                            if url.absoluteString == self.viewDetailOpenUrlStr {
                                                self.showItemDetail(configuration, category: element.category, at: message.id)
                                            }
                                            return .handled
                                        }))
                                }, closeAction: {
                                    if message.showCloseAction {
                                        FioriButton { state in
                                            if state == .normal {
                                                self.removeItem(configuration, category: element.category, at: message.id)
                                            }
                                        } label: { _ in
                                            Image(fioriName: "fiori.decline")
                                        }
                                    } else {
                                        EmptyView()
                                    }
                                }, topDivider: {
                                    EmptyView()
                                }, bannerTapAction: nil, alignment: .leading, hideSeparator: true, messageType: message.messageType)
                                    .bannerMessageStyle(self.bannerMessageStyle(message.messageType))
                                    .typeErased
                                    .swipeActions(edge: .trailing, allowsFullSwipe: true) {
                                        Button(role: .destructive) {
                                            self.removeItem(configuration, category: element.category, at: message.id)
                                        } label: {
                                            Image(fioriName: "fiori.delete")
                                        }
                                    }
                            }
                        }
                        
                    } footer: {
                        if configuration.turnOnSectionHeader {
                            Rectangle().fill(Color.preferredColor(.primaryGroupedBackground))
                                .frame(height: 30)
                        }
                    }
                    .listSectionSeparator(configuration.turnOnSectionHeader ? .hidden : .visible, edges: .bottom)
                    .listRowInsets(EdgeInsets())
                    .alignmentGuide(.listRowSeparatorLeading, computeValue: { _ in
                        0
                    })
                }
            }
            .background(Color.preferredColor(.primaryGroupedBackground))
            .listStyle(.plain)
            .environment(\.defaultMinListRowHeight, 0)
            .environment(\.defaultMinListHeaderHeight, 0)
            .modifier(FioriIntrospectModifier<UICollectionView> { collectionView in
                DispatchQueue.main.async {
                    if collectionView.contentSize.height != self.scrollContentHeight, !self.isPhone {
                        self.scrollContentHeight = collectionView.contentSize.height
                    }
                }
            })
            
            // workaround for forcing list refresh when second layer array modified in bannerMultiMessage.
            Text("\(self.refreshFlag ? "true" : "false")")
                .frame(height: 0.01)
                .opacity(0)
        })
        .background(Color.preferredColor(.chrome))
        .onDisappear(perform: {
            self.timer?.invalidate()
            self.timer = nil
        })
        .frame(minWidth: !self.isPhone ? 393 : nil)
        .frame(height: self.popoverHeight)
        .animation(self.scrollContentHeight <= 40.0 ? nil : .spring, value: self.scrollContentHeight)
        .setOnChange(of: configuration.bannerMultiMessages) {
            // when datasource is empty, dismiss in 2 seconds
            if configuration.bannerMultiMessages.isEmpty {
                self.timer = Timer.scheduledTimer(withTimeInterval: 2, repeats: false, block: { _ in
                    self.dismiss(configuration)
                })
            }
            self.resetDimensionSelector(configuration)
        }
        .onAppear {
            self.resetDimensionSelector(configuration)
            self.dimensionSelector.selectionDidChangePublisher
                .sink(receiveValue: { index in
                    self.categorySelect.categorySelectedIndex = index ?? 0
                })
                .store(in: &self.cancellableSet)
        }
    }
}

// Default fiori styles
extension BannerMultiMessageSheetFioriStyle {
    struct ContentFioriStyle: BannerMultiMessageSheetStyle {
        func makeBody(_ configuration: BannerMultiMessageSheetConfiguration) -> some View {
            BannerMultiMessageSheet(configuration)
            // Add default style for its content
            // .background()
        }
    }

    struct TitleFioriStyle: TitleStyle {
        let bannerMultiMessageSheetConfiguration: BannerMultiMessageSheetConfiguration

        func makeBody(_ configuration: TitleConfiguration) -> some View {
            Title(configuration)
            // Add default style for Title
            // .foregroundStyle(Color.preferredColor(<#fiori color#>))
            // .font(.fiori(forTextStyle: <#fiori font#>))
        }
    }

    struct CloseActionFioriStyle: CloseActionStyle {
        let bannerMultiMessageSheetConfiguration: BannerMultiMessageSheetConfiguration

        func makeBody(_ configuration: CloseActionConfiguration) -> some View {
            CloseAction(configuration)
            // Add default style for CloseAction
            // .foregroundStyle(Color.preferredColor(<#fiori color#>))
            // .font(.fiori(forTextStyle: <#fiori font#>))
        }
    }
}
