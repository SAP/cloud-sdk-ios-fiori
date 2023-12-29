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
        if let declRefExp = self.as(DeclReferenceExprSyntax.self) {
            return declRefExp.baseName.text
        }
        return nil
    }
    
    var styleEnumCases: [String] {
        var memberBlock: MemberBlockSyntax?
        if let extensionDecl = self.as(ExtensionDeclSyntax.self) {
            memberBlock = extensionDecl.memberBlock
        }
        if let structDecl = self.as(StructDeclSyntax.self) {
            memberBlock = structDecl.memberBlock
        }
        if let classDecl = self.as(ClassDeclSyntax.self) {
            memberBlock = classDecl.memberBlock
        }
        
        guard let styleEnumDecl = memberBlock?.members.compactMap({ item in
            if let enumDecl = item.decl.as(EnumDeclSyntax.self),
               enumDecl.name.text == "Style",
               enumDecl.modifiers.contains(where: { $0.name.tokenKind == .keyword(.private) })
            {
                return enumDecl
            }
            return nil
        }).first
        else {
            return []
        }
        
        return styleEnumDecl.memberBlock.members.flatMap { element in
            if let enumCaseDecl = element.decl.as(EnumCaseDeclSyntax.self) {
                return enumCaseDecl.elements.map { caseElement in
                    caseElement.name.text
                }
            }
            return []
        }
    }
}
