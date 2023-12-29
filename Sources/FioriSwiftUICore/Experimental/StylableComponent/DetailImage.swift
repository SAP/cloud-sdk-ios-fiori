import FioriMacro
import Foundation
import SwiftUI

@BaseComponent
public struct DetailImage: _DetailImageComponent {
    @ViewBuilder
    let detailImage: any View
    private let _detailImage = ["dataType": "Image?"]
}
