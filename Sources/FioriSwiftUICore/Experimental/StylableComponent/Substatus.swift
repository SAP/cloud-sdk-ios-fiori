import FioriMacro
import Foundation
import SwiftUI

@BaseComponent
public struct Substatus: _SubstatusComponent {
    @ViewBuilder
    let substatus: any View
    private let _substatus = ["dataType": "TextOrIcon?", "viewType": "TextOrIconView"]
}
