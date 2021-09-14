import FioriSwiftUICore
import SwiftUI

// class UserConsentPageDataModel: UserConsentPageModel {
//    var title_: String = ""
//    var bodyText_: String?
//    var htmlContent_: NSAttributedString?
//    var footnote_: String?
//
//    init() {}
//    init(title: String, bodyText: String?, htmlContent: NSAttributedString?, footnote: String?) {
//        self.title_ = title
//        self.htmlContent_ = htmlContent
//        self.footnote_ = footnote
//        self.bodyText_ = bodyText
//    }
// }
//
// class UserConsentDataModel: UserConsentModel, ObservableObject {
//    var forms_: [UserConsentFormData] = []
//    var secondActionTitle_: String? = "Deny"
//    var firstActionTitle_: String? = "Not Now"
//    var actionTitle_: String? = "Allow"
//    var userAccepted_: [Int] = []
//    var itemAccepted_: Binding<[Int]> = .constant([])
//    var currentPageIndex_: Binding<Int> = .constant(0)
//    var currentFormIndex_: Binding<Int> = .constant(0)
//    @Published var isCanceled_: Bool = false
//
//    func onCancel() {
//        self.isCanceled_ = true
//    }
//
//    func setSinglePageData(required: Bool) {
//        let pageModel = UserConsentPageDataModel(title: "Data Privacy", bodyText: "Detailed text about how data privacy pertains to this app and why it is important for the user to enable this functionality.", htmlContent: nil, footnote: "Learn more about Data Privacy")
//
//        var form = UserConsentFormData()
//        form.pages = [pageModel]
//        form.isRequired = required
//        self.forms_.append(form)
//        self.userAccepted_ = []
//    }
//
//    func setMultiplePageData(required: Bool) {
//        let page1 = UserConsentPageDataModel()
//        page1.title_ = "User Privacy"
//        page1.bodyText_ = "Detailed text about how data privacy pertains to this app and why it is important for the user to enable this functionality."
//        page1.footnote_ = "Learn more about Data Privacy"
//
//        let page2 = UserConsentPageDataModel()
//        page2.title_ = "Security"
//        let longText = "Detailed text about how data privacy pertains to this app and why it is important for the user to enable this functionality."
//        let text = NSMutableString()
//        for i in 1 ..< 46 {
//            text.appendFormat("%d. %@\r", i, longText)
//        }
//        page2.bodyText_ = text as String
//        page2.footnote_ = "Learn more about Data Privacy"
//
//        let page3 = UserConsentPageDataModel()
//        page3.title_ = "Consent"
//        page3.bodyText_ = text as String
//        page3.footnote_ = "Learn more about Data Privacy"
//
//        var form = UserConsentFormData()
//        form.pages = [page1, page2, page3]
//        form.isRequired = required
//        self.forms_.append(form)
//        self.userAccepted_ = []
//    }
//
//    func setHtmlData() {
//        var htmlcontent = NSAttributedString(string: "")
//        let eulaURL = Bundle.main.url(forResource: "PrivacyText", withExtension: "html")!
//        do {
//            let eulaData = try Data(contentsOf: eulaURL)
//            let eulaAttString = try NSMutableAttributedString(data: eulaData, options: [.documentType: NSAttributedString.DocumentType.html], documentAttributes: nil)
//            htmlcontent = eulaAttString
//        } catch (_) {
//            print("Failed to get Privscy text from html")
//        }
//
//        let pageModel = UserConsentPageDataModel(title: "Data Privacy in HTML", bodyText: nil, htmlContent: htmlcontent, footnote: "Learn more about Data Privacy")
//
//        var form = UserConsentFormData()
//        form.pages = [pageModel]
//        form.isRequired = true
//        self.forms_.append(form)
//        self.userAccepted_ = []
//    }
//
//    func setMixFormData(required: Bool) {
//        self.setSinglePageData(required: required)
//        self.setMultiplePageData(required: required)
//    }
//
//    func setMixFormDataMO(requiredFirst: Bool) {
//        self.setSinglePageData(required: requiredFirst)
//        self.setMultiplePageData(required: !requiredFirst)
//        self.setSinglePageData(required: requiredFirst)
//        self.setMultiplePageData(required: !requiredFirst)
//    }
//
//    func setMixFormDataOM(requiredFirst: Bool) {
//        self.setMultiplePageData(required: requiredFirst)
//        self.setSinglePageData(required: !requiredFirst)
//        self.setMultiplePageData(required: requiredFirst)
//        self.setSinglePageData(required: !requiredFirst)
//    }
//
//    func setLongTextData(requiredFirst: Bool) {
//        let htmlContent = self.rtfAttributedString(resourceName: "PrivacyText")
//        let pageModel = UserConsentPageDataModel(title: "Data Privacy in RTF", bodyText: nil, htmlContent: htmlContent, footnote: "Learn more about Data Privacy")
//
//        var form = UserConsentFormData()
//        form.pages = [pageModel]
//        form.isRequired = true
//        self.forms_.append(form)
//        self.userAccepted_ = []
//    }
//
//    func rtfAttributedString(resourceName: String) -> NSAttributedString? {
//        let resourceType = "rtf"
//        guard let path = Bundle.main.path(forResource: resourceName, ofType: resourceType) else {
//            print("Error: Couldn't find resource \(resourceName).\(resourceType)")
//            return nil
//        }
//        do {
//            let options =
//                [NSAttributedString.DocumentReadingOptionKey.documentType: NSAttributedString.DocumentType.rtf]
//            let content = try NSAttributedString(
//                url: URL(fileURLWithPath: path),
//                options: options,
//                documentAttributes: nil
//            )
//            return content // .darkModeCompatible()
//        } catch {
//            print("Error: \(error)")
//            return nil
//        }
//    }
// }
//
// struct UserConsentSinglePageM: View {
//    var model = UserConsentDataModel()
//    public init() {
//        self.model.setSinglePageData(required: true)
//    }
//
//    var body: some View {
//        UserConsent(forms: model.forms_, currentPageIndex: model.currentPageIndex_, currentFormIndex: model.currentFormIndex_, itemAccepted: model.itemAccepted_, actionTitle: model.actionTitle_, firstActionTitle: model.firstActionTitle_, secondActionTitle: model.secondActionTitle_, onCancel: nil)
//    }
// }
//
// struct UserConsentSinglePageO: View {
//    var model = UserConsentDataModel()
//    public init() {
//        self.model.setSinglePageData(required: false)
//    }
//
//    var body: some View {
//        UserConsent(forms: model.forms_, currentPageIndex: model.currentPageIndex_, currentFormIndex: model.currentFormIndex_, itemAccepted: model.itemAccepted_, actionTitle: model.actionTitle_, firstActionTitle: model.firstActionTitle_, secondActionTitle: model.secondActionTitle_, onCancel: nil)
//    }
// }
//
// struct UserConsentMultiplePageM: View {
//    @State var currentFormIndex: Int = 0
//    @State var currentPageIndex: Int = 0
//    var model = UserConsentDataModel()
//    public init() {
//        self.model.setMultiplePageData(required: true)
//    }
//
//    var body: some View {
//        UserConsent(forms: model.forms_, currentPageIndex: self.$currentPageIndex, currentFormIndex: self.$currentFormIndex, itemAccepted: model.itemAccepted_, actionTitle: model.actionTitle_, firstActionTitle: model.firstActionTitle_, secondActionTitle: model.secondActionTitle_, onCancel: nil)
//    }
// }
//
// struct UserConsentMultiplePageO: View {
//    @State var currentFormIndex: Int = 0
//    @State var currentPageIndex: Int = 0
//    var model = UserConsentDataModel()
//
//    public init() {
//        self.model.setMultiplePageData(required: false)
//    }
//
//    var body: some View {
//        UserConsent(forms: model.forms_, currentPageIndex: self.$currentPageIndex, currentFormIndex: self.$currentFormIndex, itemAccepted: model.itemAccepted_, actionTitle: model.actionTitle_, firstActionTitle: model.firstActionTitle_, secondActionTitle: model.secondActionTitle_, onCancel: nil)
//    }
// }
//
// struct UserConsentMixFormM: View {
//    @State var currentFormIndex: Int = 0
//    @State var currentPageIndex: Int = 0
//    var model = UserConsentDataModel()
//
//    public init() {
//        self.model.setMixFormData(required: true)
//    }
//
//    var body: some View {
//        UserConsent(forms: model.forms_, currentPageIndex: self.$currentPageIndex, currentFormIndex: self.$currentFormIndex, itemAccepted: model.itemAccepted_, actionTitle: model.actionTitle_, firstActionTitle: model.firstActionTitle_, secondActionTitle: model.secondActionTitle_, onCancel: nil)
//    }
// }
//
// struct UserConsentMixFormO: View {
//    @State var currentFormIndex: Int = 0
//    @State var currentPageIndex: Int = 0
//    var model = UserConsentDataModel()
//
//    public init() {
//        self.model.setMixFormData(required: false)
//    }
//
//    var body: some View {
//        UserConsent(forms: model.forms_, currentPageIndex: self.$currentPageIndex, currentFormIndex: self.$currentFormIndex, itemAccepted: model.itemAccepted_, actionTitle: model.actionTitle_, firstActionTitle: model.firstActionTitle_, secondActionTitle: model.secondActionTitle_, onCancel: nil)
//    }
// }
//
// struct UserConsentMixFormMO: View {
//    @State var currentFormIndex: Int = 0
//    @State var currentPageIndex: Int = 0
//    var model = UserConsentDataModel()
//
//    public init() {
//        self.model.setMixFormDataMO(requiredFirst: true)
//    }
//
//    var body: some View {
//        UserConsent(forms: model.forms_, currentPageIndex: self.$currentPageIndex, currentFormIndex: self.$currentFormIndex, itemAccepted: model.itemAccepted_, actionTitle: model.actionTitle_, firstActionTitle: model.firstActionTitle_, secondActionTitle: model.secondActionTitle_, onCancel: nil)
//    }
// }
//
// struct UserConsentMixFormOM: View {
//    @State var formAccepted: [Int] = []
//    @State var showInfo: Bool = false
//    @State var showDenyMsg: Bool = false
//    @State var currentFormIndex: Int = 0
//    @State var currentPageIndex: Int = 0
//    @ObservedObject var model = UserConsentDataModel()
//    @Environment(\.presentationMode) var presentationMode
//
//    public init() {
//        self.model.setMixFormDataOM(requiredFirst: true)
//    }
//
//    var body: some View {
//        let showAlert = Binding<Bool>(
//            get: { self.showInfo || self.model.isCanceled_ || self.showDenyMsg },
//            set: { _ in
//                self.showInfo = false
//                self.model.isCanceled_ = false
//                self.showDenyMsg = false
//            }
//        )
//        VStack {
//            UserConsent(forms: model.forms_, currentPageIndex: $currentPageIndex, currentFormIndex: $currentFormIndex, itemAccepted: self.$formAccepted, actionTitle: model.actionTitle_, firstActionTitle: model.firstActionTitle_, secondActionTitle: model.secondActionTitle_, onCancel: model.onCancel)
//                .footnoteModifier { content in
//                    content
//                        .onTapGesture {
//                            self.showInfo = true
//                        }
//                        .font(.headline).foregroundColor(.blue)
//                }
//
//                .actionTextModifier { content in
//                    content
//                        .onTapGesture {
//                            self.presentationMode.wrappedValue.dismiss()
//                        }
//                        .font(.headline).foregroundColor(.green)
//                }
//                .firstActionTitleModifier { content in
//                    content
//                        .onTapGesture {
//                            self.showDenyMsg = true
//                        }
//                        .font(.headline).foregroundColor(.red)
//                }
//                .secondActionTitleModifier { content in
//                    content
//                        .onTapGesture {
//                            self.presentationMode.wrappedValue.dismiss()
//                        }
//                        .font(.headline).foregroundColor(.blue)
//                }
//
//                .alert(isPresented: showAlert) {
//                    if self.showInfo {
//                        switch self.$currentPageIndex.wrappedValue {
//                        case 0:
//                            return Alert(title: Text("Information Privacy 0"), message: Text("Several data protection plans provided"), dismissButton: .default(Text("Got it")) {})
//                        case 1:
//                            return Alert(title: Text("Information Privacy 1"), message: Text("Several data protection plans provided"), dismissButton: .default(Text("Got it")) {})
//                        case 2:
//                            return Alert(title: Text("Information Privacy 2"), message: Text("Several data protection plans provided"), dismissButton: .default(Text("Got it")) {})
//                        default:
//                            return Alert(title: Text("Information Privacy"), message: Text("Several data protection plans provided"), dismissButton: .default(Text("Got it")) {})
//                        }
//                    } else if self.model.isCanceled_ {
//                        return Alert(title: Text("Cancel?"), message: Text("You have not finished the user consent form."), dismissButton: .default(Text("Got it")) {
//                            self.presentationMode.wrappedValue.dismiss()
//                        })
//                    } else if self.showDenyMsg {
//                        return Alert(title: Text("Deny the user consent?"), message: Text("You need to check it in settings."), dismissButton: .default(Text("Ok")) {
//                            self.presentationMode.wrappedValue.dismiss()
//
//                        })
//                    }
//                    return Alert(title: Text(""))
//                }
//
////            Text("Accepted: \(getResult())")
//        }
//    }
//
//    func getResult() -> String {
//        if self.formAccepted.isEmpty {
//            return ""
//        } else {
//            return self.formAccepted.map { String($0) }.joined(separator: ",")
//        }
//    }
// }
//
// struct UserConsentLongText: View {
//    var model = UserConsentDataModel()
//
//    public init() {
//        self.model.setLongTextData(requiredFirst: false)
//    }
//
//    var body: some View {
//        UserConsent(forms: model.forms_, currentPageIndex: model.currentPageIndex_, currentFormIndex: model.currentFormIndex_, itemAccepted: model.itemAccepted_, actionTitle: model.actionTitle_, firstActionTitle: model.firstActionTitle_, secondActionTitle: model.secondActionTitle_, onCancel: nil)
//    }
// }
//
// struct UserConsentSinglePageHTML: View {
//    var model = UserConsentDataModel()
//
//    public init() {
//        self.model.setHtmlData()
//    }
//
//    var body: some View {
//        UserConsent(forms: model.forms_, currentPageIndex: model.currentPageIndex_, currentFormIndex: model.currentFormIndex_, itemAccepted: model.itemAccepted_, actionTitle: model.actionTitle_, firstActionTitle: model.firstActionTitle_, secondActionTitle: model.secondActionTitle_, onCancel: nil)
//    }
// }

struct UserConsentViewBuilderExample: View {
    var body: some View {
        UserConsentView {
            UserConsentForm(userConsentPages: {
                                UserConsentPage {
                                    Text("Form 0")
                                } bodyAttributedText: {
                                    Text("Page 0")
                                }
                
                                UserConsentPage {
                                    Text("Form 0")
                                } bodyAttributedText: {
                                    Text("Page 1")
                                }
                            },
                            didAllow: { print("UserConsentForm - didAllow") },
                            didDeny: { print("UserConsentForm - didDeny: isRequired: \($0)") },
                            didCancel: { print("UserConsentForm - didAllow") })
            
            UserConsentForm(userConsentPages: {
                                UserConsentPage {
                                    Text("Form 1")
                                } bodyAttributedText: {
                                    Text("Page 0")
                                }
                
                                UserConsentPage {
                                    Text("Form 1")
                                } bodyAttributedText: {
                                    Text("Page 1")
                                }
                            },
                            isRequired: false,
                            didAllow: { print("UserConsentForm - didAllow") },
                            didDeny: { print("UserConsentForm - didDeny: isRequired: \($0)") },
                            didCancel: { print("UserConsentForm - didAllow") })
            
        } didAllow: {
            print("UserConsentView - didAllow: index: \($0)")
        } didDeny: {
            print("UserConsentView - didDeny: index: \($0), isRequired: \($1)")
        } didCancel: {
            print("UserConsentView - didCancel: index: \($0)")
        } didFinish: {
            print("UserConsentView - didFinish: Allowed forms: \($0)")
        }
    }
}

// struct UserConsentViewPreview: PreviewProvider {
//    static var previews: some View {
//        UserConsentForm(userConsentPages: {
//            UserConsentPage {
//                Text("Title 00")
//            } bodyText: {
//                Text("Body Text")
//            }
//
//            UserConsentPage {
//                Text("Title 11")
//            } bodyText: {
//                Text("Body Text 11")
//            }
//        })
//    }
// }
