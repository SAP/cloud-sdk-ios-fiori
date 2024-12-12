// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import FioriThemeManager
import Foundation
import SwiftUI

public protocol Row3Style: DynamicProperty {
    associatedtype Body: View

    func makeBody(_ configuration: Row3Configuration) -> Body
}

struct AnyRow3Style: Row3Style {
    let content: (Row3Configuration) -> any View

    init(@ViewBuilder _ content: @escaping (Row3Configuration) -> any View) {
        self.content = content
    }

    public func makeBody(_ configuration: Row3Configuration) -> some View {
        self.content(configuration).typeErased
    }
}

public struct Row3Configuration {
    public let row3Identifier = "FioriRow3_row3"

    public let row3: Row3

    public typealias Row3 = ConfigurationViewWrapper
}
