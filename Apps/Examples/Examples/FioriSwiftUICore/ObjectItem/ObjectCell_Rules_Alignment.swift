import FioriSwiftUICore
import SwiftUI

struct ObjectCell_Rules_Alignment: ListDataProtocol {
    init(cellTapped: Binding<Bool>) {}
    init() {}
    
    func numberOfSections() -> Int {
        6
    }
    
    func numberOfRowsInSection(_ section: Int) -> Int {
        switch section {
        case 0:
            return 5
        case 1:
            return 14
        case 2:
            return 9
        case 3:
            return 3
        case 4:
            return 5
        case 5:
            return 4
        default:
            return 0
        }
    }
    
    func titleForHeaderInSection(_ section: Int) -> String {
        switch section {
        case 0:
            return "Pages 2-4: GENERAL ALIGNMENT"
        case 1:
            return "Pages 5-9: STATUSES"
        case 2:
            return "Pages 10-13: DETAIL IMAGE"
        case 3:
            return "Pages 14-15: SINGLE AND MULTI-SELECTION"
        case 4:
            return "Pages 16-18: IMAGE/ICON STACK"
        case 5:
            return "Pages 19-20: DESCRIPTION"
        default:
            return ""
        }
    }
    
    func containAccessoryView(_ indexPath: IndexPath) -> Bool {
        switch (indexPath.section, indexPath.row) {
        case (1, 2):
            return false
            
        case (1, 7):
            return false
            
        default:
            return true
        }
    }
    
    func cellForRow(_ indexPath: IndexPath) -> AnyView {
//        let cell = tableView.dequeueReusableCell(withIdentifier: FUIObjectTableViewCell.reuseIdentifier, for: indexPath) as! FUIObjectTableViewCell
        ////        cell.detailImageView.layer.cornerRadius = 4
//
//        let dot: FUIAttributedImage = FUIAttributedImage(image: FUIIconLibrary.indicator.dot.withRenderingMode(.alwaysTemplate))
//        dot.tintColor = UIColor.preferredFioriColor(forStyle: .tintColorDark)
//        dot.contentMode = .center
//
//        let checkmark: FUIAttributedImage = FUIAttributedImage(image: FUIIconLibrary.system.check.withRenderingMode(.alwaysTemplate))
//        checkmark.tintColor = .magenta
//
//        let lock: UIImage = FUIIconLibrary.indicator.attachment.withRenderingMode(.alwaysTemplate)
//
//        let green = UIColor.preferredFioriColor(forStyle: .positive)
//        _ = UIColor.preferredFioriColor(forStyle: .negative)
//
//        let availableText = Utils.localizedString("Available")
//        let highText = Utils.localizedString("High")
//        let scheduledText = Utils.localizedString("Scheduled")
//        let loremIpsumText = Utils.localizedString("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi viverra libero et mauris gravida tempor.")
        
        switch (indexPath.section, indexPath.row) {
        case (0, 0):
//            let data: Test.Object = .rouja
//            cell.detailImageView.image = data.detailImage?.glyphImage
//            cell.headlineLabel.text = data.headline//"جون جاكوب جينغالي شميلين" (John Jacob Jingleheimer Schmidt)
//            cell.descriptionLabel.text = data.description
//            cell.statusText = isLongStatus ? loremIpsumText : availableText
//            cell.statusLabel.tintColor = green
//            cell.accessoryType = .disclosureIndicator
//            cell.detailImageView.isCircular = true
//            // Error associated with splitPercent
//            cell.splitPercent = 0.33
            let oi = ObjectItem(title: {
                Text("Rouja Pakiman")
            }, descriptionText: {
                Text("Rouja has worked for the company for ten years and has all of the skills that would be necessary for developing quality applications.  She is proficient in Java as well as CSS, Bootstrap, and Swift.")
            }, status: {
                Text("Available")
//                    .foregroundColor(.green)
            }, detailImage: {
                Image("person_square4").resizable().frame(width: 45, height: 45).clipShape(Circle())
            })
                .splitPercent(0.33)
            
            return AnyView(oi)
            
        case (0, 1):
//            let data: Test.Object = .rouja
//            cell.detailImageView.image = data.detailImage?.glyphImage
//            cell.headlineLabel.text = data.headline
//            cell.subheadlineText = data.subheadline
//            cell.descriptionLabel.text = data.description
//            cell.statusText = availableText
//            cell.statusLabel.tintColor = green
//            cell.accessoryType = .disclosureIndicator
//            cell.detailImageView.isCircular = true
//            cell.splitPercent = 0.33
            let oi = ObjectItem(title: {
                Text("Rouja Pakiman")
            }, subtitle: {
                Text("Java Developer")
            }, descriptionText: {
                Text("Rouja has worked for the company for ten years and has all of the skills that would be necessary for developing quality applications.  She is proficient in Java as well as CSS, Bootstrap, and Swift.")
            }, status: {
                Text("Available")
//                .foregroundColor(.green)
            }, detailImage: {
                Image("person_square4").resizable().frame(width: 45, height: 45).clipShape(Circle())
            })
                .splitPercent(0.33)
         
            return AnyView(oi)
         
        case (0, 2):
//            let data = Test.Object.transformer
//            cell.headlineLabel.text = data.headline
//            cell.descriptionLabel.text = data.description
//            cell.statusImage = data.statusImage?.glyphImage
//            cell.accessoryType = .detailButton
//            cell.iconImages = [dot]
//            cell.splitPercent = 0.43
            let oi = ObjectItem(title: {
                Text("Transformer Overheating")
            }, descriptionText: {
                Text("Customer noticed that the transformer started to over heat within 45 minutes each time he turned it on at 7:30am.  The first technician who looked at this did not have the correct additional tools to complete the job.")
            }, status: {
                Image(systemName: "exclamationmark.square.fill").foregroundColor(.preferredColor(.negativeLabel))
            }, icons: {
                // Image(systemName: "circle.fill").foregroundColor(.preferredColor(.tintColorDark))
                Circle().fill(Color.preferredColor(.tintColor)).frame(width: 14, height: 14)
            })
                .splitPercent(0.43)
            
            return AnyView(oi)
            
        case (0, 3):
//            let data: Test.Object = .rouja
//            cell.detailImageView.image = data.detailImage?.glyphImage
//            cell.headlineLabel.text = "Rouja Pakiman Rouja Pakiman Rouja Pakiman Rouja Pakiman Rouja Pakiman Rouja Pakiman Rouja Pakiman Rouja Pakiman"//data.headline
//            cell.headlineLabel.numberOfLines = 2
//            cell.descriptionLabel.text = data.description
//            cell.descriptionLabel.numberOfLines = 3
//            cell.statusText = availableText
//            cell.statusLabel.tintColor = green
//            cell.accessoryType = .disclosureIndicator
//            cell.detailImageView.isCircular = true
//            cell.splitPercent = 0.33
            let oi = ObjectItem(title: {
                Text("Rouja Pakiman Rouja Pakiman Rouja Pakiman Rouja Pakiman Rouja Pakiman Rouja Pakiman Rouja Pakiman Rouja Pakiman")
                    .lineLimit(2)
            }, descriptionText: {
                Text("Rouja has worked for the company for ten years and has all of the skills that would be necessary for developing quality applications.  She is proficient in Java as well as CSS, Bootstrap, and Swift.")
                    .lineLimit(3)
            }, status: {
                Text("Available")
//                    .foregroundColor(.green)
            }, detailImage: {
                Image("person_square4").resizable().frame(width: 45, height: 45).clipShape(Circle())
            })
                .splitPercent(0.33)
            
            return AnyView(oi)
        case (0, 4):
//            let data: Test.Object = .rouja
//            cell.detailImageView.image = data.detailImage?.glyphImage
//            // FIXEME: Change to Arabic localized string to get _NSLayoutTreeLineFragmentRectForGlyphAtIndex error
//            cell.headlineLabel.text = data.headline//johnText//Utils.localizedString("John Jacob Jingleheimer Schmidt")
//            cell.descriptionLabel.text = data.description
//            cell.statusText = availableText
//            cell.statusLabel.tintColor = green
//            cell.accessoryType = .disclosureIndicator
//            cell.detailImageView.isCircular = true
//            cell.splitPercent = 0.33
            let oi = ObjectItem(title: {
                Text("Rouja Pakiman")
            }, descriptionText: {
                Text("Rouja has worked for the company for ten years and has all of the skills that would be necessary for developing quality applications.  She is proficient in Java as well as CSS, Bootstrap, and Swift.").lineLimit(1)
            }, status: {
                Text("Available")
//                    .foregroundColor(.green)
            }, detailImage: {
                Image("person_square4").resizable().frame(width: 45, height: 45).clipShape(Circle())
            })
                .splitPercent(0.33)
            
            return AnyView(oi)
            
        case (1, 0):
//            let data = Test.Object.transformer
//            cell.headlineLabel.text = data.headline
//            cell.subheadlineText = data.subheadline
//            cell.footnoteLabel.text = data.footnote
//            cell.detailImage = Test.Object.part
//            cell.descriptionLabel.text = data.description
//            cell.statusLabel.text = data.status
//            cell.substatusText = data.substatus
//            cell.accessoryType = .disclosureIndicator
            let oi = ObjectItem(title: {
                Text("Transformer Overheating")
            }, subtitle: {
                Text("Three Phase Pad Mounted Transformer (533423)")
            }, footnote: {
                Text("1000 - Hamburg, MECHANIK")
            }, descriptionText: {
                Text("Customer noticed that the transformer started to over heat within 45 minutes each time he turned it on at 7:30am.  The first technician who looked at this did not have the correct additional tools to complete the job.")
            }, status: {
                Text("High")
            }, substatus: {
                Text("Scheduled")
            }, detailImage: {
                Image("attachment009").resizable().frame(width: 45, height: 45)
            })
            
            return AnyView(oi)
         
        case (1, 1):
//            let data = Test.Object.transformer
//            cell.headlineLabel.text = data.headline
//            cell.subheadlineText = data.subheadline
//            cell.footnoteLabel.text = data.footnote
//            cell.detailImage = Test.Object.part
//            cell.descriptionLabel.text = data.description
//            cell.statusImage = data.statusImage?.glyphImage
//            cell.substatusText = data.substatus
//            cell.accessoryType = .disclosureIndicator
            let oi = ObjectItem(title: {
                Text("Transformer Overheating")
            }, subtitle: {
                Text("Three Phase Pad Mounted Transformer (533423)")
            }, footnote: {
                Text("1000 - Hamburg, MECHANIK")
            }, descriptionText: {
                Text("Customer noticed that the transformer started to over heat within 45 minutes each time he turned it on at 7:30am.  The first technician who looked at this did not have the correct additional tools to complete the job.")
            }, status: {
                Image(systemName: "exclamationmark.square.fill").foregroundColor(.preferredColor(.negativeLabel))
            }, substatus: {
                Text("Scheduled")
            }, detailImage: {
                Image("attachment009").resizable().frame(width: 45, height: 45)
            })
            
            return AnyView(oi)
        case (1, 2):
//            let data = Test.Object.transformer
//            cell.headlineLabel.text = data.headline
//            cell.subheadlineText = data.subheadline
//            cell.footnoteLabel.text = data.footnote
//            cell.detailImage = Test.Object.part
//            cell.descriptionLabel.text = data.description
//            cell.statusImage = data.statusImage?.glyphImage
//            cell.substatusText = data.substatus
//            cell.accessoryType = .none
            let oi = ObjectItem(title: {
                Text("Transformer Overheating")
            }, subtitle: {
                Text("Three Phase Pad Mounted Transformer (533423)")
            }, footnote: {
                Text("1000 - Hamburg, MECHANIK")
            }, descriptionText: {
                Text("Customer noticed that the transformer started to over heat within 45 minutes each time he turned it on at 7:30am.  The first technician who looked at this did not have the correct additional tools to complete the job.")
            }, status: {
                Image(systemName: "exclamationmark.square.fill").foregroundColor(.preferredColor(.negativeLabel))
            }, substatus: {
                Text("Scheduled")
            }, detailImage: {
                Image("attachment009").resizable().frame(width: 45, height: 45)
            })
            
            return AnyView(oi)
         
        case (1, 3):
//            let data = Test.Object.transformer
//            cell.headlineLabel.text = data.headline
//            cell.subheadlineText = data.subheadline
//            cell.footnoteLabel.text = data.footnote
//            cell.detailImage = Test.Object.part
//            cell.descriptionLabel.text = data.description
//            cell.statusLabel.text = data.status
//            cell.accessoryType = .detailButton
//            cell.isApplyingSplitPercent = false
            let oi = ObjectItem(title: {
                Text("Transformer Overheating")
            }, subtitle: {
                Text("Three Phase Pad Mounted Transformer (533423)")
            }, footnote: {
                Text("1000 - Hamburg, MECHANIK")
            }, descriptionText: {
                Text("Customer noticed that the transformer started to over heat within 45 minutes each time he turned it on at 7:30am.  The first technician who looked at this did not have the correct additional tools to complete the job.")
            }, status: {
                Text("High")
            }, detailImage: {
                Image("attachment009").resizable().frame(width: 45, height: 45)
            })
                .splitPercent(nil)
            
            return AnyView(oi)
        case (1, 4):
//            let data = Test.Object.transformer
//            cell.headlineLabel.text = data.headline
//            cell.subheadlineText = data.subheadline
//            cell.footnoteLabel.text = data.footnote
//            cell.detailImage = Test.Object.part
//            cell.descriptionLabel.text = data.description
//            cell.statusLabel.text = data.status
//            cell.accessoryType = .checkmark
//            cell.isApplyingSplitPercent = false
            let oi = ObjectItem(title: {
                Text("Transformer Overheating")
            }, subtitle: {
                Text("Three Phase Pad Mounted Transformer (533423)")
            }, footnote: {
                Text("1000 - Hamburg, MECHANIK")
            }, descriptionText: {
                Text("Customer noticed that the transformer started to over heat within 45 minutes each time he turned it on at 7:30am.  The first technician who looked at this did not have the correct additional tools to complete the job.")
            }, status: {
                Text("High")
            }, detailImage: {
                Image("attachment009").resizable().frame(width: 45, height: 45)
            })
                .splitPercent(nil)
            
            return AnyView(oi)
        case (1, 5):
//            let data = Test.Object.transformer
//            cell.headlineLabel.text = data.headline
//            cell.descriptionLabel.text = data.description
//            cell.statusImage = data.statusImage?.glyphImage
//            cell.accessoryType = .detailButton
//            cell.iconImages = [dot]
//            cell.splitPercent = 0.43
            let oi = ObjectItem(title: {
                Text("Transformer Overheating")
            }, descriptionText: {
                Text("Customer noticed that the transformer started to over heat within 45 minutes each time he turned it on at 7:30am.  The first technician who looked at this did not have the correct additional tools to complete the job.")
            }, status: {
                Image(systemName: "exclamationmark.square.fill").foregroundColor(.preferredColor(.negativeLabel))
            }, icons: {
//                Image(systemName: "circle.fill").foregroundColor(.preferredColor(.tintColorDark))
                Circle().fill(Color.preferredColor(.tintColor)).frame(width: 14, height: 14)
            })
                .splitPercent(0.43)
            
            return AnyView(oi)
        case (1, 6):
//            let data = Test.Object.transformer
//            cell.headlineLabel.text = data.headline
//            cell.subheadlineText = data.subheadline
//            cell.footnoteLabel.text = data.footnote
//            cell.detailImage = Test.Object.part
//            cell.descriptionLabel.text = data.description
//            cell.statusLabel.text = data.status
//            cell.accessoryType = .disclosureIndicator
//            cell.isApplyingSplitPercent = false
            let oi = ObjectItem(title: {
                Text("Transformer Overheating")
            }, subtitle: {
                Text("Three Phase Pad Mounted Transformer (533423)")
            }, footnote: {
                Text("1000 - Hamburg, MECHANIK")
            }, descriptionText: {
                Text("Customer noticed that the transformer started to over heat within 45 minutes each time he turned it on at 7:30am.  The first technician who looked at this did not have the correct additional tools to complete the job.")
            }, status: {
                Text("High")
            }, detailImage: {
                Image("attachment009").resizable().frame(width: 45, height: 45)
            })
                .splitPercent(nil)
            
            return AnyView(oi)
        case (1, 7):
//            let data = Test.Object.transformer
//            cell.headlineLabel.text = data.headline
//            cell.subheadlineText = data.subheadline
//            cell.footnoteLabel.text = data.footnote
//            cell.detailImage = Test.Object.part
//            cell.descriptionLabel.text = data.description
//            cell.statusLabel.text = data.status
//            cell.accessoryType = .none
//            cell.isApplyingSplitPercent = false
            let oi = ObjectItem(title: {
                Text("Transformer Overheating")
            }, subtitle: {
                Text("Three Phase Pad Mounted Transformer (533423)")
            }, footnote: {
                Text("1000 - Hamburg, MECHANIK")
            }, descriptionText: {
                Text("Customer noticed that the transformer started to over heat within 45 minutes each time he turned it on at 7:30am.  The first technician who looked at this did not have the correct additional tools to complete the job.")
            }, status: {
                Text("High")
            }, detailImage: {
                Image("attachment009").resizable().frame(width: 45, height: 45)
            })
                .splitPercent(nil)
            
            return AnyView(oi)
        case (1, 8):
//            let data: Test.Object = .rouja
//            cell.detailImageView.image = data.detailImage?.glyphImage
//            cell.headlineLabel.text = data.headline
//            cell.subheadlineText = data.subheadline
//            cell.descriptionLabel.text = data.description
//            cell.statusText = data.status
//            cell.statusLabel.tintColor = green
//            cell.accessoryType = .disclosureIndicator
//            cell.detailImageView.isCircular = true
//            cell.splitPercent = 0.33
            let oi = ObjectItem(title: {
                Text("Rouja Pakiman")
            }, subtitle: {
                Text("Java Developer")
            }, descriptionText: {
                Text("Rouja has worked for the company for ten years and has all of the skills that would be necessary for developing quality applications.  She is proficient in Java as well as CSS, Bootstrap, and Swift.")
            }, status: {
                Text("Available")
                //                .foregroundColor(.green)
            }, detailImage: {
                Image("person_square4").resizable().frame(width: 45, height: 45).clipShape(Circle())
            })
                .splitPercent(0.33)
            
            return AnyView(oi)
            
        case (1, 9):
//            let data = Test.Object.transformer
//            cell.headlineLabel.text = data.headline
//            cell.subheadlineText = data.subheadline
//            cell.footnoteLabel.text = data.footnote
//            cell.detailImage = Test.Object.part
//            cell.descriptionLabel.text = data.description
//            cell.statusImage = data.statusImage?.glyphImage
//            cell.substatusText = data.substatus
//            cell.accessoryType = .disclosureIndicator
            let oi = ObjectItem(title: {
                Text("Transformer Overheating")
            }, subtitle: {
                Text("Three Phase Pad Mounted Transformer (533423)")
            }, footnote: {
                Text("1000 - Hamburg, MECHANIK")
            }, descriptionText: {
                Text("Customer noticed that the transformer started to over heat within 45 minutes each time he turned it on at 7:30am.  The first technician who looked at this did not have the correct additional tools to complete the job.")
            }, status: {
                Image(systemName: "exclamationmark.square.fill").foregroundColor(.preferredColor(.negativeLabel))
            }, substatus: {
                Text("Scheduled")
            }, detailImage: {
                Image("attachment009").resizable().frame(width: 45, height: 45)
            })
            
            return AnyView(oi)
            
        case (1, 10):
//            let data = Test.Object.transformer
//            cell.iconImages = ["1", dot, lock]
//            cell.headlineLabel.text = data.headline
//            cell.subheadlineText = data.subheadline
//            cell.footnoteLabel.text = data.footnote
//            cell.detailImage = Test.Object.part
//            cell.descriptionLabel.text = data.description
//            cell.statusLabel.text = data.status
//            cell.substatusText = data.substatus
//            cell.accessoryType = .disclosureIndicator
//            cell.isApplyingSplitPercent = false
            let oi = ObjectItem(title: {
                Text("Transformer Overheating").lineLimit(1)
            }, subtitle: {
                Text("Three Phase Pad Mounted Transformer (533423)")
            }, footnote: {
                Text("1000 - Hamburg, MECHANIK")
            }, descriptionText: {
                Text("Customer noticed that the transformer started to over heat within 45 minutes each time he turned it on at 7:30am.  The first technician who looked at this did not have the correct additional tools to complete the job.")
            }, status: {
                Text("High")
            }, substatus: {
                Text("Scheduled")
            }, detailImage: {
                Image("attachment009").resizable().frame(width: 45, height: 45)
            }, icons: {
                Text("1")
                Circle().fill(Color.preferredColor(.tintColor)).frame(width: 14, height: 14)
                Image(systemName: "paperclip").font(.system(size: 14))
            })
                .splitPercent(nil)
            
            return AnyView(oi)
            
        case (1, 11):
//            let data = Test.Object.transformer
//            cell.headlineLabel.text = data.headline
//            cell.subheadlineText = data.subheadline
//            cell.footnoteLabel.text = data.footnote
//            cell.detailImage = Test.Object.part
//            cell.descriptionLabel.text = data.description
//            cell.statusImage = data.statusImage?.glyphImage
//            cell.substatusText = data.substatus
//            cell.accessoryType = .disclosureIndicator
//            cell.isApplyingSplitPercent = false
            
            let oi = ObjectItem(title: {
                Text("Transformer Overheating")
            }, subtitle: {
                Text("Three Phase Pad Mounted Transformer (533423)")
            }, footnote: {
                Text("1000 - Hamburg, MECHANIK")
            }, descriptionText: {
                Text("Customer noticed that the transformer started to over heat within 45 minutes each time he turned it on at 7:30am.  The first technician who looked at this did not have the correct additional tools to complete the job.")
            }, status: {
                Image(systemName: "exclamationmark.square.fill").foregroundColor(.preferredColor(.negativeLabel))
            }, substatus: {
                Text("Scheduled")
            }, detailImage: {
                Image("attachment009").resizable().frame(width: 45, height: 45)
            })
                .splitPercent(nil)
            
            return AnyView(oi)
            
        case (1, 12):
//            let data = Test.Object.transformer
//            cell.headlineLabel.text = data.headline
//            cell.subheadlineText = data.subheadline
//            cell.footnoteLabel.text = data.footnote
//            cell.detailImage = Test.Object.part
//            cell.descriptionLabel.text = data.description
//            cell.statusImage = data.statusImage?.glyphImage
//            cell.substatusText = data.substatus
//            cell.isApplyingSplitPercent = false
            let oi = ObjectItem(title: {
                Text("Transformer Overheating")
            }, subtitle: {
                Text("Three Phase Pad Mounted Transformer (533423)")
            }, footnote: {
                Text("1000 - Hamburg, MECHANIK")
            }, descriptionText: {
                Text("Customer noticed that the transformer started to over heat within 45 minutes each time he turned it on at 7:30am.  The first technician who looked at this did not have the correct additional tools to complete the job.")
            }, status: {
                Image(systemName: "exclamationmark.square.fill").foregroundColor(.preferredColor(.negativeLabel))
            }, substatus: {
                Text("Scheduled")
            }, detailImage: {
                Image("attachment009").resizable().frame(width: 45, height: 45)
            })
                .splitPercent(nil)
            
            return AnyView(oi)
            
        case (1, 13):
//            let data = Test.Object.transformer
//            cell.headlineLabel.text = data.headline
//            cell.subheadlineText = data.subheadline
//            cell.footnoteLabel.text = data.footnote
//            cell.detailImage = Test.Object.part
//            cell.descriptionLabel.text = data.description
//            cell.statusImage = data.statusImage?.glyphImage
//            cell.substatusText = data.substatus
//            cell.accessoryType = .disclosureIndicator
            let oi = ObjectItem(title: {
                Text("Transformer Overheating")
            }, subtitle: {
                Text("Three Phase Pad Mounted Transformer (533423)")
            }, footnote: {
                Text("1000 - Hamburg, MECHANIK")
            }, descriptionText: {
                Text("Customer noticed that the transformer started to over heat within 45 minutes each time he turned it on at 7:30am.  The first technician who looked at this did not have the correct additional tools to complete the job.")
            }, status: {
                Image(systemName: "exclamationmark.square.fill").foregroundColor(.preferredColor(.negativeLabel))
            }, substatus: {
                Text("Scheduled")
            }, detailImage: {
                Image("attachment009").resizable().frame(width: 45, height: 45)
            })
            
            return AnyView(oi)
            
        // section 2: "Pages 10-13: DETAIL IMAGE"
        case (2, 0):
//            let data: Test.Object = .rouja
//            cell.detailImageView.image = data.detailImage?.glyphImage
//            cell.headlineLabel.text = data.headline
//            cell.descriptionLabel.text = data.description
//            cell.statusText = availableText
//            cell.statusLabel.tintColor = green
//            cell.accessoryType = .disclosureIndicator
//            cell.detailImageView.isCircular = true
//            cell.splitPercent = 0.33
            
            let oi = ObjectItem(title: {
                Text("Rouja Pakiman")
            }, descriptionText: {
                Text("Rouja has worked for the company for ten years and has all of the skills that would be necessary for developing quality applications.  She is proficient in Java as well as CSS, Bootstrap, and Swift.")
            }, status: {
                Text("Available")
            }, detailImage: {
                Image("person_square4").resizable().frame(width: 45, height: 45).clipShape(Circle())
            })
                .splitPercent(0.33)
            
            return AnyView(oi)
            
        case (2, 1):
//            let data: Test.Object = .rouja
//            cell.detailImageView.image = data.detailImage?.glyphImage
//            cell.headlineLabel.text = data.headline
//            cell.subheadlineText = data.subheadline
//            cell.descriptionLabel.text = data.description
//            cell.statusText = availableText
//            cell.statusLabel.tintColor = green
//            cell.accessoryType = .disclosureIndicator
//            cell.detailImageView.isCircular = true
//            cell.splitPercent = 0.33
            let oi = ObjectItem(title: {
                Text("Rouja Pakiman")
            }, subtitle: {
                Text("Java Developer")
            }, descriptionText: {
                Text("Rouja has worked for the company for ten years and has all of the skills that would be necessary for developing quality applications.  She is proficient in Java as well as CSS, Bootstrap, and Swift.")
            }, status: {
                Text("Available")
            }, detailImage: {
                Image("person_square4").resizable().frame(width: 45, height: 45).clipShape(Circle())
            })
                .splitPercent(0.33)
            
            return AnyView(oi)
            
        case (2, 2):
//            let data: Test.Object = .rouja
//            cell.detailImageView.image = FUIIconLibrary.docType.generic.withRenderingMode(.alwaysTemplate)
//            cell.detailImageView.tintColor = UIColor.preferredFioriColor(forStyle: .primary3)
//            cell.detailImageViewSize = CGSize(width: 32, height: 32)
//            cell.headlineLabel.text = data.headline
//            cell.subheadlineText = data.subheadline
//            cell.descriptionLabel.text = data.description
//            cell.statusText = availableText
//            cell.statusLabel.tintColor = green
//            cell.accessoryType = .disclosureIndicator
//            cell.detailImageView.isCircular = false
//            cell.splitPercent = 0.33
            let oi = ObjectItem(title: {
                Text("Rouja Pakiman")
            }, subtitle: {
                Text("Java Developer")
            }, descriptionText: {
                Text("Rouja has worked for the company for ten years and has all of the skills that would be necessary for developing quality applications.  She is proficient in Java as well as CSS, Bootstrap, and Swift.")
            }, status: {
                Text("Available")
            }, detailImage: {
                Image("generic-file_28px").resizable().frame(width: 32, height: 32).clipShape(Circle())
            })
                .splitPercent(0.33)
            
            return AnyView(oi)
            
        case (2, 3):
//            let data: Test.Object = .rouja
//            cell.detailImageView.image = data.detailImage?.glyphImage
//            cell.headlineLabel.text = data.headline
//            cell.subheadlineText = data.subheadline
//            cell.descriptionLabel.text = data.description
//            cell.statusText = availableText
//            cell.statusLabel.tintColor = green
//            cell.accessoryType = .disclosureIndicator
//            cell.detailImageView.isCircular = true
//            cell.splitPercent = 0.33
            let oi = ObjectItem(title: {
                Text("Rouja Pakiman")
            }, subtitle: {
                Text("Java Developer")
            }, descriptionText: {
                Text("Rouja has worked for the company for ten years and has all of the skills that would be necessary for developing quality applications.  She is proficient in Java as well as CSS, Bootstrap, and Swift.")
            }, status: {
                Text("Available")
            }, detailImage: {
                Image("person_square4").resizable().frame(width: 45, height: 45).clipShape(Circle())
            })
                .splitPercent(0.33)
            
            return AnyView(oi)
            
        case (2, 4):
//            let data = Test.Object.transformer
//            cell.headlineLabel.text = data.headline
//            cell.subheadlineText = data.subheadline
//            cell.footnoteLabel.text = data.footnote
//            cell.detailImage = Test.Object.part
//            cell.detailImageViewSize = CGSize(width: 60, height: 60)
//            cell.headlineLabel.numberOfLines = 2
//            cell.descriptionLabel.numberOfLines = 3
//            cell.descriptionLabel.text = data.description
//            cell.statusLabel.text = data.status
//            cell.substatusText = data.substatus
//            cell.accessoryType = .disclosureIndicator
            let oi = ObjectItem(title: {
                Text("Transformer Overheating")
            }, subtitle: {
                Text("Three Phase Pad Mounted Transformer (533423)")
            }, footnote: {
                Text("1000 - Hamburg, MECHANIK")
            }, descriptionText: {
                Text("Customer noticed that the transformer started to over heat within 45 minutes each time he turned it on at 7:30am.  The first technician who looked at this did not have the correct additional tools to complete the job.")
            }, status: {
                Text("High")
            }, substatus: {
                Text("Scheduled")
            }, detailImage: {
                Image("attachment009").resizable().frame(width: 60, height: 60)
            })
            
            return AnyView(oi)
            
        case (2, 5):
//            let c = UITableViewCell()
//            c.textLabel?.text = "Multi-image profile not implemented"
//            return c
            return AnyView(ObjectItem(title: "Multi-image profile not implemented"))
            
        case (2, 6):
//            let c = UITableViewCell()
//            c.textLabel?.text = "Prohibition on icons is not enforced programmatically"
//            return c
            return AnyView(ObjectItem(title: "Prohibition on icons is not enforced programmatically"))
            
        case (2, 7):
//            let data = Test.Object.transformer
//            cell.iconImages = ["1", dot, lock]
//            cell.headlineLabel.text = data.headline
//            cell.subheadlineText = data.subheadline
//            cell.footnoteLabel.text = data.footnote
//            cell.detailImage = Test.Object.part
//            cell.headlineLabel.numberOfLines = 2
//            cell.descriptionLabel.numberOfLines = 3
//            cell.descriptionLabel.text = data.description
//            cell.statusLabel.text = data.status
//            cell.substatusText = data.substatus
//            cell.accessoryType = .disclosureIndicator
            let oi = ObjectItem(title: {
                Text("Transformer Overheating")
            }, subtitle: {
                Text("Three Phase Pad Mounted Transformer (533423)")
            }, footnote: {
                Text("1000 - Hamburg, MECHANIK")
            }, descriptionText: {
                Text("Customer noticed that the transformer started to over heat within 45 minutes each time he turned it on at 7:30am.  The first technician who looked at this did not have the correct additional tools to complete the job.")
            }, status: {
                Text("Hign")
            }, substatus: {
                Text("Scheduled")
            }, detailImage: {
                Image("attachment009").resizable().frame(width: 45, height: 45)
            }, icons: {
                Text("1")
                Circle().fill(Color.preferredColor(.tintColor)).frame(width: 14, height: 14)
                Image(systemName: "paperclip").font(.system(size: 14))
            })
            
            return AnyView(oi)
            
        case (2, 8):
//            let data: Test.Object = .rouja
//            cell.iconImages = ["1", dot, lock]
//            cell.detailImageView.image = FUIIconLibrary.docType.generic.withRenderingMode(.alwaysTemplate)
//            cell.detailImageView.tintColor = UIColor.preferredFioriColor(forStyle: .primary3)
//            cell.detailImageViewSize = CGSize(width: 32, height: 32)
//            cell.headlineLabel.text = data.headline
//            cell.subheadlineText = data.subheadline
//            cell.footnoteLabel.text = data.footnote
//            cell.descriptionLabel.text = data.description
//            cell.statusText = availableText
//            cell.statusLabel.tintColor = green
//            cell.accessoryType = .disclosureIndicator
//            cell.detailImageView.isCircular = false
//            cell.splitPercent = 0.33
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
                Image("generic-file_28px").resizable().frame(width: 32, height: 32).clipShape(Circle())
            }, icons: {
                Text("1")
                Circle().fill(Color.preferredColor(.tintColor)).frame(width: 14, height: 14)
                Image(systemName: "paperclip").font(.system(size: 14))
            })
                .splitPercent(0.33)
            
            return AnyView(oi)
            
        case (3, 0):
//            let data = Test.Object.transformer
//            cell.detailImage = data.detailImage?.glyphImage
//            cell.headlineText = data.headline
//            cell.subheadlineText = data.subheadline
//            cell.footnoteText = data.footnote
//            cell.statusText = highText
//            cell.accessoryType = .checkmark
            let oi = ObjectItem(title: {
                Text("Transformer Overheating")
            }, subtitle: {
                Text("Three Phase Pad Mounted Transformer (533423)")
            }, footnote: {
                Text("1000 - Hamburg, MECHANIK")
            }, status: {
                Text("High")
            }, detailImage: {
                Image("attachment009").resizable().frame(width: 45, height: 45)
            })
            
            return AnyView(oi)
            
        case (3, 1):
//            let data = Test.Object.transformer
//            cell.detailImage = data.detailImage?.glyphImage
//            cell.headlineText = data.headline
//            cell.subheadlineText = data.subheadline
//            cell.footnoteText = data.footnote
//            cell.statusText = highText
            let oi = ObjectItem(title: {
                Text("Transformer Overheating")
            }, subtitle: {
                Text("Three Phase Pad Mounted Transformer (533423)")
            }, footnote: {
                Text("1000 - Hamburg, MECHANIK")
            }, status: {
                Text("High")
            }, detailImage: {
                Image("attachment009").resizable().frame(width: 45, height: 45)
            })
            
            return AnyView(oi)
            
        case (3, 2):
//            let data: Test.Object = .rouja
//            cell.detailImageView.image = data.detailImage?.glyphImage
//            cell.detailImageView.isCircular = true
//            cell.detailImageView.tintColor = UIColor.preferredFioriColor(forStyle: .primary3)
//            cell.headlineLabel.text = data.headline
//            cell.subheadlineText = data.subheadline
//            cell.footnoteLabel.text = data.footnote
//            cell.statusText = availableText
//            cell.statusLabel.tintColor = green
//            cell.accessoryType = .disclosureIndicator
//            cell.isApplyingSplitPercent = false
//            DispatchQueue.main.async {
//                cell.isEditing = true
//            }
        
            let oi = ObjectItem(title: {
                Text("Rouja Pakiman")
            }, subtitle: {
                Text("Java Developer")
            }, footnote: {
                Text("Los Angeles")
            }, status: {
                Text("Available")
            }, detailImage: {
                Image("person_square4").resizable().frame(width: 45, height: 45).clipShape(Circle())
            })
                .splitPercent(nil)
            
            return AnyView(oi)
        
        // section: "Pages 16-18: IMAGE/ICON STACK"
        case (4, 0):
//            let data = Test.Object.transformer
//            cell.iconImages = [dot, "2"]
//            cell.headlineText = data.headline
//            cell.descriptionText = data.description
//            cell.statusImage = data.statusImage?.glyphImage
//            cell.accessoryType = .detailButton
        
            let oi = ObjectItem(title: {
                Text("Transformer Overheating")
            }, descriptionText: {
                Text("Customer noticed that the transformer started to over heat within 45 minutes each time he turned it on at 7:30am.  The first technician who looked at this did not have the correct additional tools to complete the job.")
            }, status: {
                Image(systemName: "exclamationmark.square.fill").foregroundColor(.preferredColor(.negativeLabel))
            }, icons: {
                Circle().fill(Color.preferredColor(.tintColor)).frame(width: 14, height: 14)
                Text("2")
            })
            
            return AnyView(oi)
            
        case (4, 1):
//            let data: Test.Object = .rouja
//            cell.iconImages = ["1", dot, lock]
//            cell.detailImageView.image = data.detailImage?.glyphImage
//            cell.detailImageView.isCircular = true
//            cell.headlineLabel.text = data.headline
//            cell.subheadlineText = data.subheadline
//            cell.descriptionText = data.description
//            cell.statusText = availableText
//            cell.accessoryType = .disclosureIndicator
//            cell.splitPercent = 0.33
            let oi = ObjectItem(title: {
                Text("Rouja Pakiman")
            }, subtitle: {
                Text("Java Developer")
            }, descriptionText: {
                Text("Rouja has worked for the company for ten years and has all of the skills that would be necessary for developing quality applications.  She is proficient in Java as well as CSS, Bootstrap, and Swift.")
            }, status: {
                Text("Available")
            }, detailImage: {
                Image("person_square4").resizable().frame(width: 45, height: 45).clipShape(Circle())
            }, icons: {
                Text("1")
                Circle().fill(Color.preferredColor(.tintColor)).frame(width: 14, height: 14)
                Image(systemName: "paperclip").font(.system(size: 14))
            })
                .splitPercent(0.33)
            
            return AnyView(oi)
            
        case (4, 2):
//            let data = Test.Object.transformer
//            cell.iconImages = [dot]
//            cell.headlineText = data.headline
//            cell.descriptionText = data.description
//            cell.statusImage = data.statusImage?.glyphImage
//            cell.accessoryType = .detailButton
            let oi = ObjectItem(title: {
                Text("Transformer Overheating")
            }, descriptionText: {
                Text("Customer noticed that the transformer started to over heat within 45 minutes each time he turned it on at 7:30am.  The first technician who looked at this did not have the correct additional tools to complete the job.")
            }, status: {
                Image(systemName: "exclamationmark.square.fill").foregroundColor(.preferredColor(.negativeLabel))
            }, icons: {
                Circle().fill(Color.preferredColor(.tintColor)).frame(width: 14, height: 14)
            })
            
            return AnyView(oi)
            
        case (4, 3):
//            let data: Test.Object = .rouja
//            cell.iconImages = [lock, dot]
//            cell.detailImageView.image = data.detailImage?.glyphImage
//            cell.detailImageView.isCircular = true
//            cell.headlineLabel.text = data.headline
//            cell.subheadlineText = data.subheadline
//            cell.descriptionText = data.description
//            cell.statusText = availableText
//            cell.statusLabel.tintColor = UIColor.preferredFioriColor(forStyle: .positive)
//            cell.accessoryType = .disclosureIndicator
//            cell.splitPercent = 0.33
            let oi = ObjectItem(title: {
                Text("Rouja Pakiman")
            }, subtitle: {
                Text("Java Developer")
            }, descriptionText: {
                Text("Rouja has worked for the company for ten years and has all of the skills that would be necessary for developing quality applications.  She is proficient in Java as well as CSS, Bootstrap, and Swift.")
            }, status: {
                Text("Available")
            }, detailImage: {
                Image("person_square4").resizable().frame(width: 45, height: 45).clipShape(Circle())
            }, icons: {
                Image(systemName: "paperclip").font(.system(size: 14))
                Circle().fill(Color.preferredColor(.tintColor)).frame(width: 14, height: 14)
            })
                .splitPercent(0.33)
            
            return AnyView(oi)
            
        case (4, 4):
//            let data: Test.Object = .rouja
//            cell.iconImages = ["123456789", dot, lock, dot, lock, dot, lock, dot, lock, dot]
//            cell.detailImageView.image = data.detailImage?.glyphImage
//            cell.detailImageView.isCircular = true
//            cell.headlineLabel.text = data.headline
//            cell.subheadlineText = data.subheadline
//            cell.footnoteText = data.footnote
//            cell.descriptionText = data.description
//            cell.statusText = availableText
//            cell.statusLabel.tintColor = UIColor.preferredFioriColor(forStyle: .positive)
//            cell.accessoryType = .disclosureIndicator
//            cell.splitPercent = 0.33
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
                Image("person_square4").resizable().frame(width: 45, height: 45).clipShape(Circle())
            }, icons: {
                Text("123456789")
                Circle().fill(Color.preferredColor(.tintColor)).frame(width: 14, height: 14)
                Image(systemName: "paperclip").font(.system(size: 14))
                Circle().fill(Color.preferredColor(.tintColor)).frame(width: 14, height: 14)
                Image(systemName: "paperclip").font(.system(size: 14))
                Circle().fill(Color.preferredColor(.tintColor)).frame(width: 14, height: 14)
                Image(systemName: "paperclip").font(.system(size: 14))
                Circle().fill(Color.preferredColor(.tintColor)).frame(width: 14, height: 14)
                Image(systemName: "paperclip").font(.system(size: 14))
                Circle().fill(Color.preferredColor(.tintColor)).frame(width: 14, height: 14)
            })
                .splitPercent(0.33)
            
            return AnyView(oi)
            
        case (5, 0):
//            let data: Test.Object = .rouja
//            cell.detailImageView.image = data.detailImage?.glyphImage
//            cell.detailImageView.isCircular = true
//            cell.headlineLabel.text = data.headline
//            cell.descriptionText = data.description
//            cell.statusText = availableText
//            cell.statusLabel.tintColor = UIColor.preferredFioriColor(forStyle: .positive)
//            cell.accessoryType = .disclosureIndicator
//            cell.splitPercent = 0.33
            let oi = ObjectItem(title: {
                Text("Rouja Pakiman")
            }, descriptionText: {
                Text("Rouja has worked for the company for ten years and has all of the skills that would be necessary for developing quality applications.  She is proficient in Java as well as CSS, Bootstrap, and Swift.")
            }, status: {
                Text("Available")
            }, detailImage: {
                Image("person_square4").resizable().frame(width: 45, height: 45).clipShape(Circle())
            })
                .splitPercent(0.33)
            
            return AnyView(oi)
            
        case (5, 1):
//            let data: Test.Object = .rouja
//            cell.detailImageView.image = data.detailImage?.glyphImage
//            cell.detailImageView.isCircular = true
//            cell.headlineLabel.text = data.headline
//            cell.subheadlineText = data.subheadline
//            cell.descriptionText = data.description
//            cell.statusText = availableText
//            cell.statusLabel.tintColor = UIColor.preferredFioriColor(forStyle: .positive)
//            cell.accessoryType = .disclosureIndicator
//            cell.splitPercent = 0.33
            let oi = ObjectItem(title: {
                Text("Rouja Pakiman")
            }, subtitle: {
                Text("Java Developer")
            }, descriptionText: {
                Text("Rouja has worked for the company for ten years and has all of the skills that would be necessary for developing quality applications.  She is proficient in Java as well as CSS, Bootstrap, and Swift.")
            }, status: {
                Text("Available")
            }, detailImage: {
                Image("person_square4").resizable().frame(width: 45, height: 45).clipShape(Circle())
            })
                .splitPercent(0.33)
            
            return AnyView(oi)
            
        case (5, 2):
//            let data = Test.Object.transformer
//            cell.detailImage = data.detailImage?.glyphImage
//            cell.headlineText = data.headline
//            cell.subheadlineText = data.subheadline
//            cell.footnoteText = data.footnote
//            cell.descriptionText = data.description
//            cell.statusText = highText
//            cell.substatusText = scheduledText
//            cell.accessoryType = .disclosureIndicator
            let oi = ObjectItem(title: {
                Text("Transformer Overheating")
            }, subtitle: {
                Text("Three Phase Pad Mounted Transformer (533423)")
            }, footnote: {
                Text("1000 - Hamburg, MECHANIK")
            }, descriptionText: {
                Text("Customer noticed that the transformer started to over heat within 45 minutes each time he turned it on at 7:30am.  The first technician who looked at this did not have the correct additional tools to complete the job.")
            }, status: {
                Text("High")
            }, substatus: {
                Text("Scheduled")
            }, detailImage: {
                Image("attachment009").resizable().frame(width: 45, height: 45)
            })
            
            return AnyView(oi)
            
        case (5, 3):
//            let data = Test.Object.transformerLong
//            cell.detailImage = data.detailImage?.glyphImage
//            cell.detailImageViewSize = CGSize(width: 60, height: 60)
//            cell.headlineText = data.headline
//            cell.headlineLabel.numberOfLines = 2
//            cell.subheadlineText = data.subheadline
//            cell.footnoteText = data.footnote
//            cell.descriptionText = data.description
//            cell.statusText = highText
//            cell.substatusText = scheduledText
//            cell.accessoryType = .disclosureIndicator
            let oi = ObjectItem(title: {
                Text("Transformer Overheating When After Being on for 1 Hour or Longer Duration.").lineLimit(2)
            }, subtitle: {
                Text("Three Phase Pad Mounted Transformer (533423)")
            }, footnote: {
                Text("1000 - Hamburg, MECHANIK")
            }, descriptionText: {
                Text("Customer noticed that the transformer started to over heat within 45 minutes each time he turned it on at 7:30am.  The first technician who looked at this did not have the correct additional tools to complete the job.")
            }, status: {
                Text("High")
            }, substatus: {
                Text("Scheduled")
            }, detailImage: {
                Image("attachment009").resizable().frame(width: 60, height: 60)
            })
            
            return AnyView(oi)
        
        default:
            return AnyView(ObjectItem(title: "Lorem ipseum dolor"))
        }
    }
}
