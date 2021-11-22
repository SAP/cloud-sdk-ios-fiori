import FioriSwiftUICore
import SwiftUI

struct ObjectItemActionButtonStyle: FioriButtonStyle {
    func makeBody(configuration: FioriButtonStyle.Configuration) -> some View {
        let color: Color
        switch configuration.state {
        case .normal:
            color = Color.preferredColor(.tintColor)
        case .highlighted, .selected:
            color = .red
        default:
            color = Color.preferredColor(.tertiaryLabel)
        }
        
        return configuration.label
            .foregroundColor(.white)
            .padding(50)
            .frame(width: 500)
            .background(Circle().fill(color))
    }
}

struct SingleActionProfiles: ListDataProtocol {
    @Binding var cellTapped: Bool
    
    init(cellTapped: Binding<Bool>) {
        self._cellTapped = cellTapped
    }
    
    init() {
        self._cellTapped = Binding.constant(false)
    }
    
    func numberOfSections() -> Int {
        2
    }
    
    func numberOfRowsInSection(_ section: Int) -> Int {
        switch section {
        case 0:
            return 6
        default:
            return 1
        }
    }
    
    func titleForHeaderInSection(_ section: Int) -> String {
        switch section {
        case 0:
            return "Normal Examples"
        case 1:
            return "Cell Tap State Example w/ Developer Modal Navigation"
        default:
            return ""
        }
    }
    
    func containAccessoryView(_ indexPath: IndexPath) -> Bool {
        false
    }
    
    //    @ViewBuilder
    func cellForRow(_ indexPath: IndexPath) -> AnyView {
        let actionBtn = Button {
            print("Tapped Follow")
        } label: {
            Text("Follow")
                .font(.callout)
                .lineLimit(2)
                .foregroundColor(Color.preferredColor(.tintColor))
                .padding(EdgeInsets(top: 8, leading: 32, bottom: 8, trailing: 32))
                .overlay(RoundedRectangle(cornerRadius: 4).stroke(Color.preferredColor(.tintColor), lineWidth: 1))
        }.buttonStyle(PlainButtonStyle())
        
        switch (indexPath.section, indexPath.row) {
        case (0, 0):
            let oi = ObjectItem(title: {
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
            }, action: {
                actionBtn
            })
            
            return AnyView(oi)
            
        case (0, 1):
            let oi = ObjectItem(title: {
                Text("Rouja Pakiman")
            }, subtitle: {
                Text("Java Developer")
            }, footnote: {
                Text("Los Angeles")
            }, descriptionText: {
                Text("Rouja has worked for the company for ten years and has all of the skills that would be necessary for developing quality applications.  She is proficient in Java as well as CSS, Bootstrap, and Swift.")
            }, status: {
                Text("Available")
            }, detailImage: {
                Image("ProfilePic")
                    .resizable()
                    .frame(width: 45, height: 45)
                    .clipShape(Circle())
            }, icons: {
                Text("1")
                Circle().fill(Color.preferredColor(.tintColor)).frame(width: 14, height: 14)
            }, action: {
                actionBtn
            })
                .splitPercent(0.25)
            
            return AnyView(oi)
            
        case (0, 2):
            let oi = ObjectItem(title: {
                Text("Rouja Pakiman")
            }, subtitle: {
                Text("Java Developer")
            }, footnote: {
                Text("Los Angeles")
            }, descriptionText: {
                Text("Rouja has worked for the company for ten years and has all of the skills that would be necessary for developing quality applications.  She is proficient in Java as well as CSS, Bootstrap, and Swift.")
            }, icons: {
                Text("1")
                Circle().fill(Color.preferredColor(.tintColor)).frame(width: 14, height: 14)
                Image(systemName: "paperclip").font(.system(size: 14))
            }, action: {
                actionBtn
            })
                .splitPercent(0.25)
            
            return AnyView(oi)
            
        case (0, 3):
            let oi = ObjectItem(title: {
                Text("Rouja Pakiman")
            }, subtitle: {
                Text("Java Developer")
            }, footnote: {
                Text("Los Angeles")
            }, descriptionText: {
                Text("Rouja has worked for the company for ten years and has all of the skills that would be necessary for developing quality applications.  She is proficient in Java as well as CSS, Bootstrap, and Swift.")
            }, action: {
                actionBtn
            })
                .splitPercent(0.25)
            
            return AnyView(oi)
            
        case (0, 4):
            let oi = ObjectItem(title: {
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
            }, action: {
                actionBtn
            })
            
            return AnyView(oi)
            
        case (0, 5):
            let oi = ObjectItem(title: {
                Text("Steel Roter")
            }, subtitle: {
                Text("Product 1349-0987C65-X8900")
            }, footnote: {
                Text("In Stock")
            }, detailImage: {
                Image("wheel")
                    .resizable()
                    .frame(width: 45, height: 45)
            }, action: {
                actionBtn
            })
            
            return AnyView(oi)
            
        case (1, 0):
            let oi = ObjectItem(title: {
                Text("Rouja Pakiman")
            }, subtitle: {
                Text("Java Developer")
            }, footnote: {
                Text("Los Angeles")
            }, descriptionText: {
                Text("Rouja has worked for the company for ten years and has all of the skills that would be necessary for developing quality applications.  She is proficient in Java as well as CSS, Bootstrap, and Swift.")
            }, icons: {
                Text("1")
                Circle().fill(Color.preferredColor(.tintColor)).frame(width: 14, height: 14)
                Image(systemName: "paperclip").font(.system(size: 14))
            }, action: {
                actionBtn
            })
                .splitPercent(0.25)
                .onTapGesture {
                    print("tapped the cell")
                    self.cellTapped = true
                }
            
            return AnyView(oi)
            
        default:
            return AnyView(ObjectItem(title: "test"))
        }
    }
}
