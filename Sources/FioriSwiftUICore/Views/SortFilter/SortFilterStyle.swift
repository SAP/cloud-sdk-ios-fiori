import FioriThemeManager
import SwiftUI

public final class SortFilterStyle {
    public static var instance = SortFilterStyle(iconForCheckedItem: Image(fioriName: "fiori.accept"))
    
    let iconForCheckedItem: Image?
    let iconForMenuItem: Image
    let foregroundColorForSelectedItem: Color
    let backgroundColorForSelectedColor: Color
    let foregroundColorForUnselectedItem: Color
    let backgroundColorForUnselectedColor: Color

    public static var shared: SortFilterStyle {
        instance
    }
    
    public init(iconForCheckedItem: Image? = nil, iconForMenuItem: Image? = nil, foregroundColorForSelectedItem: Color? = nil, backgroundColorForSelectedColor: Color? = nil, foregroundColorForUnselectedItem: Color? = nil, backgroundColorForUnselectedColor: Color? = nil) {
        self.iconForCheckedItem = iconForCheckedItem
        self.iconForMenuItem = iconForMenuItem ?? Image(fioriName: "fiori.navigation.down.arrow")!
        self.foregroundColorForSelectedItem = foregroundColorForSelectedItem ?? .preferredColor(.tintColor)
        self.backgroundColorForSelectedColor = backgroundColorForSelectedColor ?? .preferredColor(.primaryBackground)
        self.foregroundColorForUnselectedItem = foregroundColorForUnselectedItem ?? .preferredColor(.separator)
        self.backgroundColorForUnselectedColor = foregroundColorForUnselectedItem ?? .preferredColor(.tertiaryFill)
    }
}
