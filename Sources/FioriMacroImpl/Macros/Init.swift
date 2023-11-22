import Foundation
import SwiftDiagnostics
import SwiftSyntax
import SwiftSyntaxBuilder
import SwiftSyntaxMacros

// Reference: https://github.com/LeonardoCardoso/InitMacro/tree/main

/// Generates a public initializer.
///
/// Example:
///
///     @Init(defaults: [:], wildcards: [], public: true)
///     public final class Test {
///         let age: Int
///         let cash: Double?
///         let name: String
///     }
///
/// produces
///
///     public final class Test {
///         let age: Int
///         let cash: Double?
///         let name: String
///
///         public init(
///             age: Int,
///             cash: Double?,
///             name: String
///         ) {
///             self.age = age
///             self.cash = cash
///             self.name = name
///         }
///     }
///
///    - Parameters:
///      - defaults: Dictionary containing defaults for the specificed properties.
///      - wildcards: Array containing the specificed properties that should be wildcards.
///      - public: The flag to indicate if the init is public or not.
public struct InitMacro: MemberMacro {
    public static func expansion(
        of attribute: AttributeSyntax,
        providingMembersOf declaration: some DeclGroupSyntax,
        in context: some MacroExpansionContext
    ) throws -> [DeclSyntax] {
        try createInit(of: attribute, providingMembersOf: declaration, in: context)
    }
}
