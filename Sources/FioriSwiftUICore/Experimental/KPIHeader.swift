import Combine
import SwiftUI

public struct KPIHeader: View {
    private let items: [AnyView]
    private let minItemSpacing: CGFloat = 4
    private let maxNumberOfItems = 4
    
    @ObservedObject private var context = KPIHeaderContext()
    
    public init(@ListItemsBuilder items: @escaping () -> [AnyView]) {
        self.items = items()
    }
    
    public var body: some View {
        if context.isViewOrganized {
            TabView {
                ForEach(0 ..< context.organizedItems.count, id: \.self) { index in
                    context.organizedItems[index]
                }
            }
            .tabViewStyle(PageTabViewStyle())
            .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
            .onReceive(resizePublisher) { _ in
                context.reset()
            }
        } else {
            ScrollView {
                VStack {
                    ForEach(0 ..< min(items.count, maxNumberOfItems), id: \.self) { index in
                        TabView {
                            HStack(spacing: 0) {
                                items[index]
                            }
                            .sizeReader { size in
                                updateContext(index: index, size: size)
                            }
                        }
                        .tabViewStyle(PageTabViewStyle())
                    }
                }
            }
            .sizeReader { size in
                context.containerSize = size
                reLayoutView()
            }
        }
    }
    
    private func updateContext(index: Int, size: CGSize) {
        if let oldSize = context.itemsSize[index], oldSize == size {
        } else {
            self.context.itemsSize[index] = size
        }
        self.reLayoutView()
    }
    
    private func reLayoutView() {
        guard self.context.itemsSize.count == min(self.items.count, self.maxNumberOfItems), self.context.containerSize.width > 0 else { return }
        self.context.organizedItems = self.organizeItems()
        self.context.isViewOrganized = true
    }
    
    private func organizeItems() -> [AnyView] {
        var organizedItems: [AnyView] = []
        let pageWidth = self.context.containerSize.width
        var itemsTotalWidth: CGFloat = 0
        var pageItems: [AnyView] = []
        for index in 0 ..< self.context.itemsSize.count {
            guard let itemSize = context.itemsSize[index] else { break }
            let itemWidth = itemSize.width
            if itemWidth + itemsTotalWidth > pageWidth {
                itemsTotalWidth = 0
                if pageItems.count == 0 {
                    organizedItems.append(self.items[index])
                } else if pageItems.count == 1 {
                    organizedItems.append(pageItems[0])
                    pageItems.removeAll()
                    pageItems.append(self.items[index])
                    itemsTotalWidth += (itemWidth + self.minItemSpacing)
                } else {
                    organizedItems.append(self.mergedHorizontalItems(pageItems))
                    pageItems.removeAll()
                    pageItems.append(self.items[index])
                    itemsTotalWidth += (itemWidth + self.minItemSpacing)
                }
            } else {
                pageItems.append(self.items[index])
                itemsTotalWidth += (itemWidth + self.minItemSpacing)
            }
        }
        if pageItems.count == 1 {
            organizedItems.append(pageItems[0])
        } else if pageItems.count > 1 {
            organizedItems.append(self.mergedHorizontalItems(pageItems))
        }
        return organizedItems
    }
    
    private func mergedHorizontalItems(_ items: [AnyView]) -> AnyView {
        HStack(spacing: self.minItemSpacing) {
            ForEach(0 ..< items.count, id: \.self) { index in
                items[index]
            }
        }.typeErased
    }
    
    private var resizePublisher: AnyPublisher<Void, Never> {
        let orientationPublisher = NotificationCenter.default.publisher(for: UIDevice.orientationDidChangeNotification)
            .compactMap { _ in () }
        let sizeCategoryPublisher = NotificationCenter.default.publisher(for: UIContentSizeCategory.didChangeNotification)
            .compactMap { _ in () }
        return Publishers.Merge(orientationPublisher, sizeCategoryPublisher)
            .eraseToAnyPublisher()
    }
}

class KPIHeaderContext: ObservableObject {
    var containerSize: CGSize = .zero
    var itemsSize: [Int: CGSize] = [:]
    var organizedItems: [AnyView] = []
    
    @Published var isViewOrganized: Bool = false
    
    func reset() {
        self.containerSize = .zero
        self.itemsSize.removeAll()
        self.organizedItems.removeAll()
        self.isViewOrganized = false
    }
}
