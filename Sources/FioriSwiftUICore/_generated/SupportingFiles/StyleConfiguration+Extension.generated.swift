// Generated using Sourcery 2.1.3 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

// This file provides APIs for easy component construction which can be used when implementing the base layout.

// MARK: CardConfiguration

extension CardConfiguration {
    var _cardHeader: CardHeader {
        CardHeader(.init(mediaImage: .init(self.mediaImage), description: .init(self.description), title: .init(self.title), subtitle: .init(self.subtitle), detailImage: .init(self.detailImage), counter: .init(self.counter), row1: .init(self.row1), row2: .init(self.row2), row3: .init(self.row3)))
    }

    var _cardFooter: CardFooter {
        CardFooter(.init(newAction: .init(self.newAction), secondaryAction: .init(self.secondaryAction)))
    }
}

// MARK: CardHeaderConfiguration

extension CardHeaderConfiguration {
    var _cardMedia: CardMedia {
        CardMedia(.init(mediaImage: .init(self.mediaImage), description: .init(self.description)))
    }

    var _cardMainHeader: CardMainHeader {
        CardMainHeader(.init(title: .init(self.title), subtitle: .init(self.subtitle), detailImage: .init(self.detailImage), counter: .init(self.counter)))
    }

    var _cardExtHeader: CardExtHeader {
        CardExtHeader(.init(row1: .init(self.row1), row2: .init(self.row2), row3: .init(self.row3)))
    }
}

// MARK: DemoViewConfiguration

extension DemoViewConfiguration {
    var _switch: Switch {
        Switch(.init(isOn: self.$isOn))
    }
}
