import SwiftUI

/**
 Flow Layout
 */
public struct FlowLayout: Layout {
    public struct CacheData {
        var width: CGFloat
        var rows: [[CGRect]]
        var rowsHeight: [CGFloat]
        
        mutating func clear() {
            self.width = 0
            self.rows.removeAll()
            self.rowsHeight.removeAll()
        }
    }
    
    /// Horizontal spacing between views
    let spacing: CGFloat
    
    /// Vertical spacing between views
    let lineSpacing: CGFloat
    
    /// Vertical alignment in each row
    let alignment: VerticalAlignment
    
    /// The maximum number of lines that FlowLayout can have
    let lineLimit: Int?
    
    /// Init
    /// - Parameters:
    ///   - spacing: Horizontal spacing between views
    ///   - lineSpacing: Vertical spacing between views
    ///   - alignment: Vertical alignment in each row
    ///   - lineLimit: The maximum number of lines that FlowLayout can have
    public init(spacing: CGFloat = 8, lineSpacing: CGFloat = 8, alignment: VerticalAlignment = .center, lineLimit: Int? = nil) {
        self.spacing = spacing
        self.lineSpacing = lineSpacing
        self.alignment = alignment
        self.lineLimit = lineLimit
    }
    
    /// Returns the size of the composite view, given a proposed size and the view’s subviews.
    public func sizeThatFits(proposal: ProposedViewSize, subviews: Subviews, cache: inout CacheData) -> CGSize {
        guard let containerWidth = proposal.width else {
            return .zero
        }
        self.calculateLayout(for: subviews, containerWidth: containerWidth, cache: &cache)
        let height = CGFloat(cache.rowsHeight.count - 1) * self.lineSpacing + cache.rowsHeight.reduce(0) { $0 + $1 }
        return CGSize(width: containerWidth, height: height)
    }
    
    /// Assigns positions to each of the layout’s subviews.
    public func placeSubviews(in bounds: CGRect, proposal: ProposedViewSize, subviews: Subviews, cache: inout CacheData) {
        guard let containerWidth = proposal.width else {
            return
        }
        self.calculateLayout(for: subviews, containerWidth: containerWidth, cache: &cache)
        
        var i = 0
        for (rowIndex, row) in cache.rows.enumerated() {
            for rect in row {
                let yOffset: CGFloat
                switch self.alignment {
                case .bottom:
                    yOffset = cache.rowsHeight[rowIndex] - rect.size.height
                case .center:
                    yOffset = (cache.rowsHeight[rowIndex] - rect.size.height) / 2
                default:
                    yOffset = 0
                }
                
                let adjustedOffset = CGPoint(x: rect.origin.x + bounds.minX, y: rect.origin.y + bounds.minY + yOffset)
                subviews[i].place(at: adjustedOffset, proposal: ProposedViewSize(width: rect.size.width, height: rect.size.height))
                i += 1
            }
        }
    }
    
    /// Creates and initializes a cache for a layout instance.
    public func makeCache(subviews: Subviews) -> CacheData {
        CacheData(width: 0, rows: [], rowsHeight: [])
    }
    
    func calculateLayout(for subviews: Subviews, containerWidth: CGFloat, cache: inout CacheData) {
        guard cache.width != containerWidth, !subviews.isEmpty, containerWidth > 0 else {
            return
        }
        cache.clear()
        
        cache.width = containerWidth
        var point = CGPoint.zero
        var rowHeight = CGFloat.zero
        var rowIndex = -1
        let sizes = subviews.map { $0.sizeThatFits(ProposedViewSize(width: containerWidth, height: nil)) }
        
        for size in sizes {
            // start a new row
            if point.x + size.width > containerWidth || cache.rows.isEmpty, rowIndex + 1 < self.lineLimit ?? Int.max {
                point.x = 0
                if !cache.rows.isEmpty {
                    // Add previous rowHeight
                    cache.rowsHeight.append(rowHeight)
                    point.y += (self.lineSpacing + rowHeight)
                }
                
                cache.rows.append([])
                rowHeight = 0
                rowIndex += 1
            }
            cache.rows[rowIndex].append(CGRect(origin: point, size: size))
            rowHeight = max(rowHeight, size.height)
            point.x += (self.spacing + size.width)
        }
        cache.rowsHeight.append(rowHeight)
    }
}

let topLayout = FlowLayout(alignment: .top)
let centerLayout = FlowLayout(alignment: .center)
let bottomLayout = FlowLayout(spacing: 32, lineSpacing: 16, alignment: .bottom)
let spacingLayout = FlowLayout(spacing: 0, lineSpacing: 0, alignment: .top)
let threeLimitLayout = FlowLayout(spacing: 4, lineSpacing: 2, alignment: .top, lineLimit: 3)
let testFlowLayouts = [TestLayout(AnyLayout(topLayout), "Top"),
                       TestLayout(AnyLayout(centerLayout), "Center"),
                       TestLayout(AnyLayout(bottomLayout), "Bottom"),
                       TestLayout(AnyLayout(spacingLayout), "Spacing"),
                       TestLayout(AnyLayout(threeLimitLayout), "3 lines limit")]

struct FlowLayoutPreview: PreviewProvider {
    static var previews: some View {
        ForEach(testFlowLayouts) { layout in
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
                LabelItem(title: "10. Critical")
                LabelItem(icon: Image(systemName: "checkmark.circle"), title: "11. Positive", alignment: .trailing)
                HStack(spacing: 2) {
                    Text("12.").font(.body)
                    Image(systemName: "star.fill")
                    Image(systemName: "star.fill")
                    Image(systemName: "star")
                    Image(systemName: "star")
                    Image(systemName: "star")
                }.border(Color.gray)
            }
            .padding()
            .border(Color.green)
            .previewDisplayName(layout.name)
            .environment(\.layoutDirection, .rightToLeft)
        }
    }
}
