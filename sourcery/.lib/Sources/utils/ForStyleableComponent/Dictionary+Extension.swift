import Foundation

extension Dictionary where Key == String, Value == NSObject {
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

extension Dictionary where Key == String, Value == NSObject {
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
