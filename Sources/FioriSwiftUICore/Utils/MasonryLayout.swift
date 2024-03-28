import SwiftUI

/**
 Masonry Layout
 */
public struct MasonryLayout: Layout {
    public struct CacheData {
        var width: CGFloat
        var columns: [[(Int, CGRect)]]
        
        mutating func clear() {
            self.width = 0
            self.columns.removeAll()
        }
    }
    
    public enum ViewOrder: Int, CaseIterable {
        /// The placement of the views is top-most then left-most then
        case topMost
        
        /// The placement of the views is left-most then top-most
        case leftMost
    }
    
    /// Number of columns
    let numberOfColumns: Int
    
    /// Horizontal spacing between views
    let spacing: CGFloat
    
    /// Vertical spacing between views
    let lineSpacing: CGFloat
    
    /// Horizontal alignment in each column
    let alignment: HorizontalAlignment
    
    /// View order
    let viewOrder: ViewOrder
    
    /// Init
    /// - Parameters:
    ///   - numOfColumns: Number of columns. The default is 1.
    ///   - viewOrder: View order. The default is `.topMost`.
    ///   - spacing: Horizontal spacing between views. The default is 8.
    ///   - lineSpacing: Vertical spacing between views. The default is 8.
    ///   - alignment: Horizontal alignment in each column. The default is `.center`.
    public init(numOfColumns: Int = 1, viewOrder: ViewOrder = .topMost, spacing: CGFloat = 8, lineSpacing: CGFloat = 8, alignment: HorizontalAlignment = .center) {
        self.numberOfColumns = max(1, numOfColumns)
        self.viewOrder = viewOrder
        self.spacing = spacing
        self.lineSpacing = lineSpacing
        self.alignment = alignment
    }
    
    /// Returns the size of the composite view, given a proposed size and the view’s subviews.
    public func sizeThatFits(proposal: ProposedViewSize, subviews: Subviews, cache: inout CacheData) -> CGSize {
        guard let containerWidth = proposal.width else {
            return .zero
        }
        
        self.calculateLayout(for: subviews, containerWidth: containerWidth, cache: &cache)
        let height: CGFloat = cache.columns.compactMap { column in
            if let last = column.last {
                return last.1.origin.y + last.1.size.height
            }
            return nil
        }.reduce(0) { max($0, $1) }
        
        return CGSize(width: containerWidth, height: height)
    }

    /// Assigns positions to each of the layout’s subviews.
    public func placeSubviews(in bounds: CGRect, proposal: ProposedViewSize, subviews: Subviews, cache: inout CacheData) {
        guard let containerWidth = proposal.width else {
            return
        }
        self.calculateLayout(for: subviews, containerWidth: containerWidth, cache: &cache)
        
        for column in cache.columns {
            for item in column {
                let pt = CGPoint(x: item.1.origin.x + bounds.origin.x, y: item.1.origin.y + bounds.origin.y)
                subviews[item.0].place(at: pt, proposal: ProposedViewSize(width: item.1.size.width, height: nil))
            }
        }
    }

    /// Creates and initializes a cache for a layout instance.
    public func makeCache(subviews: Subviews) -> CacheData {
        CacheData(width: 0, columns: [])
    }

    func calculateLayout(for subviews: Subviews, containerWidth: CGFloat, cache: inout CacheData) {
        guard cache.width != containerWidth, !subviews.isEmpty, containerWidth > 0 else {
            return
        }
        cache.clear()
        cache.width = containerWidth
        cache.columns = Array(repeating: [], count: self.numberOfColumns)
        
        let itemWidth: CGFloat = (containerWidth - CGFloat(self.numberOfColumns - 1) * self.spacing) / CGFloat(self.numberOfColumns)
        var columnIndex = -1
        let sizes = subviews.map {
            $0.sizeThatFits(ProposedViewSize(width: itemWidth, height: nil))
        }.map {
            if $0.width > itemWidth {
                return CGSize(width: itemWidth, height: $0.width)
            }
            return $0
        }
        
        for (i, size) in sizes.enumerated() {
            columnIndex = self.nextColumn(cache.columns)
            var x: CGFloat = 0
            switch self.alignment {
            case .center:
                x = CGFloat(columnIndex) * (itemWidth + self.spacing) + (itemWidth - size.width) / 2
            case .trailing:
                x = CGFloat(columnIndex) * (itemWidth + self.spacing) + itemWidth - size.width
            default:
                x = CGFloat(columnIndex) * (itemWidth + self.spacing)
            }
            var pt = CGPoint(x: x, y: 0)
            if let item = cache.columns[columnIndex].last {
                pt = CGPoint(x: x, y: item.1.maxY + self.lineSpacing)
            }
            cache.columns[columnIndex].append((i, CGRect(origin: pt, size: size)))
        }
    }
    
    func nextColumn(_ columns: [[(Int, CGRect)]]) -> Int {
        for (i, column) in columns.enumerated() {
            if column.isEmpty {
                return i
            }
        }
        
        if self.viewOrder == .topMost {
            var index = 0
            var maxHeight: CGFloat = .greatestFiniteMagnitude
            for (i, column) in columns.enumerated() {
                if let last = column.last, last.1.maxY < maxHeight {
                    index = i
                    maxHeight = last.1.maxY
                }
            }
            
            return index
        } else { // .leftMost
            for i in 0 ..< self.numberOfColumns {
                if i < self.numberOfColumns - 1, columns[i].count > columns[i + 1].count {
                    return i + 1
                }
            }
            
            return 0
        }
    }
}

struct TestLayout: Identifiable {
    let layout: AnyLayout
    let name: String
    let id = UUID()
    
    init(_ layout: AnyLayout, _ name: String? = nil) {
        self.layout = layout
        self.name = name ?? "Tab"
    }
}

let topLeadingLayout = MasonryLayout(numOfColumns: 2, alignment: .leading)
let topCenterLayout = MasonryLayout(numOfColumns: 2, alignment: .center)
let topTrailingLayout = MasonryLayout(numOfColumns: 2, alignment: .trailing)
let leftLeadingLayout = MasonryLayout(numOfColumns: 2, viewOrder: .leftMost, alignment: .leading)
let leftCenterLayout = MasonryLayout(numOfColumns: 2, viewOrder: .leftMost, alignment: .center)
let leftTrailingLayout = MasonryLayout(numOfColumns: 2, viewOrder: .leftMost, alignment: .trailing)
let oneColumn = MasonryLayout(numOfColumns: 1, viewOrder: .topMost, spacing: 4, lineSpacing: 16, alignment: .center)
let threeColumn = MasonryLayout(numOfColumns: 3, viewOrder: .topMost, spacing: 4, lineSpacing: 4, alignment: .leading)
let fiveColumn = MasonryLayout(numOfColumns: 5, viewOrder: .topMost, spacing: 4, lineSpacing: 4, alignment: .leading)
let sevenColumn = MasonryLayout(numOfColumns: 7, viewOrder: .topMost, spacing: 4, lineSpacing: 4, alignment: .leading)

let testLayouts = [TestLayout(AnyLayout(topLeadingLayout), "TL"),
                   TestLayout(AnyLayout(topCenterLayout), "TC"),
                   TestLayout(AnyLayout(topTrailingLayout), "TT"),
                   TestLayout(AnyLayout(leftLeadingLayout), "LL"),
                   TestLayout(AnyLayout(leftCenterLayout), "LC"),
                   TestLayout(AnyLayout(leftTrailingLayout), "LT"),
                   TestLayout(AnyLayout(oneColumn), "1C"),
                   TestLayout(AnyLayout(threeColumn), "3C"),
                   TestLayout(AnyLayout(fiveColumn), "5C"),
                   TestLayout(AnyLayout(sevenColumn), "7C")]

struct MasonryPreview: PreviewProvider {
    static var previews: some View {
        ForEach(testLayouts) { layout in
            layout.layout {
                Text("1. hello")
                    .font(Font.fiori(forTextStyle: .title1))
                    .border(Color.gray)
                Text("2. world").border(Color.gray)
                FioriButton(title: "3. Button")
                Text("4. Pretty long long long long ong long long title wraps two lines").padding().border(Color.gray)
                FioriButton(title: "5. Save").fioriButtonStyle(FioriSecondaryButtonStyle())
                Tag("6. Tag")
                KPIItem(data: .components([.unit("7. $"), .metric("90")]), subtitle: "avg. per night").border(Color.gray)
                LabelItem(icon: Image(systemName: "calendar"), title: "8. 1 Oct 2023 - 31 Oct 2023", alignment: .leading).border(Color.gray)
                LabelItem(icon: Image(systemName: "exclamationmark.triangle.fill"), title: "9. Negative")
                    .titleStyle { config in
                        config.title.foregroundStyle(Color.preferredColor(.negativeLabel))
                    }.border(Color.gray)
                LabelItem(title: "10. Critical")
                    .titleStyle { config in
                        config.title.foregroundStyle(Color.preferredColor(.criticalLabel))
                    }.border(Color.gray)
                LabelItem(icon: Image(systemName: "checkmark.circle"), title: "11. Positive", alignment: .trailing)
                    .titleStyle { config in
                        config.title.foregroundStyle(Color.preferredColor(.positiveLabel))
                    }.border(Color.gray)
                
                HStack(spacing: 2) {
                    Text("12.").font(.body)
                    Image(systemName: "star.fill")
                    Image(systemName: "star.fill")
                    Image(systemName: "star")
                    Image(systemName: "star")
                    Image(systemName: "star")
                }
                .border(Color.gray)
            }
            .border(Color.green)
            .previewDisplayName(layout.name)
        }
    }
}
