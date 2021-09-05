import FioriSwiftUICore
import SwiftUI

class EULAViewDataModel: EULAViewModel {
    var title: String = "EULA"
    
    var htmlContent: NSAttributedString?
    
    var actionText: String? = "Disagree"
    var secondaryActionText: String? = "Agree"
    
    func didSelectAction() {
        print("EULAView Primary button clicked")
    }
    
    func didSelectSecondaryAction() {
        print("EULAView secondary button clicked")
    }
    
    func caseHTML() {
        self.htmlContent = NSAttributedString(string: "http://www.sap.com\nThis is a legally binding agreement (\"Agreement\") between Company and SAP SE which provides the terms of your use of the SAP mobile application (Software). By clicking \"Accept\" or by installing and/or using the Software, you on behalf of the Company are agreeing to all of the terms and conditions stated in this Agreement. If you do not agree to these terms, do not click \"Agree\", and do not use the Software. You represent and warrant that you have the authority to bind the Company to the terms of this Agreement.\n\n")
    }
    
    func caseLongHTML() {
        let eulaURL = Bundle.main.url(forResource: "EULAText", withExtension: "html")!
        do {
            let eulaData = try Data(contentsOf: eulaURL)
            let eulaAttString = try NSMutableAttributedString(data: eulaData, options: [.documentType: NSAttributedString.DocumentType.html], documentAttributes: nil)
            self.htmlContent = eulaAttString
        } catch (_) {
            print("Failed to get EULA text from html")
        }
    }
    
    func caseShortHTML() {
        let eulaURL = Bundle.main.url(forResource: "EULA2", withExtension: "html")!
        do {
            let eulaData = try Data(contentsOf: eulaURL)
            let eulaAttString = try NSMutableAttributedString(data: eulaData, options: [.documentType: NSAttributedString.DocumentType.html], documentAttributes: nil)
            self.htmlContent = eulaAttString
        } catch (_) {
            print("Failed to get EULA text from html")
        }
    }
    
    func caseConcatAttributedStrings() {
        self.title = "CUSTOM EULA"
        
        let string1 = NSAttributedString(string: "This is a legally binding agreement (\"Agreement\") between Company and SAP SE which provides the terms of your use of the SAP mobile application (Software). By clicking \"Accept\" or by installing and/or using the Software, you on behalf of the Company are agreeing to all of the terms and conditions stated in this Agreement. If you do not agree to these terms, do not click \"Agree\", and do not use the Software. You represent and warrant that you have the authority to bind the Company to the terms of this Agreement.\n\n", attributes:
            [NSAttributedString.Key.font: UIFont(name: "Georgia", size: 22.0)!])
        let string2 = NSAttributedString(string: "This is a legally binding agreement (\"Agreement\") between Company and SAP SE which provides the terms of your use of the SAP mobile application (Software). By clicking \"Accept\" or by installing and/or using the Software, you on behalf of the Company are agreeing to all of the terms and conditions stated in this Agreement. If you do not agree to these terms, do not click \"Agree\", and do not use the Software. You represent and warrant that you have the authority to bind the Company to the terms of this Agreement.\n\n", attributes:
            [NSAttributedString.Key.font: UIFont(name: "Georgia", size: 15.0)!])
        let string3 = NSAttributedString(string: "This is a legally binding agreement (\"Agreement\") between Company and SAP SE which provides the terms of your use of the SAP mobile application (Software). By clicking \"Accept\" or by installing and/or using the Software, you on behalf of the Company are agreeing to all of the terms and conditions stated in this Agreement. If you do not agree to these terms, do not click \"Agree\", and do not use the Software. You represent and warrant that you have the authority to bind the Company to the terms of this Agreement.\n\n", attributes:
            [NSAttributedString.Key.font: UIFont(name: "Georgia", size: 15.0)!])
        let linkString = NSAttributedString(string: "http://service.sap.com\n\n", attributes: [NSAttributedString.Key.link: URL(string: "http://service.sap.com")!])
        let attText = NSMutableAttributedString()
        
        attText.append(linkString)
        attText.append(string1)
        attText.append(string2)
        attText.append(string3)
        attText.append(linkString)
        
        self.htmlContent = attText
        
        self.actionText = "Reject"
        self.secondaryActionText = "Confirm"
    }
    
    func caseShortStringWithLink() {
        let attributedString = NSAttributedString(string: "Short http://service.sap.com Short") // , attributes: textColorAttribute)
        
        htmlContent = attributedString
    }
    
    func caseShortAttributedStringWithLink() {
        let linkAttributes = [
            NSAttributedString.Key.link: URL(string: "https://service.sap.com")!,
            NSAttributedString.Key.font: UIFont(name: "Helvetica", size: 18.0)!,
            NSAttributedString.Key.foregroundColor: UIColor.blue
        ] as [NSAttributedString.Key: Any]
        
        let attributedString = NSMutableAttributedString(string: "Just click here to go to SAP service web site.\n\n" + "This is a legally binding agreement (\"Agreement\") between Company and SAP SE which provides the terms of your use of the SAP mobile application (Software). By clicking \"Accept\" or by installing and/or using the Software, you on behalf of the Company are agreeing to all of the terms and conditions stated in this Agreement. If you do not agree to these terms, do not click \"Agree\", and do not use the Software. You represent and warrant that you have the authority to bind the Company to the terms of this Agreement.\n\n")
        
        attributedString.setAttributes(linkAttributes, range: NSRange(location: 5, length: 10))
        self.htmlContent = attributedString
    }
}

struct EULAViewSample: View {
    var model = EULAViewDataModel()
    
    public init() {
        self.model.caseHTML()
    }
    
    var body: some View {
        VStack {
            EULAView(model: model)
        }
    }
}

struct EULALongHtmlSample: View {
    var model: EULAViewDataModel
    
    public init() {
        self.model = EULAViewDataModel()
        self.model.caseLongHTML()
    }
    
    var body: some View {
        VStack {
            EULAView(model: model)
                .actionTextModifier { $0.foregroundColor(.blue) }
        }
    }
}

struct EULAShortHtmlSample: View {
    var model = EULAViewDataModel()
    
    public init() {
        self.model.caseShortHTML()
    }
    
    var body: some View {
        VStack {
            EULAView(model: model)
                .actionTextModifier { $0.foregroundColor(.blue) }
        }
    }
}

struct EULAConcatSample: View {
    var model = EULAViewDataModel()
    
    public init() {
        self.model.caseConcatAttributedStrings()
    }
    
    var body: some View {
        VStack {
            EULAView(model: model)
                .actionTextModifier { $0.foregroundColor(.blue) }
        }
    }
}

struct EULAWithLinkSample: View {
    var model = EULAViewDataModel()
    
    public init() {
        self.model.caseShortStringWithLink()
    }
    
    var body: some View {
        VStack {
            EULAView(model: model)
                .actionTextModifier { $0.foregroundColor(.blue) }
        }
    }
}

struct EULAShortWithLinkSample: View {
    var model = EULAViewDataModel()
    
    public init() {
        self.model.caseShortAttributedStringWithLink()
    }
    
    var body: some View {
        VStack {
            EULAView(model: model)
                .actionTextModifier { $0.foregroundColor(.blue) }
        }
    }
}

struct EULAViewCustomized: View {
    var model = EULAViewDataModel()
    
    public init() {
        self.model.caseHTML()
    }
    
    var body: some View {
        VStack {
            EULAView(model: model)
                .titleModifier { $0.font(.headline).foregroundColor(.green) }
                .htmlContentModifier { $0.font(.system(size: 20)).foregroundColor(.blue) }
                .actionTextModifier { $0.foregroundColor(.green) }
                .secondaryActionTextModifier { $0.foregroundColor(.green) }
        }
    }
}

struct EULAViewSample_Previews: PreviewProvider {
    static var previews: some View {
        EULAViewSample()
    }
}
