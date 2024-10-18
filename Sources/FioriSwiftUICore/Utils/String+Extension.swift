import FioriThemeManager
import Foundation
import SwiftUI

public extension String {
    /// Localized string by `FioriSwiftUICore`
    func localizedFioriString(_ comment: String = "") -> String {
        NSLocalizedString(self, tableName: "FioriSwiftUICore", bundle: Bundle.accessor, comment: comment)
    }
}
