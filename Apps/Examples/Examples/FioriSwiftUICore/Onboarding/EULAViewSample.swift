import FioriSwiftUICore
import SwiftUI

struct EULAViewDataModel: EULAViewModel {
    var title: String = "EULA"
    var bodyAttributedText: NSAttributedString?
    
    var didAgree: (() -> Void)? = {
        print("EULAView Primary button clicked")
    }
    
    var didDisagree: (() -> Void)? = {
        print("EULAView secondary button clicked")
    }
    
    var didCancel: (() -> Void)?
    
    static let HTML = EULAViewDataModel(bodyAttributedText: NSAttributedString(string: "http://www.sap.com\nThis is a legally binding agreement (\"Agreement\") between Company and SAP SE which provides the terms of your use of the SAP mobile application (Software). By clicking \"Accept\" or by installing and/or using the Software, you on behalf of the Company are agreeing to all of the terms and conditions stated in this Agreement. If you do not agree to these terms, do not click \"Agree\", and do not use the Software. You represent and warrant that you have the authority to bind the Company to the terms of this Agreement.\n\n"))
    
    static let LongHTML: EULAViewDataModel = {
        let eulaURL = Bundle.main.url(forResource: "EULAText", withExtension: "html")!
        let eulaData = try! Data(contentsOf: eulaURL)
        let eulaAttString = try! NSMutableAttributedString(data: eulaData, options: [.documentType: NSAttributedString.DocumentType.html], documentAttributes: nil)
        return EULAViewDataModel(bodyAttributedText: eulaAttString)
    }()
    
    static let ShortHTML: EULAViewDataModel = {
        let eulaURL = Bundle.main.url(forResource: "EULA2", withExtension: "html")!
        let eulaData = try! Data(contentsOf: eulaURL)
        let eulaAttString = try! NSMutableAttributedString(data: eulaData, options: [.documentType: NSAttributedString.DocumentType.html], documentAttributes: nil)
        return EULAViewDataModel(bodyAttributedText: eulaAttString)
    }()
    
    static let ConcatAttributedStrings: EULAViewDataModel = {
        let title = "CUSTOM EULA"
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
        
        return EULAViewDataModel(title: title, bodyAttributedText: attText)
    }()
    
    static let ShortStringWithLink = EULAViewDataModel(bodyAttributedText: NSAttributedString(string: "Short http://service.sap.com Short"))
    
    static let ShortAttributedStringWithLink: EULAViewDataModel = {
        let linkAttributes = [
            NSAttributedString.Key.link: URL(string: "https://service.sap.com")!,
            NSAttributedString.Key.font: UIFont(name: "Helvetica", size: 18.0)!,
            NSAttributedString.Key.foregroundColor: UIColor.blue
        ] as [NSAttributedString.Key: Any]
        
        let attributedString = NSMutableAttributedString(string: "Just click here to go to SAP service web site.\n\n" + "This is a legally binding agreement (\"Agreement\") between Company and SAP SE which provides the terms of your use of the SAP mobile application (Software). By clicking \"Accept\" or by installing and/or using the Software, you on behalf of the Company are agreeing to all of the terms and conditions stated in this Agreement. If you do not agree to these terms, do not click \"Agree\", and do not use the Software. You represent and warrant that you have the authority to bind the Company to the terms of this Agreement.\n\n")
        
        attributedString.setAttributes(linkAttributes, range: NSRange(location: 5, length: 10))
        return EULAViewDataModel(bodyAttributedText: attributedString)
    }()
}

struct EULAViewSample: View {
    @Environment(\.presentationMode) var presentationMode
    
    let model = EULAViewDataModel.HTML
    
    var body: some View {
        EULAView(title: model.title, bodyAttributedText: model.bodyAttributedText, didAgree: model.didAgree, didDisagree: model.didDisagree) {
            self.presentationMode.wrappedValue.dismiss()
        }
    }
}

struct EULALongHtmlSample: View {
    @Environment(\.presentationMode) var presentationMode
    
    let model = EULAViewDataModel.LongHTML
    
    var body: some View {
        EULAView(title: model.title, bodyAttributedText: model.bodyAttributedText, didAgree: model.didAgree, didDisagree: model.didDisagree) {
            self.presentationMode.wrappedValue.dismiss()
        }
    }
}

struct EULAShortHtmlSample: View {
    @Environment(\.presentationMode) var presentationMode
    
    let model = EULAViewDataModel.ShortHTML
    
    var body: some View {
        EULAView(title: model.title, bodyAttributedText: model.bodyAttributedText, didAgree: model.didAgree, didDisagree: model.didDisagree) {
            self.presentationMode.wrappedValue.dismiss()
        }
    }
}

struct EULAConcatSample: View {
    @Environment(\.presentationMode) var presentationMode
    
    let model = EULAViewDataModel.ConcatAttributedStrings
    
    var body: some View {
        EULAView(title: model.title, bodyAttributedText: model.bodyAttributedText, didAgree: model.didAgree, didDisagree: model.didDisagree) {
            self.presentationMode.wrappedValue.dismiss()
        }
    }
}

struct EULAWithLinkSample: View {
    @Environment(\.presentationMode) var presentationMode
    
    let model = EULAViewDataModel.ShortStringWithLink
    
    var body: some View {
        EULAView(title: model.title, bodyAttributedText: model.bodyAttributedText, didAgree: model.didAgree, didDisagree: model.didDisagree) {
            self.presentationMode.wrappedValue.dismiss()
        }
    }
}

struct EULAShortWithLinkSample: View {
    @Environment(\.presentationMode) var presentationMode
    
    let model = EULAViewDataModel.ShortAttributedStringWithLink
    
    var body: some View {
        EULAView(title: model.title, bodyAttributedText: model.bodyAttributedText, didAgree: model.didAgree, didDisagree: model.didDisagree) {
            self.presentationMode.wrappedValue.dismiss()
        }
    }
}

struct EULAViewCustomized: View {
    @Environment(\.presentationMode) var presentationMode
    
    let model = EULAViewDataModel.HTML
    
    var body: some View {
        EULAView(title: model.title, bodyAttributedText: model.bodyAttributedText, didAgree: model.didAgree, didDisagree: model.didDisagree) {
            self.presentationMode.wrappedValue.dismiss()
        }
        .titleModifier { $0.font(.headline).foregroundColor(.green) }
        .bodyAttributedTextModifier { $0.font(.system(size: 20)).foregroundColor(.blue) }
        .actionModifier { $0.foregroundColor(.green) }
        .secondaryActionModifier { $0.foregroundColor(.green) }
    }
}

struct EULAViewSample_Previews: PreviewProvider {
    static var previews: some View {
        EULAViewSample()
    }
}
