//
//  File.swift
//  
//
//  Created by Stadelman, Stan on 1/22/20.
//

import SwiftUI

struct ObjectCardGroupItemView: View {
    
    var model: ObjectGroupItem
    
    var body: some View {
        HStack(alignment: .center) {
            SafeView(model.icon)
                .frame(width: 45, height: 45, alignment: .center)
            
            VStack(alignment: HorizontalAlignment.leading, spacing: 4) {
                SafeText(model.label)
                    .font(.caption)
                    .foregroundColor(.gray)
                SafeText(model.value)
                    .font(.caption)
                    .foregroundColor(.getLinkColor(type: self.model.type))
                    .onTapGesture {
                        self.action(type: self.model.type, value: self.model.value)
                }
            }
            .padding(EdgeInsets(top: 10.5, leading: 0, bottom: 10.5, trailing: 0))
        }
    }
    
    func action(type: String?, value: String) {
        guard let _type = type else {
            return
        }
        
        switch _type {
        case "link":
            let url = URL.init(string: value)
            openURL(url: url)
        case "phone":
            let tel = "tel://"
            let formatted = tel + value.validPhoneNumber(number: value)
            let url = URL.init(string: formatted)
            openURL(url: url)
        case "email":
            let email = "mailto:\(value)"
            let url = URL.init(string: email)
            openURL(url: url)
        default:
            break
        }
    }
    
    func openURL(url: URL?) {
        guard let validURL = url, UIApplication.shared.canOpenURL(validURL) else { return }
        UIApplication.shared.open(validURL)
    }
}

