import Foundation
import SourceryRuntime

public extension Variable {
    var swiftUITypeNameBacked: String {
        if let backingSwiftUIComponent = backingSwiftUIComponent {
            return backingSwiftUIComponent
        }

        return self.swiftUITypeName
    }

    var swiftUITypeName: String {
        if let backingSwiftUIComponent = backingSwiftUIComponent {
            return backingSwiftUIComponent
        }

        switch self.typeName.unwrappedTypeName {
        case "String", "[String]", "NSAttributedString":
            return "Text"
        case "Image":
            return "Image"
        default:
            return "Never"
        }
    }

    var conditionalAssignment: String {
        if isOptional || annotations["bindingPropertyOptional"] != nil {
            return "\(self.trimmedName) != nil ? ViewBuilder.buildEither(first: \(self.toSwiftUI)) : ViewBuilder.buildEither(second: EmptyView())"
        } else {
            return self.toSwiftUI
        }
    }

    var backingSwiftUIComponent: String? {
        self.definedInType?.resolvedAnnotations("backingComponent").first ?? resolvedAnnotations("backingComponent").first
    }

    var toSwiftUI: String {
        if self.backingSwiftUIComponent != nil {
            return "\(self.swiftUITypeName)(\(self.trimmedName): \(self.trimmedName))"
        }
        switch self.typeName.unwrappedTypeName {
        case "String":
            return isOptional ? "Text(\(self.trimmedName)!)" : "Text(\(self.trimmedName))"
        case "[String]":
            return "Text(\(self.trimmedName).joined(separator: \", \"))"
        case "Image":
            return isOptional ? "\(self.trimmedName)!" : self.trimmedName
        default:
            return "\(self.swiftUITypeName)(\(self.trimmedName): \(self.trimmedName))"
        }
    }

    var emptyDefault: String {
        if isOptional || annotations["bindingPropertyOptional"] != nil {
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
            @ViewBuilder var \(self.trimmedName): some View {
                    if isModelInit {
                        _\(self.trimmedName).modifier(\(self.trimmedName)Modifier.concat(Fiori.\(type.componentName).\(self.trimmedName)).concat(Fiori.\(type.componentName).\(self.trimmedName)Cumulative))
                    } else {
                        _\(self.trimmedName).modifier(\(self.trimmedName)Modifier.concat(Fiori.\(type.componentName).\(self.trimmedName)))
                    }
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

public extension Variable {
    var isRepresentableByView: Bool {
        !annotations.keys.contains("no_view")
    }

    var viewBuilderDecl: String {
        if let cfb = self.resolvedAnnotations("customFunctionBuilder").first {
            return "@\(cfb) \(self.trimmedName): @escaping () -> \(self.trimmedName.capitalizingFirst())"
        } else {
            return "@ViewBuilder \(self.trimmedName): @escaping () -> \(self.trimmedName.capitalizingFirst())"
        }
    }

    var propDecl: String {
        "\(self.trimmedName): \(self.typeName)"
    }
    
    var computedInternalTypeName: String {
        if annotations["bindingProperty"] != nil {
            return "Binding<\(self.typeName.name)>"
        } else if annotations["bindingPropertyOptional"] != nil {
            return "Binding<\(self.typeName.name)>?"
        } else {
            return self.typeName.name
        }
    }
}
