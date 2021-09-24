// Generated using Sourcery 1.1.1 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import SwiftUI

public struct TagStack {
    @Environment(\.tagsModifier) private var tagsModifier

    var _tags: [String]? = nil
	
    public init(model: TagStackModel) {
        self.init(tags: model.tags)
    }

    public init(tags: [String]? = nil) {
        self._tags = tags
    }
}
