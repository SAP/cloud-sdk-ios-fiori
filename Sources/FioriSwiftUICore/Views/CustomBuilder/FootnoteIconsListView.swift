import SwiftUI

struct FootnoteIconsListView<T: FootnoteIconList>: View {
    let icons: T
    
    var count: Int {
        self.icons.count
    }
    
    var maxCount: Int {
        self.icons.maxCount
    }

    var size: CGSize {
        self.icons.size
    }

    var isCircular: Bool {
        self.icons.isCircular
    }

    var spacing: CGFloat {
        self.icons.spacing
    }
    
    // This condition check if for handle recursive builder issue.
    func checkIsNestingIcons() -> Bool {
        let typeString = String(describing: T.self)
        return typeString.contains("SingleFootnoteIcon<SingleFootnoteIcon") || typeString.contains("SingleFootnoteIcon<PairFootnoteIcon") || typeString.contains("PairFootnoteIcon<")
    }
    
    var body: some View {
        if self.count == 1, self.checkIsNestingIcons() {
            self.icons.view(at: 0)
        } else {
            self.avatarsView()
        }
    }
    
    @ViewBuilder
    func avatarsView(withText: Bool = false) -> some View {
        FootnoteIconsHStack(spacing: self.spacing) {
            let itemsCount = self.maxCount <= 0 ? self.count : min(self.count, self.maxCount)
            ForEach(0 ..< itemsCount, id: \.self) { index in
                self.icons.view(at: index)
                    .frame(width: self.size.width, height: self.size.height)
                    .ifApply(self.isCircular) {
                        $0.clipShape(Capsule())
                    }
                    .overlay {
                        Group {
                            if self.isCircular {
                                Capsule()
                                    .inset(by: 0.33 / 2.0)
                                    .stroke(Color.preferredColor(.separator), lineWidth: 0.33)
                            } else {
                                Rectangle()
                                    .inset(by: 0.33 / 2.0)
                                    .stroke(Color.preferredColor(.separator), lineWidth: 0.33)
                            }
                        }
                    }
            }
        }
    }
}

struct FootnoteIconsHStack: Layout {
    struct CacheData {
        var width: CGFloat
        var count: Int
        var size: CGSize
    }
    
    let spacing: CGFloat
    
    func makeCache(subviews: Subviews) -> CacheData {
        CacheData(width: 0, count: 0, size: .zero)
    }

    func sizeThatFits(proposal: ProposedViewSize, subviews: Subviews, cache: inout CacheData) -> CGSize {
        self.calculateSizeAndCount(proposal: proposal, subviews: subviews, cache: &cache)
        return cache.size
    }
    
    func calculateSizeAndCount(proposal: ProposedViewSize, subviews: Subviews, cache: inout CacheData) {
        guard let contentWidth = proposal.width, cache.width != contentWidth else {
            return
        }
        cache.width = contentWidth
        
        var totalWidth: CGFloat = 0
        var maxHeight: CGFloat = 0
        
        for (index, subview) in subviews.enumerated() {
            let subviewSize = subview.sizeThatFits(proposal)
            maxHeight = max(maxHeight, subviewSize.height)
            let gap = index > 0 ? self.spacing : 0
            if totalWidth + subviewSize.width + gap <= contentWidth {
                totalWidth += (subviewSize.width + gap)
            } else {
                cache.count = index
                cache.size = CGSize(width: totalWidth, height: maxHeight)
                return
            }
        }
        cache.count = subviews.count
        cache.size = CGSize(width: totalWidth, height: maxHeight)
    }
    
    func placeSubviews(in bounds: CGRect, proposal: ProposedViewSize, subviews: Subviews, cache: inout CacheData) {
        var xOffset: CGFloat = bounds.minX
        self.calculateSizeAndCount(proposal: proposal, subviews: subviews, cache: &cache)
        for (index, subview) in subviews.enumerated() {
            if index < cache.count {
                let subviewSize = subview.sizeThatFits(proposal)
                subview.place(at: CGPoint(x: xOffset, y: bounds.minY),
                              proposal: ProposedViewSize(CGSize(width: subviewSize.width, height: subviewSize.height)))
                xOffset += (subviewSize.width + self.spacing)
            } else {
                let maxOffset = CGFloat.greatestFiniteMagnitude
                let offScreen = CGPoint(x: maxOffset, y: maxOffset)
                subview.place(at: offScreen, proposal: .unspecified)
            }
        }
    }
}
