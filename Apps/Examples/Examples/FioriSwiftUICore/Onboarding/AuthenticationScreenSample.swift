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
                TextFieldFormView(title: "", text: self.$password, placeholder: "Enter your name")
                TextFieldFormView(title: "", text: self.$name, isSecureEnabled: true, placeholder: "Enter your password")
                TextFieldFormView(title: "", text: self.$url, isSecureEnabled: false, placeholder: "URL")
                TextFieldFormView(title: "", text: self.$email, isSecureEnabled: false, placeholder: "Email")
                TextFieldFormView(title: "", text: self.$test1, isSecureEnabled: false, placeholder: "Test 1")
                TextFieldFormView(title: "", text: self.$test2, isSecureEnabled: false, placeholder: "Test 2")
                TextFieldFormView(title: "", text: self.$test3, isSecureEnabled: false, placeholder: "Test 3")
            }
        }, signInAction: {
            EmptyView()
        }, isDisabled: self.password.isEmpty || self.name.isEmpty || self.url.isEmpty || self.email.isEmpty || self.test1.isEmpty || self.test2.isEmpty || self.test3.isEmpty) {
            print("sign in ......")
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
                TextFieldFormView(title: "", text: self.$password, isSecureEnabled: true, placeholder: "Enter your password")
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
        .bannerMessageView(isPresented: self.$isPresentedBanner,
                           pushContentDown: .constant(false),
                           icon: { EmptyView() },
                           title: self.verifyMessage,
                           bannerTapped: nil,
                           alignment: nil,
                           messageType: self.messageType)
    }
}
