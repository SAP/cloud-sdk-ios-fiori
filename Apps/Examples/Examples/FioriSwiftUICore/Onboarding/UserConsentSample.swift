import FioriSwiftUICore
import SwiftUI

class UserConsentPageDataModel: UserConsentPageModel {
    var title_: String = ""
    var bodyText_: String?
    var htmlContent_: NSAttributedString?
    var footnote_: String?
    
    init() {}
    init(title: String, bodyText: String?, htmlContent: NSAttributedString?, footnote: String?) {
        self.title_ = title
        self.htmlContent_ = htmlContent
        self.footnote_ = footnote
        self.bodyText_ = bodyText
    }
}

class UserConsentDataModel: UserConsentModel, ObservableObject {
    @Published var cfStatus: UserConsentState = .userConsentInit
    var forms_: [UserConsentFormData] = []
    var secondActionTitle_: String? = "Deny"
    var firstActionTitle_: String? = "Not Now"
    var actionTitle_: String? = "Allow"
    var userAccepted_: [Int] = []
    var itemAccepted_: Binding<[Int]> = .constant([])
    
    func onCancel() {
        self.cfStatus = .userConsentCancel
    }
    
    func onAccepted(currentIndex: Int) {
        if !self.userAccepted_.contains(currentIndex) {
            self.userAccepted_.append(currentIndex)
            print("User Accepted form: \(self.userAccepted_), \(currentIndex)")
        }
        print("UserConsentSample: itemAccepted: \(self.itemAccepted_.wrappedValue)")
    }
    
    func setSinglePageData(required: Bool) {
        let pageModel = UserConsentPageDataModel(title: "Data Privacy", bodyText: "Detailed text about how data privacy pertains to this app and why it is important for the user to enable this functionality.", htmlContent: nil, footnote: "Learn more about Data Privacy")
        
        var form = UserConsentFormData()
        form.pages = [pageModel]
        form.isRequired = required
        self.forms_.append(form)
        self.userAccepted_ = []
    }
    
    func setMultiplePageData(required: Bool) {
        let page1 = UserConsentPageDataModel()
        page1.title_ = "Data Privacy"
        page1.bodyText_ = "Detailed text about how data privacy pertains to this app and why it is important for the user to enable this functionality."
        page1.footnote_ = "Learn more about Data Privacy"
        
        let page2 = UserConsentPageDataModel()
        page2.title_ = "Security"
        let longText = "Detailed text about how data privacy pertains to this app and why it is important for the user to enable this functionality."
        let text = NSMutableString()
        for i in 1 ..< 46 {
            text.appendFormat("%d. %@\r", i, longText)
        }
        page2.bodyText_ = text as String
        page2.footnote_ = "Learn more about Data Privacy"
        
        let page3 = UserConsentPageDataModel()
        page3.title_ = "Consent"
        page3.bodyText_ = text as String
        page3.footnote_ = "Learn more about Data Privacy"
        
        var form = UserConsentFormData()
        form.pages = [page1, page2, page3]
        form.isRequired = required
        self.forms_.append(form)
        self.userAccepted_ = []
    }
    
    func setHtmlData() {
        var htmlcontent = NSAttributedString(string: "")
        let eulaURL = Bundle.main.url(forResource: "PrivacyText", withExtension: "html")!
        do {
            let eulaData = try Data(contentsOf: eulaURL)
            let eulaAttString = try NSMutableAttributedString(data: eulaData, options: [.documentType: NSAttributedString.DocumentType.html], documentAttributes: nil)
            htmlcontent = eulaAttString
        } catch (_) {
            print("Failed to get Privscy text from html")
        }
        
        let pageModel = UserConsentPageDataModel(title: "Data Privacy in HTML", bodyText: nil, htmlContent: htmlcontent, footnote: "Learn more about Data Privacy")
        
        var form = UserConsentFormData()
        form.pages = [pageModel]
        form.isRequired = true
        self.forms_.append(form)
        self.userAccepted_ = []
    }
    
    func setMixFormData(required: Bool) {
        self.setSinglePageData(required: required)
        self.setMultiplePageData(required: required)
    }
    
    func setMixFormDataMO(requiredFirst: Bool) {
        self.setSinglePageData(required: requiredFirst)
        self.setMultiplePageData(required: !requiredFirst)
        self.setSinglePageData(required: requiredFirst)
        self.setMultiplePageData(required: !requiredFirst)
    }
    
    func setMixFormDataOM(requiredFirst: Bool) {
        self.setMultiplePageData(required: requiredFirst)
        self.setSinglePageData(required: !requiredFirst)
        self.setMultiplePageData(required: requiredFirst)
        self.setSinglePageData(required: !requiredFirst)
    }
    
    func setLongTextData(requiredFirst: Bool) {
        let htmlContent = self.rtfAttributedString(resourceName: "PrivacyText")
        let pageModel = UserConsentPageDataModel(title: "Data Privacy in RTF", bodyText: nil, htmlContent: htmlContent, footnote: "Learn more about Data Privacy")
        
        var form = UserConsentFormData()
        form.pages = [pageModel]
        form.isRequired = true
        self.forms_.append(form)
        self.userAccepted_ = []
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
            return content // .darkModeCompatible()
        } catch {
            print("Error: \(error)")
            return nil
        }
    }
}

struct UserConsentSinglePageM: View {
    var model = UserConsentDataModel()
    public init() {
        self.model.setSinglePageData(required: true)
    }

    var body: some View {
        UserConsent(forms: model.forms_, itemAccepted: model.itemAccepted_, actionTitle: model.actionTitle_, firstActionTitle: model.firstActionTitle_, secondActionTitle: model.secondActionTitle_, onCancel: nil, onAccepted: model.onAccepted)
    }
}

struct UserConsentSinglePageO: View {
    @ObservedObject var model = UserConsentDataModel()
    @Environment(\.presentationMode) var presentationMode
    public init() {
        self.model.setSinglePageData(required: false)
    }
    
    var body: some View {
        var showAlert = Binding<Bool>(
            get: { self.model.cfStatus == .userConsentCancel || self.model.cfStatus == .userConsentMoreInfo || self.model.cfStatus == .userConsentDeny },
            set: { _ in self.model.cfStatus = .userConsentInit }
        )
        UserConsent(model: model)
            .footnoteModifier { content in
                content
                    .onTapGesture {
                        model.cfStatus = .userConsentMoreInfo
                    }
                    .font(.headline).foregroundColor(.blue)
            }
            
            .actionTextModifier { content in
                content
                    .onTapGesture {
                        model.cfStatus = .userConsentAllow
                        self.presentationMode.wrappedValue.dismiss()
                    }
                    .font(.headline).foregroundColor(.green)
            }
            .firstActionTitleModifier { content in
                content
                    .onTapGesture {
                        model.cfStatus = .userConsentDeny
                    }
                    .font(.headline).foregroundColor(.red)
            }
            .secondActionTitleModifier { content in
                content
                    .onTapGesture {
                        self.presentationMode.wrappedValue.dismiss()
                        model.cfStatus = .userConsentDeny
                    }
                    .font(.headline).foregroundColor(.blue)
            }
            
            .alert(isPresented: showAlert) {
                switch model.cfStatus {
                case .userConsentMoreInfo:
                    return Alert(title: Text("Information Privacy"), message: Text("Several data protection plans provided"), dismissButton: .default(Text("Got it")) {
                        model.cfStatus = .userConsentInit
                    })
                case .userConsentCancel:
                    return Alert(title: Text("Cancel?"), message: Text("You have not finished the user consent form."), dismissButton: .default(Text("Got it")) {
                        self.presentationMode.wrappedValue.dismiss()
                        model.cfStatus = .userConsentInit
                    })
                case .userConsentInit:
                    break
                case .userConsentAllow:
                    break
                case .userConsentDeny:
                    return Alert(title: Text("Deny the user consent?"), message: Text("You need to check it in settings."), dismissButton: .default(Text("Ok")) {
                        self.presentationMode.wrappedValue.dismiss()
                        model.cfStatus = .userConsentInit
                    })
                case .userConsentStatus:
                    break
                }
                return Alert(title: Text(""))
            }
    }
}

struct UserConsentMultiplePageM: View {
    var model = UserConsentDataModel()
    public init() {
        self.model.setMultiplePageData(required: true)
    }
    
    var body: some View {
        UserConsent(forms: model.forms_, itemAccepted: model.itemAccepted_, actionTitle: model.actionTitle_, firstActionTitle: model.firstActionTitle_, secondActionTitle: model.secondActionTitle_, onCancel: nil, onAccepted: model.onAccepted)
    }
}

struct UserConsentMultiplePageO: View {
    var model = UserConsentDataModel()
    
    public init() {
        self.model.setMultiplePageData(required: false)
    }
    
    var body: some View {
        UserConsent(forms: model.forms_, itemAccepted: model.itemAccepted_, actionTitle: model.actionTitle_, firstActionTitle: model.firstActionTitle_, secondActionTitle: model.secondActionTitle_, onCancel: nil, onAccepted: model.onAccepted)
    }
}

struct UserConsentMixFormM: View {
    var model = UserConsentDataModel()
    
    public init() {
        self.model.setMixFormData(required: true)
    }
    
    var body: some View {
        UserConsent(forms: model.forms_, itemAccepted: model.itemAccepted_, actionTitle: model.actionTitle_, firstActionTitle: model.firstActionTitle_, secondActionTitle: model.secondActionTitle_, onCancel: nil, onAccepted: model.onAccepted)
    }
}

struct UserConsentMixFormO: View {
    var model = UserConsentDataModel()
    
    public init() {
        self.model.setMixFormData(required: false)
    }
    
    var body: some View {
        UserConsent(forms: model.forms_, itemAccepted: model.itemAccepted_, actionTitle: model.actionTitle_, firstActionTitle: model.firstActionTitle_, secondActionTitle: model.secondActionTitle_, onCancel: nil, onAccepted: model.onAccepted)
    }
}

struct UserConsentMixFormMO: View {
    var model = UserConsentDataModel()
    
    public init() {
        self.model.setMixFormDataMO(requiredFirst: true)
    }
    
    var body: some View {
        UserConsent(forms: model.forms_, itemAccepted: model.itemAccepted_, actionTitle: model.actionTitle_, firstActionTitle: model.firstActionTitle_, secondActionTitle: model.secondActionTitle_, onCancel: nil, onAccepted: model.onAccepted)
    }
}

struct UserConsentMixFormOM: View {
    var model = UserConsentDataModel()
    
    public init() {
        self.model.setMixFormDataOM(requiredFirst: true)
    }
    
    var body: some View {
        UserConsent(forms: model.forms_, itemAccepted: model.itemAccepted_, actionTitle: model.actionTitle_, firstActionTitle: model.firstActionTitle_, secondActionTitle: model.secondActionTitle_, onCancel: nil, onAccepted: model.onAccepted)
    }
}

struct UserConsentLongText: View {
    var model = UserConsentDataModel()
    
    public init() {
        self.model.setLongTextData(requiredFirst: false)
    }
    
    var body: some View {
        UserConsent(forms: model.forms_, itemAccepted: model.itemAccepted_, actionTitle: model.actionTitle_, firstActionTitle: model.firstActionTitle_, secondActionTitle: model.secondActionTitle_, onCancel: nil, onAccepted: model.onAccepted)
    }
}

struct UserConsentSinglePageHTML: View {
    var model = UserConsentDataModel()
    
    public init() {
        self.model.setHtmlData()
    }
    
    var body: some View {
        UserConsent(forms: model.forms_, itemAccepted: model.itemAccepted_, actionTitle: model.actionTitle_, firstActionTitle: model.firstActionTitle_, secondActionTitle: model.secondActionTitle_, onCancel: nil, onAccepted: model.onAccepted)
    }
}
