import SwiftSyntax
import SwiftSyntaxBuilder
import SwiftSyntaxMacros

/// Func With unique name.
public enum ComponentStyleEnvironmentValues: MemberMacro {
    public static func expansion(of node: AttributeSyntax, providingMembersOf declaration: some DeclGroupSyntax, in context: some MacroExpansionContext) throws -> [DeclSyntax] {
        var ret: [DeclSyntax] = []
        let styleEnumCases = declaration.styleEnumCases
        for style in styleEnumCases {
            let styleDecl = try VariableDeclSyntax(.init(stringLiteral: "var \(style): any \(style.firstLetterUppercased())")) {
                "\(raw: style)Stack.last ?? .base"
            }
            
            let styleStackDecl = try VariableDeclSyntax(.init(stringLiteral: "var \(style)Stack: [any \(style.firstLetterUppercased())]")) {
                AccessorDeclSyntax(stringLiteral: "get { self[\(style.firstLetterUppercased())StackKey.self] }")
                
                AccessorDeclSyntax(stringLiteral: "set { self[\(style.firstLetterUppercased())StackKey.self] = newValue }")
            }
            
            ret.append(contentsOf: [.init(styleDecl), .init(styleStackDecl)])
        }
        
        return ret
    }
}
