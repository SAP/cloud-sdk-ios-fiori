import FioriMacro
import Foundation
import SwiftUI

@BaseComponent
public struct Title<_Title: View>: _TitleComponent {
    @ViewBuilder
    let title: _Title
    private let _title = (dataType: "AttributedString", viewType: "Text")
}
