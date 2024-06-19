import Foundation
import SourceryRuntime

extension [Variable] {
    /// ```
    /// let title: any View
    /// let subtitle: any View
    /// @Binding var textInput: String
    /// ```
    var propertyListDecl: String {
        map { variable in
            var varDecl = variable.documentation.isEmpty ? "" : variable.docText + "\n"
            if let (_, returnType, _, _) = variable.resultBuilderAttrs {
                varDecl += "let \(variable.name): \(returnType)"
            } else if variable.hasResultBuilderAttribute {
                let type = variable.closureReturnType ?? variable.typeName.name
                varDecl += "let \(variable.name): \(type)"
            } else if variable.isBinding {
                varDecl += "@Binding var \(variable.name): \(variable.typeName)"
            } else {
                let letOrVar = variable.isMutable ? "var" : "let"
                varDecl += "\(letOrVar) \(variable.name): \(variable.typeName)"
            }
            
            return varDecl
        }
        .joined(separator: "\n")
    }
    
    var viewBuilderInitParams: String {
        map { variable in
            if let (name, returnType, defaultValue, _) = variable.resultBuilderAttrs {
                return "\(name) \(variable.name): () -> \(returnType)\(defaultValue.prependAssignmentIfNeeded())"
            } else if variable.hasResultBuilderAttribute {
                return variable.resultBuilderInitParamDecl
            } else if variable.isBinding {
                if variable.defaultValue.isEmpty {
                    return "\(variable.name): Binding<\(variable.typeName)>"
                } else {
                    return "\(variable.name): Binding<\(variable.typeName)>\(variable.defaultValue.prependAssignmentIfNeeded())"
                }
            } else {
                return variable.regular_initParamDecl
            }
        }
        .joined(separator: ",\n")
    }
    
    func viewBuilderInitBody(isBaseComponent: Bool) -> String {
        map { variable in
            let name = variable.name
            if variable.isResultBuilder {
                let assignment = isBaseComponent || !variable.isStyleable ? "\(name)()" : "\(name.capitalizingFirst()) { \(name)() }"
                return "self.\(name) = \(assignment)"
            } else if variable.isBinding {
                return "self._\(name) = \(name)"
            } else {
                return "self.\(name) = \(name)"
            }
        }
        .joined(separator: "\n")
    }
    
    var dataInitParams: String {
        map { variable in
            let decl: String
            if variable.isBinding {
                return "\(variable.name): Binding<\(variable.typeName)>"
            } else if variable.hasResultBuilderAttribute {
                return variable.resultBuilderInitParamDecl
            } else {
                return variable.regular_initParamDecl
            }
        }
        .joined(separator: ",\n")
    }
    
    var dataInitBody: String {
        let initArgs = map { variable in
            let name = variable.name
            if let (_, _, _, backingComponent) = variable.resultBuilderAttrs {
                let arg = backingComponent.isEmpty ? "\(name)" : "\(backingComponent)(\(name))"
                return "\(name): { \(arg) }"
            } else {
                return "\(name): \(name)"
            }
        }
        .joined(separator: ", ")
        
        return "self.init(\(initArgs))"
    }
    
    var configurationInitBody: String {
        map { variable in
            let name = variable.name
            if variable.isBinding {
                return "self._\(name) = configuration.$\(name)"
            } else {
                return "self.\(name) = configuration.\(name)"
            }
        }
        .joined(separator: "\n")
    }
    
    var configurationInitArgs: String {
        map { variable in
            let name = variable.name
            if variable.isResultBuilder, variable.annotations.resultBuilderReturnType == nil {
                return "\(name): .init(self.\(name))"
            } else if variable.isBinding {
                return "\(name): self.$\(name)"
            } else {
                return "\(name): self.\(name)"
            }
        }
        .joined(separator: ", ")
    }
    
    var viewEmptyCheckingBody: String {
        let ret = self.filter { variable in
            variable.isResultBuilder
        }.compactMap { variable in
            let name = variable.name
            if variable.isResultBuilder {
                return "\(name).isEmpty"
            } else if variable.isOptional {
                return "\(name) == nil"
            } else {
                return nil
            }
        }
        .joined(separator: " &&\n")
        
        return ret.isEmpty ? "false" : ret
    }
    
    var configurationPropertyListDecl: String {
        var props: [String] = []
        var `typealias`: [String] = []
        for variable in self {
            let name = variable.name
            if variable.isResultBuilder {
                props.append("public let \(name): \(name.capitalizingFirst())")
                var type = "ConfigurationViewWrapper"
                if let returnType = variable.annotations.resultBuilderReturnType {
                    type = returnType
                }
                `typealias`.append("public typealias \(name.capitalizingFirst()) = \(type)")
            } else if variable.isBinding {
                props.append("@Binding public var \(name): \(variable.typeName)")
            } else {
                props.append("public let \(name): \(variable.typeName)")
            }
        }
        
        return (props + [""] + `typealias`).joined(separator: "\n")
    }
    
    var configurationResultBuilderPropertyListDecl: String {
        compactMap { variable in
            let name = variable.name
            if variable.isResultBuilder {
                return "configuration.\(name)"
            } else {
                return nil
            }
        }
        .joined(separator: "\n")
    }
}
