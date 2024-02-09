// Generated using Sourcery 2.1.3 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

public protocol Row2Style: DynamicProperty {
    associatedtype Body: View

    func makeBody(_ configuration: Row2Configuration) -> Body
}
    
struct AnyRow2Style: Row2Style {
    let content: (Row2Configuration) -> any View

    init(@ViewBuilder _ content: @escaping (Row2Configuration) -> any View) {
        self.content = content
    }

    public func makeBody(_ configuration: Row2Configuration) -> some View {
        self.content(configuration).typeErased
    }
}
    
public struct Row2Configuration {
    public let row2: Row2

    public typealias Row2 = ConfigurationViewWrapper
}
