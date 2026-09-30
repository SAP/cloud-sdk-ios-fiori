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
            Image(fioriName: "fiori.tag")
        case .start, .end:
            Image(fioriName: "fiori.rhombus.milestone.2")
        case .open:
            Image(fioriName: "fiori.circle.task")
        case .inProgress:
            Image(systemName: "ellipsis.circle.fill")
        case .complete:
            Image(fioriName: "fiori.sys.enter.2")
        case .add:
            Image(fioriName: "fiori.add")
        case .delete:
            Image(fioriName: "fiori.delete.fill")
        }
    }
}

/// The status of a timeline node
public enum TimelineNodeType: Sendable {
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
    /// timeline event add
    case add
    /// timeline event delete
    case delete
}
