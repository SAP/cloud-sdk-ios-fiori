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

struct OnboardingExamples_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingExamples().environment(\.horizontalSizeClass, .compact)
    }
}
