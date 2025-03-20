import Foundation
import SwiftUI

/// It is either a String or Image
public enum TextOrIcon {
    // Contains a text only
    case text(AttributedString)
    // Contains an icon only
    case icon(Image)
    // Contains both a text and an icon
    case both(AttributedString, Image)
}
