import FioriMacro
import Foundation
import SwiftUI

/// ActionTitle component
@BaseComponent
public struct ActionTitle<_ActionTitle: View>: _ActionTitleComponent {
    @ViewBuilder
    let actionTitle: _ActionTitle
    private let _actionTitle = (dataType: "AttributedString", viewType: "Text")
}
