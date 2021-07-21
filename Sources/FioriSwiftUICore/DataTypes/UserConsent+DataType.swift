
import SwiftUI

public enum UserConsentState: Int {
    case userConsentInit
    case userConsentAllow
    case userConsentDeny
    case userConsentCancel
    case userConsentMoreInfo
    case userConsentStatus
}

public struct UserConsentFormData {
    public var pages: [UserConsentPageModel]?
    public var isRequired: Bool = true
    public init() {}
}
