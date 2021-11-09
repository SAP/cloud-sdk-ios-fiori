import Foundation

internal protocol ColorStyleCompatibilityProvider {
    /// :nodoc:
    var uuid: UUID { get }
    
    /// Incremental color definitions that contain `future (non-existed)` color styles in the next palette.
    var compatibleColorDefinitions: [ColorStyle: ColorStyle] { get }
    
    /// :nodoc:
    func compatibleStyle(from style: ColorStyle) -> ColorStyle?
}
