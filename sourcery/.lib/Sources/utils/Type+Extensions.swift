//
//  File.swift
//  
//
//  Created by Stadelman, Stan on 12/14/20.
//

import Foundation
import SourceryRuntime

// MARK: - Public API
extension Type {
    /**
     Declares additional 'non-model' `ViewBuilder` generic types
     Follows list of `componentProperties.templateParameterDecls`
     ```
     struct AcmeComponent<Title: View, /* starts here => */ AcmeView: View, ...
     ```
     */
    public var add_view_builder_paramsTemplateParameterDecls: Array<String> {
        resolvedAnnotations("add_view_builder_params").map({ "\($0.capitalizingFirst()): View" })
    }
}

extension Type {
    func viewBuilderProperties(in context: [String: Type]) -> [(name: String, type: String)] {
        let componentProperties = flattenedComponentProperties(contextType: context).map { (name: $0.name, type: $0.name.capitalizingFirst()) }
        let addViewBuilderProperties = resolvedAnnotations("add_view_builder_params").map { (name: $0, type: $0.capitalizingFirst()) }
        return [componentProperties, addViewBuilderProperties].flatMap { $0 }
    }
}


extension Type {

    public var componentName: String {
        name.replacingOccurrences(of: "Model", with: "")
    }

    public var componentNameAsPropertyDecl: String {
        componentName.lowercasingFirst()
    }

    public func flattenedComponentProperties(contextType: [String: Type]) -> Array<Variable> {
        inheritedTypes.compactMap({ contextType[$0] }).flatMap({ $0.allVariables })
    }

    public func resolvedAnnotations(_ name: String) -> Array<String> {
        if let string = self.annotations[name] as? String {
            return [string]
        } else if let array = self.annotations[name] as? Array<String> {
            return array
        } else {
            return []
        }
    }
    
    public var add_view_builder_paramsViewBuilderPropertyDecls: [String] {
        resolvedAnnotations("add_view_builder_params")
            .map({ "private let _\($0): \($0.capitalizingFirst())" })
    }
    
    public var add_view_builder_paramsViewBuilderInitParams: [String] {
        resolvedAnnotations("add_view_builder_params")
            .map({ "@ViewBuilder \($0): @escaping () -> \($0.capitalizingFirst())"})
    }
    public var add_view_builder_paramsViewBuilderInitParamAssignment: [String] {
        resolvedAnnotations("add_view_builder_params")
            .map({ "self._\($0) = \($0)()" })
    }
    
    public var add_view_builder_paramsResolvedViewModifierChain: [String] {
        resolvedAnnotations("add_view_builder_params")
            .map {
                """
                var \($0): some View {
                        _\($0)
                    }
                """
            }
    }
    
    public var add_view_builder_paramsExtensionModelInitParamsChaining: [String] {
        resolvedAnnotations("add_view_builder_params")
            .map({ "\($0): \($0)" })
    }
    
    public var add_env_propsDecls: [String] {
        resolvedAnnotations("add_env_props")
            .map({ "@Environment(\\.\($0)) var \($0)" })
    }

    public func add_public_propsDecls(indent level: Int) -> String {
        resolvedAnnotations("add_public_props")
            .map({ "public let \($0)"}).joined(separator: carriageRet(level))
    }

    // Not used when Style/Configuration is not adopted
    public var componentStyleName: String {
        "\(componentName)tStyle"
    }

    // Not used when Style/Configuration is not adopted
    public var componentStyleNameAsPropertyDecl: String {
        componentStyleName.lowercasingFirst()
    }

    // Not used when Style/Configuration is not adopted
    public var stylePropertyDecl: String {
        "@Environment(\\.\(componentNameAsPropertyDecl)Style) var style: Any\(componentStyleName)"
    }

    // Not used when Style/Configuration is not adopted
    public var componentStyleConfigurationName: String {
        "\(componentStyleName)Configuration"
    }

    // Not used when Style/Configuration is not adopted
    public var fioriComponentStyleName: String {
        "Fiori\(componentStyleName)"
    }

    // Not used when Style/Configuration is not adopted
    public var fioriLayoutRouterName: String {
        "Fiori\(componentName)LayoutRouter"
    }

//    public var usage: String {
//        "\(componentName) \(componentProperties.usage)"
//    }
//
//    public var acmeUsage: String {
//        "\(componentName) \(componentProperties.acmeUsage)"
//    }

    public func fioriStyleImplEnumDecl(componentProperties: [Variable]) -> String {
        """
        extension Fiori {
            enum \(componentName) {
                \(componentProperties.typealiasViewModifierDecls)

                // TODO: - substitute type-specific ViewModifier for EmptyModifier
                /*
                    // replace `typealias Subtitle = EmptyModifier` with:

                    struct Subtitle: ViewModifier {
                        func body(content: Content) -> some View {
                            content
                                .font(.body)
                                .foregroundColor(.preferredColor(.primary3))
                        }
                    }
                */
                \(componentProperties.staticViewModifierPropertyDecls)
            }
        }
        """
    }

    var closureProperties: [Variable] {
        var closureProperties: [Variable] = []

        for method in self.methods {
            let v = Variable(name: "\(method.name)Closure", typeName: method.returnTypeName, type: Type(), accessLevel: (read: .internal, write: .internal), isComputed: true, isStatic: false, defaultValue: nil, attributes: [:], annotations: [:], definedInTypeName: method.definedInTypeName)
            closureProperties.append(v)
        }

        return closureProperties
    }

    func closureProperties(contextType: [String: Type]) -> [Variable] {
        inheritedTypes.compactMap { contextType[$0] }.flatMap { $0.allMethods }.map { (method) -> Variable in

            let name = "\(method.name.components(separatedBy: "(").first ?? method.selectorName)Closure"

            let parameterListAsString: String = method.parameters.map({ "\($0.typeName)" }).joined(separator: ",")
            let typeName = TypeName("((\(parameterListAsString)) -> \(method.returnTypeName))?")

            var convertionAnnotations: [String: NSObject] = [:]
            convertionAnnotations["originalMethod"] = method

            return Variable(name: name, typeName: typeName, type: Type(), accessLevel: (read: SourceryRuntime.AccessLevel(rawValue: method.accessLevel)!, write: SourceryRuntime.AccessLevel(rawValue: method.accessLevel)!), isComputed: true, isStatic: method.isStatic, defaultValue: nil, attributes: [:], annotations: convertionAnnotations, definedInTypeName: method.definedInTypeName)
        }
    }
}
