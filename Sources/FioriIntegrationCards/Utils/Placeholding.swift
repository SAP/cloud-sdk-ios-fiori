import Foundation

public protocol Placeholding {
    func replacingPlaceholders(withValuesIn object: Any) -> Self
}
