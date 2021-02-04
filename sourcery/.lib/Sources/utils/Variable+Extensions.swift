import Foundation
import SourceryRuntime

public extension Variable {
    var swiftUITypeName: String {
        if let backingSwiftUIComponent = backingSwiftUIComponent {
            return backingSwiftUIComponent
        }

        switch self.typeName.unwrappedTypeName {
        case "String", "[String]":
            return "Text"
        case "Image":
            return "Image"
        default:
            return "Never"
        }
    }

    var conditionalAssignment: String {
        if isOptional {
            return "\(self.backingSwiftUIComponentArgumentLabel ?? self.trimmedName) != nil ? ViewBuilder.buildEither(first: \(self.toSwiftUI)) : ViewBuilder.buildEither(second: EmptyView())"
        } else {
            return self.toSwiftUI
        }
    }

    var backingSwiftUIComponent: String? {
        resolvedAnnotations("backingComponent").first
    }

    var backingSwiftUIComponentArgumentLabel: String? {
        resolvedAnnotations("backingComponentArgumentLabel").first
    }

    var toSwiftUI: String {
        if let backingSwiftUIComponentLabel = backingSwiftUIComponentArgumentLabel {
            return isOptional ? "\(backingSwiftUIComponentLabel)!" : backingSwiftUIComponentLabel
        }

        switch self.typeName.unwrappedTypeName {
        case "String":
            return isOptional ? "Text(\(self.trimmedName)!)" : "Text(\(self.trimmedName))"
        case "[String]":
            return "Text(\(self.trimmedName).joined(separator: \", \"))"
        case "Image":
            return isOptional ? "\(self.trimmedName)!" : self.trimmedName
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

    func resolvedAnnotations(_ name: String) -> [String] {
        if let string = self.annotations[name] as? String {
            return [string]
        } else if let array = self.annotations[name] as? [String] {
            return array
        } else {
            return []
        }
    }
}
