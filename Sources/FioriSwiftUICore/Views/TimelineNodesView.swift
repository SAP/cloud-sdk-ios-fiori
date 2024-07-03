import SwiftUI

/// 'TImelineNodesView' displays an image representing a timeline node.
public struct TimelineNodesView: View {
    /// The type of timeline node content to display
    public var content: TimelineNodeType?

    /// init with node image
    public init(_ content: TimelineNodeType?) {
        self.content = content
    }
    
    @ViewBuilder
    public var body: some View {
        if let content = self.content {
            switch content {
            case .predefine(let nodeStatus):
                if nodeStatus == TimelineNodeStatus.beforeEnd || nodeStatus == TimelineNodeStatus.beforeStart {
                    Image(systemName: "diamond")
                } else if nodeStatus == TimelineNodeStatus.start || nodeStatus == TimelineNodeStatus.end {
                    Image(systemName: "diamond.fill")
                } else if nodeStatus == TimelineNodeStatus.open {
                    Image(systemName: "circle")
                } else if nodeStatus == TimelineNodeStatus.inProgress {
                    Image(systemName: "ellipsis.circle.fill")
                } else if nodeStatus == TimelineNodeStatus.complete {
                    Image(systemName: "checkmark.circle.fill")
                }
            case .custom(let image):
                image
            }
        }
    }
}

/// The status of a timeline node
public enum TimelineNodeStatus: String {
    /// timeline event before start
    case beforeStart
    /// timeline event start
    case start
    /// timeline event open
    case open
    /// timeline event inprogress
    case inProgress
    /// timeline event complete
    case complete
    /// timeline event before end
    case beforeEnd
    /// timeline event end
    case end
}

/// The type of content to display in a timeline node view
public enum TimelineNodeType {
    /// A predefined image representing a timeline node.
    case predefine(TimelineNodeStatus)
    /// Dev provide a custom image to display for the timeline node
    case custom(Image)
}
