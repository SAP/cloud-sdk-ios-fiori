import Foundation
import SwiftUI

class TableUtility {
    static func xPos(_ pos: CGFloat, layoutDirection: LayoutDirection, width: CGFloat) -> CGFloat {
        if layoutDirection == .rightToLeft {
            return width - pos
        } else {
            return pos
        }
    }
}
