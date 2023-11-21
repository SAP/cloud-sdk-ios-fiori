import Foundation
import SwiftUI

// TODO: macro
public protocol TitleStyle: DynamicProperty {
    associatedtype Body: View
    func makeBody(_ configuration: NewTitleConfiguration) -> Body
}

// TODO: macro
public struct NewTitleConfiguration {
    let title: Title
    
    public struct Title: View {
        /// Check if this type-erased view is empty.
        ///
        /// There are two situations that will cause the view to become empty.
        ///
        /// 1. Pass `EmptyView` to view-builder arguments in the init.
        /// 2. Pass `nil` value to the data arguments in the init.
        public let isEmpty: Bool
        var title: any View
        
        init(_ title: some View) {
            self.isEmpty = title.isEmpty
            self.title = title
        }
        
        public var body: some View {
            title.typeErased
        }
    }
}

// MARK: Style implementations

// TODO: macro
// Layout style
public struct NewTitleBaseStyle: TitleStyle {
    public func makeBody(_ configuration: NewTitleConfiguration) -> some View {
        configuration.title
    }
}

// For SDK developer to implement default fiori styles
public struct NewTitleFioriStyle: TitleStyle {
    public func makeBody(_ configuration: NewTitleConfiguration) -> some View {
        TitleView(configuration)
            .foregroundStyle(.red)
            .font(.title)
    }
}

public struct AnyNewTitleStyle: TitleStyle {
    let content: (NewTitleConfiguration) -> any View
    
    init(@ViewBuilder _ content: @escaping (NewTitleConfiguration) -> any View) {
        self.content = content
    }
    
    public func makeBody(_ configuration: NewTitleConfiguration) -> some View {
        self.content(configuration).typeErased
    }
}

// MARK: Style extensions

extension TitleStyle where Self == NewTitleBaseStyle {
    static var base: NewTitleBaseStyle {
        NewTitleBaseStyle()
    }
}

extension TitleStyle where Self == NewTitleFioriStyle {
    static var fiori: some TitleStyle {
        NewTitleFioriStyle()
    }
}
