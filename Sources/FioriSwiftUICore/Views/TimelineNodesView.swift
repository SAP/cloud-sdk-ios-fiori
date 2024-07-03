import SwiftUI

/// display timeline node image
public struct TimelineNodesView: View {
    var content: TimelineNodeType?

    /// init with node image
    public init(_ content: TimelineNodeType?) {
        self.content = content
    }
    
    @ViewBuilder
    public var body: some View {
        if self.content != nil {
            switch self.content! {
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

/// Timeline node status
public enum TimelineNodeStatus: String {
    case beforeStart
    case start
    case open
    case inProgress
    case complete
    case beforeEnd
    case end
}

/// Timeline node types
public enum TimelineNodeType {
    case predefine(TimelineNodeStatus)
    case custom(Image)
}
