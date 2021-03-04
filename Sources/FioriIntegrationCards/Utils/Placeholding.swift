import Foundation

public protocol Placeholding {
    /// being able to replace placeholders (single or curly braces) for which the values are stored in variadic parameters (arrays or dictionaries)
    func replacingPlaceholders(withValuesIn objects: Any...) -> Self
}
