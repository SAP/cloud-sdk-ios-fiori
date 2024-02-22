import Combine
import SwiftUI

struct KPIHeaderContent<List: IndexedViewContainer>: View {
    typealias V = List.V
    let list: List
    var maxNumberOfItems = 4
    
    @ObservedObject private var context = KPIHeaderContext<V>()
    var count: Int {
        self.list.count
    }
    
    var body: some View {
        Group {
            if self.context.isViewOrganized {
                tabView
            } else {
                calculateLayoutView
            }
        }
    }
    
    func view(at index: Int) -> V {
        self.list.view(at: index)
    }
}

extension KPIHeaderContent {
    var tabView: some View {
        TabView {
            ForEach(0 ..< self.context.organizedItems.count, id: \.self) { index in
                let pageItems = self.context.organizedItems[index]
                if pageItems.count == 1 {
                    pageItems[0]
                } else {
                    HStack(spacing: self.minItemSpacing) {
                        ForEach(0 ..< pageItems.count, id: \.self) { index in
                            pageItems[index]
                        }
                    }
                }
            }
        }
        .tabViewStyle(PageTabViewStyle())
        .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
        .frame(minHeight: self.context.itemsMaxHeight)
        .onReceive(self.resizePublisher) { _ in
            self.context.reset()
        }
    }
    
    var calculateLayoutView: some View {
        VStack {
            ForEach(0 ..< min(self.count, self.maxNumberOfItems), id: \.self) { index in
                TabView {
                    HStack(spacing: 0) {
                        self.view(at: index)
                    }
                    .sizeReader { size in
                        self.updateContext(index: index, size: size)
                    }
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
            }
        }
        .sizeReader { size in
            self.context.containerSize = size
            self.reLayoutView()
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
        guard self.context.itemsSize.count == min(self.count, self.maxNumberOfItems), self.context.containerSize.width > 0 else { return }
        self.context.organizedItems = self.organizeItems()
        self.context.isViewOrganized = true
    }
    
    private func organizeItems() -> [[V]] {
        var organizedItems: [[V]] = []
        let pageWidth = self.context.containerSize.width
        var itemsTotalWidth: CGFloat = 0
        var pageItems: [V] = []
        
        for index in 0 ..< self.context.itemsSize.count {
            guard let itemSize = context.itemsSize[index] else { break }
            self.context.itemsMaxHeight = itemSize.height > self.context.itemsMaxHeight ? itemSize.height : self.context.itemsMaxHeight
            let itemWidth = itemSize.width
            if itemWidth + itemsTotalWidth > pageWidth {
                itemsTotalWidth = 0
                if pageItems.isEmpty {
                    organizedItems.append([self.view(at: index)])
                } else {
                    organizedItems.append(pageItems)
                    pageItems.removeAll()
                    pageItems.append(self.view(at: index))
                    itemsTotalWidth += (itemWidth + self.minItemSpacing)
                }
            } else {
                pageItems.append(self.view(at: index))
                itemsTotalWidth += (itemWidth + self.minItemSpacing)
            }
        }
        if !pageItems.isEmpty {
            organizedItems.append(pageItems)
        }
        return organizedItems
    }
    
    private var resizePublisher: AnyPublisher<Void, Never> {
        let orientationPublisher = NotificationCenter.default.publisher(for: UIDevice.orientationDidChangeNotification)
            .compactMap { _ in () }
        let sizeCategoryPublisher = NotificationCenter.default.publisher(for: UIContentSizeCategory.didChangeNotification)
            .compactMap { _ in () }
        return Publishers.Merge(orientationPublisher, sizeCategoryPublisher)
            .eraseToAnyPublisher()
    }
    
    private var minItemSpacing: CGFloat {
        8
    }
}

private class KPIHeaderContext<V: View>: ObservableObject {
    var containerSize: CGSize = .zero
    var itemsSize: [Int: CGSize] = [:]
    var organizedItems: [[V]] = []
    var itemsMaxHeight: CGFloat = 0
    
    @Published var isViewOrganized: Bool = false
    
    func reset() {
        self.containerSize = .zero
        self.itemsSize.removeAll()
        self.organizedItems.removeAll()
        self.isViewOrganized = false
    }
}
