import Foundation
import SwiftDiagnostics
import SwiftSyntax
import SwiftSyntaxBuilder
import SwiftSyntaxMacros

// Reference: https://github.com/LeonardoCardoso/InitMacro/tree/main

/// Generates a public initializer.
///
/// Example:
///
///     @Init(defaults: [:], wildcards: [], public: true)
///     public final class Test {
///         let age: Int
///         let cash: Double?
///         let name: String
///     }
///
/// produces
///
///     public final class Test {
///         let age: Int
///         let cash: Double?
///         let name: String
///
///         public init(
///             age: Int,
///             cash: Double?,
///             name: String
///         ) {
///             self.age = age
///             self.cash = cash
///             self.name = name
///         }
///     }
///
///    - Parameters:
///      - defaults: Dictionary containing defaults for the specificed properties.
///      - wildcards: Array containing the specificed properties that should be wildcards.
///      - public: The flag to indicate if the init is public or not.
public struct InitMacro: MemberMacro {
    public static func expansion(
        of attribute: AttributeSyntax,
        providingMembersOf declaration: some DeclGroupSyntax,
        in context: some MacroExpansionContext
    ) throws -> [DeclSyntax] {
        // Only `struct` and `class` is suitable for this macro
        guard declaration.is(StructDeclSyntax.self) || declaration.is(ClassDeclSyntax.self) else {
            let message: DiagnosticMessage
            if !declaration.is(StructDeclSyntax.self) {
                message = InitMacroDiagnostic.notAsStruct("InitMacro")
            } else {
                message = InitMacroDiagnostic.notAsClass("InitMacro")
            }
            let error = Diagnostic(
                node: attribute._syntaxNode,
                message: message
            )
            context.diagnose(error)
            return []
        }
        
        var parameters = [String]()
        var assignments = [String]()
        var accessorType = false
        
        if let decl = declaration.as(ClassDeclSyntax.self) {
            (parameters, assignments, accessorType) = self.makeData(
                getModifiers("", decl.modifiers),
                decl.memberBlock.members,
                decl.attributes
            )
        }
        if let decl = declaration.as(StructDeclSyntax.self) {
            (parameters, assignments, accessorType) = self.makeData(
                getModifiers("", decl.modifiers),
                decl.memberBlock.members,
                decl.attributes
            )
        }
        
        let initBody: [CodeBlockItemListSyntax.Element] = assignments.enumerated().map { index, assignment in
            if index == 0 {
                return "\(raw: assignment)"
            } else {
                return "\n\(raw: assignment)"
            }
        }
        
        let initDeclSyntax = try InitializerDeclSyntax(
            SyntaxNodeString(
                stringLiteral: "\(accessorType ? "public " : "")init(\n\(parameters.joined(separator: ",\n"))\n)"
            ),
            bodyBuilder: { .init(initBody) }
        )
        
        return ["\(raw: initDeclSyntax)"]
    }
    
    private static func makeData(
        _ accessorPrefix: String,
        _ members: MemberBlockItemListSyntax,
        _ attributes: AttributeListSyntax?
    ) -> ([String], [String], Bool) {
        var defaults = [String: String]()
        var wildcards = [String]()
        
        // Get attributes for Init macro
        let attributes = getAttributes(attributes, "Init")?.arguments?.as(LabeledExprListSyntax.self)
        
        // Analyse the `defaults` parameter
        if let defaultsAttributes = attributes?
            .first(where: { "\($0)".contains("defaults") })?
            .expression.as(DictionaryExprSyntax.self)?
            .content.as(DictionaryElementListSyntax.self)
        {
            for attribute in defaultsAttributes {
                if let key = attribute.key.as(StringLiteralExprSyntax.self)?
                    .segments.first?.as(StringSegmentSyntax.self)?
                    .content
                {
                    defaults["\(key.text)"] = "\(attribute.value)"
                }
            }
        }
        
        // Analyse the `wildcards` parameter
        if let wildcardsAttributes = attributes?
            .first(where: { "\($0)".contains("wildcards") })?
            .expression.as(ArrayExprSyntax.self)?
            .elements
        {
            for attribute in wildcardsAttributes {
                if let key = attribute.expression.as(StringLiteralExprSyntax.self)?
                    .segments.first?.as(StringSegmentSyntax.self)?
                    .content
                {
                    wildcards.append("\(key)")
                }
            }
        }
        
        // Analyse the `public` parameter
        var accessorType = accessorPrefix.contains("public")
        if let publicAttribute = attributes?
            .first(where: { "\($0)".contains("public") })?
            .expression.as(BooleanLiteralExprSyntax.self)?.literal
        {
            accessorType = "\(publicAttribute)" == "true"
        }
        
        var parameters = [String]()
        var assignments = [String]()
        
        for member in members {
            if let syntax = member.decl.as(VariableDeclSyntax.self),
               case let bindings = syntax.bindings,
               let pattern = bindings.first,
               let identifier = pattern.pattern.as(IdentifierPatternSyntax.self)?.identifier,
               let type = pattern.typeAnnotation?.type,
               !(syntax.bindingSpecifier.tokenKind == .keyword(.let) && pattern.initializer != nil)
            {
                let isViewBuilder = syntax.isViewBuilder
                let identifierPrefix = {
                    var ret = ""
                    
                    ret += isViewBuilder ? "@ViewBuilder " : ""
                    
                    let shouldUnderscoreParameter = wildcards.contains("\(identifier)")
                    ret += shouldUnderscoreParameter ? "_ " : ""
                    
                    return ret
                }()
                
                let shouldAddScaping = type.is(FunctionTypeSyntax.self)
                let typePrefix = "\(shouldAddScaping ? "@escaping " : "")"
                let type = {
                    guard isViewBuilder else { return type }
                    return "() -> \(type)"
                }()
                
                var parameter = "\(identifierPrefix)\(identifier): \(typePrefix)\(type)"
                if let defaultValue = defaults["\(identifier)"] {
                    let value = defaultValue.containsPattern("\\(\\)\"")
                        ? defaultValue.removePattern("\"(.*)\"")
                        : defaultValue
                    parameter += " = " + "\(value)"
                } else if let initializer = pattern.initializer {
                    parameter += "\(initializer)"
                }
                
                let memberAccessor = getModifiers("", syntax.modifiers)
                let memberAccessorPrefix = (memberAccessor.contains("static") ? "S" : "s") + "elf"
                
                let isComputedProperty = pattern.accessorBlock?.is(CodeBlockSyntax.self) == true
                let isUsingAccessors = pattern.accessorBlock?.is(AccessorBlockSyntax.self) == true
                if !isComputedProperty, !isUsingAccessors {
                    parameters.append(parameter)
                    
                    let value = isViewBuilder ? "\(identifier)()" : "\(identifier)"
                    assignments.append("\(memberAccessorPrefix).\(identifier) = \(value)")
                }
            }
        }
        
        return (parameters, assignments, accessorType)
    }
}

extension String {
    func containsPattern(_ pattern: String = "Optional\\((.*)\\)") -> Bool {
        self.extractPattern(pattern) != nil
    }
    
    func removePattern(_ pattern: String = "Optional\\((.*)\\)") -> String {
        if let match = extractPattern(pattern) {
            if let range = Range(match.range(at: 1), in: self) {
                return String(self[range])
            }
        }
        return self
    }
    
    private func extractPattern(_ pattern: String = "Optional\\((.*)\\)") -> NSTextCheckingResult? {
        do {
            let regex = try NSRegularExpression(
                pattern: pattern
            )
            return regex.firstMatch(
                in: self,
                options: [],
                range: NSRange(location: 0, length: utf16.count)
            )
        } catch {}
        return nil
    }
}

private extension AttachedMacro {
    static func getAttributes(
        _ attributes: AttributeListSyntax?,
        _ key: String
    ) -> AttributeSyntax? {
        attributes?
            .first(where: { "\($0)".contains(key) })?
            .as(AttributeSyntax.self)
    }
    
    static func getModifiers(
        _ initialModifiers: String,
        _ modifiers: DeclModifierListSyntax?
    ) -> String {
        var initialModifiers = initialModifiers
        modifiers?.forEach {
            let accessorType = $0.name
            initialModifiers += "\(accessorType.text) "
        }
        return initialModifiers
    }
}
