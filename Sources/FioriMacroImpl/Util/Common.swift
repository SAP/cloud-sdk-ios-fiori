import Foundation
import SwiftDiagnostics
import SwiftSyntax
import SwiftSyntaxBuilder
import SwiftSyntaxMacros

enum InitType {
    case viewbuilder, data, configuration
}

extension AttachedMacro {
    static func createInit(
        of node: AttributeSyntax,
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
                node: node._syntaxNode,
                message: message
            )
            context.diagnose(error)
            return []
        }
        
        var parameters = [String]()
        var assignments = [String]()
        var accessorType = false

        if let decl = declaration.as(StructDeclSyntax.self) {
            let configurationName = "\(decl.name)Configuration"
            (parameters, assignments, _, accessorType) = self.makeData(
                getModifiers("", decl.modifiers),
                decl.memberBlock.members,
                decl.attributes,
                .viewbuilder,
                configurationName
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
    
    static func createDataInit(
        of node: AttributeSyntax,
        providingMembersOf declaration: some DeclGroupSyntax,
        in context: some MacroExpansionContext
    ) throws -> ([DeclSyntax], [String]) {
        // Only `struct` and `class` is suitable for this macro
        guard declaration.is(StructDeclSyntax.self) || declaration.is(ClassDeclSyntax.self) else {
            let message: DiagnosticMessage
            if !declaration.is(StructDeclSyntax.self) {
                message = InitMacroDiagnostic.notAsStruct("InitMacro")
            } else {
                message = InitMacroDiagnostic.notAsClass("InitMacro")
            }
            let error = Diagnostic(
                node: node._syntaxNode,
                message: message
            )
            context.diagnose(error)
            return ([], [])
        }
        
        var parameters = [String]()
        var assignments = [String]()
        var genericParams = [String]()
        var accessorType = false

        if let decl = declaration.as(StructDeclSyntax.self) {
            (parameters, assignments, genericParams, accessorType) = self.makeData(
                getModifiers("", decl.modifiers),
                decl.memberBlock.members,
                decl.attributes,
                .data
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
                stringLiteral: "init(\n\(parameters.joined(separator: ",\n"))\n)"
            ),
            bodyBuilder: { .init(initBody) }
        )
        
        return (["\(raw: initDeclSyntax)"], genericParams)
    }
    
    static func createConfigurationInit(
        of node: AttributeSyntax,
        providingMembersOf declaration: some DeclGroupSyntax,
        in context: some MacroExpansionContext,
        isBaseComponent: Bool = true
    ) throws -> ([DeclSyntax], [String]) {
        // Only `struct` and `class` is suitable for this macro
        guard declaration.is(StructDeclSyntax.self) || declaration.is(ClassDeclSyntax.self) else {
            let message: DiagnosticMessage
            if !declaration.is(StructDeclSyntax.self) {
                message = InitMacroDiagnostic.notAsStruct("InitMacro")
            } else {
                message = InitMacroDiagnostic.notAsClass("InitMacro")
            }
            let error = Diagnostic(
                node: node._syntaxNode,
                message: message
            )
            context.diagnose(error)
            return ([], [])
        }
        
        var parameters = [String]()
        var assignments = [String]()
        var genericParams = [String]()

        if let decl = declaration.as(StructDeclSyntax.self) {
            let configurationName = "\(decl.name)Configuration"
            (parameters, assignments, genericParams, _) = self.makeData(
                getModifiers("", decl.modifiers),
                decl.memberBlock.members,
                decl.attributes,
                .configuration,
                configurationName
            )
            
            parameters = ["_ configuration: \(decl.name)Configuration"]
            assignments.append("self._shouldApplyDefaultStyle = false")
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
                stringLiteral: "init(\n\(parameters.joined(separator: ",\n"))\n)"
            ),
            bodyBuilder: { .init(initBody) }
        )
        
        return (["\(raw: initDeclSyntax)"], genericParams)
    }
    
    private static func makeData(
        _ accessorPrefix: String,
        _ members: MemberBlockItemListSyntax,
        _ attributes: AttributeListSyntax?,
        _ initType: InitType,
        _ configurationName: String = ""
    ) -> ([String], [String], [String], Bool) {
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
        var genericParams = [String]()
        
        func viewBuilderInit() {
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
        }
        
        func dataInit() {
            /// getting data types for each view builder property
            ///
            /// ["title": ["AttributedString, "Text""]]
            var dict: [String: [String]] = [:]
            for member in members {
                if let syntax = member.decl.as(VariableDeclSyntax.self),
                   case let bindings = syntax.bindings,
                   let pattern = bindings.first,
                   let identifier = pattern.pattern.as(IdentifierPatternSyntax.self)?.identifier,
                   syntax.bindingSpecifier.tokenKind == .keyword(.let),
                   let tupleList = pattern.initializer?.value.as(TupleExprSyntax.self)?.elements
                {
                    for labeledExpr in tupleList {
                        guard let stringLiteral = labeledExpr.expression.as(StringLiteralExprSyntax.self),
                              let segment = stringLiteral.segments.first?.as(StringSegmentSyntax.self),
                              case let text = segment.content.text
                        else {
                            return
                        }
                              
                        dict[identifier.text.trimLeadingUnderscore(), default: []].append(text)
                    }
                }
            }
            
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
                        
                        let shouldUnderscoreParameter = wildcards.contains("\(identifier)")
                        ret += shouldUnderscoreParameter ? "_ " : ""
                        
                        return ret
                    }()
                    
                    let shouldAddScaping = type.is(FunctionTypeSyntax.self)
                    let typePrefix = "\(shouldAddScaping ? "@escaping " : "")"
                    let paramType = {
                        if let dataType = dict[identifier.text]?.first {
                            return dataType
                        } else if isViewBuilder {
                            return "() -> \(type)"
                        } else {
                            return "\(type)"
                        }
                    }()
                    
                    var parameter = "\(identifierPrefix)\(identifier): \(typePrefix)\(paramType)"
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
                        
                        var viewType: String?
                        if let list = dict[identifier.text],
                           list.count > 1,
                           case let _viewType = list[1]
                        {
                            viewType = _viewType
                            
                            genericParams.append("\(type) == \(_viewType)")
                        }
                        
                        let value = {
                            if let viewType {
                                return "\(viewType)(\(identifier))"
                            } else if isViewBuilder {
                                return "\(identifier)()"
                            } else {
                                return "\(identifier)"
                            }
                        }()
                        assignments.append("\(memberAccessorPrefix).\(identifier) = \(value)")
                    }
                }
            }
        }
        
        func configurationInit() {
            for member in members {
                if let syntax = member.decl.as(VariableDeclSyntax.self),
                   case let bindings = syntax.bindings,
                   let pattern = bindings.first,
                   let identifier = pattern.pattern.as(IdentifierPatternSyntax.self)?.identifier,
                   let type = pattern.typeAnnotation?.type,
                   !(syntax.bindingSpecifier.tokenKind == .keyword(.let) && pattern.initializer != nil)
                {
                    let isViewBuilder = syntax.isViewBuilder
                    genericParams.append("\(type) == \(configurationName).\(identifier.text.firstLetterUppercase())")
//                    let identifierPrefix = {
//                        var ret = ""
//
//                        ret += isViewBuilder ? "@ViewBuilder " : ""
//
//                        let shouldUnderscoreParameter = wildcards.contains("\(identifier)")
//                        ret += shouldUnderscoreParameter ? "_ " : ""
//
//                        return ret
//                    }()
//
//                    let shouldAddScaping = type.is(FunctionTypeSyntax.self)
//                    let typePrefix = "\(shouldAddScaping ? "@escaping " : "")"
//                    let type = {
//                        guard isViewBuilder else { return type }
//                        return "() -> \(type)"
//                    }()
                    
//                    var parameter = "\(identifierPrefix)\(identifier): \(typePrefix)\(type)"
//                    if let defaultValue = defaults["\(identifier)"] {
//                        let value = defaultValue.containsPattern("\\(\\)\"")
//                        ? defaultValue.removePattern("\"(.*)\"")
//                        : defaultValue
//                        parameter += " = " + "\(value)"
//                    } else if let initializer = pattern.initializer {
//                        parameter += "\(initializer)"
//                    }
                    
                    let memberAccessor = getModifiers("", syntax.modifiers)
                    let memberAccessorPrefix = (memberAccessor.contains("static") ? "S" : "s") + "elf"
                    
                    let isComputedProperty = pattern.accessorBlock?.is(CodeBlockSyntax.self) == true
                    let isUsingAccessors = pattern.accessorBlock?.is(AccessorBlockSyntax.self) == true
                    if !isComputedProperty, !isUsingAccessors {
                        assignments.append("\(memberAccessorPrefix).\(identifier) = configuration.\(identifier)")
                    }
                }
            }
        }
        
        switch initType {
        case .viewbuilder:
            viewBuilderInit()
        case .data:
            dataInit()
        default:
            configurationInit()
        }
        
        return (parameters, assignments, genericParams, accessorType)
    }
    
    static func getInitParamList(
        of node: AttributeSyntax,
        providingMembersOf declaration: some DeclGroupSyntax,
        in context: some MacroExpansionContext
    ) -> [String] {
        guard let members = declaration.as(StructDeclSyntax.self)?.memberBlock.members else {
            return []
        }
        
        var ret: [String] = []
        for member in members {
            if let syntax = member.decl.as(VariableDeclSyntax.self),
               case let bindings = syntax.bindings,
               let pattern = bindings.first,
               let identifier = pattern.pattern.as(IdentifierPatternSyntax.self)?.identifier,
               let type = pattern.typeAnnotation?.type,
               !(syntax.bindingSpecifier.tokenKind == .keyword(.let) && pattern.initializer != nil)
            {
                ret.append(identifier.text)
            }
        }
        
        return ret
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
    
    func trimLeadingUnderscore() -> String {
        var chars = Array(self)
        var i = 0
        while i < chars.count, chars[i] == "_" {
            i += 1
        }
        return String(chars[i ..< chars.count])
    }
    
    func firstLetterUppercase() -> String {
        if self.isEmpty {
            return self
        }
        
        var chars = Array(self)
        chars[0] = Character(chars[0].uppercased())
        return String(chars)
    }
}

extension AttachedMacro {
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
