import Foundation
import SwiftCompilerPlugin
import SwiftSyntax
import SwiftSyntaxMacros

@main struct Plugin: CompilerPlugin {
    let providingMacros: [Macro.Type] = [
        FioriIconMacro.self,
        InitMacro.self,
        BaseComponent.self
    ]
}