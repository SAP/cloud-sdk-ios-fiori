//
//  File.swift
//  
//
//  Created by Stadelman, Stan on 12/14/20.
//

import Foundation
import SourceryRuntime

// MARK: Public API
extension Array where Element == Variable {
    
    public func foo() -> String { "Foo" }
    /**
     Formats a list `View`-conforming generic parameter for struct declaration.
     
     Returned as an array, so that it can be flat-mapped with generic parameters specified in sourcery annotations.
     ```
     Title: View, Subtitle: View, ...
     ```
     */
    public var templateParameterDecls: Array<String> {
        map({ "\($0.trimmedName.capitalizingFirst()): View"})
    }
    
    /**
     Formats accessor property to Environment-cached `ViewModifier` for each component property
     ```
     @Environment(\.titleModifier) private var titleModifier
     @Environment(\.subtitleModifier) private var subtitleModifier
     ...
     ```
     */
    public var viewModifierPropertyDecls: String {
        map({ "@Environment(\\.\($0.trimmedName)Modifier) private var \($0.trimmedName)Modifier" }).joined(separator: "\n\t")
    }
    
    /**
     Formats private 'caching' properties to hold the developer-supplied ViewBuilder for each property
     ```
     private let _title: () -> Title
     private let _subtitle: () -> Subtitle
     ...
     ```
     */
    public var viewBuilderPropertyDecls: String {
        map({ "private let _\($0.trimmedName): () -> \($0.trimmedName.capitalizingFirst())" }).joined(separator: "\n\t")
    }
    
    /**
     Formats list of init ViewBuilder parameters
     ```
     public init( // starts here =>
         @ViewBuilder title: @escaping () -> Title,
         @ViewBuilder subtitle: @escaping () -> Subtitle, ...
     ```
     */
    public var viewBuilderInitParams: String {
        map({ "@ViewBuilder \($0.trimmedName): @escaping () -> \($0.trimmedName.capitalizingFirst())"}).joined(separator: ",\n\t\t")
    }
    
    /**
     Formats the assignment from init params to caching stored properties
     ```
     public init(
         /* ... */
         ) { // starts here =>
             self._title = title
             self._subtitle = subtitle
            ...
     ```
     */
    public var viewBuilderInitParamAssignment: String {
        map({ "self._\($0.trimmedName) = \($0.trimmedName)" }).joined(separator: "\n\t\t\t")
    }
    
    /**
    Responsible for resolving view modifiers from default styling, and Environment property
     
      Generates as follows:
     ```
     var title: some View {
         _title().modifier(titleModifier.concat(Fiori.ChartFloorplan.title))
     }
     ```
     - important: This is the ONLY view which should be used by developers in the layout construction
     */
    public func resolvedViewModifierChain(type: Type) -> String {
        map { $0.resolvedViewModifierChain(type: type) }.joined(separator: "\n\t")
    }
}

// MARK: Public API Extension

extension Array where Element: Variable {
    
    /**
     Formatted assignments for initializer which takes optional content.
     
     Uses `ViewBuilder.buildEither` to account for nil content injected via this API
     ```
     init(/*...*/) { // starts here =>
        // Where content is non-optional
        self._title = { Text(title) }

        // Where content is optional (e.g. String?)
        self._subtitle = { subtitle != nil ?
            ViewBuilder.buildEither(first: Text(subtitle!)) :
            ViewBuilder.buildEither(second: EmptyView())
        }
     ```
     */
    public var extensionModelInitParamsAssignments: String {
        map({ "self._\($0.trimmedName) = { \($0.conditionalAssignment) }" }).joined(separator: "\n\t\t")
    }
}

extension Array where Element: Variable {



    func configurationInitParams(component: String) -> String {
        map({ "\($0.trimmedName): _\($0.trimmedName)().modifier(\($0.trimmedName)Modifier.concat(Fiori.\(component).\($0.trimmedName))).typeErased" }).joined(separator: ",\n\t\t\t")
    }

    var configurationPropertyDecls: String {
        map({ "let \($0.trimmedName): AnyView" }).joined(separator: "\n\t")
    }

    var configurationPropertyViewBuilder: String {
        map({ "configuration.\($0.trimmedName)"}).joined(separator: "\n\t\t\t")
    }

    var staticViewModifierPropertyDecls: String {
        map({ "static let \($0.trimmedName) = \($0.trimmedName.capitalizingFirst())()" }).joined(separator: "\n\t\t")
    }

    var typealiasViewModifierDecls: String {
        map({ "typealias \($0.trimmedName.capitalizingFirst()) = EmptyModifier" }).joined(separator: "\n\t\t")
    }

    public var extensionContrainedWhereEmptyView: String {
        map({ "\($0.trimmedName.capitalizingFirst()) == EmptyView" }).joined(separator: ", ")
    }

    public var extensionConstrainedWhereConditionalContent: String {
        map({ "\($0.trimmedName.capitalizingFirst()) == \($0.isOptional ? "_ConditionalContent<\($0.swiftUITypeName), EmptyView>" : $0.swiftUITypeName)"}).joined(separator: ",\n\t\t")
    }

    public var extensionModelInitParams: String {
        map({ "\($0.trimmedName): \($0.typeName.name)\($0.emptyDefault)" }).joined(separator: ", ")
    }

    public var extensionModelInitParamsAssignment: String {
        map({ "\($0.trimmedName): model.\($0.name)"}).joined(separator: ", ")
    }



    var usage: String {
        reduce(into: Array<String>(), { prev, next in
            let label = prev.count > 0 ? "\(next.name):" : ""
            prev.append("\(label) {\n\t\t\tconfiguration.\(next.name)\n\t\t}")
        }).joined(separator: " ")
    }

    var acmeUsage: String {
        reduce(into: Array<String>(), { prev, next in
            let label = prev.count > 0 ? "\(next.name):" : ""
            prev.append("""
            \(label) {
                        VStack {
                            configuration.\(next.name)
                            Acme\(next.name.capitalizingFirst())View()
                        }
                    }
            """)
        }).joined(separator: " ")
    }

    public func extensionInitParamWhereEmptyView(scenario: Array<Element>) -> String {
        var output: Array<String> = []
        for variable in self {
            if !scenario.contains(variable) {
                output.append("@ViewBuilder \(variable.trimmedName): @escaping () -> \(variable.trimmedName.capitalizingFirst())")
            }
        }
        return output.joined(separator: ",\n\t\t")
    }

    public func extensionInitParamAssignmentWhereEmptyView(scenario: Array<Element>) -> String {
        var output: Array<String> = []
        for variable in self {
            if scenario.contains(variable) {
                output.append("\(variable.trimmedName): { EmptyView() }")
            } else {
                output.append("\(variable.trimmedName): \(variable.trimmedName)")
            }
        }
        return output.joined(separator: ",\n\t\t\t")
    }
}


