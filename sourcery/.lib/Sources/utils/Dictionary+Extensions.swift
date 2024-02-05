import Foundation
import SourceryRuntime

// MARK: styleable component

public extension Dictionary where Key == String, Value == NSObject {
    // annotation: genericParameter.name = ActionView
    var resultBuilderName: String? {
        self["resultBuilder.name"] as? String
    }
    
    var resultBuilderReturnType: String? {
        self["resultBuilder.returnType"] as? String
    }
    
    var resultBuilderBackingComponent: String? {
        self["resultBuilder.backingComponent"] as? String
    }
   
    var resultBuilderDefaultValue: String? {
        self["resultBuilder.defaultValue"] as? String
    }
    
    var isViewBuilder: Bool {
        self["@ViewBuilder"] != nil
    }
}

public extension Dictionary where Key == String, Value == NSObject {
    var isBinding: Bool {
        self["@Binding"] != nil ? true : false
    }
    
    var isComponent: Bool {
        self.isBaseComponent || self.isCompositeComponent
    }
    
    var isBaseComponent: Bool {
        self["BaseComponent"] != nil ? true : false
    }
    
    var isCompositeComponent: Bool {
        self["CompositeComponent"] != nil ? true : false
    }
}

// MARK: Old

// Handling default values for variables
public extension Dictionary where Key == String, Value == NSObject {
    var defaultValue: NSObject? {
        guard let defaultValue = self["default.value"] else {
            return nil
        }
        
        return self.isStringLiteral ? #""\#(defaultValue)""# as NSObject : defaultValue
    }
    
    var isStringLiteral: Bool {
        self["default.isStringLiteral"] != nil
    }
    
    func defaultValue(for variable: String) -> NSObject? {
        let key = "default.\(variable).value"
        return self[key]
    }
    
    func isStringLiteral(for variable: String) -> Bool {
        let key = "default.\(variable).isStringLiteral"
        return self[key] != nil
    }
    
    // Find all the default values provided in annotation: default.variableName.value
    var defaultValueDict: [String: NSObject] {
        var ret: [String: NSObject] = [:]
        
        let keys: [String] = keys.compactMap {
            let components = $0.components(separatedBy: ".")
            if components.count == 3, components[0] == "default", components[2] == "value" {
                return components[1]
            }
            return nil
        }
        
        for key in keys {
            if let value = defaultValue(for: key) {
                ret[key] = value
            }
        }
        
        return ret
    }
}

// Handling backing component
public extension Dictionary where Key == String, Value == NSObject {
    // annotation: generated_component_not_configurable
    var isGeneratedComponentNotConfigurable: Bool {
        self["generated_component_not_configurable"] != nil
    }
    
    // annotation: backingComponent=Action
    var backingComponent: String? {
        self["backingComponent"] as? String
    }
    
    // annotation: generated_component || generated_component_composite || generated_component_not_configurable
    var isGeneratedComponent: Bool {
        keys.contains { $0.contains("generated_component") }
    }
}

public extension Dictionary where Key == String, Value == NSObject {
    // annotation: genericParameter.name = ActionView
    var genericParameterName: String? {
        self["genericParameter.name"] as? String
    }
    
    // annotation: genericParameter.type = OtherView
    var genericParameterType: String? {
        self["genericParameter.type"] as? String
    }
}

public extension Dictionary where Key == String, Value == NSObject {
    var importFrameworks: [String] {
        self["importFrameworks"] as? [String] ?? []
    }
}
