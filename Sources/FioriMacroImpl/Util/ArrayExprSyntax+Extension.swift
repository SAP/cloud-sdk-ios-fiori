import Foundation
import SwiftSyntax
import SwiftSyntaxBuilder
import SwiftSyntaxMacros

extension ArrayExprSyntax {
    var stringValues: [String] {
        self.elements.compactMap { element in
            guard let stringExpr = element.expression.as(StringLiteralExprSyntax.self),
                  let value = stringExpr.segments.first?.as(StringSegmentSyntax.self)?.content.text
            else {
                return nil
            }
            
            return value
        }
    }
}
