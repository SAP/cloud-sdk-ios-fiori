import Combine
import FioriSwiftUICore
import SwiftUI

struct ActivationScreenSample: View {
    @State var inputText: String = ""
    var showsIllustratedMessage = false
    @State var isScanPresented = false

    public init() {}
    
    public init(showsIllustratedMessage: Bool = false) {
        self.showsIllustratedMessage = showsIllustratedMessage
    }
    
    var body: some View {
        VStack {
            ActivationScreen(title: "Activation",
                             descriptionText: "If you received a welcome email, follow the activation link in the email.Otherwise, enter your email address or scan the QR code to start onboarding.",
                             footnote: "Or",
                             action: FioriButton(title: "Use your email", action: { _ in
                                 print("ActivationScreen Primary button clicked, email: \(self.inputText)")
                             }),
                             secondaryAction: FioriButton(title: "Scan", action: { _ in
                                 print("call barcode scanner")
                                 self.isScanPresented.toggle()
                             }),
                             illustratedMessage: IllustratedMessage(detailImage: {
                                 Image("IllustrationImage").resizable(resizingMode: .stretch)
                             }, title: {
                                 Text("Activation")
                             }, description: {
                                 Text("If you received a welcome email, follow the activation link in the email.Otherwise, enter your email address or scan the QR code to start onboarding.")
                                     .padding(EdgeInsets(top: 10, leading: 0, bottom: 0, trailing: 0))
                             }, detailImageSize: .large),
                             inputText: self.$inputText,
                             showsIllustratedMessage: self.showsIllustratedMessage)
                .sheet(isPresented: self.$isScanPresented) {
                    OnboardingScanView(shouldValidateScanResult: { scanResult in
                        scanResult == "success"
                    }, didCancel: {
                        self.isScanPresented.toggle()
                    }, usesCameraOnly: false,
                    didTapContinue: {
                        self.isScanPresented.toggle()
                    })
                }
        }
    }
}

struct ActivationScreenCustomizedSample: View {
    @State var inputText: String = ""
    var showsIllustratedMessage = false

    public init() {}
    
    public init(showsIllustratedMessage: Bool = false) {
        self.showsIllustratedMessage = showsIllustratedMessage
    }
    
    var body: some View {
        VStack {
            ActivationScreen(title: {
                Text("Activation")
                    .foregroundStyle(.red)
            }, descriptionText: {
                Text("If you received a welcome email, follow the activation link in the email.Otherwise, enter your email address or scan the QR code to start onboarding.")
                    .foregroundStyle(.blue)
                    .font(.fiori(forTextStyle: .subheadline))
            }, footnote: {
                Text("Or")
                    .foregroundStyle(.green)
                    .font(.fiori(forTextStyle: .headline))
            }, action: {
                FioriButton(title: "Use Your Email", action: { _ in
                    print("ActivationScreen Primary button clicked, email: \(self.inputText)")
                })
            }, secondaryAction: {
                Image(systemName: "qrcode.viewfinder")
                    .font(.largeTitle)
                    .foregroundStyle(Color.preferredColor(.secondaryLabel))
                    .padding(6)
                    .onTapGesture {
                        print("Camera is tapped")
                    }
            }, illustratedMessage: {
                IllustratedMessage(detailImage: {
                    Image("IllustrationImage").resizable(resizingMode: .stretch)
                }, title: {
                    Text("Activation")
                }, description: {
                    Text("If you received a welcome email, follow the activation link in the email.Otherwise, enter your email address or scan the QR code to start onboarding.")
                        .padding(EdgeInsets(top: 10, leading: 0, bottom: 0, trailing: 0))
                }, detailImageSize: .large)
            },
            inputText: self.$inputText,
            showsIllustratedMessage: self.showsIllustratedMessage)
        }
    }
}

struct ActivationScreenSample_Previews: PreviewProvider {
    static var previews: some View {
        ActivationScreenSample()
    }
}
