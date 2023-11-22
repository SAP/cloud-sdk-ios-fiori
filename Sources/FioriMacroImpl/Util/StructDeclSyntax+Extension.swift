import Foundation
import SwiftSyntax
import SwiftSyntaxBuilder
import SwiftSyntaxMacros

extension StructDeclSyntax {
    var lowerCasedName: String {
        name.text.lowercased()
    }
}
