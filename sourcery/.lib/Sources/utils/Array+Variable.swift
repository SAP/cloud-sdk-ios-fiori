import Foundation
import SourceryRuntime

// MARK: Styleable Component

public extension Array where Element == Variable {
    /// ```
    /// let title: any View
    /// let subtitle: any View
    /// @Binding var textInput: String
    /// ```
    var propertyListDecl: String {
        map { variable in
            if let (_, returnType, _, _) = variable.resultBuilderAttrs {
                return "let \(variable.name): \(returnType)"
            } else if variable.isConvertedToBinding {
                return "@Binding var \(variable.name): \(variable.typeName)"
            } else {
                let letOrVar = variable.isMutable ? "var" : "let"
                return "\(letOrVar) \(variable.name): \(variable.typeName)"
            }
        }
        .joined(separator: "\n")
    }
    
    var viewBuilderInitParams: String {
        map { variable in
            let decl: String
            if let (name, returnType, defaultValue, _) = variable.resultBuilderAttrs {
                return "\(name) \(variable.name): () -> \(returnType)\(defaultValue.prependAssignmentIfNeeded())"
            } else if variable.isConvertedToBinding {
                return "\(variable.name): Binding<\(variable.typeName)>"
            } else {
                return "\(variable.name): \(variable.typeName)\(variable.defaultValue.prependAssignmentIfNeeded())"
            }
        }
        .joined(separator: ",\n")
    }
    
    func viewBuilderInitBody(isBaseComponent: Bool) -> String {
        map { variable in
            let name = variable.name
            if variable.resultBuilderAttrs != nil {
                let assignment = isBaseComponent ? "\(name)()" : "\(name.capitalizingFirst()) { \(name)() }"
                return "self.\(name) = \(assignment)"
            } else if variable.isConvertedToBinding {
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
            if variable.isConvertedToBinding {
                return "\(variable.name): Binding<\(variable.typeName)>"
            } else {
                return "\(variable.name): \(variable.typeName)\(variable.defaultValue.prependAssignmentIfNeeded())"
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
            if variable.isConvertedToBinding {
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
            if variable.resultBuilderAttrs != nil {
                return "\(name): .init(self.\(name))"
            } else if variable.isConvertedToBinding {
                return "\(name): self.$\(name)"
            } else {
                return "\(name): self.\(name)"
            }
        }
        .joined(separator: ", ")
    }
    
    var viewEmptyCheckingBody: String {
        let ret = compactMap { variable in
            let name = variable.name
            if variable.resultBuilderAttrs != nil {
                return "\(name).isEmpty"
            } else if variable.isOptional {
                return "\(name) == nil"
            } else {
                return nil
            }
        }
        .joined(separator: " ||\n")
        
        return ret.isEmpty ? "false" : ret
    }
    
    var configurationPropertyListDecl: String {
        var props: [String] = []
        var `typealias`: [String] = []
        for variable in self {
            let name = variable.name
            if variable.resultBuilderAttrs != nil {
                props.append("public let \(name): \(name.capitalizingFirst())")
                `typealias`.append("public typealias \(name.capitalizingFirst()) = ConfigurationViewWrapper")
            } else if variable.isConvertedToBinding {
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
            if variable.resultBuilderAttrs != nil {
                return "configuration.\(name)"
            } else {
                return nil
            }
        }
        .joined(separator: "\n")
    }
}

// MARK: Public API

public extension Array where Element == Variable {
    func foo() -> String { "Foo" }
    /**
     Formats a list `View`-conforming generic parameter for struct declaration.

     Returned as an array, so that it can be flat-mapped with generic parameters specified in sourcery annotations.
     ```
     Title: View, Subtitle: View, ...
     ```
     */
    var templateParameterDecls: [String] {
        map { "\($0.genericParameterName): \($0.genericParameterType)" }
    }

    /**
     Formats accessor property to Environment-cached `ViewModifier` for each component property
     ```
     @Environment(\.titleModifier) private var titleModifier
     @Environment(\.subtitleModifier) private var subtitleModifier
     ...
     ```
     */
    var viewModifierPropertyDecls: [String] {
        filter { $0.annotations.keys.contains("no_style") == false }
            .map { "@Environment(\\.\($0.trimmedName)Modifier) private var \($0.trimmedName)Modifier" }
    }

    /**
     Formats internal 'caching' properties to hold the developer-supplied ViewBuilder for each property
     ```
     let _title: Title
     let _subtitle: Subtitle
     let _isRequired: Bool
     ...
     ```
     */
    var miscPropertyDecls: [String] {
        map {
            if $0.isConvertedToBinding, !$0.isRepresentableByView {
                return "var _\($0.trimmedName): Binding<\($0.typeName)>"
            }

            let letOrVar = $0.isMutable ? "var" : "let"
            
            if $0.isRepresentableByView == false {
                return "\(letOrVar) _\($0.trimmedName): \($0.typeName)"
            } else {
                return "\(letOrVar) _\($0.trimmedName): \($0.genericParameterName)"
            }
        }
    }

    /**
     Creates internal "is<View>Nil" properties, related to optional component properties, as utilities to be used in to compute "is<View>EmptyView>" properties
     ```
     private let isSubtitleNil: Bool = false
     ...
     ```
     */
    var viewBuilderNilPropertyDecls: [String] {
        filter { $0.isOptional == true }
            .map { "private var is\($0.trimmedName.capitalizingFirst())Nil: Bool = false" }
    }

    /**
     Creates internal computed "is<View>EmptyView>" properties, related to optional component properties, to compute the information if `EmptyView` is used nor not
     ```
     var isSubtitleEmptyView: Bool {
     ((isModelInit && isSubtitleNil) || Subtitle.self == EmptyView.self) ? true : false
     }
     ...
     ```
     */
    var viewBuilderEmptyViewPropertyDecls: [String] {
        filter { $0.isOptional == true && $0.isRepresentableByView }
            .map { """
            var is\($0.trimmedName.capitalizingFirst())EmptyView: Bool {
                    ((isModelInit && is\($0.trimmedName.capitalizingFirst())Nil) || \($0.genericParameterName).self == EmptyView.self) ? true : false
                }
            """
            }
    }

    /**
     Creates assignment statements for is<View>Nil" properties (which are are related to optional component properties)
     ```
     isSubtitleNil = subtitle == nil ? true : false
     ...
     ```
     */
    var viewBuilderNilPropertyAssignment: [String] {
        filter { $0.isOptional == true }
            .map { "is\($0.trimmedName.capitalizingFirst())Nil = \($0.trimmedName) == nil ? true : false" }
    }

    var dataTypePropertyDecls: [String] {
        map {
            if $0.annotations["bindingProperty"] != nil || $0.annotations["bindingPropertyOptional"] != nil {
                return "var _\($0.trimmedName): Binding<\($0.typeName.name)>"
            } else if $0.isOptional {
                return "var _\($0.trimmedName): \($0.computedInternalTypeName) = nil"
            } else {
                return "var _\($0.trimmedName): \($0.computedInternalTypeName)"
            }
        }
    }

    /**
     Formats list of either  init ViewBuilder parameters or regular properties
     ```
     public init( // starts here =>
     @ViewBuilder kpi: @escaping () -> Kpi,
     @UserConsentFormBuilder userConsentPages: @escaping () -> UserConsentPages,
     fraction: Double?, ...
     ```
     */
    var miscInitParams: [String] {
        map {
            if $0.isConvertedToBinding, !$0.isRepresentableByView {
                return "\($0.trimmedName): \($0.computedInternalTypeName)\($0.emptyDefault)"
            }
            
            if $0.isRepresentableByView == false {
                return $0.propDecl
            } else {
                return $0.viewBuilderDecl
            }
        }
    }

    /**
     Formats the assignment from init params to caching stored properties
     ```
     public init(
     /* ... */
     ) { // starts here =>
     self._title = title()
     self._subtitle = subtitle()
     self._isRequired = isRequired
     ...
     ```
     */
    var miscInitParamAssignment: [String] {
        map {
            if $0.isConvertedToBinding, !$0.isRepresentableByView {
                if let defaultValue = $0.annotations["bindingPropertyOptional"] as? String {
                    return "self._\($0.trimmedName) = \($0.trimmedName) ?? \(defaultValue)"
                }
                
                return "self._\($0.trimmedName) = \($0.trimmedName)"
            }
            
            if $0.isRepresentableByView == false {
                return "self._\($0.trimmedName) = \($0.trimmedName)"
            } else {
                return "self._\($0.trimmedName) = \($0.trimmedName)()"
            }
        }
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
    func resolvedViewModifierChain(type: Type) -> String {
        map { $0.resolvedViewModifierChain(type: type) }.joined(separator: "\n\t")
    }
}

// MARK: Public API Extension

public extension Array where Element: Variable {
    /**
     Formatted assignments for initializer which takes optional content.

     Uses `ViewBuilder.buildEither` to account for nil content injected via this API
     ```
     init( /* ... */ ) { // starts here =>
     // Where content is non-optional
     self._title = { Text(title) }()

     // Where content is optional (e.g. String?)
     self._subtitle = { subtitle != nil ?
     ViewBuilder.buildEither(first: Text(subtitle!)) :
     ViewBuilder.buildEither(second: EmptyView())
     }()
     ```
     */
    var extensionModelInitParamsAssignments: [String] {
        map {
            if $0.isConvertedToBinding, !$0.isRepresentableByView {
                if let defaultValue = $0.annotations["bindingPropertyOptional"] as? String {
                    return "self._\($0.trimmedName) = \($0.trimmedName) ?? \(defaultValue)"
                }
                
                return "self._\($0.trimmedName) = \($0.trimmedName)"
            }
            
            if $0.isRepresentableByView {
                return "self._\($0.trimmedName) = \($0.conditionalAssignment)"
            } else {
                return "self._\($0.trimmedName) = \($0.trimmedName)"
            }
        }
    }

    var extensionModelInitParamsDataTypeAssignments: [String] {
        map {
            if let defaultValue = $0.annotations["bindingPropertyOptional"] as? String {
                return "self._\($0.trimmedName) = \($0.trimmedName) ?? \(defaultValue)"
            } else {
                return "self._\($0.trimmedName) = \($0.trimmedName)"
            }
        }
    }
}

extension Array where Element: Variable {
    func configurationInitParams(component: String) -> String {
        map { "\($0.trimmedName): _\($0.trimmedName)().modifier(\($0.trimmedName)Modifier.concat(Fiori.\(component).\($0.trimmedName))).typeErased" }.joined(separator: ",\n\t\t\t")
    }

    var configurationPropertyDecls: String {
        map { "let \($0.trimmedName): AnyView" }.joined(separator: "\n\t")
    }

    var configurationPropertyViewBuilder: String {
        map { "configuration.\($0.trimmedName)" }.joined(separator: "\n\t\t\t")
    }

    var staticViewModifierPropertyDecls: String {
        map { "static let \($0.trimmedName) = \($0.trimmedName.capitalizingFirst())()" }.joined(separator: "\n\t\t")
    }

    var staticViewModifierCumulativePropertyDecls: String {
        map { "static let \($0.trimmedName)Cumulative = \($0.trimmedName.capitalizingFirst())Cumulative()" }.joined(separator: "\n\t\t")
    }

    var typealiasViewModifierDecls: String {
        map { """
        typealias \($0.trimmedName.capitalizingFirst()) = EmptyModifier
                typealias \($0.trimmedName.capitalizingFirst())Cumulative = EmptyModifier
        """ }.joined(separator: "\n\t\t")
    }

    public var extensionContrainedWhereEmptyView: String {
        map { "\($0.genericParameterName) == \($0.swiftUIViewTypeName)" }.joined(separator: ", ")
    }

    public var extensionConstrainedWhereConditionalContent: String {
        map { "\($0.genericParameterName) == \(($0.isOptional || $0.annotations.keys.contains("bindingPropertyOptional")) ? "_ConditionalContent<\($0.swiftUITypeName), EmptyView>" : $0.swiftUITypeName)" }.joined(separator: ",\n\t\t")
    }

    public var extensionModelInitParams: [String] {
        map { "\($0.trimmedName): \($0.computedInternalTypeName)\($0.emptyDefault)" }
    }

    public var extensionModelInitParamsChaining: [String] {
        map {
            if $0.type?.isGeneratedComponent == true, let backingComponent = $0.backingSwiftUIComponent {
                let decls = $0.isOptional ?
                    "model.\($0.name) != nil ? \(backingComponent)(model: model.\($0.name)!) : nil" :
                    "\(backingComponent)(model: model.\($0.name)"
                return "\($0.trimmedName): \(decls)"
            } else if $0.annotations.keys.contains("bindingProperty") || $0.annotations.keys.contains("bindingPropertyOptional") {
                return "\($0.trimmedName): Binding<\($0.typeName.name)>(get: { model.\($0.name) }, set: { model.\($0.name) = $0 })"
            } else {
                return "\($0.trimmedName): model.\($0.name)"
            }
        }
    }

    var usage: String {
        reduce(into: [String]()) { prev, next in
            let label = prev.count > 0 ? "\(next.name):" : ""
            prev.append("\(label) {\n\t\t\tconfiguration.\(next.name)\n\t\t}")
        }.joined(separator: " ")
    }

    var acmeUsage: String {
        reduce(into: [String]()) { prev, next in
            let label = prev.count > 0 ? "\(next.name):" : ""
            prev.append("""
            \(label) {
                        VStack {
                            configuration.\(next.name)
                            Acme\(next.name.capitalizingFirst())View()
                        }
                    }
            """)
        }.joined(separator: " ")
    }

    public func extensionInitParamWhereEmptyView(scenario: [Element]) -> [String] {
        var output: [String] = []
        for variable in self {
            if !scenario.contains(variable) {
                if variable.isRepresentableByView {
                    if let cfb = variable.resolvedAnnotations("customFunctionBuilder").first {
                        output.append("@\(cfb) \(variable.trimmedName): () -> \(variable.genericParameterName)")
                    } else {
                        output.append("@ViewBuilder \(variable.trimmedName): () -> \(variable.genericParameterName)")
                    }
                } else {
                    if variable.annotations["bindingProperty"] != nil {
                        output.append("\(variable.trimmedName): Binding<\(variable.typeName)>")
                    } else {
                        output.append("\(variable.trimmedName): \(variable.typeName)\(variable.emptyDefault)")
                    }
                }
            }
        }
        return output
    }

    public func extensionInitParamAssignmentWhereEmptyView(scenario: [Element]) -> [String] {
        var output: [String] = []
        for variable in self {
            if scenario.contains(variable), variable.isRepresentableByView {
                if variable.resolvedAnnotations("customFunctionBuilder").first != nil {
                    output.append("\(variable.trimmedName): { }")
                } else {
                    output.append("\(variable.trimmedName): { \(variable.swiftUIViewDefaultValue) }")
                }
            } else {
                output.append("\(variable.trimmedName): \(variable.trimmedName)")
            }
        }
        return output
    }
}

public extension Array where Element: Variable {
    internal var privateClosurePropModelDecls: [String] {
        map { "var _\($0.trimmedName): \($0.typeName) = nil" }
    }

    internal var extensionModelInitClosureParamsChaining: [String] {
        // return "\($0.trimmedName): model.\($0.name)"
        map {
            guard let method = $0.annotations["originalMethod"] as? SourceryRuntime.Method else { return "" }
            return "\($0.trimmedName): model.\(method.selectorName)"
        }
    }

    var extensionModelInitClosureParams: [String] {
        map {
            "\($0.trimmedName): \($0.typeName) = nil"
        }
    }

    internal var extensionModelInitClosureParamsAssignments: [String] {
        map { "self._\($0.trimmedName) = \($0.trimmedName)" }
    }

    var representableByView: [Variable] {
        filter { $0.isRepresentableByView }
    }
    
    var stylable: [Variable] {
        filter { $0.isStylable }
    }
    
    var uniqueTrimmedName: [Variable] {
        var ret: [Variable] = []
        for variable in self {
            if !ret.contains(where: { $0.trimmedName == variable.trimmedName }) {
                ret.append(variable)
            }
        }

        return ret
    }
}
