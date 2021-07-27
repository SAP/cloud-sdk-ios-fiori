import SwiftUI

/// Data types for user consent form state
enum UserConsentState: Int {
    case userConsentInit
    case userConsentCancel
    case userConsentStatus
}

/// Data types for user consent form
public struct UserConsentFormData {
    /// User consent page in the user consent form
    public var pages: [UserConsentPageModel]?
    /// Boolean denoting whether the user consent form is a mandatory form or not. It is true by default.
    public var isRequired: Bool = true
    public init() {}
}
