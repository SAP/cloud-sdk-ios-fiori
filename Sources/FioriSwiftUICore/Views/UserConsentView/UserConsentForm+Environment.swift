import Foundation
import SwiftUI

struct UserConsentFormDidAllow: EnvironmentKey {
    public static let defaultValue: (() -> Void)? = nil
}

struct UserConsentFormDidDeny: EnvironmentKey {
    public static let defaultValue: ((Bool) -> Void)? = nil
}

struct UserConsentFormDidCancel: EnvironmentKey {
    public static let defaultValue: (() -> Void)? = nil
}

extension EnvironmentValues {
    var userConsentFormDidAllow: (() -> Void)? {
        get { self[UserConsentFormDidAllow.self] }
        set { self[UserConsentFormDidAllow.self] = newValue }
    }
    
    var userConsentFormDidDeny: ((Bool) -> Void)? {
        get { self[UserConsentFormDidDeny.self] }
        set { self[UserConsentFormDidDeny.self] = newValue }
    }
    
    var userConsentFormDidCancel: (() -> Void)? {
        get { self[UserConsentFormDidCancel.self] }
        set { self[UserConsentFormDidCancel.self] = newValue }
    }
}

extension View {
    func userConsentFormDidAllow(_ closure: (() -> Void)?) -> some View {
        self.environment(\.userConsentFormDidAllow, closure)
    }
    
    func userConsentFormDidDeny(_ closure: ((Bool) -> Void)?) -> some View {
        self.environment(\.userConsentFormDidDeny, closure)
    }
    
    func userConsentFormDidCancel(_ closure: (() -> Void)?) -> some View {
        self.environment(\.userConsentFormDidCancel, closure)
    }
}
