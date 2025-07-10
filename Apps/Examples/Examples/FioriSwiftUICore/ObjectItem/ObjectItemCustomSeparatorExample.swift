import FioriSwiftUICore
import FioriThemeManager
import SwiftUI

struct ObjectItemCustomSeparatorExample: View {
    @State var isCustomSeparatorInset = false
    @State var isSeparatorHidden = false
    
    let items: [ObjectItem] = [
        ObjectItem(title: {
            Text("Transformer Overheating")
        }, subtitle: {
            Text("Three Phase Pad Mounted Transformer (533423)")
        }, footnote: {
            Text("1000 - Hamburg, MECHANIK")
        }, description: {
            Text("Customer noticed that the transformer started to over heat within 45 minutes each time he turned it on at 7:30am.  The first technician who looked at this did not have the correct additional tools to complete the job.")
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
        }, showsDescriptionInCompact: true),
        
        ObjectItem(title: {
            Text("Transformer Overheating")
        }, subtitle: {
            Text("Three Phase Pad Mounted Transformer (533423)")
        }, footnote: {
            Text("1000 - Hamburg, MECHANIK")
        }, description: {
            Text("Customer noticed that the transformer started to over heat within 45 minutes each time he turned it on at 7:30am.  The first technician who looked at this did not have the correct additional tools to complete the job.")
        }, status: {
            Image(systemName: "exclamationmark.triangle").foregroundColor(.red)
        }, substatus: {
            Text("Scheduled")
        }, detailImage: {
            Image(systemName: "person")
                .font(.system(size: 45, weight: .regular, design: .serif))
                .border(Color.black, width: 1)
        }),
        
        ObjectItem(title: {
            Text("Transformer Overheating When After Being on for 1 Hour or Longer")
                .font(.system(size: 28, weight: .regular, design: .serif))
        }, subtitle: {
            Text("Three Phase Pad Mounted Transformer (533423)")
        }, footnote: {
            Text("1000 - Hamburg, MECHANIK")
        }, description: {
            Text("Customer noticed that the transformer started to over heat within 45 minutes each time he turned it on at 7:30am.  The first technician who looked at this did not have the correct additional tools to complete the job.")
                .font(.system(size: 24, weight: .regular, design: .serif))
        }, status: {
            Image(systemName: "exclamationmark.triangle")
                .font(.system(size: 30, weight: .regular, design: .serif))
                .foregroundColor(.red)
        }),
        
        ObjectItem(title: {
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
        }),
        
        ObjectItem(title: {
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
                .tagStyle(MyTagStyle())
            Tag("PM01")
            Tag("103-Repair")
        }),
        
        ObjectItem(title: {
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
        }),
        
        ObjectItem {
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
        } footnoteIconsText: {
            Text("This is a very very very very very very very very very very very very very very very very very long text layout with footnote icons")
        },
        
        ObjectItem(title: "Cafe Food Title That Is So Long It Has To Wrap",
                   footnote: "3493 followers",
                   action: FioriButton(title: "Follow", action: { _ in print("Tapped Follow") })),
        ObjectItem(title: {
            Text("Rouja Pakiman")
        }, subtitle: {
            Text("Java Developer")
        }, footnote: {
            Text("Los Angeles")
        }, detailImage: {
            Image("ProfilePic")
                .resizable()
                .frame(width: 45, height: 45)
                .clipShape(Circle())
        }, action: { FioriButton(action: { _ in print("Tapped Follow") }, label: { _ in Text("Follow") }) }),
        
        ObjectItem(title: {
            Text("Rouja Pakiman")
        }, description: {
            Text("Rouja has worked for the company for ten years and has all of the skills that would be necessary for developing quality applications.  She is proficient in Java as well as CSS, Bootstrap, and Swift.")
        }, status: {
            Text("Available")
            //                    .foregroundColor(.green)
        }, detailImage: {
            Image("person_square4").resizable().frame(width: 45, height: 45).clipShape(Circle())
        })
    ]
    
    var body: some View {
        List {
            Section {
                ForEach(0 ..< self.items.count, id: \.self) { index in
                    self.items[index]
                        .listRowSeparator(self.isSeparatorHidden ? .hidden : .visible, edges: .bottom)
                        .ifApply(self.isCustomSeparatorInset) { item in
                            item.alignmentGuide(.listRowSeparatorLeading) { _ in
                                50
                            }
                        }
                }
            } header: {
                VStack {
                    Toggle("Custom separator inset", isOn: self.$isCustomSeparatorInset)
                    Toggle("Is Separator Hidden", isOn: self.$isSeparatorHidden)
                }.textCase(.none)
            }
        }
        .id(self.isSeparatorHidden)
        .navigationTitle("Object Item Custom Separator")
    }
}
