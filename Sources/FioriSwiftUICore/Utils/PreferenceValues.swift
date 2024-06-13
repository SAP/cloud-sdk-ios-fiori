import Foundation
import SwiftUI

// Propogate item count value to the super view.
// Used by `_CountableView`.
public struct ItemCountPreferenceKey: PreferenceKey {
    public static var defaultValue = 0
    
    public static func reduce(value: inout Int, nextValue: () -> Int) {
        value = nextValue()
    }
}
