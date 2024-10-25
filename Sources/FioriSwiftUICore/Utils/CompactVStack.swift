import SwiftUI

// This VStack will ignore subviews which width or height is 0, so no extra space will be added.
struct CompactVStack: Layout {
    var alignment: HorizontalAlignment
    var spacing: CGFloat

    init(alignment: HorizontalAlignment = .center, spacing: CGFloat = 8) {
        self.alignment = alignment
        self.spacing = spacing
    }
    
    func placeSubviews(in bounds: CGRect, proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) {
        guard let containerWidth = proposal.width else { return }
        var currentY: CGFloat = bounds.minY
        for subview in subviews {
            let size = subview.sizeThatFits(ProposedViewSize(width: containerWidth, height: nil))
            let xPosition: CGFloat
            switch self.alignment {
            case .leading:
                xPosition = bounds.minX
            case .trailing:
                xPosition = bounds.maxX - size.width
            default:
                xPosition = bounds.midX - size.width / 2
            }

            subview.place(at: CGPoint(x: xPosition, y: currentY), proposal: ProposedViewSize(width: containerWidth, height: size.height))
            currentY += size.height + self.spacing
        }
    }
    
    func sizeThatFits(proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) -> CGSize {
        guard let containerWidth = proposal.width else { return .zero }
        var totalHeight: CGFloat = 0
        var maxWidth: CGFloat = 0
        
        for subview in subviews {
            let size = subview.sizeThatFits(ProposedViewSize(width: containerWidth, height: nil))
            if size.width > 0, size.height > 0 {
                totalHeight += size.height
                maxWidth = max(maxWidth, size.width)
                totalHeight += self.spacing
            }
        }
        if totalHeight > 0 {
            totalHeight -= self.spacing
        }
        return CGSize(width: maxWidth, height: totalHeight)
    }
}
