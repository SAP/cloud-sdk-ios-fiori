import Combine
import SwiftUI

class KPIHeaderContentContext: ObservableObject {
    @Published var isViewSizeCalculated: Bool = false
    @Published var organizedItemsIndexes: [[Int]] = []
    var itemsSize: [Int: CGSize] = [:]
    var containerSize: CGSize = .zero
    var itemsMaxHeight: CGFloat = 0
    
    func reset() {
        self.itemsMaxHeight = 0
        self.organizedItemsIndexes.removeAll()
        self.itemsSize.removeAll()
        self.isViewSizeCalculated = false
        self.containerSize = .zero
    }
}

struct KPIContainerStack: View {
    var items: [KPIHeaderItemModel]
    @State private var currentPage: Int = 0
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    @Environment(\.isItemOrderForced) var isItemOrderForced: Bool
    @Environment(\.interItemSpacing) var interItemSpacing: CGFloat?
    @ObservedObject var context = KPIHeaderContentContext()
    @State private var reArrangedItems: [KPIHeaderItemModel] = []

    /// :nodoc:
    init(_ items: [KPIHeaderItemModel]) {
        self.items = items
    }
    
    var body: some View {
        Group {
            if self.context.isViewSizeCalculated {
                self.headerContentTabViewGenerator()
            } else {
                self.calculateLayoutView()
            }
        }
        .onAppear {
            self.context.reset()
            self.reArrangedItems = self.reArrangeItems(isItemOrderForced: self.isItemOrderForced)
        }
    }
    
    /// Rearrange the items, maximum count of items is 4.
    /// - Parameter isItemOrderForced: A Boolean value that determines whether the order of items in `KPIHeader` is forced or not.
    /// - Returns: An array of ReArranged items.
    func reArrangeItems(isItemOrderForced: Bool) -> [any KPIHeaderItemModel] {
        let filteredItems = self.items.filter { item in
            if item is KPIProgressItem {
                let pgrsItem: KPIProgressItem = item as! KPIProgressItem
                return pgrsItem.chartSize != .small
            }
            return true
        }

        var _reArrangedItems = Array(filteredItems.prefix(4))
        if !isItemOrderForced {
            var index = 0
            for i in 0 ..< _reArrangedItems.count {
                if _reArrangedItems[i] is KPIProgressItem {
                    if i != index {
                        _reArrangedItems.swapAt(i, index)
                    }
                    index += 1
                }
            }
        }
        return _reArrangedItems
    }
    
    @ViewBuilder
    private func view(at index: Int) -> some View {
        if let item: KPIItem = self.reArrangedItems[index] as? KPIItem {
            item.typeErased
        } else if let item: KPIProgressItem = self.reArrangedItems[index] as? KPIProgressItem {
            item.typeErased
        } else if let item: any View = self.reArrangedItems[index] as? any View {
            item.typeErased
        } else {
            EmptyView()
        }
    }
    
    @ViewBuilder
    private func headerContentTabViewGenerator() -> some View {
        TabView(selection: self.$currentPage, content: {
            ForEach(0 ..< min(self.context.organizedItemsIndexes.count, 4), id: \.self) { index in
                let pageItems: [Int] = self.context.organizedItemsIndexes[index]
                if pageItems.count == 1 {
                    self.view(at: pageItems[0])
                        .frame(width: self.widthOfHStackInOnePage(itemsIndex: pageItems), alignment: .center)
                } else {
                    HStack(spacing: self.interItemSpacing ?? (self.horizontalSizeClass == .compact ? 40 : 48)) {
                        ForEach(0 ..< pageItems.count, id: \.self) { index in
                            self.view(at: pageItems[index])
                                .frame(width: self.context.itemsSize[index]?.width)
                        }
                    }
                    .frame(width: self.widthOfHStackInOnePage(itemsIndex: pageItems), alignment: .center)
                }
            }
        })
        .padding([.leading, .trailing], self.horizontalSizeClass == .compact ? 16 : 32)
        .padding([.top, .bottom], 24)
        .tabViewStyle(.page(indexDisplayMode: .never))
        .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .never))
        .frame(minHeight: 24 + self.context.itemsMaxHeight + 24)
        .onReceive(self.resizePublisher) { _ in
            self.context.reset()
        }
        
        if self.context.organizedItemsIndexes.count > 1 {
            PageIndicator(numberOfPages: self.context.organizedItemsIndexes.count, currentPage: self.$currentPage)
                .padding(.top, 4)
                .padding(.bottom, 8)
        }
    }
    
    private func widthOfHStackInOnePage(itemsIndex: [Int]) -> CGFloat {
        var totalWidth: CGFloat = 0.0
        for i in 0 ..< itemsIndex.count {
            totalWidth += self.context.itemsSize[itemsIndex[i]]?.width ?? 0.0
            if i != itemsIndex.count - 1 {
                totalWidth += CGFloat(self.interItemSpacing ?? (self.horizontalSizeClass == .compact ? 40 : 48))
            }
        }
        return totalWidth
    }
    
    private var resizePublisher: AnyPublisher<Void, Never> {
        #if os(visionOS)
            let sizeCategoryPublisher = NotificationCenter.default.publisher(for: UIContentSizeCategory.didChangeNotification)
                .compactMap { _ in () }
            return sizeCategoryPublisher.eraseToAnyPublisher()
        #else
            let orientationPublisher = NotificationCenter.default.publisher(for: UIDevice.orientationDidChangeNotification)
                .compactMap { _ in () }
            let sizeCategoryPublisher = NotificationCenter.default.publisher(for: UIContentSizeCategory.didChangeNotification)
                .compactMap { _ in () }
            return Publishers.Merge(orientationPublisher, sizeCategoryPublisher)
                .eraseToAnyPublisher()
        #endif
    }
    
    @ViewBuilder
    private func calculateLayoutView() -> some View {
        VStack {
            ForEach(0 ..< min(self.reArrangedItems.count, 4), id: \.self) { index in
                TabView {
                    HStack(spacing: 0) {
                        self.view(at: index)
                            .fixedSize()
                    }
                    .sizeReader { size in
                        if let oldSize = self.context.itemsSize[index], oldSize == size {
                        } else {
                            self.context.itemsSize[index] = size
                        }
                        self.reLayoutView(interItemSpacing: CGFloat(self.interItemSpacing ?? (self.horizontalSizeClass == .compact ? 40 : 48)))
                    }
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
            }
        }
        .sizeReader { size in
            self.context.containerSize = size
            self.reLayoutView(interItemSpacing: CGFloat(self.interItemSpacing ?? (self.horizontalSizeClass == .compact ? 40 : 48)))
        }
    }
    
    private func reLayoutView(interItemSpacing: CGFloat) {
        guard self.context.itemsSize.count == min(self.reArrangedItems.count, 4), self.context.containerSize.width > 0 else { return }
        
        self.organizeItems(interItemSpacing: interItemSpacing)
        self.context.isViewSizeCalculated = true
    }
    
    func organizeItems(interItemSpacing: CGFloat) {
        let horizontalPadding = self.horizontalSizeClass == .compact ? 16.0 : 32.0
        let pageWidth = self.context.containerSize.width - (horizontalPadding * 2)
        var itemsTotalWidth: CGFloat = 0
        
        var organizedItemsIndexes: [[Int]] = []
        var pageItems: [Int] = []
        for index in 0 ..< self.context.itemsSize.count {
            guard let itemSize = self.context.itemsSize[index] else { break }
            self.context.itemsMaxHeight = itemSize.height > self.context.itemsMaxHeight ? itemSize.height : self.context.itemsMaxHeight
            let itemWidth = itemSize.width
            if itemWidth + itemsTotalWidth > pageWidth {
                itemsTotalWidth = 0
                if pageItems.isEmpty {
                    organizedItemsIndexes.append([index])
                } else {
                    organizedItemsIndexes.append(pageItems)
                    pageItems.removeAll()
                    pageItems.append(index)
                    itemsTotalWidth += (itemWidth + interItemSpacing)
                }
            } else {
                pageItems.append(index)
                itemsTotalWidth += (itemWidth + interItemSpacing)
            }
        }
        if !pageItems.isEmpty {
            organizedItemsIndexes.append(pageItems)
        }
        
        if self.context.organizedItemsIndexes != organizedItemsIndexes {
            self.context.organizedItemsIndexes = organizedItemsIndexes
        }
    }
}

/// The key for whether the order of items in `KPIHeader` is forced or not in the environment.
struct KPIHeaderIsItemOrderForcedKey: EnvironmentKey {
    static var defaultValue: Bool = false
}

/// The key for the inter item spacing of items in `KPIHeader` in the environment.
struct KPIHeaderInterItemSpacingKey: EnvironmentKey {
    static var defaultValue: CGFloat? = nil
}

public extension EnvironmentValues {
    var isItemOrderForced: Bool {
        get {
            self[KPIHeaderIsItemOrderForcedKey.self]
        }
        set {
            self[KPIHeaderIsItemOrderForcedKey.self] = newValue
        }
    }
    
    var interItemSpacing: CGFloat? {
        get {
            self[KPIHeaderInterItemSpacingKey.self]
        }
        set {
            self[KPIHeaderInterItemSpacingKey.self] = newValue
        }
    }
}

public extension View {
    /// Set whether the order of items in `KPIHeader` is forced or not.
    /// - Parameter isItemOrderForced: A Boolean value that determines whether the order of items in `KPIHeader` is forced or not.
    /// - Returns: A view that controls whether the order of items in `KPIHeader` is forced or not.
    func isItemOrderForced(_ isItemOrderForced: Bool) -> some View {
        environment(\.isItemOrderForced, isItemOrderForced)
    }
    
    /// Set inter item spacing of items in `KPIHeader`.
    /// - Parameter interItemSpacing: A specified value for inter itemSpacing of items in `KPIHeader`.
    /// - Returns: A view that controls inter item spacing of items in `KPIHeader`.
    func interItemSpacing(_ interItemSpacing: CGFloat?) -> some View {
        environment(\.interItemSpacing, interItemSpacing)
    }
}
