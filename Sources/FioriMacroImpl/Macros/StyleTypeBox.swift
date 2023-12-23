import Foundation
import SwiftSyntax
import SwiftSyntaxBuilder
import SwiftSyntaxMacros

public struct StyleTypeEraser: PeerMacro {
    public static func expansion(of node: SwiftSyntax.AttributeSyntax, providingPeersOf declaration: some SwiftSyntax.DeclSyntaxProtocol, in context: some SwiftSyntaxMacros.MacroExpansionContext) throws -> [SwiftSyntax.DeclSyntax] {
        guard let typeName = declaration.typeName,
              typeName.hasSuffix("Style"),
              case let compName = typeName.dropLast(5)
        else {
            return []
        }
        
        var ret: [DeclSyntax] = []
        
        let anyStyleDecl = try StructDeclSyntax(.init(stringLiteral: "public struct Any\(typeName): \(typeName)")) {
            "let content: (\(raw: compName)Configuration) -> any View"
            
            try InitializerDeclSyntax(.init(stringLiteral: "init(@ViewBuilder _ content: @escaping (\(compName)Configuration) -> any View)")) {
                "self.content = content"
            }
            
            try FunctionDeclSyntax(.init(stringLiteral: "public func makeBody(_ configuration: \(compName)Configuration) -> some View")) {
                "self.content(configuration).typeErased"
            }
        }
        ret.append(.init(anyStyleDecl))
        
        return ret
    }
}
