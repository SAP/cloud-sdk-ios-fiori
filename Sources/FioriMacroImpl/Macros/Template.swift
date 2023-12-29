import Foundation
import SwiftSyntax
import SwiftSyntaxBuilder
import SwiftSyntaxMacros

public struct Template: DeclarationMacro {
    public static func expansion(of node: some SwiftSyntax.FreestandingMacroExpansionSyntax, in context: some SwiftSyntaxMacros.MacroExpansionContext) throws -> [SwiftSyntax.DeclSyntax] {
        var arguments = node.arguments
        guard let template = arguments.remove(at: arguments.startIndex).expression.as(StringLiteralExprSyntax.self)?.segments.first?.as(StringSegmentSyntax.self)?.content.text,
              let components = arguments.first?.expression.as(ArrayExprSyntax.self)?.stringValues
        else {
            return []
        }
        
        return components.map { component -> DeclSyntax in
            let ret = template.replacingOccurrences(of: "{0}", with: component)
            return DeclSyntax(stringLiteral: ret)
        }
    }
}
