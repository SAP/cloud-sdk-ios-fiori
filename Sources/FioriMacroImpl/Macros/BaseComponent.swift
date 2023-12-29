import Foundation
import SwiftSyntax
import SwiftSyntaxBuilder
import SwiftSyntaxMacros

public struct BaseComponent: MemberMacro {
    public static func expansion(of node: AttributeSyntax, providingMembersOf declaration: some DeclGroupSyntax, in context: some MacroExpansionContext) throws -> [DeclSyntax] {
        var ret: [DeclSyntax] = []
        
        if let structDecl = declaration.as(StructDeclSyntax.self),
           case let name = structDecl.firstCharlowerCased()
        {
            /// Add style environment variable
            /// ```
            /// @Environment(\.titleStyle) var style
            /// ```
            let envDecl = try VariableDeclSyntax(SyntaxNodeString(stringLiteral: "@Environment(\\.\(name)Style) var style"))
            ret.append("\(raw: envDecl)")
            
            /// ```
            /// fileprivate var _shouldApplyDefaultStyle = true
            /// ```
            let shouldApplyDefaultStyleDecl = try VariableDeclSyntax(SyntaxNodeString(stringLiteral: "fileprivate var _shouldApplyDefaultStyle = true"))
            ret.append("\(raw: shouldApplyDefaultStyleDecl)")
        }
        
        ret.append(contentsOf: try InitMacro.createInit(of: node, providingMembersOf: declaration, in: context))
        
        return ret
    }
}

extension BaseComponent: ExtensionMacro {
    public static func expansion(of node: SwiftSyntax.AttributeSyntax, attachedTo declaration: some SwiftSyntax.DeclGroupSyntax, providingExtensionsOf type: some SwiftSyntax.TypeSyntaxProtocol, conformingTo protocols: [SwiftSyntax.TypeSyntax], in context: some SwiftSyntaxMacros.MacroExpansionContext) throws -> [SwiftSyntax.ExtensionDeclSyntax] {
        var ret: [ExtensionDeclSyntax] = []
        ret.append(contentsOf: try self.createInitExtension(of: node, attachedTo: declaration, providingExtensionsOf: type, conformingTo: protocols, in: context, initType: .data))
        ret.append(contentsOf: try self.createInitExtension(of: node, attachedTo: declaration, providingExtensionsOf: type, conformingTo: protocols, in: context, initType: .configuration))
        ret.append(contentsOf: try self.createPrivateHelperExtension(of: node, attachedTo: declaration, providingExtensionsOf: type, conformingTo: protocols, in: context))
        ret.append(contentsOf: try self.createViewExtension(of: node, attachedTo: declaration, providingExtensionsOf: type, conformingTo: protocols, in: context))
        return ret
    }
    
    static func createInitExtension(of node: SwiftSyntax.AttributeSyntax, attachedTo declaration: some SwiftSyntax.DeclGroupSyntax, providingExtensionsOf type: some SwiftSyntax.TypeSyntaxProtocol, conformingTo protocols: [SwiftSyntax.TypeSyntax], in context: some SwiftSyntaxMacros.MacroExpansionContext, initType: InitType) throws -> [SwiftSyntax.ExtensionDeclSyntax] {
        guard let name = declaration.as(StructDeclSyntax.self)?.name.text else {
            return []
        }
        
        var initDecl: [DeclSyntax]
        switch initType {
        case .data:
            initDecl = try createDataInit(of: node, providingMembersOf: declaration, in: context)
        default:
            initDecl = try createConfigurationInit(of: node, providingMembersOf: declaration, in: context)
        }

        let header = "public extension \(name)"
        let extensionDecl = try ExtensionDeclSyntax(.init(stringLiteral: header)) {
            for decl in initDecl {
                MemberBlockItemSyntax(decl: decl)
            }
        }
        return [extensionDecl]
    }
    
    static func createPrivateHelperExtension(of node: SwiftSyntax.AttributeSyntax, attachedTo declaration: some SwiftSyntax.DeclGroupSyntax, providingExtensionsOf type: some SwiftSyntax.TypeSyntaxProtocol, conformingTo protocols: [SwiftSyntax.TypeSyntax], in context: some SwiftSyntaxMacros.MacroExpansionContext) throws -> [SwiftSyntax.ExtensionDeclSyntax] {
        guard let name = declaration.as(StructDeclSyntax.self)?.name.text else {
            return []
        }
        
        var methods: [FunctionDeclSyntax] = []
        
        let shouldApplyDefaultStyleFuncDecl = try FunctionDeclSyntax(.init(stringLiteral: "func shouldApplyDefaultStyle(_ bool: Bool) -> some View")) {
            let lines =
                """
                var s = self
                s._shouldApplyDefaultStyle = bool
                return s
                """
                .components(separatedBy: "\n")
            for line in lines {
                CodeBlockItemSyntax(stringLiteral: line)
            }
        }
        methods.append(shouldApplyDefaultStyleFuncDecl)
        
        let members = declaration.as(StructDeclSyntax.self)?.memberBlock.members
        var paramList: [String] = []
        for member in members ?? [] {
            if let syntax = member.decl.as(VariableDeclSyntax.self),
               case let bindings = syntax.bindings,
               let pattern = bindings.first,
               let identifier = pattern.pattern.as(IdentifierPatternSyntax.self)?.identifier,
               !(syntax.bindingSpecifier.tokenKind == .keyword(.let) && pattern.initializer != nil)
            {
                var param: String
                if syntax.isViewBuilder {
                    param = "\(identifier): { self.\(identifier) }"
                } else {
                    param = "\(identifier): self.\(identifier)"
                }
                paramList.append(param)
            }
        }
        
        let defaultStyleFuncDecl = try FunctionDeclSyntax(.init(stringLiteral: "func defaultStyle() -> some View")) {
            let lines =
                """
                \(name)(\(paramList.joined(separator: ",\n")))
                .shouldApplyDefaultStyle(false)
                .\(name.firstLetterlowercased())Style(.fiori)
                """
                .components(separatedBy: "\n")
            for line in lines {
                CodeBlockItemSyntax(stringLiteral: line)
            }
        }
        methods.append(defaultStyleFuncDecl)
        
        let extensionDecl = try ExtensionDeclSyntax(.init(stringLiteral: "private extension \(name)")) {
            for method in methods {
                method
            }
        }
        
        return [extensionDecl]
    }
    
    static func createViewExtension(of node: SwiftSyntax.AttributeSyntax, attachedTo declaration: some SwiftSyntax.DeclGroupSyntax, providingExtensionsOf type: some SwiftSyntax.TypeSyntaxProtocol, conformingTo protocols: [SwiftSyntax.TypeSyntax], in context: some SwiftSyntaxMacros.MacroExpansionContext) throws -> [SwiftSyntax.ExtensionDeclSyntax] {
        guard let name = declaration.as(StructDeclSyntax.self)?.name.text else {
            return []
        }
        
        let members = declaration.as(StructDeclSyntax.self)?.memberBlock.members
        var paramList: [String] = []
        for member in members ?? [] {
            if let syntax = member.decl.as(VariableDeclSyntax.self),
               case let bindings = syntax.bindings,
               let pattern = bindings.first,
               let identifier = pattern.pattern.as(IdentifierPatternSyntax.self)?.identifier,
               !(syntax.bindingSpecifier.tokenKind == .keyword(.let) && pattern.initializer != nil)
            {
                var param: String
                if syntax.isViewBuilder {
                    param = "\(identifier): .init(self.\(identifier))"
                } else {
                    param = "\(identifier): self.\(identifier)"
                }
                paramList.append(param)
            }
        }
        
        let header = "public var body: some View"
        let bodyDecl = try VariableDeclSyntax(.init(stringLiteral: header)) {
            let lines =
                """
                if _shouldApplyDefaultStyle {
                    self.defaultStyle()
                } else {
                    style.resolve(configuration: .init(\(paramList.joined(separator: ", ")))).typeErased
                        .transformEnvironment(\\.\(name.firstLetterlowercased())StyleStack) { stack in
                            if !stack.isEmpty {
                                stack.removeLast()
                            }
                        }
                }
                """
                .components(separatedBy: "\n")
            for line in lines {
                CodeBlockItemSyntax(stringLiteral: line)
            }
        }
        
        let extensionDecl = try ExtensionDeclSyntax(.init(stringLiteral: "extension \(name): View")) {
            bodyDecl
        }
        
        return [extensionDecl]
    }
    
//    static func createStyleExtension(of node: SwiftSyntax.AttributeSyntax, attachedTo declaration: some SwiftSyntax.DeclGroupSyntax, providingExtensionsOf type: some SwiftSyntax.TypeSyntaxProtocol, conformingTo protocols: [SwiftSyntax.TypeSyntax], in context: some SwiftSyntaxMacros.MacroExpansionContext) throws -> [SwiftSyntax.ExtensionDeclSyntax] {
//        guard let name = declaration.typeName else {
//            return []
//        }
//
//        var ret: [ExtensionDeclSyntax] = []
//
//        let baseStyleExt = try ExtensionDeclSyntax(.init(stringLiteral: "extension \(name)Style where Self == \(name)BaseStyle")) {
//            try VariableDeclSyntax(.init(stringLiteral: "static var base: \(name)BaseStyle")) {
//                FunctionCallExprSyntax(calledExpression: DeclReferenceExprSyntax(baseName: .identifier("\(name)BaseStyle")), arguments: [])
//            }
//        }
//        ret.append(baseStyleExt)
//
//        let fioriStyleExt = try ExtensionDeclSyntax(.init(stringLiteral: "extension \(name)Style where Self == \(name)FioriStyle")) {
//            try VariableDeclSyntax(.init(stringLiteral: "static var fiori: \(name)FioriStyle")) {
//                FunctionCallExprSyntax(calledExpression: DeclReferenceExprSyntax(baseName: .identifier("\(name)FioriStyle")), arguments: [])
//            }
//        }
//        ret.append(fioriStyleExt)
//
//        return ret
//    }
}

extension BaseComponent: PeerMacro {
    public static func expansion(of node: SwiftSyntax.AttributeSyntax, providingPeersOf declaration: some SwiftSyntax.DeclSyntaxProtocol, in context: some SwiftSyntaxMacros.MacroExpansionContext) throws -> [SwiftSyntax.DeclSyntax] {
        guard let typeName = declaration.typeName else {
            return []
        }
        
        var ret: [DeclSyntax] = []
        
        let configurationDecl = try StructDeclSyntax(.init(stringLiteral: "public struct \(typeName)Configuration")) {
            let variableDecls = declaration.as(StructDeclSyntax.self)?.getInitVariableList() ?? []
            
            for varDecl in variableDecls {
                let name = varDecl.name
                
                if varDecl.isViewBuilder {
                    let variableDecl = try VariableDeclSyntax(.init(stringLiteral: "public let \(name): \(name.firstLetterUppercased())"))
                    MemberBlockItemSyntax(decl: variableDecl)
                    
                    let typealiasDecl = try TypeAliasDeclSyntax(.init(stringLiteral: "public typealias \(name.firstLetterUppercased()) = ConfigurationViewWrapper"))
                    MemberBlockItemSyntax(decl: typealiasDecl)
                } else {
                    if let type = varDecl.typeName {
                        let variableDecl = try VariableDeclSyntax(.init(stringLiteral: "let \(name): \(type)"))
                        MemberBlockItemSyntax(decl: variableDecl)
                    }
                }
            }
        }
        ret.append(.init(configurationDecl))
        
        return ret
    }
}
