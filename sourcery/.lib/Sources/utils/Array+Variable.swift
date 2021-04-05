import Foundation
import SourceryRuntime

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
        map { "\($0.trimmedName.capitalizingFirst()): View" }
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
     Formats private 'caching' properties to hold the developer-supplied ViewBuilder for each property
     ```
     private let _title: Title
     private let _subtitle: Subtitle
     ...
     ```
     */
    var viewBuilderPropertyDecls: [String] {
        map { "private let _\($0.trimmedName): \($0.trimmedName.capitalizingFirst())" }
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
        filter { $0.isOptional == true }
            .map { """
            var is\($0.trimmedName.capitalizingFirst())EmptyView: Bool {
                    ((isModelInit && is\($0.trimmedName.capitalizingFirst())Nil) || \($0.trimmedName.capitalizingFirst()).self == EmptyView.self) ? true : false
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
        map { "var _\($0.trimmedName): \($0.typeName) = nil" }
    }

    /**
     Formats list of init ViewBuilder parameters
     ```
     public init( // starts here =>
         @ViewBuilder title: @escaping () -> Title,
         @ViewBuilder subtitle: @escaping () -> Subtitle, ...
     ```
     */
    var viewBuilderInitParams: [String] {
        map {
            if let cfb = $0.resolvedAnnotations("customFunctionBuilder").first {
                return "@\(cfb) \($0.trimmedName): @escaping () -> \($0.trimmedName.capitalizingFirst())"
            } else {
                return "@ViewBuilder \($0.trimmedName): @escaping () -> \($0.trimmedName.capitalizingFirst())"
            }
        }
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
    var viewBuilderInitParamAssignment: [String] {
        map { "self._\($0.trimmedName) = \($0.trimmedName)()" }
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
        map { "self._\($0.trimmedName) = \($0.conditionalAssignment)" }
    }

    var extensionModelInitParamsDataTypeAssignments: [String] {
        map { "self._\($0.trimmedName) = \($0.trimmedName)" }
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

    var typealiasViewModifierDecls: String {
        map { "typealias \($0.trimmedName.capitalizingFirst()) = EmptyModifier" }.joined(separator: "\n\t\t")
    }

    public var extensionContrainedWhereEmptyView: String {
        map { "\($0.trimmedName.capitalizingFirst()) == EmptyView" }.joined(separator: ", ")
    }

    public var extensionConstrainedWhereConditionalContent: String {
        map { "\($0.trimmedName.capitalizingFirst()) == \($0.isOptional ? "_ConditionalContent<\($0.swiftUITypeName), EmptyView>" : $0.swiftUITypeName)" }.joined(separator: ",\n\t\t")
    }

    public var extensionModelInitParams: [String] {
        map { "\($0.trimmedName): \($0.typeName.name)\($0.emptyDefault)" }
    }

    public var extensionModelInitParamsChaining: [String] {
        map { "\($0.trimmedName): model.\($0.name)" }
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
                if let cfb = variable.resolvedAnnotations("customFunctionBuilder").first {
                    output.append("@\(cfb) \(variable.trimmedName): @escaping () -> \(variable.trimmedName.capitalizingFirst())")
                } else {
                    output.append("@ViewBuilder \(variable.trimmedName): @escaping () -> \(variable.trimmedName.capitalizingFirst())")
                }
            }
        }
        return output
    }

    public func extensionInitParamAssignmentWhereEmptyView(scenario: [Element]) -> [String] {
        var output: [String] = []
        for variable in self {
            if scenario.contains(variable) {
                if variable.resolvedAnnotations("customFunctionBuilder").first != nil {
                    output.append("\(variable.trimmedName): { }")
                } else {
                    output.append("\(variable.trimmedName): { EmptyView() }")
                }
            } else {
                output.append("\(variable.trimmedName): \(variable.trimmedName)")
            }
        }
        return output
    }
}

extension Array where Element: Variable {
    var privateClosurePropModelDecls: [String] {
        map { "var _\($0.trimmedName): \($0.typeName) = nil" }
    }

    var extensionModelInitClosureParamsChaining: [String] {
        // return "\($0.trimmedName): model.\($0.name)"
        map {
            guard let method = $0.annotations["originalMethod"] as? SourceryRuntime.Method else { return "" }
            return "\($0.trimmedName): model.\(method.selectorName)"
        }
    }

    public var extensionModelInitClosureParams: [String] {
        map {
            "\($0.trimmedName): \($0.typeName) = nil"
        }
    }

    var extensionModelInitClosureParamsAssignments: [String] {
        map { "self._\($0.trimmedName) = \($0.trimmedName)" }
    }
}
