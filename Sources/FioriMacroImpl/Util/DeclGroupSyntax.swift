import Foundation
import SwiftSyntax
import SwiftSyntaxBuilder
import SwiftSyntaxMacros

extension SyntaxProtocol {
    var typeName: String? {
        if let structDecl = self.as(StructDeclSyntax.self) {
            return structDecl.name.text
        }
        if let classDecl = self.as(ClassDeclSyntax.self) {
            return classDecl.name.text
        }
        return nil
    }
}
