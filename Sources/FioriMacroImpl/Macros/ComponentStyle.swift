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
        
        let styleBoxDecl = try StructDeclSyntax(.init(stringLiteral: "struct Any\(typeName): \(typeName)")) {
            "let content: (\(raw: componentName)Configuration) -> any View"
            
            try InitializerDeclSyntax(.init(stringLiteral: "init(@ViewBuilder _ content: @escaping (\(componentName)Configuration) -> any View)")) {
                "self.content = content"
            }
            
            try FunctionDeclSyntax(.init(stringLiteral: "public func makeBody(_ configuration: \(componentName)Configuration) -> some View")) {
                "self.content(configuration).typeErased"
            }
        }
        ret.append(.init(styleBoxDecl))
        
        return ret
    }
}
