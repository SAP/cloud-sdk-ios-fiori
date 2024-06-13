import Foundation
import SwiftUI

public protocol MenuSelectionItemProtocol {
    var icon: Image? { get }
    var title: AttributedString { get }
}

public extension MenuSelectionItem {
    init(model: MenuSelectionItemProtocol, action: (() -> Void)? = nil) {
        self.init(icon: model.icon, title: model.title, action: action)
    }
}
