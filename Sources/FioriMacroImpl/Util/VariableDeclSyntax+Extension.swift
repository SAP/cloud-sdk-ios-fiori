import Foundation
import SwiftSyntax

extension VariableDeclSyntax {
    var isViewBuilder: Bool {
        self.attributes.contains { element in
            guard let attribute = element.as(AttributeSyntax.self),
                  attribute.atSign.tokenKind == .atSign,
                  let identifier = attribute.attributeName.as(IdentifierTypeSyntax.self),
                  identifier.name.text == "ViewBuilder"
            else {
                return false
            }
            
            return true
        }
    }
    
    var name: String {
        guard let pattern = self.bindings.first,
              let name = pattern.pattern.as(IdentifierPatternSyntax.self)?.identifier.text
        else {
            fatalError("Variable syntax \(self) has no identifier")
        }
        
        return name
    }
}
