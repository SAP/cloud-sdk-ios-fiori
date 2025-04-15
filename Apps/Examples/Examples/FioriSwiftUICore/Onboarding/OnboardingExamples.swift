import SwiftUI

struct OnboardingExamples: View {
    var _isNewObjectItem: Bool = false
    
    var body: some View {
        List {
            NavigationLink(
                destination: WelcomeExamples(_isNewObjectItem: self._isNewObjectItem))
            {
                Text("WelcomeScreen Examples")
            }
            
            NavigationLink(
                destination: ActivationScreenExamples())
            {
                Text("ActivationScreen")
            }
            
            NavigationLink(
                destination: InfoViewExamples(),
                label: {
                    Text("InfoView Examples")
                }
            )
            
            NavigationLink(
                destination: EULAExamples())
            {
                Text("_EULA Examples")
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
            
        }.navigationBarTitle("Onboarding")
    }
}

struct WelcomeExamples: View {
    var _isNewObjectItem: Bool = false
    var body: some View {
        List {
            if self._isNewObjectItem {
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
            } else {
                Section {
                    NavigationLink(
                        destination: WelcomeScreenSample())
                    {
                        Text("WelcomeScreen")
                    }
                    NavigationLink(
                        destination: WelcomeScreenCustomized())
                    {
                        Text("WelcomeScreen customized")
                    }
                    NavigationLink(
                        destination: WelcomeScreenDiscoveryService())
                    {
                        Text("WelcomeScreen with Discovery Service")
                    }
                }
            }
            
        }.navigationBarTitle("Welcome Examples", displayMode: .inline)
    }
}

struct ActivationScreenExamples: View {
    var body: some View {
        List {
            NavigationLink(
                destination: ActivationScreenSample())
            {
                Text("ActivationScreen")
            }
            
            NavigationLink(
                destination: ActivationScreenCustomizedSample())
            {
                Text("Customized")
            }
        }.navigationBarTitle("Onboarding", displayMode: .inline)
    }
}

struct InfoViewExamples: View {
    var body: some View {
        List {
            NavigationLink(
                destination: InfoViewSample(),
                label: {
                    Text("InfoView")
                }
            )
            NavigationLink(
                destination: InfoViewWithLoadingLabel())
            {
                Text("InfoView With Loading Label")
            }
            
            NavigationLink(
                destination: InfoViewCustomized())
            {
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
