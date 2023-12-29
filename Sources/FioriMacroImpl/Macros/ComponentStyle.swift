import Foundation
import SwiftSyntax
import SwiftSyntaxBuilder
import SwiftSyntaxMacros

public struct ComponentStyle: MemberMacro {
    public static func expansion(of node: AttributeSyntax, providingMembersOf declaration: some DeclGroupSyntax, in context: some MacroExpansionContext) throws -> [DeclSyntax] {
        guard let typeName = declaration.typeName,
              typeName.hasSuffix("Style"),
              case let componentName = typeName.dropLast(5)
        else {
            return []
        }
        
        var ret: [DeclSyntax] = []
        
        ret.append(.init(stringLiteral: "associatedtype Body: View"))
        ret.append(.init(try FunctionDeclSyntax(SyntaxNodeString(stringLiteral: "func makeBody(_ configuration: \(componentName)Configuration) -> Body"))))
        
        return ret
    }
}

extension ComponentStyle: PeerMacro {
    public static func expansion(of node: SwiftSyntax.AttributeSyntax, providingPeersOf declaration: some SwiftSyntax.DeclSyntaxProtocol, in context: some SwiftSyntaxMacros.MacroExpansionContext) throws -> [SwiftSyntax.DeclSyntax] {
        guard let typeName = declaration.typeName,
              typeName.hasSuffix("Style"),
              case let componentName = typeName.dropLast(5)
        else {
            return []
        }
        
        var ret: [DeclSyntax] = []
        
        let anyStyleDecl = try StructDeclSyntax(.init(stringLiteral: "struct Any\(typeName): \(typeName)")) {
            "let content: (\(raw: componentName)Configuration) -> any View"
            
            try InitializerDeclSyntax(.init(stringLiteral: "init(@ViewBuilder _ content: @escaping (\(componentName)Configuration) -> any View)")) {
                "self.content = content"
            }
            
            try FunctionDeclSyntax(.init(stringLiteral: "public func makeBody(_ configuration: \(componentName)Configuration) -> some View")) {
                "self.content(configuration).typeErased"
            }
        }
        ret.append(.init(anyStyleDecl))
        
        let styleModifierDecl = try StructDeclSyntax(.init(stringLiteral: "public struct \(typeName)Modifier<Style: \(typeName)>: ViewModifier")) {
            "let style: Style"
            
            try FunctionDeclSyntax(.init(stringLiteral: "public func body(content: Content) -> some View")) {
                "content.\(raw: typeName.firstLetterlowercased())(self.style)"
            }
        }
        ret.append(.init(styleModifierDecl))
        
        let resolvedStyleDecl = try StructDeclSyntax(.init(stringLiteral: "struct Resolved\(typeName)<Style: \(typeName)>: View")) {
            "let style: Style"
            "let configuration: \(raw: componentName)Configuration"
            
            try VariableDeclSyntax(.init(stringLiteral: "var body: some View")) {
                "style.makeBody(configuration)"
            }
        }
        ret.append(.init(resolvedStyleDecl))
        
        let styleStackDecl = try StructDeclSyntax(.init(stringLiteral: "struct \(typeName)StackKey: EnvironmentKey")) {
            "static let defaultValue: [any \(raw: typeName)] = []"
        }
        ret.append(.init(styleStackDecl))
        
        return ret
    }
}

extension ComponentStyle: ExtensionMacro {
    public static func expansion(of node: SwiftSyntax.AttributeSyntax, attachedTo declaration: some SwiftSyntax.DeclGroupSyntax, providingExtensionsOf type: some SwiftSyntax.TypeSyntaxProtocol, conformingTo protocols: [SwiftSyntax.TypeSyntax], in context: some SwiftSyntaxMacros.MacroExpansionContext) throws -> [SwiftSyntax.ExtensionDeclSyntax] {
        guard let typeName = declaration.typeName,
              typeName.hasSuffix("Style"),
              case let componentName = typeName.dropLast(5)
        else {
            return []
        }
        
        var ret: [ExtensionDeclSyntax] = []
     
//        let baseStyleExt = try ExtensionDeclSyntax(.init(stringLiteral: "public extension \(typeName) where Self == \(componentName)BaseStyle")) {
//            try VariableDeclSyntax(.init(stringLiteral: "static var base: \(componentName)BaseStyle")) {
//                .init(stringLiteral: "\(componentName)BaseStyle()")
//            }
//        }
//        ret.append(baseStyleExt)
//
//        let fioriStyleExt = try ExtensionDeclSyntax(.init(stringLiteral: "public extension \(typeName) where Self == \(componentName)FioriStyle")) {
//            try VariableDeclSyntax(.init(stringLiteral: "static var fiori: \(componentName)FioriStyle")) {
//                .init(stringLiteral: "\(componentName)FioriStyle()")
//            }
//        }
//        ret.append(fioriStyleExt)
        
        let styleModifierExt = try ExtensionDeclSyntax(.init(stringLiteral: "public extension \(typeName)")) {
            try FunctionDeclSyntax(.init(stringLiteral: "func modifier(_ modifier: some ViewModifier) -> some \(typeName)")) {
                "ModifiedStyle(style: self, modifier: modifier)"
            }
            
            try FunctionDeclSyntax(.init(stringLiteral: "func concat(_ style: some \(typeName)) -> some \(typeName)")) {
                "style.modifier(\(raw: typeName)Modifier(style: self))"
            }
        }
        ret.append(styleModifierExt)
        
//        let resolveStyleExt = try ExtensionDeclSyntax(.init(stringLiteral: "extension \(typeName)")) {
//            try FunctionDeclSyntax(.init(stringLiteral: "func resolve(configuration: \(componentName)Configuration) -> some View")) {
//                "Resolved\(raw: typeName)(style: self, configuration: configuration)"
//            }
//        }
//        ret.append(resolveStyleExt)
        
        return ret
    }
}
