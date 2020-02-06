//
//  File.swift
//  
//
//  Created by Stadelman, Stan on 1/22/20.
//

import SwiftUI
import Combine

public struct ObjectCardView: View {
    
    @ObservedObject var model: ObjectCard
      
    public init(model: ObjectCard) {
        self.model = model
//        self.sinks.insert(model.objectWillChange.sink { _ in
//            print("content changed")
//        })
//        self.sinks.insert(model.content.objectWillChange.sink { _ in print("icons changed") } )
    }
    
    public var body: some View {
        VStack() {
            Group {
                HeaderView(model: model.header!)
                Divider().accentColor(Color.primary)
                HStack(alignment: .firstTextBaseline, spacing: 8) {
                    ForEach(model.content.value!.prefix(2)) {
                        ObjectCardGroupView(model: $0)
                    }
                }
            }
        }
        .padding(16)
        .overlay(
            RoundedRectangle(cornerRadius: 6)
                .stroke(Color.gray, lineWidth: 0.5)
        ).padding(16)
    }
    
    private var sinks: Set<AnyCancellable> = Set<AnyCancellable>()
}

public struct ObjectCardView_Previews: PreviewProvider {
    public static var previews: some View {
        ObjectCardView_Previews.bootstrapView().previewLayout(.sizeThatFits)
    }
    
    static func bootstrapView() -> AnyView {
        let model = try! JSONDecoder().decode(Manifest.self, from: testString.data(using: .utf8)!)
        switch model.card {
        case .object(let card):
            return AnyView(ObjectCardView(model: card))
        default:
            return AnyView(EmptyView())
        }
    }
}

fileprivate let testString = """
{
    "_version": "1.15.0",
    "sap.app": {
        "id": "card.explorer.object.card",
        "type": "card",
        "title": "Sample of an Object Card",
        "subTitle": "Sample of an Object Card"
    },
    "sap.ui": {
        "technology": "UI5",
        "icons": {
            "icon": "sap-icon://switch-classes"
        }
    },
    "sap.card": {
        "type": "Object",
        "data": {
            "json": {
                "firstName": "Donna",
                "lastName": "Moore",
                "position": "Sales Executive",
                "phone": "+1 202 555 5555",
                "email": "my@mymail.com",
                "photo": "./topics/images/Woman_avatar_01.png",
                "manager": {
                    "firstName": "John",
                    "lastName": "Miller",
                    "photo": "./topics/images/Woman_avatar_02.png"
                },
                "company": {
                    "name": "Robert Brown Entertainment",
                    "address": "481 West Street, Anytown OH 45066, USA",
                    "email": "mail@mycompany.com",
                    "emailSubject": "Subject",
                    "website": "www.company_a.example.com",
                    "url": "http://www.company_a.example.com"
                }
            }
        },
        "header": {
            "icon": {
                "src": "{photo}"
            },
            "title": "{firstName} {lastName}",
            "subTitle": "{position}"
        },
        "content": {
            "groups": [
                {
                    "title": "Contact Details",
                    "items": [
                        {
                            "label": "First Name:",
                            "value": "{firstName}"
                        },
                        {
                            "label": "Last Name:",
                            "value": "{lastName}"
                        },
                        {
                            "label": "Phone:",
                            "value": "{phone}",
                            "type": "phone"
                        },
                        {
                            "label": "Email:",
                            "value": "{email}",
                            "type": "email"
                        }
                    ]
                },
                {
                    "title": "Company Details",
                    "items": [
                        {
                            "label": "Company Name:",
                            "value": "{company/name}"
                        },
                        {
                            "label": "Address:",
                            "value": "{company/address}"
                        },
                        {
                            "label": "Email:",
                            "value": "{company/email}",
                            "emailSubject": "{company/emailSubject}",
                            "type": "email"
                        },
                        {
                            "label": "Website:",
                            "value": "{company/website}",
                              "url": "{company/url}",
                            "type": "link"
                        }
                    ]
                },
                {
                  "title": "Organizational Details",
                  "items": [
                        {
                            "label": "Direct Manager:",
                            "value": "{manager/firstName} {manager/lastName}",
                            "icon": {
                                "src": "{manager/photo}"
                            }
                        }
                  ]
                }
            ]
        }
    }
}
"""
