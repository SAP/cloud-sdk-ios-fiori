import Foundation
import SourceryRuntime

extension Variable {
    var defaultValue: String {
        if isBinding {
            if let defaultValue = annotations.defaultValue {
                return "\(defaultValue)"
            } else {
                return ""
            }
        } else {
            if let defaultValue = annotations.defaultValue {
                return "\(defaultValue)"
            }
            
            if isOptional {
                if !self.attributes.isEmpty {
                    return "{ EmptyView() }"
                } else {
                    return "nil"
                }
            } else if isArray {
                return "[]"
            } else {
                return ""
            }
        }
    }
    
    var shouldHaveIntrinsicDefaultValue: Bool {
        isOptional || isArray
    }
}

extension Variable {
    var isBinding: Bool {
        annotations.isBinding
    }
}

extension Variable {
    var isResultBuilder: Bool {
        self.resultBuilderAttrs != nil || hasResultBuilderAttribute
    }
    
    /**
     For a variable (typically a result builder) that is styleable, during initialization, it will be wrapped by a styleable component.
     
     ```swift
     public init(@ViewBuilder title: () -> any View)
     {
         self.title = Title { title() }
     }
     ```
     
     Otherwise,
     
     ```swift
     public init(@ViewBuilder content: () -> any View)
     {
         self.content = content()
     }
     ```
     */
    var isStyleable: Bool {
        self.isResultBuilder && self.definedInType?.isBaseComponent == true
    }
    
    var resultBuilderAttrs: (name: String, returnType: String, defaultValue: String, backingComponent: String)? {
        if annotations.isViewBuilder {
            return ("@ViewBuilder", self.resultBuilderReturnType, self.resultBuilderDefaultValue, self.backingComponent)
        }
        
        guard let name = annotations.resultBuilderName
        else {
            return nil
        }
        
        return (name, self.resultBuilderReturnType, self.resultBuilderDefaultValue, self.backingComponent)
    }
    
    var backingComponent: String {
        if let backingComponent = annotations.resultBuilderBackingComponent {
            return backingComponent
        }
        
        return self.default_backingComponent
    }
    
    var default_backingComponent: String {
        switch "\(typeName)" {
        case "AttributedString", "String":
            return "Text"
        case "AttributedString?", "String?":
            return "OptionalText"
        case "Image", "Image?":
            return ""
        case "TextOrIcon", "TextOrIcon?":
            return "TextOrIconView"
        default:
            return ""
        }
    }
    
    var resultBuilderReturnType: String {
        if let returnType = annotations.resultBuilderReturnType {
            return returnType
        }
        
        return "any View"
    }
    
    var resultBuilderDefaultValue: String {
        if let defaultValue = annotations.resultBuilderDefaultValue {
            return defaultValue
        }
        
        if self.shouldHaveIntrinsicDefaultValue {
            return "{ EmptyView() }"
        } else {
            return ""
        }
    }
}

extension Variable {
    var hasResultBuilderAttribute: Bool {
        !self.attributes.isEmpty
    }
    
    var resultBuilderInitParamDecl: String {
        var ret = self.attributes.string + " "

        if self.closureParameters.isEmpty {
            ret += "\(self.name): \(self.resultBuilderTypeName ?? self.typeName.name)\(self.defaultValue.prependAssignmentIfNeeded())"
        } else {
            let escapingAttr = self.typeName.isClosure &&
                !self.typeName.isOptional
                ? "@escaping " : ""
            ret += "@ViewBuilder \(self.name): \(escapingAttr)\(self.typeName)\(self.defaultValue.prependAssignmentIfNeeded())"
        }

        return ret
    }
    
    var resultBuilderTypeName: String? {
        guard self.hasResultBuilderAttribute else {
            return nil
        }
        return self.typeName.closure?.name
    }
}

extension Variable {
    var componentName: String {
        name.capitalizingFirst()
    }
    
    var styleProtocolName: String {
        "\(self.componentName)Style"
    }
    
    var fioriStyleName: String {
        "\(self.componentName)FioriStyle"
    }
    
    var styleModifierName: String {
        "\(name)Style"
    }
    
    var styleModifierExpr: String {
        ".\(self.styleModifierName)"
    }
    
    var configurationName: String {
        "\(self.componentName)Configuration"
    }
}

extension Variable {
    var docText: String {
        self.documentation.map { str in
            "/// \(str)"
        }
        .joined(separator: "\n")
    }
}

extension Variable {
    var closureReturnType: String? {
        self.typeName.closure?.actualReturnTypeName.name
    }

    var closureParameters: [ClosureParameter] {
        self.typeName.closure?.parameters ?? []
    }
}

extension Variable {
    var regular_initParamDecl: String {
        let escapingAttr = !self.isResultBuilder &&
            typeName.isClosure &&
            !typeName.isOptional
            ? "@escaping " : ""

        return "\(name): \(escapingAttr)\(typeName)\(self.defaultValue.prependAssignmentIfNeeded())"
    }
}
