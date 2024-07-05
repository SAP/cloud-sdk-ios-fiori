import SwiftUI

/// 'TImelineNodeView' displays an image representing a timeline node.
public struct TimelineNodeView: View {
    /// The type of timeline node content to display
    public var nodeType: TimelineNodeType

    /// init with node image
    public init(_ nodeType: TimelineNodeType) {
        self.nodeType = nodeType
    }
    
    @ViewBuilder
    public var body: some View {
        switch self.nodeType {
        case .beforeStart(let image):
            image ?? Image(systemName: "diamond")
        case .start(let image):
            image ?? Image(systemName: "diamond.fill")
        case .open(let image):
            image ?? Image(systemName: "circle")
        case .inProgress(let image):
            image ?? Image(systemName: "ellipsis.circle.fill")
        case .complete(let image):
            image ?? Image(systemName: "checkmark.circle.fill")
        case .beforeEnd(let image):
            image ?? Image(systemName: "diamond")
        case .end(let image):
            image ?? Image(systemName: "diamond.fill")
        }
    }
}

/// The status of a timeline node
public enum TimelineNodeType {
    /// timeline event before start
    case beforeStart(Image? = nil)
    /// timeline event start
    case start(Image? = nil)
    /// timeline event open
    case open(Image? = nil)
    /// timeline event in progress
    case inProgress(Image? = nil)
    /// timeline event complete
    case complete(Image? = nil)
    /// timeline event before end
    case beforeEnd(Image? = nil)
    /// timeline event end
    case end(Image? = nil)
}
