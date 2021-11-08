import Foundation

internal protocol ColorStyleCompatibilityProvider {
    var uuid: UUID { get }
    var obsoletedColorDefinitions: [ColorStyle: ColorStyle] { get }
    func compatibleStyle(from style: ColorStyle) -> ColorStyle?
}
