// Generated using Sourcery 2.1.3 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

extension Avatars: _ViewEmptyChecking {
    public var isEmpty: Bool {
        avatars.isEmpty
    }
}

extension Description: _ViewEmptyChecking {
    public var isEmpty: Bool {
        description.isEmpty
    }
}

extension DetailImage: _ViewEmptyChecking {
    public var isEmpty: Bool {
        detailImage.isEmpty
    }
}

extension Footnote: _ViewEmptyChecking {
    public var isEmpty: Bool {
        footnote.isEmpty
    }
}

extension FootnoteIcons: _ViewEmptyChecking {
    public var isEmpty: Bool {
        footnoteIcons.isEmpty
    }
}

extension Icons: _ViewEmptyChecking {
    public var isEmpty: Bool {
        icons.isEmpty
    }
}

extension NewAction: _ViewEmptyChecking {
    public var isEmpty: Bool {
        newAction.isEmpty
    }
}

extension NewObjectItem: _ViewEmptyChecking {
    public var isEmpty: Bool {
        title.isEmpty ||
            subtitle.isEmpty ||
            footnote.isEmpty ||
            description.isEmpty ||
            status.isEmpty ||
            substatus.isEmpty ||
            detailImage.isEmpty ||
            icons.isEmpty ||
            avatars.isEmpty ||
            footnoteIcons.isEmpty ||
            tags.isEmpty ||
            newAction.isEmpty
    }
}

extension Status: _ViewEmptyChecking {
    public var isEmpty: Bool {
        status.isEmpty
    }
}

extension Substatus: _ViewEmptyChecking {
    public var isEmpty: Bool {
        substatus.isEmpty
    }
}

extension Subtitle: _ViewEmptyChecking {
    public var isEmpty: Bool {
        subtitle.isEmpty
    }
}

extension Tags: _ViewEmptyChecking {
    public var isEmpty: Bool {
        tags.isEmpty
    }
}

extension Title: _ViewEmptyChecking {
    public var isEmpty: Bool {
        title.isEmpty
    }
}
