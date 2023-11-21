import Foundation
import SwiftDiagnostics

enum InitMacroDiagnostic: Error,
    DiagnosticMessage
{
    case notAsClass(String)
    case notAsStruct(String)

    private var rawValue: String {
        switch self {
        case .notAsClass(let macro):
            return "notAsClass_\(macro)"
        case .notAsStruct(let macro):
            return "notAsStruct_\(macro)"
        }
    }

    // MARK: - DiagnosticMessage

    var severity: DiagnosticSeverity { .error }

    var message: String {
        switch self {
        case .notAsClass(let macro):
            return "'@\(macro)' can only be applied to a class."
        case .notAsStruct(let macro):
            return "'@\(macro)' can only be applied to a struct."
        }
    }

    var diagnosticID: MessageID {
        .init(domain: "InitMacroImplementation", id: self.rawValue)
    }
}
