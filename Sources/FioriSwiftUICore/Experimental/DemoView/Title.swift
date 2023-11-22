import FioriMacro
import Foundation
import SwiftUI

/// Title component
@BaseComponent
public struct Title<_Title: View>: _TitleComponent {
    @ViewBuilder
    let title: _Title
    private let _title = (dataType: "AttributedString", viewType: "Text")
}
