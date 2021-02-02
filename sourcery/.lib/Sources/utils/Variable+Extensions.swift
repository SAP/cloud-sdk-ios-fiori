import Foundation
import SourceryRuntime

public extension Variable {
    var swiftUITypeName: String {
        switch self.typeName.unwrappedTypeName {
        case "String", "[String]":
            return "Text"
        case "Image":
            return "Image"
        case "[ActivityItem]":
            return "ActivityItems" // used for extension where condition _ConditionalContent<ActivityItem, EmptyView>
        default:
            return "Never"
        }
    }

    var conditionalAssignment: String {
        if isOptional {
            return "\(self.trimmedName) != nil ? ViewBuilder.buildEither(first: \(self.toSwiftUI)) : ViewBuilder.buildEither(second: EmptyView())"
        } else {
            return self.toSwiftUI
        }
    }

    var toSwiftUI: String {
        switch self.typeName.unwrappedTypeName {
        case "String":
            return isOptional ? "Text(\(self.trimmedName)!)" : "Text(\(self.trimmedName))"
        case "[String]":
            return "Text(\(self.trimmedName).joined(separator: \", \"))"
        case "Image":
            return isOptional ? "\(self.trimmedName)!" : self.trimmedName
        case "[ActivityItem]":
            return isOptional ? "ActivityItems(items: \(self.trimmedName)!)" : self.trimmedName
        default:
            return "\(self.swiftUITypeName)(\(self.trimmedName))"
        }
    }

    var emptyDefault: String {
        if isOptional {
            return " = nil"
        } else if typeName.isArray {
            return " = []"
        } else {
            return ""
        }
    }

    var trimmedName: String {
        name.replacingOccurrences(of: "_", with: "")
    }
}

public extension Variable {
    func resolvedViewModifierChain(type: Type) -> String {
        if annotations.keys.contains("no_style") == false {
            return """
            var \(self.trimmedName): some View {
                    _\(self.trimmedName).modifier(\(self.trimmedName)Modifier.concat(Fiori.\(type.componentName).\(self.trimmedName)))
                }
            """
        } else {
            return """
            var \(self.trimmedName): some View {
                    _\(self.trimmedName)
                }
            """
        }
    }
}
