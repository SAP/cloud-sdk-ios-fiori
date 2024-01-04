import FioriMacro
import Foundation
import SwiftUI

extension TagStack {
    init(_ tags: [String]) {
        self.init(tags: tags)
    }
}

@BaseComponent
public struct Tags: _TagsComponent {
    @ViewBuilder
    let tags: any View
    private let _tags = ["dataType": "[String]", "viewType": "TagStack"]
}
