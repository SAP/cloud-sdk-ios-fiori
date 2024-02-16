// Generated using Sourcery 2.1.3 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

extension Action: _ViewEmptyChecking {
    public var isEmpty: Bool {
        action.isEmpty
    }
}

extension Avatars: _ViewEmptyChecking {
    public var isEmpty: Bool {
        avatars.isEmpty
    }
}

extension CardBody: _ViewEmptyChecking {
    public var isEmpty: Bool {
        cardBody.isEmpty
    }
}

extension Card: _ViewEmptyChecking {
    public var isEmpty: Bool {
        mediaImage.isEmpty ||
            description.isEmpty ||
            title.isEmpty ||
            subtitle.isEmpty ||
            detailImage.isEmpty ||
            counter.isEmpty ||
            row1.isEmpty ||
            row2.isEmpty ||
            row3.isEmpty ||
            cardBody.isEmpty ||
            action.isEmpty ||
            secondaryAction.isEmpty
    }
}

extension CardExtHeader: _ViewEmptyChecking {
    public var isEmpty: Bool {
        row1.isEmpty ||
            row2.isEmpty ||
            row3.isEmpty
    }
}

extension CardFooter: _ViewEmptyChecking {
    public var isEmpty: Bool {
        action.isEmpty ||
            secondaryAction.isEmpty
    }
}

extension CardHeader: _ViewEmptyChecking {
    public var isEmpty: Bool {
        mediaImage.isEmpty ||
            description.isEmpty ||
            title.isEmpty ||
            subtitle.isEmpty ||
            detailImage.isEmpty ||
            counter.isEmpty ||
            row1.isEmpty ||
            row2.isEmpty ||
            row3.isEmpty
    }
}

extension CardMainHeader: _ViewEmptyChecking {
    public var isEmpty: Bool {
        title.isEmpty ||
            subtitle.isEmpty ||
            detailImage.isEmpty ||
            counter.isEmpty
    }
}

extension CardMedia: _ViewEmptyChecking {
    public var isEmpty: Bool {
        mediaImage.isEmpty ||
            description.isEmpty
    }
}

extension Counter: _ViewEmptyChecking {
    public var isEmpty: Bool {
        counter.isEmpty
    }
}

extension DemoView: _ViewEmptyChecking {
    public var isEmpty: Bool {
        title.isEmpty ||
            subtitle.isEmpty ||
            status.isEmpty ||
            action.isEmpty
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

extension MediaImage: _ViewEmptyChecking {
    public var isEmpty: Bool {
        mediaImage.isEmpty
    }
}

extension ObjectItem: _ViewEmptyChecking {
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
            action.isEmpty
    }
}

extension Row1: _ViewEmptyChecking {
    public var isEmpty: Bool {
        row1.isEmpty
    }
}

extension Row2: _ViewEmptyChecking {
    public var isEmpty: Bool {
        row2.isEmpty
    }
}

extension Row3: _ViewEmptyChecking {
    public var isEmpty: Bool {
        row3.isEmpty
    }
}

extension SecondaryAction: _ViewEmptyChecking {
    public var isEmpty: Bool {
        secondaryAction.isEmpty
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

extension Switch: _ViewEmptyChecking {
    public var isEmpty: Bool {
        false
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
