import FioriMacro
import Foundation
import SwiftUI

@BaseComponent
public struct Description: _DescriptionComponent {
    @ViewBuilder
    let description: any View
    private let _description = (dataType: "AttributedString?", viewType: "OptionalText")
}
