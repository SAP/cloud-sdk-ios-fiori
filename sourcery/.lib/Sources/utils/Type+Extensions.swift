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

    public var add_view_builder_paramsDecls: String {
        resolvedAnnotations("add_view_builder_params").map({ "@Environment(\\.\($0)) var \($0)" }).joined(separator: "\n\t")
    }
    
    public var add_env_propsDecls: String {
        resolvedAnnotations("add_env_props").map({ "@Environment(\\.\($0)) var \($0)" }).joined(separator: "\n\t")
    }

    public func add_public_propsDecls(indent level: Int) -> String {
        resolvedAnnotations("add_public_props").map({ "public let \($0)"}).joined(separator: carriageRet(level))
    }

//    public func componentResolvedViewBuilderDecls(indent level: Int) -> String {
//        componentProperties.map({ "@ViewBuilder var \($0.trimmedName): some View {\n\t\t\($0.concatenatedModifiers(component: componentName))\n\t}"}).joined(separator: carriageRet(level))
//    }

//    public func defaultInit(indent level: Int) -> String {
//        let initParams = componentProperties.viewBuilderInitParams + resolvedAnnotations("add_public_props")
//        return initParams.map({ $0 }).joined(separator: ",\(carriageRet(level))")
//    }

//    public func extensionModelInit() -> String {
//        let initParams = componentProperties.extensionModelInitParams + resolvedAnnotations("add_public_props")
//        return initParams.map({ $0 }).joined(separator: ", ")
//    }

//    public func extensionModelInitParamsAssignment() -> String {
//        let add_public_props: [String] = resolvedAnnotations("add_public_props").valuesBeforeColon().map({ "\($0): \($0)"})
//        let initParamsAssignment = componentProperties.extensionModelInitParamsAssignment + add_public_props
//        return initParamsAssignment.map({ $0 }).joined(separator: ", ")
//    }

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
}
