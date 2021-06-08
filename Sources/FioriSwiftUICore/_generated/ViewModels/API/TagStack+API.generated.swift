// Generated using Sourcery 1.3.4 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import SwiftUI

public struct TagStack {
    

    var _tags: [String]? = nil
	
    public init(model: TagStackModel) {
        self.init(tags: model.tags_)
    }

    public init(tags: [String]? = nil) {
        self._tags = tags
    }
}
