import Foundation

internal protocol ColorStyleCompatibilityProvider {
    var uuid: UUID { get }
    func newColorStyle(for obsoletedStyle: ColorStyle) -> ColorStyle?
}
