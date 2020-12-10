import Foundation
import SwiftUI

extension ContentSizeCategory {
    static var orderedSizes: [ContentSizeCategory] {
        [.extraSmall,
         .small,
         .medium,
         .large,
         .extraLarge,
         .extraExtraLarge,
         .extraExtraExtraLarge,
         .accessibilityMedium,
         .accessibilityLarge,
         .accessibilityExtraLarge,
         .accessibilityExtraExtraLarge,
         .accessibilityExtraExtraExtraLarge]
    }

    static func < (lhs: ContentSizeCategory, rhs: ContentSizeCategory) -> Bool {
        var sizes = self.orderedSizes
        while sizes.contains(lhs) {
            sizes.removeFirst()
        }
        return sizes.contains(rhs)
    }

    static func > (lhs: ContentSizeCategory, rhs: ContentSizeCategory) -> Bool {
        var sizes = self.orderedSizes
        while sizes.contains(lhs) {
            sizes.removeLast()
        }
        return sizes.contains(rhs)
    }

    static func <= (lhs: ContentSizeCategory, rhs: ContentSizeCategory) -> Bool {
        guard lhs != rhs else { return true }

        return lhs < rhs
    }

    static func >= (lhs: ContentSizeCategory, rhs: ContentSizeCategory) -> Bool {
        guard lhs != rhs else { return true }

        return lhs > rhs
    }
}
