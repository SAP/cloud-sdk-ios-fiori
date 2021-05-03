import SwiftUI

public extension View {
    /// Returns a type-erased version of the view.
    var typeErased: AnyView { AnyView(self) }
}
