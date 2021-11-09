import Foundation

internal protocol ColorStyleCompatibilityProvider {
    var uuid: UUID { get }
    var compatibleColorDefinitions: [ColorStyle: ColorStyle] { get }
    func compatibleStyle(from style: ColorStyle) -> ColorStyle?
}
