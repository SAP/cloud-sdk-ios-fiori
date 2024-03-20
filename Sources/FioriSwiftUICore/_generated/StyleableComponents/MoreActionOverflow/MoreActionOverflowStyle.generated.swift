// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

public protocol MoreActionOverflowStyle: DynamicProperty {
    associatedtype Body: View

    func makeBody(_ configuration: MoreActionOverflowConfiguration) -> Body
}
    
struct AnyMoreActionOverflowStyle: MoreActionOverflowStyle {
    let content: (MoreActionOverflowConfiguration) -> any View

    init(@ViewBuilder _ content: @escaping (MoreActionOverflowConfiguration) -> any View) {
        self.content = content
    }

    public func makeBody(_ configuration: MoreActionOverflowConfiguration) -> some View {
        self.content(configuration).typeErased
    }
}
    
public struct MoreActionOverflowConfiguration {
    public let moreActionOverflow: MoreActionOverflow

    public typealias MoreActionOverflow = ConfigurationViewWrapper
}
