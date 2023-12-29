import Foundation
import SwiftDiagnostics
import SwiftSyntax
import SwiftSyntaxBuilder
import SwiftSyntaxMacros

public struct StyleModifierViewExtension: DeclarationMacro {
    public static func expansion(of node: some SwiftSyntax.FreestandingMacroExpansionSyntax, in context: some SwiftSyntaxMacros.MacroExpansionContext) throws -> [SwiftSyntax.DeclSyntax] {
        guard let styles: [String] = node.arguments.first?.expression.as(ArrayExprSyntax.self)?.elements.compactMap({ element in
            guard let stringExpr = element.expression.as(StringLiteralExprSyntax.self),
                  let style = stringExpr.segments.first?.as(StringSegmentSyntax.self)?.content.text
            else {
                return nil
            }
            
            return style
        }) else {
            return []
        }
        
        return styles.flatMap { style -> [DeclSyntax] in
            guard style.hasSuffix("Style"),
                  case let componentName = String(style.dropLast(5))
            else {
                return []
            }
            
            let styleProtocolDecl: DeclSyntax =
                """
                func \(raw: style.firstLetterlowercased())(_ style: some \(raw: style.firstLetterUppercased())) -> some View {
                    self.transformEnvironment(\\.\(raw: style.firstLetterlowercased())Stack) { stack in
                        stack.append(style)
                    }
                }
                """
            
            let closureDecl: DeclSyntax =
                """
                func \(raw: style.firstLetterlowercased())(@ViewBuilder content: @escaping (\(raw: componentName.firstLetterUppercased())Configuration) -> some View) -> some View {
                    self.transformEnvironment(\\.\(raw: style.firstLetterlowercased())Stack) { stack in
                        let style = Any\(raw: style.firstLetterUppercased())(content)
                        stack.append(style)
                    }
                }
                """
            
            return [styleProtocolDecl, closureDecl]
        }
    }
}
