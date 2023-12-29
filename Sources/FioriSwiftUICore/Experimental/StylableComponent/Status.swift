import FioriMacro
import Foundation
import SwiftUI

@BaseComponent
public struct Status: _StatusComponent {
    @ViewBuilder
    let status: any View
    private let _status = ["dataType": "TextOrIcon?", "viewType": "TextOrIconView"]
}
