import FioriSwiftUICore
import SwiftUI

struct ObjectItemAvatarsExample: ObjectItemListDataProtocol {
    var isNewObjectItem: Bool = false
    
    init(cellTapped: Binding<Bool>) {}
    
    func numberOfSections() -> Int {
        1
    }
    
    func numberOfRowsInSection(_ section: Int) -> Int {
        self.isNewObjectItem ? 8 : 4
    }
    
    func titleForHeaderInSection(_ section: Int) -> String {
        "avatar"
    }
    
    func cellForRow(_ indexPath: IndexPath) -> AnyView {
        if self.isNewObjectItem {
            return self.getNewObjectItem(for: indexPath).typeErased
        } else {
            return self.getObjectItem(for: indexPath).typeErased
        }
    }
    
    func getNewObjectItem(for indexPath: IndexPath) -> some View {
        switch (indexPath.section, indexPath.row) {
        case (0, 0):
            let oi = ObjectItem(title: {
                Text("Transformer Overheating")
            }, subtitle: {
                Text("Three Phase Pad Mounted Transformer (533423)")
            }, footnote: {
                Text("1000 - Hamburg, MECHANIK")
            }, description: {
                Text("Customer noticed that the transformer started to over heat within 45 minutes each time he turned it on at 7:30am.  The first technician who looked at this did not have the correct additional tools to complete the job.")
                    .lineLimit(3)
            }, status: {
                Text("High")
            }, substatus: {
                Text("Scheduled")
            }, detailImage: {
                Image(systemName: "person")
                    .font(.system(size: 45, weight: .regular, design: .serif))
                    .border(Color.black, width: 1)
            }, icons: {
                Text("1")
                Image(systemName: "circle.fill").foregroundColor(.blue)
                Image(systemName: "paperclip").frame(width: 16, height: 16)
            }, avatars: {
                Color.red
            }, footnoteIcons: {
                Color.red
                Color.green
                Color.red
                Color.red
                Color.blue
            })
            .isAvatarCircular(false)
            return AnyView(oi)
        case (0, 1):
            let oi = ObjectItem(title: {
                Text("Transformer Overheating")
            }, subtitle: {
                Text("Three Phase Pad Mounted Transformer (533423)")
            }, footnote: {
                Text("1000 - Hamburg, MECHANIK")
            }, description: {
                Text("Customer noticed that the transformer started to over heat within 45 minutes each time he turned it on at 7:30am.  The first technician who looked at this did not have the correct additional tools to complete the job.")
                    .lineLimit(3)
            }, status: {
                Text("High")
            }, substatus: {
                Text("Scheduled")
            }, detailImage: {
                Image(systemName: "person")
                    .font(.system(size: 45, weight: .regular, design: .serif))
                    .border(Color.black, width: 1)
            }, icons: {
                Text("1")
                Image(systemName: "circle.fill").foregroundColor(.blue)
                Image(systemName: "paperclip").frame(width: 16, height: 16)
            }, avatars: {
                Color.green
                Color.red
            }, footnoteIcons: {
                Color.red
                Color.green
                Color.red
                Color.red
                Color.blue
            }, tags: {
                Tag("Started")
                Tag("PM01")
                Tag("103-Repair")
            })
            .isAvatarCircular(false)
            .avatarBorderWidth(2)
            .avatarBorderColor(Color.yellow)
            .avatarSize(CGSize(width: 40, height: 40))
            .splitPercent(0.5)
            .footnoteIconsMaxCount(-2)
            return AnyView(oi)
        case (0, 2):
            let oi = ObjectItem(title: {
                Text("Transformer Overheating")
            }, subtitle: {
                Text("Three Phase Pad Mounted Transformer (533423)")
            }, footnote: {
                Text("1000 - Hamburg, MECHANIK")
            }, description: {
                Text("Customer noticed that the transformer started to over heat within 45 minutes each time he turned it on at 7:30am.  The first technician who looked at this did not have the correct additional tools to complete the job.")
                    .lineLimit(3)
            }, status: {
                Text("High")
            }, substatus: {
                Text("Scheduled")
            }, detailImage: {
                Image(systemName: "person")
                    .font(.system(size: 45, weight: .regular, design: .serif))
                    .border(Color.black, width: 1)
            }, icons: {
                Text("1")
                Image(systemName: "circle.fill").foregroundColor(.blue)
                Image(systemName: "paperclip").frame(width: 16, height: 16)
            }, avatars: {
                Color.blue
            }, footnoteIcons: {
                Color.red
                Color.green
                Color.red
                Color.red
                Color.blue
            })
            .isAvatarCircular(true)
            .avatarBorderWidth(1)
            .avatarBorderColor(Color.black)
            .splitPercent(0.5)
            .footnoteIconsSpacing(2)
            return AnyView(oi)
            
        case (0, 3):
            let oi = ObjectItem(title: {
                Text("Transformer Overheating")
            }, subtitle: {
                Text("Three Phase Pad Mounted Transformer (533423)")
            }, footnote: {
                Text("1000 - Hamburg, MECHANIK")
            }, description: {
                Text("Customer noticed that the transformer started to over heat within 45 minutes each time he turned it on at 7:30am.  The first technician who looked at this did not have the correct additional tools to complete the job.")
                    .lineLimit(3)
            }, status: {
                Text("High")
            }, substatus: {
                Text("Scheduled")
            }, detailImage: {
                Image(systemName: "person")
                    .font(.system(size: 45, weight: .regular, design: .serif))
                    .border(Color.black, width: 1)
            }, icons: {
                Text("1")
                Image(systemName: "circle.fill").foregroundColor(.blue)
                Image(systemName: "paperclip").frame(width: 16, height: 16)
            }, avatars: {
                Image(systemName: "person")
                    .resizable()
                Text("XY")
                    .frame(width: 30, height: 30)
                    .background(Color.red)
                    .foregroundColor(Color.white)
            }, footnoteIcons: {
                Color.red
                Color.green
                Text("XY")
                    .minimumScaleFactor(0.1)
                    .padding(2)
                    .frame(width: 20, height: 20)
                    .background(Color.black)
                    .foregroundColor(Color.white)
                Color.red
                Color.blue
            })
            .isAvatarCircular(true)
            .avatarBorderWidth(3)
            .avatarBorderColor(Color.blue)
            .avatarSize(CGSize(width: 30, height: 30))
            .footnoteIconsMaxCount(4)
            .footnoteIconsSize(CGSize(width: 20, height: 20))
            .isFootnoteIconsCircular(false)
            return AnyView(oi)
        case (0, 4):
            let oi = ObjectItem {
                Text("Title: This is a case for for long text with icons")
            } subtitle: {
                Text("Subtitle: this is a subtitle")
            } footnoteIcons: {
                Color.random
                Color.random
                Color.random
                Color.random
                Color.random
                Color.random
            }.footnoteIconsText("This is a very very very very very very very very very very very very long text layout with footnote icons")
            return AnyView(oi)
        case (0, 5):
            let oi = ObjectItem {
                Text("This is a case for for short text with icons")
            } subtitle: {
                Text("Subtitle: this is a subtitle")
            } footnoteIcons: {
                Color.random
                Color.random
                Color.random
                Color.random
                Color.random
                Color.random
            }.footnoteIconsText("This is a short one.")
            return AnyView(oi)
        case (0, 6):
            let oi = ObjectItem {
                Text("This is a case for for long leading text with icons")
            } subtitle: {
                Text("Subtitle: this is a subtitle")
            } footnoteIcons: {
                Color.random
                Color.random
                Color.random
                Color.random
                Color.random
                Color.random
            }.footnoteIconsText("This is a very very very very very very very very very very very very long text layout with footnote icons")
                .footnoteIconsTextPosition(.leading)
            return AnyView(oi)
        case (0, 7):
            let oi = ObjectItem {
                Text("This is a case for for short leading text with icons")
            } subtitle: {
                Text("Subtitle: this is a subtitle")
            } footnoteIcons: {
                Color.random
                Color.random
                Color.random
                Color.random
                Color.random
                Color.random
            }.footnoteIconsText {
                Text("This is text with custom style.")
                    .font(.fiori(forTextStyle: .headline))
                    .foregroundStyle(Color.random)
            }
            .footnoteIconsTextPosition(.leading)
            return AnyView(oi)
        default:
            return AnyView(_ObjectItem(title: "Lorem ipseum dolor"))
        }
    }
    
    func getObjectItem(for indexPath: IndexPath) -> some View {
        switch (indexPath.section, indexPath.row) {
        case (0, 0):
            let oi = _ObjectItem(title: {
                Text("Transformer Overheating")
            }, subtitle: {
                Text("Three Phase Pad Mounted Transformer (533423)")
            }, footnote: {
                Text("1000 - Hamburg, MECHANIK")
            }, descriptionText: {
                Text("Customer noticed that the transformer started to over heat within 45 minutes each time he turned it on at 7:30am.  The first technician who looked at this did not have the correct additional tools to complete the job.")
                    .lineLimit(3)
            }, status: {
                Text("High")
            }, substatus: {
                Text("Scheduled")
            }, detailImage: {
                Image(systemName: "person")
                    .font(.system(size: 45, weight: .regular, design: .serif))
                    .border(Color.black, width: 1)
            }, icons: {
                Text("1")
                Image(systemName: "circle.fill").foregroundColor(.blue)
                Image(systemName: "paperclip").frame(width: 16, height: 16)
            }, avatars: {
                Color.red
            }, footnoteIcons: {
                Color.red
                Color.green
                Color.red
                Color.red
                Color.blue
            })
            .isAvatarCircular(false)
            return AnyView(oi)
        case (0, 1):
            let oi = _ObjectItem(title: {
                Text("Transformer Overheating")
            }, subtitle: {
                Text("Three Phase Pad Mounted Transformer (533423)")
            }, footnote: {
                Text("1000 - Hamburg, MECHANIK")
            }, descriptionText: {
                Text("Customer noticed that the transformer started to over heat within 45 minutes each time he turned it on at 7:30am.  The first technician who looked at this did not have the correct additional tools to complete the job.")
                    .lineLimit(3)
            }, status: {
                Text("High")
            }, substatus: {
                Text("Scheduled")
            }, detailImage: {
                Image(systemName: "person")
                    .font(.system(size: 45, weight: .regular, design: .serif))
                    .border(Color.black, width: 1)
            }, icons: {
                Text("1")
                Image(systemName: "circle.fill").foregroundColor(.blue)
                Image(systemName: "paperclip").frame(width: 16, height: 16)
            }, avatars: {
                Color.green
                Color.red
            }, footnoteIcons: {
                Color.red
                Color.green
                Color.red
                Color.red
                Color.blue
            }, tags: {
                Tag("Started")
                Tag("PM01")
                Tag("103-Repair")
            })
            .isAvatarCircular(false)
            .avatarBorderWidth(2)
            .avatarBorderColor(Color.yellow)
            .avatarSize(CGSize(width: 40, height: 40))
            .splitPercent(0.5)
            .footnoteIconsMaxCount(-2)
            return AnyView(oi)
        case (0, 2):
            let oi = _ObjectItem(title: {
                Text("Transformer Overheating")
            }, subtitle: {
                Text("Three Phase Pad Mounted Transformer (533423)")
            }, footnote: {
                Text("1000 - Hamburg, MECHANIK")
            }, descriptionText: {
                Text("Customer noticed that the transformer started to over heat within 45 minutes each time he turned it on at 7:30am.  The first technician who looked at this did not have the correct additional tools to complete the job.")
                    .lineLimit(3)
            }, status: {
                Text("High")
            }, substatus: {
                Text("Scheduled")
            }, detailImage: {
                Image(systemName: "person")
                    .font(.system(size: 45, weight: .regular, design: .serif))
                    .border(Color.black, width: 1)
            }, icons: {
                Text("1")
                Image(systemName: "circle.fill").foregroundColor(.blue)
                Image(systemName: "paperclip").frame(width: 16, height: 16)
            }, avatars: {
                Color.blue
            }, footnoteIcons: {
                Color.red
                Color.green
                Color.red
                Color.red
                Color.blue
            })
            .isAvatarCircular(true)
            .avatarBorderWidth(1)
            .avatarBorderColor(Color.black)
            .splitPercent(0.5)
            .footnoteIconsSpacing(2)
            return AnyView(oi)
            
        case (0, 3):
            let oi = _ObjectItem(title: {
                Text("Transformer Overheating")
            }, subtitle: {
                Text("Three Phase Pad Mounted Transformer (533423)")
            }, footnote: {
                Text("1000 - Hamburg, MECHANIK")
            }, descriptionText: {
                Text("Customer noticed that the transformer started to over heat within 45 minutes each time he turned it on at 7:30am.  The first technician who looked at this did not have the correct additional tools to complete the job.")
                    .lineLimit(3)
            }, status: {
                Text("High")
            }, substatus: {
                Text("Scheduled")
            }, detailImage: {
                Image(systemName: "person")
                    .font(.system(size: 45, weight: .regular, design: .serif))
                    .border(Color.black, width: 1)
            }, icons: {
                Text("1")
                Image(systemName: "circle.fill").foregroundColor(.blue)
                Image(systemName: "paperclip").frame(width: 16, height: 16)
            }, avatars: {
                Image(systemName: "person")
                    .resizable()
                Text("XY")
                    .frame(width: 40, height: 40)
                    .background(Color.red)
                    .foregroundColor(Color.white)
            }, footnoteIcons: {
                Color.red
                Color.green
                Text("XY")
                    .minimumScaleFactor(0.1)
                    .padding(2)
                    .frame(width: 20, height: 20)
                    .background(Color.black)
                    .foregroundColor(Color.white)
                Color.red
                Color.blue
            })
            .isAvatarCircular(true)
            .avatarBorderWidth(3)
            .avatarBorderColor(Color.blue)
            .avatarSize(CGSize(width: 30, height: 30))
            .footnoteIconsMaxCount(4)
            .footnoteIconsSize(CGSize(width: 20, height: 20))
            .isFootnoteIconsCircular(false)
            return AnyView(oi)
        default:
            return AnyView(_ObjectItem(title: "Lorem ipseum dolor"))
        }
    }
    
    func containAccessoryView(_ indexPath: IndexPath) -> Bool {
        false
    }
}
