import Combine
import FioriSwiftUICore
import SwiftUI

struct AuthenticationExamples: View {
    @State private var showsIllustratedMessage = false
    @State private var showsDynamicAuth = false
    
    var body: some View {
        List {
            NavigationLink(
                destination: AuthenticationExample(showsIllustratedMessage: self.showsIllustratedMessage))
            {
                Text("AuthenticationScreen")
            }
            
            NavigationLink(
                destination: BasicAuthenticationExample(showsIllustratedMessage: self.showsIllustratedMessage))
            {
                Text("Basic Authentication")
            }
            
            Button("Dynamic Authentication") {
                self.showsDynamicAuth = true
            }

            NavigationLink(
                destination: PasscodePolicyAuthenticationExample(showsIllustratedMessage: self.showsIllustratedMessage))
            {
                Text("Passcode Policy")
            }

            NavigationLink(
                destination: CreatePasscodeFlowExample(showsIllustratedMessage: self.showsIllustratedMessage))
            {
                Text("Create Passcode Flow")
            }

            NavigationLink(
                destination: CustomInputPasscodePolicyExample(showsIllustratedMessage: self.showsIllustratedMessage))
            {
                Text("Passcode Policy (Custom Input)")
            }

            Toggle(isOn: self.$showsIllustratedMessage) {
                Text("Show Illustration Message")
            }
            .tint(Color.preferredColor(.tintColor))
        }
        .navigationBarTitle("Authentication Examples", displayMode: .inline)
        .sheet(isPresented: self.$showsDynamicAuth) {
            NavigationView {
                DynamicAuthenticationExample(showsIllustratedMessage: self.showsIllustratedMessage)
            }
        }
    }
}

struct BasicAuthenticationExample: View {
    @State var password: String = ""
    @State var name: String = ""
    @State var showsIllustratedMessage: Bool
    @State var isPresentedBanner: Bool = false
    @State private var messageType: BannerMultiMessageType = .neutral
    @State private var verifyMessage: String = "Verifying Information..."
    
    var body: some View {
        Authentication(detailImage: {
            if self.showsIllustratedMessage {
                Image(.illustration).resizable().aspectRatio(contentMode: .fit)
            }
        }, title: {
            Text("Authentication")
        }, subtitle: {
            Text("Please provide your username and password to Basic authenticate.")
        }, isDisabled: self.password.isEmpty || self.name.isEmpty) {
            print("sign in ......")
            self.isPresentedBanner = true
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                self.messageType = .negative
                self.verifyMessage = "Verify Successfully"
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
                self.isPresentedBanner = false
                self.messageType = .neutral
                self.verifyMessage = "Verifying Information..."
                self.password = ""
            }
        }
        .authenticationStyle(BasicAuthenticationStyle(password: self.$password, name: self.$name))
        .bannerMessageView(isPresented: self.$isPresentedBanner,
                           pushContentDown: .constant(false),
                           icon: { EmptyView() },
                           title: self.verifyMessage,
                           bannerTapped: nil,
                           alignment: nil,
                           messageType: self.messageType)
    }
}

struct DynamicAuthenticationExample: View {
    @Environment(\.dismiss) private var dismiss
    @State private var password: String = ""
    @State private var name: String = ""
    @State private var url: String = ""
    @State private var email: String = ""
    @State private var test1: String = ""
    @State private var test2: String = ""
    @State private var test3: String = ""
    var showsIllustratedMessage: Bool
    @FocusState private var testFocused: Bool
    
    var body: some View {
        Authentication(detailImage: {
            if self.showsIllustratedMessage {
                Image(.illustration).resizable().aspectRatio(contentMode: .fit)
            }
        }, title: {
            EmptyView()
        }, subtitle: {
            Text("XXXX Please provide your username and password to authenticate XXXX.")
        }, authInput: {
            VStack(spacing: 16) {
                TextFieldFormView(title: "User Name:", text: self.$password, placeholder: "Enter your name")
                    .textFieldFormViewStyle(AuthTextFieldStyle())
                    .titleStyle { config in
                        config.title.font(.fiori(forTextStyle: .headline, weight: .medium))
                    }
                TextFieldFormView(title: "Password:", text: self.$name, isSecureEnabled: true, placeholder: "Enter your password")
                    .textFieldFormViewStyle(AuthTextFieldStyle())
                    .titleStyle { config in
                        config.title.font(.fiori(forTextStyle: .headline, weight: .medium))
                    }
                TextFieldFormView(title: "URL:", text: self.$url, isSecureEnabled: false, placeholder: "URL")
                    .textFieldFormViewStyle(AuthTextFieldStyle())
                    .titleStyle { config in
                        config.title.font(.fiori(forTextStyle: .headline, weight: .medium))
                    }
                TextFieldFormView(title: "Email:", text: self.$email, isSecureEnabled: false, placeholder: "Email")
                    .textFieldFormViewStyle(AuthTextFieldStyle())
                    .titleStyle { config in
                        config.title.font(.fiori(forTextStyle: .headline, weight: .medium))
                    }
                TextFieldFormView(title: "Test 1:", text: self.$test1, isSecureEnabled: false, placeholder: "Test 1")
                    .textFieldFormViewStyle(AuthTextFieldStyle())
                    .titleStyle { config in
                        config.title.font(.fiori(forTextStyle: .headline, weight: .medium))
                    }
                    .focused(self.$testFocused)
                TextFieldFormView(title: "Test 2:", text: self.$test2, isSecureEnabled: false, placeholder: "Test 2")
                    .textFieldFormViewStyle(AuthTextFieldStyle())
                    .titleStyle { config in
                        config.title.font(.fiori(forTextStyle: .headline, weight: .medium))
                    }
                TextFieldFormView(title: "Test 3:", text: self.$test3, isSecureEnabled: false, placeholder: "Test 3")
                    .textFieldFormViewStyle(AuthTextFieldStyle())
                    .titleStyle { config in
                        config.title.font(.fiori(forTextStyle: .headline, weight: .medium))
                    }
            }
        }, signInAction: {
            EmptyView()
        }, isDisabled: self.password.isEmpty || self.name.isEmpty || self.url.isEmpty || self.email.isEmpty || self.test1.isEmpty || self.test2.isEmpty || self.test3.isEmpty) {
            print("sign in ......")
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.6) {
                self.testFocused = true
            }
        }
        .navigationBarItems(
            leading: Button("Cancel") {
                self.dismiss()
            },
            trailing: Button("Done") {
                print("Done tapped")
                self.dismiss()
            }
            .disabled(self.password.isEmpty || self.name.isEmpty || self.url.isEmpty || self.email.isEmpty || self.test1.isEmpty || self.test2.isEmpty || self.test3.isEmpty)
        )
    }
}

struct AuthenticationExample: View {
    @State var password: String = ""
    @State var name: String = ""
    @State var showsIllustratedMessage: Bool
    @State var isPresentedBanner: Bool = false
    @State private var messageType: BannerMultiMessageType = .neutral
    @State private var verifyMessage: String = "Verifying Information..."
    @FocusState private var nameFocused: Bool
    
    var body: some View {
        Authentication(detailImage: {
            if self.showsIllustratedMessage {
                Image(.illustration).resizable().aspectRatio(contentMode: .fit)
            }
        }, title: {
            Text("Authentication")
        }, subtitle: {
            Text("Please provide your username and password to authenticate.")
        }, authInput: {
            VStack(spacing: 16) {
                TextFieldFormView(title: "", text: self.$name, placeholder: "Enter your name")
                    .textFieldFormViewStyle(AuthTextFieldStyle())
                    .focused(self.$nameFocused)
                TextFieldFormView(title: "", text: self.$password, isSecureEnabled: true, placeholder: "Enter your password")
                    .textFieldFormViewStyle(AuthTextFieldStyle())
            }
        }, isDisabled: self.password.isEmpty || self.name.isEmpty) {
            print("sign in ......")
            self.isPresentedBanner = true
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                self.messageType = .negative
                self.verifyMessage = "Verify Successfully"
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
                self.isPresentedBanner = false
                self.messageType = .neutral
                self.verifyMessage = "Verifying Information..."
                self.password = ""
            }
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.6) {
                self.nameFocused = true
            }
        }
        .bannerMessageView(isPresented: self.$isPresentedBanner,
                           pushContentDown: .constant(false),
                           icon: { EmptyView() },
                           title: self.verifyMessage,
                           bannerTapped: nil,
                           alignment: nil,
                           messageType: self.messageType)
    }
}

// MARK: - Passcode Policy (single screen)

/// Demonstrates a single-screen passcode entry validated against a `FioriPasscodePolicy`.
struct PasscodePolicyAuthenticationExample: View {
    @State private var passcode: String = ""
    @State var showsIllustratedMessage: Bool

    private let policy: FioriPasscodePolicy = {
        var policy = FioriPasscodePolicy(minLength: 8, hasDigit: true, hasUpper: true, hasSpecial: true, minUniqueChars: 4)
        policy.addPasscodeRule(FioriPasscodeRule(displayName: "At least 2 lowercase letters", isDisplayed: true) { passcode in
            passcode.unicodeScalars.filter { CharacterSet.lowercaseLetters.contains($0) }.count >= 2
        })
        return policy
    }()

    var body: some View {
        Authentication(detailImage: {
            if self.showsIllustratedMessage {
                Image(.illustration).resizable().aspectRatio(contentMode: .fit)
            }
        }, title: {
            Text("Create Passcode")
        }, subtitle: {
            Text("Your passcode must meet the requirements below.")
        }, isDisabled: !self.policy.validate(passcode: self.passcode)) {
            print("passcode accepted ......")
        }
        .authenticationStyle(PasscodePolicyAuthenticationStyle(passcode: self.$passcode, policy: self.policy))
        .navigationBarTitle("Passcode Policy", displayMode: .inline)
    }
}

// MARK: - Create Passcode Flow (two steps: create -> confirm)

/// Demonstrates a two-step "create passcode" flow using `PasscodePolicyAuthenticationStyle`:
/// 1. `CreatePasscodeView` — enter a new passcode that must satisfy the policy.
/// 2. `ConfirmPasscodeView` — re-enter the passcode; it must match the one from step 1.
struct CreatePasscodeFlowExample: View {
    @State var showsIllustratedMessage: Bool

    /// The policy for the "create" step.
    private let policy: FioriPasscodePolicy = {
        var policy = FioriPasscodePolicy(minLength: 8, hasDigit: true, hasUpper: true, hasSpecial: true, minUniqueChars: 4)
        policy.addPasscodeRule(FioriPasscodeRule(displayName: "At least 2 lowercase letters", isDisplayed: true) { passcode in
            passcode.unicodeScalars.filter { CharacterSet.lowercaseLetters.contains($0) }.count >= 2
        })
        return policy
    }()

    var body: some View {
        CreatePasscodeView(policy: self.policy, showsIllustratedMessage: self.showsIllustratedMessage)
    }
}

/// Step 1: enter a new passcode that satisfies the policy, then continue to confirmation.
struct CreatePasscodeView: View {
    let policy: FioriPasscodePolicy
    var showsIllustratedMessage: Bool

    @State private var passcode: String = ""
    @State private var showsConfirm: Bool = false

    var body: some View {
        Authentication(detailImage: {
            if self.showsIllustratedMessage {
                Image(.illustration).resizable().aspectRatio(contentMode: .fit)
            }
        }, title: {
            Text("Create Passcode")
        }, subtitle: {
            Text("Your passcode must meet the requirements below.")
        }, signInAction: {
            FioriButton { _ in Text("Next") }
        }, isDisabled: !self.policy.validate(passcode: self.passcode)) {
            self.showsConfirm = true
        }
        .authenticationStyle(PasscodePolicyAuthenticationStyle(passcode: self.$passcode, policy: self.policy))
        .navigationBarTitle("Create Passcode", displayMode: .inline)
        .navigationDestination(isPresented: self.$showsConfirm) {
            ConfirmPasscodeView(originalPasscode: self.passcode, showsIllustratedMessage: self.showsIllustratedMessage)
        }
    }
}

/// Step 2: re-enter the passcode; it must match the one created in step 1.
struct ConfirmPasscodeView: View {
    let originalPasscode: String
    var showsIllustratedMessage: Bool

    @Environment(\.dismiss) private var dismiss
    @State private var passcode: String = ""
    @State private var isPresentedBanner: Bool = false

    /// A policy whose single displayed requirement is "matches the original passcode".
    private var confirmPolicy: FioriPasscodePolicy {
        var policy = FioriPasscodePolicy(minLength: 0)
        let original = self.originalPasscode
        policy.addPasscodeRule(FioriPasscodeRule(displayName: "Matches the passcode above", isDisplayed: true) { passcode in
            !passcode.isEmpty && passcode == original
        })
        return policy
    }

    var body: some View {
        Authentication(detailImage: {
            if self.showsIllustratedMessage {
                Image(.illustration).resizable().aspectRatio(contentMode: .fit)
            }
        }, title: {
            Text("Confirm Passcode")
        }, subtitle: {
            Text("Re-enter your passcode to confirm.")
        }, signInAction: {
            FioriButton { _ in Text("Done") }
        }, isDisabled: !self.confirmPolicy.validate(passcode: self.passcode)) {
            print("passcode created ......")
            self.isPresentedBanner = true
        }
        .authenticationStyle(PasscodePolicyAuthenticationStyle(passcode: self.$passcode, policy: self.confirmPolicy))
        .navigationBarTitle("Confirm Passcode", displayMode: .inline)
        .bannerMessageView(isPresented: self.$isPresentedBanner,
                           pushContentDown: .constant(false),
                           icon: { EmptyView() },
                           title: "Passcode created successfully",
                           bannerTapped: nil,
                           alignment: nil,
                           messageType: .positive)
    }
}

// MARK: - Passcode Policy with custom authInput

/// Demonstrates supplying a custom `authInput` (multiple fields / custom styles) while still
/// letting `PasscodePolicyAuthenticationStyle` append the live requirement checklist below it.
/// The custom passcode field and the style share the same `passcode` binding, so the checklist
/// updates as the user types.
struct CustomInputPasscodePolicyExample: View {
    @State private var name: String = ""
    @State private var passcode: String = ""
    @State var showsIllustratedMessage: Bool

    private let policy = FioriPasscodePolicy(minLength: 8, hasDigit: true, hasUpper: true, hasSpecial: true, minUniqueChars: 4)

    var body: some View {
        Authentication(detailImage: {
            if self.showsIllustratedMessage {
                Image(.illustration).resizable().aspectRatio(contentMode: .fit)
            }
        }, title: {
            Text("Create Passcode")
        }, subtitle: {
            Text("Custom fields with an appended requirement checklist.")
        }, authInput: {
            VStack(spacing: 16) {
                TextFieldFormView(title: "User Name:", text: self.$name, placeholder: "Enter your name")
                    .textFieldFormViewStyle(AuthTextFieldStyle())
                    .titleStyle { config in
                        config.title.font(.fiori(forTextStyle: .headline, weight: .medium))
                    }
                TextFieldFormView(title: "Passcode:", text: self.$passcode, isSecureEnabled: true, placeholder: "Enter your passcode")
                    .textFieldFormViewStyle(AuthTextFieldStyle())
                    .titleStyle { config in
                        config.title.font(.fiori(forTextStyle: .headline, weight: .medium))
                    }
            }
        }, isDisabled: self.name.isEmpty || !self.policy.validate(passcode: self.passcode)) {
            print("passcode accepted ......")
        }
        .authenticationStyle(PasscodePolicyAuthenticationStyle(passcode: self.$passcode, policy: self.policy))
        .navigationBarTitle("Custom Input", displayMode: .inline)
    }
}
