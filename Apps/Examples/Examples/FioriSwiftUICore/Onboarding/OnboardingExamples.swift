import SwiftUI

struct OnboardingExamples: View {
    var body: some View {
        List {
            NavigationLink(
                destination: WelcomeScreenSample()) {
                Text("WelcomeScreen")
            }
            
            NavigationLink(
                destination: ActivationScreenSample()) {
                Text("ActivationScreen")
            }
            
            NavigationLink(
                destination: InfoViewSample(),
                label: {
                    Text("InfoView")
                }
            )
        }.navigationBarTitle("FioriSwiftUICore")
    }
}

struct OnboardingExamples_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingExamples().environment(\.horizontalSizeClass, .compact)
    }
}
