import SwiftUI

struct OnboardingExamples: View {
    var body: some View {
        List {
            NavigationLink(
                destination: WelcomeExamples()) {
                Text("WelcomeScreen Examples")
            }
            
            NavigationLink(
                destination: ActivationScreenExamples()) {
                Text("ActivationScreen")
            }
            
            NavigationLink(
                destination: InfoViewExamples(),
                label: {
                    Text("InfoView Examples")
                }
            )
            
            NavigationLink(
                destination: EULAExamples()) {
                Text("EULA Examples")
            }

            NavigationLink(
                destination: UserConsentExamples()) {
                Text("User Consent Form Examples")
            }
            
        }.navigationBarTitle("Onboarding")
    }
}

struct WelcomeExamples: View {
    var body: some View {
        List {
            NavigationLink(
                destination: WelcomeScreenSample()) {
                Text("WelcomeScreen")
            }
            NavigationLink(
                destination: WelcomeScreenCustomized()) {
                Text("WelcomeScreen customized")
            }
            NavigationLink(
                destination: WelcomeScreenDiscoveryService()) {
                Text("WelcomeScreen with Discovery Service")
            }
        }.navigationBarTitle("Welcome Examples", displayMode: .inline)
    }
}

struct ActivationScreenExamples: View {
    var body: some View {
        List {
            NavigationLink(
                destination: ActivationScreenSample()) {
                Text("ActivationScreen")
            }
            
            NavigationLink(
                destination: ActivationScreenCustomizedSample()) {
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
                destination: InfoViewWithLoadingLabel()) {
                Text("InfoView With Loading Label")
            }
            
            NavigationLink(
                destination: InfoViewCustomized()) {
                Text("InfoView Customized")
            }
        }.navigationBarTitle("InfoView Examples", displayMode: .inline)
    }
}

struct EULAExamples: View {
    var body: some View {
        List {
            NavigationLink(
                destination: EULAViewSample()) {
                Text("EULA Example")
            }

            NavigationLink(
                destination: EULALongHtmlSample()) {
                Text("Long HTML")
            }

            NavigationLink(
                destination: EULAShortHtmlSample()) {
                Text("Short HTML")
            }

            NavigationLink(
                destination: EULAConcatSample()) {
                Text("Concat Attributed Strings")
            }

            NavigationLink(
                destination: EULAWithLinkSample()) {
                Text("Short HTML with Link")
            }

            NavigationLink(
                destination: EULAShortWithLinkSample()) {
                Text("Short Attributed Strings with Link")
            }
            
            NavigationLink(
                destination: EULAViewCustomized()) {
                Text("Customized EULA Example")
            }

        }.navigationBarTitle("EULA Examples", displayMode: .inline)
    }
}

struct UserConsentExamples: View {
    var body: some View {
        List {
            NavigationLink(
                destination: UserConsentSinglePageM()) {
                Text("Single Page Form(S)-Mandatory")
            }

            NavigationLink(
                destination: UserConsentSinglePageO()) {
                Text("Single Page Form(S)-Optional-Customized")
            }

            NavigationLink(
                destination: UserConsentMultiplePageM()) {
                Text("Multi Page Form(M)-Mandatory")
            }

            NavigationLink(
                destination: UserConsentMultiplePageO()) {
                Text("Multi Page Form(M)-Optional")
            }

            NavigationLink(
                destination: UserConsentMixFormM()) {
                Text("Mixed Forms: (S, M)-All Mandatory")
            }

            NavigationLink(
                destination: UserConsentMixFormO()) {
                Text("Mixed Forms: (S, M)-All Optional")
            }
            
            NavigationLink(
                destination: UserConsentMixFormMO()) {
                Text("(S,M,S,M)-S(mandatory)&M(optional)")
            }
            
            NavigationLink(
                destination: UserConsentMixFormOM()) {
                Text("(M,S,M,S)-S(optional)&M(mandatory)")
            }
            
            NavigationLink(
                destination: UserConsentSinglePageHTML()) {
                Text("HTML")
            }
            
            NavigationLink(
                destination: UserConsentLongText()) {
                Text("Long RTF")
            }
            
        }.navigationBarTitle("User Consent Examples", displayMode: .inline)
    }
}

struct OnboardingExamples_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingExamples().environment(\.horizontalSizeClass, .compact)
    }
}
