import SwiftUI

extension TagStack: TagViewList {
    public var count: Int {
        var tags: [String] = []

        if let tmpTags = _tags {
            tags = tmpTags
        }
        
        return tags.count
    }
    
    /// the View at Index in the TagViewList
    public func view(at index: Int) -> some View {
        var tags: [String] = []

        if let tmpTags = _tags {
            tags = tmpTags
        }
        
        return Tag(tags[index])
    }
}
