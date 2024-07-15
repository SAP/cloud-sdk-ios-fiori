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
        case .beforeStart, .beforeEnd:
            Image(systemName: "diamond")
        case .start, .end:
            Image(systemName: "diamond.fill")
        case .open:
            Image(systemName: "circle")
        case .inProgress:
            Image(systemName: "ellipsis.circle.fill")
        case .complete:
            Image(systemName: "checkmark.circle.fill")
        }
    }
}

/// The status of a timeline node
public enum TimelineNodeType {
    /// timeline event before start
    case beforeStart
    /// timeline event start
    case start
    /// timeline event open
    case open
    /// timeline event in progress
    case inProgress
    /// timeline event complete
    case complete
    /// timeline event before end
    case beforeEnd
    /// timeline event end
    case end
}
