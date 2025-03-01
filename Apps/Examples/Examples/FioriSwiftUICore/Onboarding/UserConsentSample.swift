import FioriSwiftUICore
import SwiftUI

struct UserConsentViewBuilderExample: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var showPageInfo1: Bool = false
    @State private var showPageInfo2: Bool = false
    @State private var showPageInfo3: Bool = false
    @State private var showPageInfo4: Bool = false
    
    var body: some View {
        let detailText = "Detailed text about how info privacy pertains to this app and why it is important for the user to enable this functionality."
        if #available(iOS 15.0, *) {
            UserConsentView {
                UserConsentForm(userConsentPages: {
                                    UserConsentPage {
                                        Text("Form 0: Info Privacy")
                                    } bodyText: {
                                        Text(detailText)
                                    } action: {
                                        Button {
                                            print("UserConsentForm - More Info 0")
                                            showPageInfo1 = true
                                        } label: {
                                            Text("Learn more about Info Privacy")
                                        }
                                    }
                                        
                                    UserConsentPage {
                                        Text("Form 0: Data Privacy")
                                    } bodyText: {
                                        Text(detailText)
                                    } action: {
                                        Button {
                                            print("UserConsentForm - More Info 1")
                                            showPageInfo2 = true
                                        } label: {
                                            Text("Learn more about Data Privacy")
                                        }
                                    }
                                },
                                didAllow: { print("UserConsentForm - didAllow") } // ,
                )
      
                UserConsentForm(userConsentPages: {
                                    UserConsentPage {
                                        Text("Form 1: Security")
                                    } bodyText: {
                                        Text(detailText)
                                    } action: {
                                        Button {
                                            print("UserConsentForm - More Info 3")
                                            showPageInfo3 = true
                                        } label: {
                                            Text("Learn more about Data Privacy")
                                        }
                                    }
    
                                    UserConsentPage {
                                        Text("Form 1: Data Sharing")
                                    } bodyText: {
                                        Text(detailText)
                                    } action: {
                                        Button {
                                            print("UserConsentForm - More Info 4")
                                            showPageInfo4 = true
                                        } label: {
                                            Text("Learn more about Data Privacy")
                                        }
                                    }
                                },
                                isRequired: false,
                                didAllow: { print("UserConsentForm - didAllow") })
                    
            } didAllow: {
                print("UserConsentView - didAllow: index: \($0)")
            } didDeny: {
                print("UserConsentView - didDeny: index: \($0), isRequired: \($1)")
            } didCancel: { _ in
                print("UserConsentView - didCancel")
            } didFinish: { _ in
                presentationMode.wrappedValue.dismiss()
            }
            .alert("Information Privacy", isPresented: $showPageInfo1, actions: {}, message: { Text("Several data protection plans provided") })
            .alert("Data Privacy", isPresented: $showPageInfo2, actions: {}, message: { Text("Several data protection plans provided") })
            .alert("Security", isPresented: $showPageInfo3, actions: {}, message: { Text("Several data protection plans provided") })
            .alert("Data Sharing", isPresented: $showPageInfo4, actions: {}, message: { Text("Several data protection plans provided") })

        } else {
            // Fallback on earlier versions
        }
    }
}

struct UserConsentSinglePageM: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var showAlert: Bool = false
    
    var body: some View {
        let detailText = "Detailed text about how info privacy pertains to this app and why it is important for the user to enable this functionality."
        if #available(iOS 15.0, *) {
            UserConsentView {
                UserConsentForm(userConsentPages: {
                                    UserConsentPage {
                                        Text("Info Privacy")
                                    } bodyText: {
                                        Text(detailText)
                                    } action: {
                                        Button {
                                            print("UserConsentForm - More Info 0")
                                            showAlert = true
                                        } label: {
                                            Text("Learn more about Info Privacy")
                                        }
                                    }
                                },
                                didAllow: nil,
                                didDeny: nil,
                                didCancel: nil)
                    
            } didAllow: {
                print("UserConsentView - didAllow: index: \($0)")
            } didDeny: {
                print("UserConsentView - didDeny: index: \($0), isRequired: \($1)")
            } didCancel: { _ in
                print("UserConsentView - didCancel")
            } didFinish: { _ in
                presentationMode.wrappedValue.dismiss()
            }
            .alert("Information Privacy", isPresented: $showAlert, actions: {}, message: { Text("Several data protection plans provided") })

        } else {
            // Fallback on earlier versions
        }
    }
}

struct UserConsentSinglePageO: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var showAlert: Bool = false
    
    var body: some View {
        let longText = self.rtfAttributedString(resourceName: "PrivacyText") ?? NSAttributedString(string: "")
        
        if #available(iOS 15.0, *) {
            UserConsentView {
                UserConsentForm(userConsentPages: {
                                    UserConsentPage(title: "Data Privacy", bodyText: AttributedString(longText), action:
                                        FioriButton(action: { _ in
                                            print("UserConsentForm - More Info")
                                            showAlert = true
                                        }, label: { _ in
                                            Text("Learn more about Data Privacy")
                                        }))
                                },
                                isRequired: false)
                
            } didAllow: {
                print("UserConsentView - didAllow: index: \($0)")
            } didDeny: {
                print("UserConsentView - didDeny: index: \($0), isRequired: \($1)")
            } didCancel: { _ in
                print("UserConsentView - didCancel")
            } didFinish: { _ in
                presentationMode.wrappedValue.dismiss()
            }
            .alert("Information Privacy", isPresented: $showAlert, actions: {}, message: { Text("Several data protection plans provided") })
        } else {
            // Fallback on earlier versions
        }
    }
    
    func rtfAttributedString(resourceName: String) -> NSAttributedString? {
        let resourceType = "rtf"
        guard let path = Bundle.main.path(forResource: resourceName, ofType: resourceType) else {
            print("Error: Couldn't find resource \(resourceName).\(resourceType)")
            return nil
        }
        do {
            let options =
                [NSAttributedString.DocumentReadingOptionKey.documentType: NSAttributedString.DocumentType.rtf]
            let content = try NSAttributedString(
                url: URL(fileURLWithPath: path),
                options: options,
                documentAttributes: nil
            )
            return content
        } catch {
            print("Error: \(error)")
            return nil
        }
    }
}

struct UserConsentCustomized: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var showPageInfo1: Bool = false
    @State private var showPageInfo2: Bool = false
    @State private var showPageInfo3: Bool = false
    @State private var showPageInfo4: Bool = false
    @State private var showCancelAlert: Bool = false
    @State private var showDenyAlert: Bool = false
    
    var body: some View {
        let detailText = "Detailed text about how info privacy pertains to this app and why it is important for the user to enable this functionality."
        let alertConfig: (UserConsentAlertType) -> AlertConfiguration? = { alertType in
            switch alertType {
            case .deny:
                return AlertConfiguration(title: "Customized: You will not be able to continue onboarding if not accept.", action: AlertConfiguration.Action(label: "Accept"), secondaryAction: AlertConfiguration.Action(label: "Deny"))
            case .cancel:
                return AlertConfiguration(title: "Customized: Cancel?", action: AlertConfiguration.Action(label: NSLocalizedString("No", comment: "")), secondaryAction: AlertConfiguration.Action(label: NSLocalizedString("Quit", comment: "")))
            }
        }
        
        if #available(iOS 15.0, *) {
            UserConsentView {
                UserConsentForm(userConsentPages: {
                                    UserConsentPage {
                                        Text("Form 0: Info Privacy")
                                            .font(.fiori(forTextStyle: .title1)).foregroundColor(.green)
                                    } bodyText: {
                                        Text(detailText)
                                            .font(.fiori(forTextStyle: .subheadline)).foregroundColor(.green)
                                    } action: {
                                        Button {
                                            print("UserConsentForm - More Info 0")
                                            showPageInfo1 = true
                                        } label: {
                                            Text("Learn more about Info Privacy")
                                        }
                                    }
                                        
                                    UserConsentPage {
                                        Text("Form 0: Data Privacy")
                                    } bodyText: {
                                        Text(detailText)
                                    } action: {
                                        Button {
                                            print("UserConsentForm - More Info 1")
                                            showPageInfo2 = true
                                        } label: {
                                            Text("Learn more about Data Privacy")
                                        }
                                    }
                                },
                                isRequired: true,
                                alertConfiguration: alertConfig,
                                didAllow: { print("UserConsentForm - didAllow") },
                                didDeny: { print("UserConsentForm - didDeny: isRequired: \($0)")
                                    if $0 {
                                        showDenyAlert = true
                                    }
                                },
                                didCancel: {
                                    print("UserConsentForm - didCancel")
                                    showCancelAlert = true
                                })
      
                UserConsentForm(userConsentPages: {
                                    UserConsentPage {
                                        Text("Form 1: Security")
                                    } bodyText: {
                                        Text(detailText)
                                    } action: {
                                        Button {
                                            print("UserConsentForm - More Info 3")
                                            showPageInfo3 = true
                                        } label: {
                                            Text("Learn more about Data Privacy")
                                        }
                                    }
    
                                    UserConsentPage {
                                        Text("Form 1: Data Sharing")
                                    } bodyText: {
                                        Text(detailText)
                                    } action: {
                                        Button {
                                            print("UserConsentForm - More Info 4")
                                            showPageInfo4 = true
                                        } label: {
                                            Text("Learn more about Data Privacy")
                                        }
                                    }
                                },
                                isRequired: false,
                                didAllow: { print("UserConsentForm - didAllow") },
                                didDeny: { print("UserConsentForm - didDeny: isRequired: \($0)")
                                    if $0 {
                                        showDenyAlert = true
                                    }
                                },
                                didCancel: { print("UserConsentForm - didCancel")
                                    showCancelAlert = true
                                })
                    
            } didAllow: {
                print("UserConsentView - didAllow: index: \($0)")
            } didDeny: {
                print("UserConsentView - didDeny: index: \($0), isRequired: \($1)")
            } didCancel: { _ in
                showCancelAlert = true
                print("UserConsentView - didCancel")
            } didFinish: { _ in
                presentationMode.wrappedValue.dismiss()
            }
            .alert("Information Privacy", isPresented: $showPageInfo1, actions: {}, message: { Text("Several data protection plans provided") })
            .alert("Data Privacy", isPresented: $showPageInfo2, actions: {}, message: { Text("Several data protection plans provided") })
            .alert("Security", isPresented: $showPageInfo3, actions: {}, message: { Text("Several data protection plans provided") })
            .alert("Data Sharing", isPresented: $showPageInfo4, actions: {}, message: { Text("Several data protection plans provided") })
            .alert("Onboarding process canceled", isPresented: $showCancelAlert, actions: { Button("Got it", action: { presentationMode.wrappedValue.dismiss() }) }, message: { Text("Customized message") })
            .alert("The user consent denied", isPresented: $showDenyAlert, actions: { Button("ok", action: { presentationMode.wrappedValue.dismiss() }) }, message: { Text("Costomized alert message") })
        } else {
            // Fallback on earlier versions
        }
    }
}
