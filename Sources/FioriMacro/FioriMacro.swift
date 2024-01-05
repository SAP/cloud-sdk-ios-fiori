import Foundation
import SwiftUI

/// Generates a public initializer.
///
/// Example:
///
///   @Init(defaults: [:], wildcards: [], public: true)
///   public final class Test {
///       let age: Int
///       let cash: Double?
///       let name: String
///   }
///
/// produces
///
///    public final class Test {
///        let age: Int
///        let cash: Double?
///        let name: String
///
///        public init(
///            age: Int,
///            cash: Double?,
///            name: String
///        ) {
///            self.age = age
///            self.cash = cash
///            self.name = name
///        }
///    }
///
///    - Parameters:
///      - defaults: Dictionary containing defaults for the specificed properties.
///      - wildcards: Array containing the specificed properties that should be wildcards.
///      - public: The flag to indicate if the init is public or not.
@attached(member, names: named(init))
public macro Init(
    defaults: [String: Any] = [:],
    wildcards: [String] = [],
    public: Bool = true
) = #externalMacro(
    module: "FioriMacroImpl",
    type: "InitMacro"
)

@attached(member, names: named(_registrar), arbitrary)
public macro FioriIcon() = #externalMacro(module: "FioriMacroImpl", type: "FioriIconMacro")

@attached(extension, names: named(modifier), named(concat) /* , named(resolve) */ )
@attached(member, names: named(Body), named(makeBody))
@attached(peer, names: prefixed(`Any`), suffixed(Modifier), prefixed(Resolved), suffixed(StackKey))
public macro ComponentStyle() = #externalMacro(module: "FioriMacroImpl", type: "ComponentStyle")

@attached(member, names: arbitrary)
public macro ComponentStyleEnvironmentValues() = #externalMacro(module: "FioriMacroImpl", type: "ComponentStyleEnvironmentValues")

@freestanding(declaration, names: arbitrary)
public macro StyleModifierViewExtension(_ styles: [String]) = #externalMacro(module: "FioriMacroImpl", type: "StyleModifierViewExtension")

@freestanding(declaration, names: arbitrary)
public macro Template(_ template: String, _ styles: [String]) = #externalMacro(module: "FioriMacroImpl", type: "Template")
