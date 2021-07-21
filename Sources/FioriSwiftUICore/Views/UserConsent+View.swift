/// - Important: to make `@Environment` properties (e.g. `horizontalSizeClass`), internally accessible
/// to extensions, add as sourcery annotation in `FioriSwiftUICore/Models/ModelDefinitions.swift`
/// to declare a wrapped property
/// e.g.:  `// sourcery: add_env_props = ["horizontalSizeClass"]`

import SwiftUI

extension Fiori {
    enum UserConsent {
        struct ActionTitle: ViewModifier {
            func body(content: Content) -> some View {
                content
                    .font(.headline)
                    .foregroundColor(.preferredColor(.tintColor))
            }
        }

        struct FirstActionTitle: ViewModifier {
            func body(content: Content) -> some View {
                content
                    .font(.body)
                    .foregroundColor(.preferredColor(.tintColor))
            }
        }

        struct SecondActionTitle: ViewModifier {
            func body(content: Content) -> some View {
                content
                    .font(.body)
                    .foregroundColor(.preferredColor(.tintColor))
            }
        }

        typealias ActionTitleCumulative = EmptyModifier
        typealias FirstActionTitleCumulative = EmptyModifier
        typealias SecondActionTitleCumulative = EmptyModifier
        
        static let actionTitle = ActionTitle()
        static let firstActionTitle = FirstActionTitle()
        static let secondActionTitle = SecondActionTitle()
        static let actionTitleCumulative = ActionTitleCumulative()
        static let firstActionTitleCumulative = FirstActionTitleCumulative()
        static let secondActionTitleCumulative = SecondActionTitleCumulative()
    }
}

extension UserConsent: View {
    public var body: some View {
        let pageModel = self._forms[self.currentFormIndex].pages?[currentPageIndex] ?? self._forms[0].pages?[0]
        
        VStack {
            if #available(iOS 14.0, *) {
                UserConsentPage(model: pageModel!)
                    .toolbar(content: {
                        ToolbarItem(placement: .bottomBar) {
                            self.leftButton
                        }
                        ToolbarItem(placement: .bottomBar) {
                            Spacer()
                                .setHidden(!self.hideNextButton())
                        }
                        ToolbarItem(placement: .bottomBar) {
                            self.rightButton
                        }
                        
                    })
            } else {
                UserConsentPage(model: pageModel!)
                if self.hideNextButton() {
                    HStack {
                        self.leftButton
                        Spacer()
                        self.rightButton
                    }
                    .padding(.leading, 16)
                    .padding(.trailing, 16)
                    .frame(maxHeight: 30, alignment: .bottom)
                }
            }
        }
        
        .navigationBarItems(leading:
            VStack {
                if self.currentPageIndex == 0 {
                    Button(action: self._onCancel ?? self.onCancelButtonClicked) {
                        Text("Cancel", tableName: tableName, bundle: bundle)
                    }
                } else {
                    Button(action: self.loadPreviousPage) {
                        Text(getBackTitle())
                    }
                }
            },
                            
            trailing: Button(action: {
                self.loadNextPage()
            }, label: {
                Text("Next", tableName: tableName, bundle: bundle)
            })
                .setHidden(self.hideNextButton()))
        
        .onDisappear(perform: {
            let cancelString = NSLocalizedString("Canceled", tableName: tableName, bundle: bundle, value: "Canceled", comment: "")
            let okString = NSLocalizedString("Ok", tableName: tableName, bundle: bundle, value: "Ok", comment: "")
            let cancelMsgString = NSLocalizedString("User canceled Onboarding", tableName: tableName, bundle: bundle, value: "User canceled Onboarding", comment: "")
            let statusString = NSLocalizedString("Status", tableName: tableName, bundle: bundle, value: "Status", comment: "")
            
            switch self.currentState {
            case .userConsentCancel:
                self.alertMessage(title: cancelString, message: cancelMsgString, primaryAction: UIAlertAction(title: okString, style: .default, handler: nil), secondaryAction: nil)
            case .userConsentStatus:
                if self.numAccepted > 0 {
                    self.alertMessage(title: statusString, message: "User accepted \(self.numAccepted) form(s)", primaryAction: UIAlertAction(title: okString, style: .default, handler: nil), secondaryAction: nil)
                }
            case .userConsentInit:
                break
            case .userConsentAllow:
                break
            case .userConsentDeny:
                break
            case .userConsentMoreInfo:
                break
            }
        })
        
        .navigationBarTitle(self.getTitle())
    }
    
    @ViewBuilder var leftButton: some View {
        if self._forms[self.currentFormIndex].isRequired {
            secondActionTitle
                .onTapGesture {
                    self.onDenyButtonClicked()
                }
                .setHidden(!self.hideNextButton())
                .buttonStyle(StatefulButtonStyle())
        } else {
            firstActionTitle
                .onTapGesture {
                    self.onNotNowButtonClicked()
                }
                .setHidden(!self.hideNextButton())
                .buttonStyle(StatefulButtonStyle())
        }
    }
    
    @ViewBuilder var rightButton: some View {
        actionTitle
            .onTapGesture {
                self.onAllowButtonClicked()
                (self._onAccepted ?? self.updateResult)(self.currentFormIndex)
            }
            .setHidden(!self.hideNextButton())
            .buttonStyle(StatefulButtonStyle())
    }
    
    func getTitle() -> String {
        let pages = self._forms[self.currentFormIndex].pages
        if pages?.count ?? 0 > 1 {
            return "Step \(self.currentPageIndex + 1) of \(pages?.count ?? 0)"
        }
        return ""
    }
    
    func hideNextButton() -> Bool {
        let pages = self._forms[self.currentFormIndex].pages
        if pages?.count == 1 {
            return true
        } else if self.currentPageIndex == 0 && pages?.count ?? 0 > 1 {
            return false
        } else if self.currentPageIndex + 1 == pages?.count ?? 0 {
            return true
        } else {
            return false
        }
    }
    
    func getBackTitle() -> String {
        if currentPageIndex > 0 {
            guard let page = self._forms[self.currentFormIndex].pages?[self.currentPageIndex - 1] else { return "" }
            return page.title_
        }
        return ""
    }
    
    func loadNextPage() {
        guard let pages = self._forms[self.currentFormIndex].pages else { return }
        if pages.count > 0, self.currentPageIndex < pages.count - 1 {
            self.currentPageIndex += 1
        }
    }
    
    func loadPreviousPage() {
        if self.currentPageIndex > 0 {
            currentPageIndex -= 1
        } else if self.currentFormIndex > 0 {
            self.currentFormIndex -= 1
            let pages = self._forms[currentFormIndex].pages
            if pages?.count ?? 0 > 1 {
                self.currentPageIndex = pages?.count ?? 0 - 1
            }
        }
    }
    
    func onCancelButtonClicked() {
        self.currentState = .userConsentCancel
        self.alertMessage(title: "Are you sure you want to cancel?", message: "", primaryAction: UIAlertAction(title: "No", style: .cancel, handler: nil), secondaryAction: UIAlertAction(title: "Quit", style: .default, handler: { _ in self.presentationMode.wrappedValue.dismiss() }))
    }
    
    func onDenyButtonClicked() {
        self.currentState = .userConsentDeny
        let denyString = NSLocalizedString("Without consent you will not be able to continue onboarding.", tableName: tableName, bundle: bundle, value: "Without consent you will not be able to continue onboarding.", comment: "")
        let giveConsentString = NSLocalizedString("Give Consent", tableName: tableName, bundle: bundle, value: "Give Consent", comment: "")
        let quitString = NSLocalizedString("Quit", tableName: tableName, bundle: bundle, value: "Quit", comment: "")
        self.alertMessage(
            title: denyString,
            message: "",
            primaryAction: UIAlertAction(
                title: giveConsentString,
                style: .cancel,
                handler: { _ in
                    self.numAccepted += 1
                    if self.currentFormIndex + 1 < self._forms.count {
                        self.currentFormIndex += 1
                        self.currentPageIndex = 0
                    } else {
                        self.currentState = .userConsentStatus
                        self.presentationMode.wrappedValue.dismiss()
                    }
                }
            ),
            secondaryAction: UIAlertAction(
                title: quitString,
                style: .default,
                handler: { _ in
                    self.currentState = .userConsentStatus
                    self.presentationMode.wrappedValue.dismiss()
                }
            )
        )
    }
    
    func onAllowButtonClicked() {
        self._onAccepted!(self.currentFormIndex)
        self._itemAccepted.wrappedValue.append(self.currentFormIndex)
        print("itemAccepted: \(self._itemAccepted.wrappedValue)")
        self.numAccepted += 1
        if self.currentFormIndex + 1 < self._forms.count {
            self.currentFormIndex += 1
            self.currentPageIndex = 0
        } else {
            self.currentState = .userConsentStatus
            self.presentationMode.wrappedValue.dismiss()
        }
    }
    
    func updateResult(formIndex: Int) {
        if !self.ucAccepted.contains(formIndex) {
            self.ucAccepted.append(formIndex)
        }
    }
    
    func onNotNowButtonClicked() {
        if self.currentFormIndex + 1 < self._forms.count {
            self.currentFormIndex += 1
            self.currentPageIndex = 0
        } else {
            if self.numAccepted > 0 {
                self.currentState = .userConsentStatus
            }
            self.presentationMode.wrappedValue.dismiss()
        }
    }
}

extension View {
    /// Alert message used in SDK
    func alertMessage(title: String, message: String, primaryAction: UIAlertAction?, secondaryAction: UIAlertAction?) {
        let alertVC = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        if primaryAction != nil {
            alertVC.addAction(primaryAction!)
            if secondaryAction != nil {
                alertVC.addAction(secondaryAction!)
            }
        } else {
            let okAction = UIAlertAction(title: "OK", style: .default) { (_: UIAlertAction) in
            }
            alertVC.addAction(okAction)
        }
        let viewController = UIApplication.shared.windows.first!.rootViewController!
        viewController.present(alertVC, animated: true, completion: nil)
    }
}
