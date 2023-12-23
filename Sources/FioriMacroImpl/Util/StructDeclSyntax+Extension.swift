import Foundation
import SwiftSyntax
import SwiftSyntaxBuilder
import SwiftSyntaxMacros

extension StructDeclSyntax {
    func firstCharlowerCased() -> String {
        var char = Array(name.text)
        char[0] = Character(char[0].lowercased())
        return String(char)
    }
}

extension StructDeclSyntax {
    func getInitVariableList() -> [VariableDeclSyntax] {
        let members = self.memberBlock.members
        var ret: [VariableDeclSyntax] = []
        for member in members {
            if let varDecl = member.decl.as(VariableDeclSyntax.self),
               case let bindings = varDecl.bindings,
               let pattern = bindings.first,
               !(varDecl.bindingSpecifier.tokenKind == .keyword(.let) && pattern.initializer != nil)
            {
                ret.append(varDecl)
            }
        }
        
        return ret
    }
}
