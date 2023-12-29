import FioriMacro
import Foundation
import SwiftUI

/// ActionTitle component
@BaseComponent
public struct ActionTitle: _ActionTitleComponent {
    @ViewBuilder
    let actionTitle: any View
    private let _actionTitle = ["dataType": "AttributedString?", "viewType": "OptionalText"]
}
