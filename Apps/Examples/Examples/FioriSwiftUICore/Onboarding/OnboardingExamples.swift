import SwiftUI

struct OnboardingExamples: View {
    var _isNewObjectItem: Bool = false
    
    var body: some View {
        List {
            NavigationLink(
                destination: WelcomeExamples())
            {
                Text("WelcomeScreen Examples")
            }
            
            NavigationLink(
                destination: ActivationScreenExamples())
            {
                Text("ActivationScreen")
            }
            
            if self._isNewObjectItem {
                NavigationLink(
                    destination: InfoViewExamples(isNewInfoView: true))
                {
                    Text("InfoView Examples")
                }
                NavigationLink(
                    destination: EULAExamples(isNewEULAView: true))
                {
                    Text("EULA Examples")
                }
                NavigationLink(
                    destination: UserConsentExamples())
                {
                    Text("User Consent Form Examples")
                }
                NavigationLink(
                    destination: AuthenticationExamples())
                {
                    Text("AuthenticationScreen Examples")
                }
            } else {
                NavigationLink(
                    destination: InfoViewExamples())
                {
                    Text("_InfoView Examples")
                }
                NavigationLink(
                    destination: EULAExamples())
                {
                    Text("_EULA Examples")
                }
            }
            
            NavigationLink(
                destination: WhatsNewExample())
            {
                Text("What's New")
            }
        }.navigationBarTitle("Onboarding")
    }
}

struct WelcomeExamples: View {
    var body: some View {
        List {
            Section {
                NavigationLink {
                    OnBoardingWelcomeScreenExamples()
                } label: {
                    Text("OnBoarding - WelcomeScreen")
                }
            } header: {
                Text("Extra Examples")
                    .textCase(.none)
            }
            
        }.navigationBarTitle("Welcome Examples", displayMode: .inline)
    }
}

struct ActivationScreenExamples: View {
    @State private var showsIllustratedMessage = false

    var body: some View {
        List {
            NavigationLink(
                destination: ActivationScreenSample(showsIllustratedMessage: self.showsIllustratedMessage))
            {
                Text("ActivationScreen")
            }
            
            NavigationLink(
                destination: ActivationScreenCustomizedSample(showsIllustratedMessage: self.showsIllustratedMessage))
            {
                Text("Customized")
            }
            
            Toggle("Use Illustration Message", isOn: self.$showsIllustratedMessage)
                .tint(Color.preferredColor(.tintColor))
        }.navigationBarTitle("Onboarding", displayMode: .inline)
    }
}

struct InfoViewExamples: View {
    var isNewInfoView = false
    var body: some View {
        List {
            NavigationLink {
                if self.isNewInfoView {
                    InfoViewSample()
                } else {
                    _InfoViewSample()
                }
            } label: {
                Text("InfoView")
            }
            NavigationLink {
                if self.isNewInfoView {
                    InfoViewWithLoadingLabel()
                } else {
                    _InfoViewWithLoadingLabel()
                }
            } label: {
                Text("InfoView With Loading Label")
            }
            
            NavigationLink {
                if self.isNewInfoView {
                    InfoViewCustomized()
                } else {
                    _InfoViewCustomized()
                }
            } label: {
                Text("InfoView Customized")
            }
        }.navigationBarTitle("InfoView Examples", displayMode: .inline)
    }
}

struct EULAExamples: View {
    var isNewEULAView = false
    var body: some View {
        List {
            NavigationLink {
                if self.isNewEULAView {
                    EULAViewSample()
                } else {
                    _EULAViewSample()
                }
            } label: {
                Text("EULA Example")
            }
            
            NavigationLink {
                if self.isNewEULAView {
                    EULALongHtmlSample()
                } else {
                    _EULALongHtmlSample()
                }
            } label: {
                Text("Long HTML")
            }
            
            NavigationLink {
                if self.isNewEULAView {
                    EULAShortHtmlSample()
                } else {
                    _EULAShortHtmlSample()
                }
            } label: {
                Text("Short HTML")
            }
            
            NavigationLink {
                if self.isNewEULAView {
                    EULAConcatSample()
                } else {
                    _EULAConcatSample()
                }
            } label: {
                Text("Concat Attributed Strings")
            }
            
            NavigationLink {
                if self.isNewEULAView {
                    EULAWithLinkSample()
                } else {
                    _EULAWithLinkSample()
                }
            } label: {
                Text("Short HTML with Link")
            }
            
            NavigationLink {
                if self.isNewEULAView {
                    EULAShortWithLinkSample()
                } else {
                    _EULAShortWithLinkSample()
                }
            } label: {
                Text("Short Attributed Strings with Link")
            }
            
            NavigationLink {
                if self.isNewEULAView {
                    EULAViewCustomized()
                } else {
                    _EULAViewCustomized()
                }
            } label: {
                Text("Customized EULA Example")
            }
            
        }.navigationBarTitle("EULA Examples", displayMode: .inline)
    }
}

struct UserConsentExamples: View {
    var body: some View {
        List {
            NavigationLink(
                destination: UserConsentSinglePageM())
            {
                Text("Single Page Form(Mandatory)")
            }
            
            NavigationLink(
                destination: UserConsentSinglePageO())
            {
                Text("Single Page Form(Optional, Long RTF)")
            }
            
            NavigationLink(
                destination: UserConsentViewBuilderExample())
            {
                Text("Multiple Forms(ViewBuilder)")
            }
            
            NavigationLink(
                destination: UserConsentCustomized())
            {
                Text("Multiple Forms(Customized)")
            }
            
        }.navigationBarTitle("User Consent Examples", displayMode: .inline)
    }
}

struct OnboardingExamples_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingExamples().environment(\.horizontalSizeClass, .compact)
    }
}
