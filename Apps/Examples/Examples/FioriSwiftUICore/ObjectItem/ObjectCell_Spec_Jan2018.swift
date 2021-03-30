import FioriSwiftUICore
import SwiftUI

struct ObjectCell_Spec_Jan2018: ListDataProtocol {
    init(cellTapped: Binding<Bool>) {}
    init() {}
    
    func numberOfSections() -> Int {
        5
    }
    
    func numberOfRowsInSection(_ section: Int) -> Int {
        switch section {
        case 0:
            return 3
        case 1:
            return 3
        default:
            return 1
        }
    }
    
    func titleForHeaderInSection(_ section: Int) -> String {
        switch section {
        case 0:
            return "Page 8: Alignment- Headline label only"
        case 1:
            return "Page 9: Regular View"
        case 2:
            return "Page 10: Icon Stack-Padding"
        case 3:
            return "Page 11: Profile Image Variations"
        default:
            return ""
        }
    }
    
    func containAccessoryView(_ indexPath: IndexPath) -> Bool {
        true
    }
    
    func cellForRow(_ indexPath: IndexPath) -> AnyView {
        //    let dot = FUIAttributedImage(image: #imageLiteral(resourceName: "dot1").withRenderingMode(.alwaysTemplate))
        //    dot.tintColor = UIColor.preferredFioriColor(forStyle: .tintColorDark)
        //    dot.isCircular = true
        //    dot.size = CGSize(width: 12, height: 12)
        
        switch (indexPath.section, indexPath.row) {
        case (0, 0):
            //        cell.headlineText = Utils.localizedString("Lorem ipseum dolor")
            //        cell.descriptionText = Utils.localizedString("Some descirption")
            //        cell.statusText = Utils.localizedString("Some status")
            //        cell.substatusText = Utils.localizedString("some substatus")
            //        cell.accessoryType = .disclosureIndicator
            //        let longNormalText = "Just some really long text that is here dont worry about it too much"
            //        let newLineText = "Words\nSeparated\nNewLineChars and this is " + longNormalText
            //        cell.footnoteText = newLineText
            //        cell.footnoteLabel.numberOfLines = 4
            let oi = ObjectItem(title: "Lorem ipseum dolor",
                                footnote: "Words\nSeparated\nNewLineChars and this is Just some really long text that is here dont worry about it too much",
                                descriptionText: "Some descirption",
                                status: "Some status",
                                substatus: "some substatus")
                .footnoteModifier {
                    $0.lineLimit(4)
                }
            
            return AnyView(oi)
            
        case (0, 1):
//            cell.headlineText = Utils.localizedString("Lorem ipseum dolor")
//            cell.descriptionText = Utils.localizedString("Some descirption")
//            cell.statusText = Utils.localizedString("Some status")
//            cell.substatusText = Utils.localizedString("some substatus")
//            cell.accessoryType = .disclosureIndicator
//            let longNormalText = "Just some really long text that is here dont worry about it too much"
//            let newLineText = "NewLineChars and this is " + longNormalText + "\nWords\nSeparated"
//            cell.footnoteText = newLineText
//            cell.footnoteLabel.numberOfLines = 4
        
            let oi = ObjectItem(title: {
                Text("Lorem ipseum dolor")
            }, footnote: {
                Text("NewLineChars and this is Just some really long text that is here dont worry about it too much\nWords\nSeparated")
                    .lineLimit(4)
            }, descriptionText: {
                Text("Some descirption")
            }, status: {
                Text("Some status")
            }, substatus: {
                Text("some substatus").font(.system(size: 32))
            })
            
            return AnyView(oi)
            
        case (0, 2):
            //                cell.detailImage = #imageLiteral(resourceName: "ProfilePic")
            //                cell.detailImageView.isCircular = true
            //                cell.headlineText = Utils.localizedString("John Jacob Jingleheimer Schmidt")
            //                cell.headlineLabel.numberOfLines = 2
            //                cell.descriptionText = Utils.localizedString("Description is one line of text without wrapping")
            //                cell.statusText = Utils.localizedString("Available")
            //                cell.statusLabel.textColor = UIColor.preferredFioriColor(forStyle: .negative)
            //                cell.accessoryType = .disclosureIndicator
            //                cell.splitPercent = 0.5
            //                if isBorderExample {
            //                    cell.detailImageView.borderColor = UIColor.blue
            //                    cell.detailImageView.borderWidth = 0
            //                    cell.detailImageView.isCircular = true
            //                }
            let oi = ObjectItem(title: {
                Text("John Jacob Jingleheimer Schmidt")
            }, descriptionText: {
                Text("Description is one line of text without wrapping")
            }, status: {
                Text("Available").foregroundColor(.preferredColor(.negative))
            }, detailImage: {
                Image("ProfilePic").resizable().frame(width: 45, height: 45).clipShape(Circle())
            })
                .splitPercent(0.5)
            
            return AnyView(oi)
            
        case (1, 0):
//         cell.detailImageView.image = #imageLiteral(resourceName: "ProfilePic")
//         cell.detailImageView.isCircular = true
//         cell.headlineLabel.text = Utils.localizedString("Rouja Pakiman")
//         cell.subheadlineLabel.text = Utils.localizedString("Java Developer")
//         cell.descriptionLabel.text = Utils.localizedString("Customer discussed he needs a table to accomodate a family of 7.")
//         cell.statusLabel.text = Utils.localizedString("Available")
//         cell.statusLabel.textColor = UIColor.preferredFioriColor(forStyle: .positive)
//         cell.accessoryType = .disclosureIndicator
//         //            cell.iconImages = ["1", dot]
//         cell.splitPercent = 0.5
//         if isBorderExample {
//         cell.detailImageView.borderColor = UIColor.blue
//         cell.detailImageView.borderWidth = 10
//         cell.detailImageView.isCircular = true
//         }
            let oi = ObjectItem(title: {
                Text("Rouja Pakiman")
            }, subtitle: {
                Text("Java Developer")
            }, descriptionText: {
                Text("Customer discussed he needs a table to accomodate a family of 7.")
            }, status: {
                Text("Available").foregroundColor(.preferredColor(.positive))
            }, detailImage: {
                Image("ProfilePic").resizable().frame(width: 45, height: 45).clipShape(Circle())
            })
                .splitPercent(0.5)
            
            return AnyView(oi)
            
        case (1, 1):
//         cell.detailImageView.image = #imageLiteral(resourceName: "oski")
//         cell.headlineLabel.text = Utils.localizedString("No Description Set")
//         cell.subheadlineLabel.text = Utils.localizedString("Three Phase Pad Mounted Transformer (533423)")
//         cell.footnoteLabel.text = Utils.localizedString("1000 - Hamburg, MECHANIK")
//         cell.statusImageView.image = FUIIconLibrary.indicator.veryHighPriority
//         cell.substatusLabel.text = Utils.localizedString("Scheduled")
//         cell.accessoryType = .disclosureIndicator
//         //            cell.isAdaptiveLayout = false
//         if isBorderExample {
//         cell.detailImageView.borderColor = UIColor.blue
//         cell.detailImageView.borderWidth = 3
//         }
        
            let oi = ObjectItem(title: {
                Text("No Description Set")
            }, subtitle: {
                Text("Three Phase Pad Mounted Transformer (533423)")
            }, footnote: {
                Text("1000 - Hamburg, MECHANIK")
            }, status: {
                Image(systemName: "exclamationmark.square.fill")
            }, substatus: {
                Text("Scheduled")
            }, detailImage: {
                Image("oski").resizable().frame(width: 45, height: 45)
            })
            
            return AnyView(oi)
         
        case (1, 2):
            //            cell.iconImages = ["1", dot, FUIIconLibrary.indicator.attachment]
//         cell.detailImageView.image = #imageLiteral(resourceName: "ProfilePic")
//         cell.detailImageView.isCircular = true
//         cell.headlineLabel.text = Utils.localizedString("Rouja Pakiman")
//         cell.subheadlineLabel.text = Utils.localizedString("Java Developer")
//         cell.footnoteLabel.text = Utils.localizedString("San Carlos, CA. USA")
//         cell.descriptionLabel.text = Utils.localizedString("CustomerShortDescription")
//         cell.statusLabel.text = Utils.localizedString("This is a long status")
//         cell.substatusImageView.image = FUIIconLibrary.system.selected.withRenderingMode(.alwaysTemplate)
//         cell.substatusImageView.tintColor = UIColor.preferredFioriColor(forStyle: .primary3)
//         cell.accessoryType = .disclosureIndicator
//         cell.splitPercent = 0.5
//         if isBorderExample {
//         cell.detailImageView.borderColor = UIColor.blue
//         cell.detailImageView.borderWidth = 3
//         cell.detailImageView.isCircular = true
//         }
            let oi = ObjectItem(title: {
                Text("Rouja Pakiman")
            }, subtitle: {
                Text("Java Developer")
            }, footnote: {
                Text("San Carlos, CA. USA")
            }, descriptionText: {
                Text("Customer discussed he needs a and chair to table to accomodate a big family.  This is really important so they can all eat dinner at the same time.")
            }, status: {
                Text("This is a long status")
            }, substatus: {
                Image(systemName: "checkmark.circle.fill").foregroundColor(.preferredColor(.primary3))
            }, detailImage: {
                Image("ProfilePic").resizable().frame(width: 45, height: 45).clipShape(Circle())
            })
                .splitPercent(0.5)
            
            return AnyView(oi)
            
        case (2, 0):
            //            cell.iconImages = ["1", dot, FUIIconLibrary.indicator.attachment]
//         cell.detailImageView.image = #imageLiteral(resourceName: "ProfilePic")
//         cell.detailImageView.isCircular = true
//         cell.headlineLabel.text = Utils.localizedString("Rouja Pakiman")
//         cell.subheadlineLabel.text = Utils.localizedString("Java Developer")
//         cell.footnoteLabel.text = Utils.localizedString("San Carlos, CA. USA")
//         cell.descriptionLabel.text = Utils.localizedString("CustomerShortDescription")
//         cell.statusLabel.text = Utils.localizedString("This is a long status")
//         cell.statusLabel.textColor = UIColor.preferredFioriColor(forStyle: .positive)
//         cell.substatusImageView.image = FUIIconLibrary.system.selected.withRenderingMode(.alwaysTemplate)
//         cell.substatusImageView.tintColor = UIColor.preferredFioriColor(forStyle: .primary3)
//         cell.accessoryType = .disclosureIndicator
//         cell.splitPercent = 0.5
//         if isBorderExample {
//         cell.detailImageView.borderColor = UIColor.blue
//         cell.detailImageView.borderWidth = 20
//         cell.detailImageView.isCircular = true
//         }
            let oi = ObjectItem(title: {
                Text("Rouja Pakiman")
            }, subtitle: {
                Text("Java Developer")
            }, footnote: {
                Text("San Carlos, CA. USA")
            }, descriptionText: {
                Text("Customer discussed he needs a and chair to table to accomodate a big family.  This is really important so they can all eat dinner at the same time.")
            }, status: {
                Text("This is a long status").foregroundColor(.preferredColor(.positive))
            }, substatus: {
                Image(systemName: "checkmark.circle.fill").foregroundColor(.preferredColor(.primary3))
            }, detailImage: {
                Image("ProfilePic").resizable().frame(width: 45, height: 45).clipShape(Circle())
            })
                .splitPercent(0.5)
            
            return AnyView(oi)
        
        case (3, 0):
//         let cell = UITableViewCell(style: .default, reuseIdentifier: nil)
//         cell.textLabel?.text = "Multi-profile image needs to be developed"
//         return cell
            return AnyView(ObjectItem(title: "Multi-profile image needs to be developed"))
            
        case (4, 0):
//         let cell = UITableViewCell(style: UITableViewCellStyle.value1, reuseIdentifier: nil)
//         cell.textLabel?.text = "Headline"
//         cell.detailTextLabel?.text = "Subheadline"
//         cell.accessoryType = .disclosureIndicator
//         return cell
            return AnyView(ObjectItem(title: "Headline", status: "Subheadline"))
            
        default:
            return AnyView(ObjectItem(title: "Lorem ipseum dolor", status: "Available"))
        }
    }
}
