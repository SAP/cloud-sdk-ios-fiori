import Foundation
import SourceryRuntime

public extension Variable {
    /*
     var swiftUITypeNameBacked: String {
         if let backingSwiftUIComponent = backingSwiftUIComponent {
             return backingSwiftUIComponent
         }

         return self.swiftUITypeName
     }
      */

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
    
    var swiftUIViewTypeName: String {
        if !isRepresentableByView {
            return "Never"
        }
        
        if annotations.defaultValue != nil || !isOptional {
            return self.swiftUITypeName
        }
        
        return "EmptyView"
    }
    
    var swiftUIViewDefaultValue: String {
        if !isRepresentableByView {
            return "Never"
        }
        
        guard let defaultValue = annotations.defaultValue else {
            return "EmptyView()"
        }
        
        if let backingComponent = backingSwiftUIComponent {
            // viewModel property
            if type?.isGeneratedComponent == true {
                return "\(backingComponent)(model: \(defaultValue))"
            }
            // Property with backingComponent in single property component protocol (e.g. IconsComponent)
            else {
                return "\(backingComponent)(\(self.trimmedName): \(defaultValue)"
            }
        }
        
        switch self.swiftUITypeName {
        case "Text":
            return "Text(\(defaultValue))"
        case "Image":
            return "\(defaultValue)"
        default:
            return "\(defaultValue)"
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
        if let backingComponent = annotations.backingComponent {
            return backingComponent
        } else if type?.annotations.isGeneratedComponentNotConfigurable == true {
            return type?.componentName
        } else {
            return nil
        }
    }

    var toSwiftUI: String {
        if let backingComponent = self.backingSwiftUIComponent {
            return type?.isGeneratedComponent == true ?
                // For viewModel property (e.g. ActionModel)
                self.nameForceUnwrapIfNeeded.trim() :
                // For property with backingComponent annotation in single property component (e.g. IconsComponent)
                "\(backingComponent)(\(self.trimmedName): \(self.nameForceUnwrapIfNeeded.trim()))"
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
        if type?.isGeneratedComponent == true, self.backingSwiftUIComponent != nil, annotations.defaultValue != nil {
            return " = \(self.swiftUIViewDefaultValue)"
        } else if let defaultValue = annotations.defaultValue {
            return " = \(defaultValue)"
        } else if (isOptional && annotations["bindingProperty"] == nil) || annotations["bindingPropertyOptional"] != nil {
            return " = nil"
        } else if typeName.isArray, !isConvertedToBinding {
            return " = []"
        } else {
            return ""
        }
    }

    var trimmedName: String {
        name.replacingOccurrences(of: "_", with: "")
    }
    
    var nameForceUnwrapIfNeeded: String {
        isOptional ? "\(name)!" : name
    }
    
    var genericParameterName: String {
        if let genericParameterName = annotations.genericParameterName {
            return genericParameterName
        } else {
            return self.trimmedName.capitalizingFirst()
        }
    }
    
    var genericParameterType: String {
        if let genericParameterType = annotations.genericParameterType {
            return genericParameterType
        } else {
            return "View"
        }
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
            var \(self.trimmedName): \(self.genericParameterName) {
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
    
    var isStylable: Bool {
        !annotations.keys.contains("no_style")
    }
    
    var isConvertedToBinding: Bool {
        annotations["bindingProperty"] != nil || annotations["bindingPropertyOptional"] != nil
    }

    var viewBuilderDecl: String {
        if let cfb = self.resolvedAnnotations("customFunctionBuilder").first {
            return "@\(cfb) \(self.trimmedName): () -> \(self.genericParameterName)"
        } else {
            return "@ViewBuilder \(self.trimmedName): () -> \(self.genericParameterName)"
        }
    }

    var propDecl: String {
        if let defaultValue = annotations.defaultValue {
            return "\(self.trimmedName): \(self.typeName) = \(defaultValue)"
        } else {
            return "\(self.trimmedName): \(self.typeName)"
        }
    }
    
    var computedInternalTypeName: String {
        if annotations["bindingProperty"] != nil {
            return "Binding<\(self.typeName.name)>"
        } else if annotations["bindingPropertyOptional"] != nil {
            return "Binding<\(self.typeName.name)>?"
        } else if type?.isGeneratedComponent == true, let backingComponent = backingSwiftUIComponent {
            let ret = isOptional ? backingComponent + "?" : backingComponent
            return ret
        } else {
            return self.typeName.name
        }
    }
}
