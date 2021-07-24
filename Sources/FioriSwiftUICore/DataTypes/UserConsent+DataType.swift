
import SwiftUI

enum UserConsentState: Int {
    case userConsentInit
    case userConsentCancel
    case userConsentStatus
}

public struct UserConsentFormData {
    public var pages: [UserConsentPageModel]?
    public var isRequired: Bool = true
    public init() {}
}
