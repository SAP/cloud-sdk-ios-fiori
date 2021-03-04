import Foundation

extension Array where Element == Any {
    /**
     Variadic parameters are converted to an array while inside a function. Forwarding this array to another function which accepts variadic parameters will result in a nested array
     Use this function to remove nesting arrays and remove nil values
     ```
     var anyArray: [Any] = [[["Hello", nil]]
     var result = anyArray.flatCompactMapForVariadicParameters() // result is ["Hello"]
     ```
     */
    func flatCompactMapForVariadicParameters() -> [Any] {
        var filtered: [Any] = []
        for el in self {
            if let array = el as? [Any] {
                return array.flatCompactMapForVariadicParameters()
            }
        }
        for case let optionalAny in self {
            if Optional.isNil(optionalAny) == false {
                filtered.append(optionalAny)
            }
        }
        return filtered
    }
}
