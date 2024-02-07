import Foundation
import SourceryRuntime

extension Variable {
    var defaultValue: String {
        if isConvertedToBinding {
            return ""
        } else {
            if let defaultValue = annotations.defaultValue {
                return " = \(defaultValue)"
            }
            
            if isOptional {
                return "nil"
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
