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
        if let protocolDecl = self.as(ProtocolDeclSyntax.self) {
            return protocolDecl.name.text
        }
        return nil
    }
}
