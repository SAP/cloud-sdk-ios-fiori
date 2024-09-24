import Combine
import FioriThemeManager
import SwiftUI

/// Single Banner Message Model
public struct BannerMessageItemModel: Identifiable {
    public var id: UUID
    /// Banner icon
    public var icon: any View
    /// Banner title
    public var title: String
    /// Message Type
    public var messageType: BannerMultiMessageType
    
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
    
    public init(id: UUID = UUID(), icon: any View, title: String, messageType: BannerMultiMessageType) {
        self.id = id
        self.icon = icon
        self.title = title
        self.messageType = messageType
    }
}

public struct BannerMessageListModel: Identifiable, Equatable {
    public static func == (lhs: BannerMessageListModel, rhs: BannerMessageListModel) -> Bool {
        lhs.id == rhs.id
    }
    
    public var id: UUID
    // customized category, like "Errors", "Warnings", "Information", etc
    public let category: String
    public var items: [BannerMessageItemModel]
    
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

class CategorySelect: ObservableObject {
    @Published var categorySelectedIndex = 0
    
    init(categorySelectedIndex: Int = 0) {
        self.categorySelectedIndex = categorySelectedIndex
    }
}

public struct BannerMultiMessageSheet: View {
    // The callback when click the close button.
    private var closeAction: (() -> Void)? = nil
    // Remove item action, First parameter is category, and the secondary is the item's id. When the secondary is nil, the entire category was removed.
    private var removeAction: ((String, UUID?) -> Void)? = nil
    // View the message detail callback, the parameter is message id, developer can use the id to scroll to the relative item
    private var viewDetailAction: ((UUID) -> Void)? = nil
    // Turn on category section header or not
    private var turnOnSectionHeader = true
    
    @Binding private var bannerMultiMessages: [BannerMessageListModel]
    
    @StateObject private var categorySelect = CategorySelect()
    @State private var dimensionSelector: DimensionSelector = {
        let all = NSLocalizedString("All", tableName: "FioriSwiftUICore", bundle: Bundle.accessor, comment: "")
        return DimensionSelector(segmentTitles: [all], selectedIndex: 0)
    }()

    @State private var timer: Timer?
    @State private var cancellableSet: Set<AnyCancellable> = []
    
    /// Public initializer for banner multi-message sheet
    /// - Parameters:
    ///   - closeAction: callback when close button is clicked
    ///   - removeAction: callback when category or single item is removed
    ///   - viewDetailAction: callback when the link button is clicked
    ///   - turnOnSectionHeader: the mark to turn on section header or not
    ///   - bannerMultiMessages: the data source for banner multi-message sheet
    public init(closeAction: (() -> Void)? = nil,
                removeAction: ((String, UUID?) -> Void)? = nil,
                viewDetailAction: ((UUID) -> Void)? = nil,
                turnOnSectionHeader: Bool = true,
                bannerMultiMessages: Binding<[BannerMessageListModel]>)
    {
        self.closeAction = closeAction
        self.removeAction = removeAction
        self.viewDetailAction = viewDetailAction
        self.turnOnSectionHeader = turnOnSectionHeader

        _bannerMultiMessages = bannerMultiMessages
        
        self.resetDimensionSelector()
    }
    
    private var messageItemView: ((UUID) -> any View)? = nil
    
    /// Public initializer for banner multi-message sheet
    /// - Parameters:
    ///   - closeAction: callback when close button is clicked
    ///   - removeAction: callback when category or single item is removed
    ///   - turnOnSectionHeader: the mark to turn on section header or not
    ///   - bannerMultiMessages: the data source for banner multi-message sheet
    ///   - messageItemView: view for each item under the category
    public init(closeAction: (() -> Void)? = nil,
                removeAction: ((String, UUID?) -> Void)? = nil,
                turnOnSectionHeader: Bool = true,
                bannerMultiMessages: Binding<[BannerMessageListModel]>,
                @ViewBuilder messageItemView: @escaping ((UUID) -> any View))
    {
        self.closeAction = closeAction
        self.removeAction = removeAction
        self.turnOnSectionHeader = turnOnSectionHeader
        _bannerMultiMessages = bannerMultiMessages
        self.messageItemView = messageItemView
        
        self.resetDimensionSelector()
    }
    
    private func resetDimensionSelector() {
        var titles: [String] = []
        for element in self.bannerMultiMessages {
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
    private var popoverHeight: CGFloat? {
        let contentHeight = self.messageCountHeight + self.dimensionSelectorHeight + self.scrollContentHeight
        return !self.isPhone ? min(contentHeight, 380.0) : nil
    }
    
    private var isPhone: Bool {
        UIDevice.current.userInterfaceIdiom == .phone
    }
    
    private var filteredBannerMultiMessages: [BannerMessageListModel] {
        let selectedCategory = self.dimensionSelector.titles[self.categorySelect.categorySelectedIndex]
        let filteredBannerMultiMessages = self.bannerMultiMessages.filter { model in
            if self.categorySelect.categorySelectedIndex == 0 {
                return true
            } else {
                return model.category == selectedCategory
            }
        }
        return filteredBannerMultiMessages
    }
    
    private var messageCountStr: String {
        var count = 0
        for element in self.bannerMultiMessages {
            count += element.items.count
        }
        return String(format: NSLocalizedString("Messages (%d)", tableName: "FioriSwiftUICore", bundle: Bundle.accessor, comment: ""), count)
    }
    
    public var body: some View {
        VStack(spacing: 0, content: {
            HStack {
                Text(self.messageCountStr)
                    .foregroundStyle(Color.preferredColor(.primaryLabel))
                    .font(.fiori(forTextStyle: .headline, weight: .bold))
                
                if self.isPhone {
                    Spacer()
                    
                    FioriButton(isSelectionPersistent: false, action: { _ in
                        self.dismiss()
                    }, image: { _ in
                        Image(fioriName: "fiori.error")
                    })
                    .fioriButtonStyle(FioriTertiaryButtonStyle(colorStyle: .normal))
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
                ForEach(self.filteredBannerMultiMessages, id: \.id) { element in
                    Section {
                        if self.turnOnSectionHeader {
                            HStack {
                                Text("\(element.category) (\(element.items.count))")
                                    .font(.fiori(forTextStyle: .subheadline))
                                    .foregroundStyle(Color.preferredColor(.secondaryLabel))
                                Spacer()
                                
                                _Action(actionText: _ClearActionDefault().actionText, didSelectAction: {
                                    self.removeCategoryAction(category: element.category)
                                })
                                .font(.fiori(forTextStyle: .subheadline))
                                .foregroundStyle(Color.preferredColor(.tintColor))
                            }
                            .padding(EdgeInsets(top: 8, leading: 16, bottom: 8, trailing: 16))
                        }
                        
                        ForEach(0 ..< element.items.count, id: \.self) { index in
                            let message = element.items[index]
                            
                            if let item = self.messageItemView {
                                AnyView(item(message.id))
                            } else {
                                BannerMessage(icon: {
                                    message.icon
                                }, title: {
                                    Text(self.attributedMessageTitle(title: message.title, typeDesc: message.typeDesc))
                                }, closeAction: {
                                    FioriButton { state in
                                        if state == .normal {
                                            self.removeItem(category: element.category, at: message.id)
                                        }
                                    } label: { _ in
                                        Image(fioriName: "fiori.decline")
                                    }
                                }, topDivider: {
                                    EmptyView()
                                }, bannerTapAction: {
                                    self.showItemDetail(category: element.category, at: message.id)
                                }, alignment: .leading, hideSeparator: true, messageType: message.messageType)
                                    .swipeActions(edge: .trailing, allowsFullSwipe: true) {
                                        Button(role: .destructive) {
                                            self.removeItem(category: element.category, at: message.id)
                                        } label: {
                                            Image(fioriName: "fiori.delete")
                                        }
                                    }
                            }
                        }
                        
                    } footer: {
                        if self.turnOnSectionHeader {
                            Rectangle().fill(Color.preferredColor(.primaryGroupedBackground))
                                .frame(height: 30)
                        }
                    }
                    .listSectionSeparator(self.turnOnSectionHeader ? .hidden : .visible, edges: .bottom)
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
        })
        .background(Color.preferredColor(.chrome))
        .onDisappear(perform: {
            self.timer?.invalidate()
            self.timer = nil
        })
        .frame(minWidth: !self.isPhone ? 393 : nil)
        .frame(height: self.popoverHeight)
        .animation(self.scrollContentHeight <= 40.0 ? nil : .spring)
//        .animation(.spring, value: self.popoverHeight)
        .onChange(of: self.bannerMultiMessages) { _ in
            // when datasource is empty, dismiss in 2 seconds
            if self.bannerMultiMessages.isEmpty {
                self.timer = Timer.scheduledTimer(withTimeInterval: 2, repeats: false, block: { _ in
                    self.dismiss()
                })
            }
            self.resetDimensionSelector()
        }
        .onAppear {
            self.dimensionSelector.selectionDidChangePublisher
                .sink(receiveValue: { index in
                    self.categorySelect.categorySelectedIndex = index ?? 0
                })
                .store(in: &self.cancellableSet)
        }
    }
    
    private func attributedMessageTitle(title: String, typeDesc: String) -> AttributedString {
        let attributedString = NSMutableAttributedString(string: title)
        
        let viewDetailStr = String(format: NSLocalizedString("View %@", tableName: "FioriSwiftUICore", bundle: Bundle.accessor, comment: ""), typeDesc)
        let viewDetail = NSAttributedString(string: " \(viewDetailStr)", attributes: [.foregroundColor: UIColor(Color.preferredColor(.tintColor))])
        attributedString.append(viewDetail)
        return AttributedString(attributedString)
    }
    
    private func removeItem(category: String, at id: UUID) {
        for i in 0 ..< self.bannerMultiMessages.count {
            var element = self.bannerMultiMessages[i]
            if element.category == category {
                for index in 0 ..< element.items.count where element.items[index].id == id {
                    element.items.remove(at: index)
                    break
                }
                self.bannerMultiMessages.remove(at: i)
                self.bannerMultiMessages.insert(element, at: i)
                
                if element.items.isEmpty {
                    self.handleRemoveCategory(category)
                }
                break
            }
        }
        self.removeAction?(category, id)
    }
    
    private func removeCategoryAction(category: String) {
        self.handleRemoveCategory(category)
        self.removeAction?(category, nil)
    }
    
    private func handleRemoveCategory(_ category: String) {
        for i in 0 ..< self.bannerMultiMessages.count {
            let element = self.bannerMultiMessages[i]
            if element.category == category {
                self.bannerMultiMessages.remove(at: i)
                break
            }
        }
    }
    
    private func showItemDetail(category: String, at id: UUID) {
        self.viewDetailAction?(id)
        self.dismiss()
    }
    
    private func dismiss() {
        self.timer?.invalidate()
        self.timer = nil
        
        self.closeAction?()
    }
}

#Preview {
    BannerMultiMessageSheet(bannerMultiMessages: Binding<[BannerMessageListModel]>.constant([
        BannerMessageListModel(category: "Errors", items: [
            BannerMessageItemModel(icon: Image(fioriName: "fiori.notification.3"), title: "Single-line text for banner.", messageType: .negative)
        ])
    ]))
}
