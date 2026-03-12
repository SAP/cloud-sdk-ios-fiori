import FioriSwiftUICore
import FioriThemeManager
import SwiftUI

enum OnBoardingWelcomeScreenItemType {
    case link
    case customLogo
    case mdm
    case discoveryService
    case scan
    case activation
    case longLongTexts
    case longLongTextsWithMDM
    case longTexts
    case longTextsWithMDM
    case linkAndDemoNotAvailable
    case mdmAndDemoNotAvailable
}

struct OnBoardingWelcomeScreenExamples: View {
    @State private var showLegalAgreement = false
    @State private var showTermsOfService = false
    @State private var showsIllustratedMessage = false
    
    private var headerImageOptions: [AttributedString] = ["None", "SAP", "SF Square", "SF Long"]
    private var headerImageNames: [String] = ["", "SAPLogo", "SF-Square", "SF-Long"]
    @State private var showHeaderImage = false
    @State private var headerImageSelectIndex = 0
    
    @State private var showWelcomeScreen = false
    
    @State private var email: String = ""
    
    @State private var type: OnBoardingWelcomeScreenItemType = .link
    
    @State private var state: WelcomeScreenState = .notConfigured
    
    @State private var options: Set<WelcomeScreenOption> = []
    
    @State private var titleStr: String = ""
    @State private var descriptionStr: String = ""
    @State private var primaryButtonTitleStr: String = ""
    @State private var secondaryButtonTitleStr: String = ""
    @State private var isDemoAvailable: Bool = true
    
    @State private var isLegalAgreementRequired = false
    @State var valuePickerVisible = false
    
    var body: some View {
        List {
            Text("Developer Example with Link").onTapGesture {
                self.showDifferentWelcomeScreen(.link)
            }
            Text("Developer Example with Custom Logo").onTapGesture {
                self.showDifferentWelcomeScreen(.customLogo)
            }
            Text("Developer Example with MDM").onTapGesture {
                self.showDifferentWelcomeScreen(.mdm)
            }
            Text("Developer Example with Discovery Service").onTapGesture {
                self.showDifferentWelcomeScreen(.discoveryService)
            }
            Text("Developer Example with Scan").onTapGesture {
                self.showDifferentWelcomeScreen(.scan)
            }
            Text("Developer Example with Activation").onTapGesture {
                self.showDifferentWelcomeScreen(.activation)
            }
            Text("With Long Long Texts with MDM").onTapGesture {
                self.showDifferentWelcomeScreen(.longLongTextsWithMDM)
            }
            Text("With Long Long Texts").onTapGesture {
                self.showDifferentWelcomeScreen(.longLongTexts)
            }
            Text("With Long Texts").onTapGesture {
                self.showDifferentWelcomeScreen(.longTexts)
            }
            Text("With Long Texts with MDM").onTapGesture {
                self.showDifferentWelcomeScreen(.longTextsWithMDM)
            }
            Text("With Link and Demo Not Available").onTapGesture {
                self.showDifferentWelcomeScreen(.linkAndDemoNotAvailable)
            }
            Text("With MDM and Demo Not Available").onTapGesture {
                self.showDifferentWelcomeScreen(.mdmAndDemoNotAvailable)
            }
            
            ValuePicker(title: "Header Image", isRequired: false, options: self.headerImageOptions, selectedIndex: self.$headerImageSelectIndex, isTrackingLiveChanges: true, alwaysShowPicker: false, controlState: .normal, pickerVisible: self.$valuePickerVisible)
            
            Toggle(isOn: self.$showLegalAgreement) {
                Text("Show Legal Agreement")
            }
            .tint(Color.preferredColor(.tintColor))
            
            Toggle(isOn: self.$showTermsOfService) {
                Text("Show Terms of Service")
            }
            .tint(Color.preferredColor(.tintColor))
            
            Toggle(isOn: self.$showsIllustratedMessage) {
                Text("Show Illustration Message")
            }
            .tint(Color.preferredColor(.tintColor))
        }
        .fullScreenCover(isPresented: self.$showWelcomeScreen, content: { [titleStr, descriptionStr, primaryButtonTitleStr, secondaryButtonTitleStr, type, state, options, isDemoAvailable, showTermsOfService, isLegalAgreementRequired, headerImageSelectIndex] in
            NavigationView {
                WelcomeScreen(title: {
                    if headerImageSelectIndex == 0 {
                        Text(titleStr)
                    }
                }, description: {
                    Text(descriptionStr)
                }, icon: {
                    if headerImageSelectIndex == 0 {
                        if type == .customLogo {
                            Image("oski").resizable().scaledToFit().frame(width: 120, height: 60)
                        } else {
                            Image("SAPLogo").resizable().scaledToFit().frame(width: 60, height: 28)
                        }
                    }
                }, footnote: {
                    Text("Want to explore?")
                }, action: {
                    FioriButton { _ in
                        //
                    } label: { _ in
                        Text(primaryButtonTitleStr)
                            .multilineTextAlignment(.center)
                    }

                }, secondaryAction: {
                    FioriButton { _ in
                        UIApplication.shared.open(URL(string: "http://www.google.com")!)
                    } label: { _ in
                        Text(secondaryButtonTitleStr)
                            .multilineTextAlignment(.center)
                    }

                }, illustratedMessage: {
                    IllustratedMessage(detailImage: {
                        Image(type == .customLogo ? "HimilayanCat" : "IllustrationImage").resizable(resizingMode: .stretch)
                    }, title: {
                        Text("Enterprise Solution")
                    }, description: {
                        Text("Enterprise solutions are designed to integrate multiple facets of a company's business through the interchange of information")
                            .padding(EdgeInsets(top: 10, leading: 0, bottom: 0, trailing: 0))
                    }, detailImageSize: .large)
                }, headlineImage: {
                    if headerImageSelectIndex > 0, headerImageSelectIndex < self.headerImageNames.count {
                        if headerImageSelectIndex == 2 {
                            Image(self.headerImageNames[self.headerImageSelectIndex]).resizable().scaledToFit()
                                .frame(width: 68, height: 68)
                        } else {
                            Image(self.headerImageNames[self.headerImageSelectIndex]).resizable().scaledToFit()
                                .frame(width: 256, height: 54)
                        }
                    }
                }, inputText: self.$email, legalText: {
                    self.legalTextView()
                        .padding(EdgeInsets(top: 8, leading: 0, bottom: 8, trailing: 0))
                }, isLegalAgreementRequired: isLegalAgreementRequired, showsIllustratedMessage: self.showsIllustratedMessage, state: state, options: options, isDemoAvailable: isDemoAvailable, footerText: {
                    if showTermsOfService, type != .link, type != .customLogo {
                        self.footerTextView()
                    }
                })
                .toolbar {
                    ToolbarItem(placement: .topBarLeading) {
                        Button("Cancel".localizedFioriString()) {
                            self.showWelcomeScreen = false
                        }.fixedSize()
                    }
                }
            }
        })
    }
    
    func legalTextView() -> some View {
        HStack(spacing: 0) {
            Text("I agree the ")
                .font(.fiori(forTextStyle: .caption1))
                .foregroundStyle(Color.preferredColor(.tertiaryLabel))
            Link(destination: URL(string: "https://assets.cdn.sap.com/agreements/end-user-agreements/lic/end-user-license-agreement-for-sap-on-premise-indirect-sales-thailand-english-v4-2015.pdf")!) {
                Text("End User License Agreement")
                    .font(.fiori(forTextStyle: .caption1))
                    .foregroundStyle(Color.preferredColor(.tintColor))
            }
            Text(" and the ")
                .font(.fiori(forTextStyle: .caption1))
                .foregroundStyle(Color.preferredColor(.tertiaryLabel))
            Link(destination: URL(string: "https://www.sap.com/about/legal/privacy.html")!) {
                Text("Privacy Policy")
                    .font(.fiori(forTextStyle: .caption1))
                    .foregroundStyle(Color.preferredColor(.tintColor))
            }
            Text(".")
                .font(.fiori(forTextStyle: .caption1))
                .foregroundStyle(Color.preferredColor(.tertiaryLabel))
        }
        .multilineTextAlignment(.leading)
        .fixedSize(horizontal: false, vertical: true)
    }
    
    func footerTextView() -> some View {
        HStack(spacing: 0) {
            Text("View our ")
                .font(.fiori(forTextStyle: .caption1))
                .foregroundStyle(Color.preferredColor(.tertiaryLabel))
            Link(destination: URL(string: "https://sap.com")!) {
                Text("Terms of Service")
                    .font(.fiori(forTextStyle: .caption1))
                    .foregroundStyle(Color.preferredColor(.tintColor))
            }
        }
        .multilineTextAlignment(.leading)
        .fixedSize(horizontal: false, vertical: true)
    }
    
    func showDifferentWelcomeScreen(_ type: OnBoardingWelcomeScreenItemType) {
        self.showWelcomeScreen = true
        
        self.type = type
        
        self.state = .notConfigured
        self.options = []
        self.isDemoAvailable = true
        
        self.titleStr = "SAP Project Companion for Managers"
        self.primaryButtonTitleStr = "Get Started"
        self.secondaryButtonTitleStr = "Try the Demo"
        
        self.descriptionStr = "Stay on top of your daily tasks management and easily collaborate on projects."
        self.isLegalAgreementRequired = self.showLegalAgreement
        
        if type == .link || type == .customLogo {
            self.isLegalAgreementRequired = false
            self.descriptionStr = "Please follow the instructions you received in the welcome email to start the activation process."
        } else if type == .mdm {
            self.state = .isConfigured
        } else if type == .discoveryService {
            self.descriptionStr = "The Only Valid Email is good@aaa.com."
            self.state = .notConfigured
            self.options = [.discoveryService]
        } else if type == .scan {
            self.descriptionStr = "Please scan the secure QR code to start the activation process."
            self.primaryButtonTitleStr = "Scan QR Code"
            self.options = [.barcodeScanner]
        } else if type == .activation {
            self.state = .notConfigured
            self.options = [.barcodeScanner, .discoveryService]
        } else if type == .longLongTextsWithMDM {
            self.state = .isConfigured
            self.titleStr = "Thank you for downloading SAP Project Companion for Managers Name wraps 2 lines"
            self.descriptionStr = "Stay on top of your daily tasks management and easily collaborate on projects this text has to wrap because the text is very very very long."
            self.primaryButtonTitleStr = "My activation button text has so many characters that the text has to wrap because the text is very very very long"
            self.secondaryButtonTitleStr = "My demo text has so many characters that the text has to wrap because the text is very very very long"
        } else if type == .longLongTexts {
            self.state = .notConfigured
            self.options = [.discoveryService]
            self.titleStr = "Thank you for downloading SAP Project Companion for Managers Name wraps 2 lines"
            self.descriptionStr = "Please follow the instructions you received in the welcome email to start the activation process this text wrapping to four lines or more so very long text has to wrap because the text is very very long.Please follow the instructions you received in the welcome email to start the activation process this text wrapping to four lines or more so very long text has to wrap because the text is very very long.Please follow the instructions you received in the welcome email to start the activation process this text wrapping to four lines or more so very long text has to wrap because the text is very very long.Please follow the instructions you received in the welcome email to start the activation process this text wrapping to four lines or more so very long text has to wrap because the text is very very long.Please follow the instructions you received in the welcome email to start the activation process this text wrapping to four lines or more so very long text has to wrap because the text is very very long.Please follow the instructions you received in the welcome email to start the activation process this text wrapping to four lines or more so very long text has to wrap because the text is very very long.Please follow the instructions you received in the welcome email to start the activation process this text wrapping to four lines or more so very long text has to wrap because the text is very very long.Please follow the instructions you received in the welcome email to start the activation process this text wrapping to four lines or more so very long text has to wrap because the text is very very long."
            self.primaryButtonTitleStr = "My activation button text has so many characters that the text has to wrap because the text is very very very long"
            self.secondaryButtonTitleStr = "My demo text has so many characters that the text has to wrap because the text is very very very long"
        } else if type == .longTexts {
            self.state = .notConfigured
            self.options = [.discoveryService]
            self.titleStr = "Thank you for downloading SAP Project Companion for Managers Name wraps 2 lines"
            self.descriptionStr = "Please follow the instructions you received in the welcome email to start the activation process this text wrapping to four lines or more so very long text has to wrap because the text is very very long.Please follow the instructions you received in the welcome email to start the activation process this text wrapping to four lines or more so very long text has to wrap because the text is very very long.Please follow the instructions you received in the welcome email to start the activation process this text wrapping to four lines or more so very long text has to wrap because the text is very very long.Please follow the instructions you received in the welcome email to start the activation process this text wrapping to four lines or more so very long text has to wrap because the text is very very long.Please follow the instructions you received in the welcome email to start the activation process this text wrapping to four lines or more so very long text has to wrap because the text is very very long.Please follow the instructions you received in the welcome email to start the activation process this text wrapping to four lines or more so very long text has to wrap because the text is very very long.Please follow the instructions you received in the welcome email to start the activation process this text wrapping to four lines or more so very long text has to wrap because the text is very very long.Please follow the instructions you received in the welcome email to start the activation process this text wrapping to four lines or more so very long text has to wrap because the text is very very long."
            self.primaryButtonTitleStr = "My activation button text has so many characters that the text has to wrap"
            self.secondaryButtonTitleStr = "My demo text has so many characters that the text has to wrap"
        } else if type == .longTextsWithMDM {
            self.state = .isConfigured
            self.titleStr = "Thank you for downloading SAP Project Companion for Managers Name wraps 2 lines"
            self.descriptionStr = "Stay on top of your daily tasks management and easily collaborate on projects this text wraps text has to wrap"
            self.primaryButtonTitleStr = "My activation button text has so many characters that the text has to wrap"
            self.secondaryButtonTitleStr = "My demo text has so many characters that the text has to wrap"
        } else if type == .mdmAndDemoNotAvailable {
            self.state = .isConfigured
            self.isDemoAvailable = false
        } else if type == .linkAndDemoNotAvailable {
            self.isDemoAvailable = false
        }
    }
}

#Preview {
    OnBoardingWelcomeScreenExamples()
}
