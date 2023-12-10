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
