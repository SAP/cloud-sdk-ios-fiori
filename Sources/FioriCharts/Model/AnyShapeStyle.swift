import SwiftUI

/// A type-erased ShapeStyle
public struct AnyShapeStyle {
    /// store the solid ShapeStyle
    public let base: Any
    
    /// Create an instance that type-erases ShapeStyle
    public init(_ base: some ShapeStyle) {
        self.base = base
    }
}
