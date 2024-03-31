import SwiftUI

struct EqualWidthWithMaxWidthHStackLayout: Layout {
    /// The distance between adjacent subviews.
    var spacing: CGFloat? = 4
    
    /// Same height for all subviews
    var isSameHeight: Bool = true
    
    /// The vertical alignment of subviews.
    var alignment: VerticalAlignment = .center
    
    /// Maximum width for each element in the container
    var maxWidth: CGFloat? = nil
    
    var horizontalSizeClass: UserInterfaceSizeClass? = .compact
    
    func sizeThatFits(proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) -> CGSize {
        guard !subviews.isEmpty else { return .zero }
        
        let subViewSizes = subviews.map {
            $0.sizeThatFits(.unspecified)
        }
        let width: CGFloat = subViewSizes.reduce(0) { curr, subviewSize in
            curr + subviewSize.width
        }
        let idealWidth = width + CGFloat(subViewSizes.count - 1) * (self.spacing ?? 0)
        let maxHeight: CGFloat = subViewSizes.reduce(0) { curr, subviewSize in
            max(curr, subviewSize.height)
        }

        return CGSize(width: proposal.width ?? idealWidth, height: maxHeight)
    }
    
    func placeSubviews(in bounds: CGRect, proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) {
        guard !subviews.isEmpty else { return }
        
        let subViewSizes = subviews.map {
            $0.sizeThatFits(.unspecified)
        }
        let maxHeight: CGFloat = subViewSizes.reduce(0) { curr, subviewSize in
            max(curr, subviewSize.height)
        }
        let theSpacing: CGFloat = self.spacing ?? 0
        let totalSpacing = theSpacing * CGFloat(subviews.count - 1)
        let width: CGFloat = subViewSizes.reduce(0) { curr, subviewSize in
            curr + subviewSize.width
        }
        let idealWidth = width + totalSpacing
        let containerWidth = proposal.width ?? idealWidth
        
        let theMaxWidth = containerWidth <= 430 ? CGFloat.greatestFiniteMagnitude : self.maxWidth ?? CGFloat.greatestFiniteMagnitude
        let subviewWidth: CGFloat = min(theMaxWidth, (containerWidth - CGFloat(subviews.count - 1) * theSpacing) / CGFloat(subviews.count))
        
        // align trailing
        var x: CGFloat = bounds.minX + subviewWidth / 2 + bounds.size.width - subviewWidth * CGFloat(subviews.count) - totalSpacing
        var y = bounds.midY
        var anchor = UnitPoint.center
        switch self.alignment {
        case .top:
            y = bounds.minY
            anchor = .top
        case .bottom:
            y = bounds.maxY
            anchor = .bottom
        default:
            y = bounds.midY
            anchor = .center
        }
        for i in subviews.indices {
            subviews[i].place(at: CGPointMake(x, y),
                              anchor: anchor,
                              proposal: ProposedViewSize(width: subviewWidth, height: self.isSameHeight ? maxHeight : subViewSizes[i].height))
            x += subviewWidth + theSpacing
        }
    }
}

#Preview("layout top") {
    EqualWidthWithMaxWidthHStackLayout(spacing: 8, alignment: .top) {
        FioriButton(title: "Save")
            .border(Color.green)
        Text("Decline")
            .border(Color.green)
    }.border(Color.gray)
}

#Preview("layout center") {
    EqualWidthWithMaxWidthHStackLayout(spacing: 8, alignment: .center) {
        FioriButton(title: "Save")
            .frame(maxWidth: .infinity)
            .border(Color.green)
        Text("Decline")
            .border(Color.green)
    }.border(Color.gray)
}

#Preview("layout bottom") {
    EqualWidthWithMaxWidthHStackLayout(spacing: 8, alignment: .bottom, maxWidth: 120) {
        FioriButton(title: "Save")
            .frame(maxWidth: .infinity)
            .border(Color.green)

        Text("Decline")
            .frame(maxWidth: .infinity)
            .border(Color.green)
    }.border(Color.gray)
}
