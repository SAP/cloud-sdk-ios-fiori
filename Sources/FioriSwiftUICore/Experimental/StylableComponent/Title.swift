import FioriMacro
import Foundation
import SwiftUI

/// Title component
@BaseComponent
public struct Title: _TitleComponent {
    @ViewBuilder
    let title: any View
    private let _title = (dataType: "AttributedString", viewType: "Text")
}
