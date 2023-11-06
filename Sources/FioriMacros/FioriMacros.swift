import Foundation
import SwiftSyntax
import SwiftSyntaxMacros

struct FioriIconMacro: MemberMacro {
    static func expansion(of node: AttributeSyntax, providingMembersOf declaration: some DeclGroupSyntax, in context: some MacroExpansionContext) throws -> [DeclSyntax] {
        let backingProperties: [DeclSyntax] = declaration.memberBlock.members.compactMap {
            guard let variable = $0.decl.as(VariableDeclSyntax.self) else { return nil }
            guard let binding = variable.bindings.first else { return nil }
            guard let identifier = binding.pattern.as(IdentifierPatternSyntax.self) else { return nil }
            let name = identifier.identifier
            if name.text == "accept" {
                return "public static let _\(name) = UIImage(named: \"fiori.accept\", in: Bundle.accessor, with: nil)!"
            }
            return nil
        }
        return backingProperties
    }
}
