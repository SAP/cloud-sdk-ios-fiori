import Foundation
import SwiftUI

public struct ConfigurationViewWrapper: View {
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
