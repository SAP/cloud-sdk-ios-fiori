import SwiftUI

/// A type-erased ShapeStyle
public struct AnyShapeStyle {
    /// store the solid ShapeStyle
    public let base: Any
    
    /// Create an instance that type-erases ShapeStyle
    public init<S>(_ base: S) where S: ShapeStyle {
        self.base = base
    }
}
