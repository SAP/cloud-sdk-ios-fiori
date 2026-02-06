import FioriSwiftUICore
import SwiftUI

struct ObjectCell_Rules_Alignment: ObjectItemListDataProtocol {
    @State private var isShowingDetailView: Bool = false
    
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
        let oi: any View
        switch (indexPath.section, indexPath.row) {
        case (0, 0):
            oi = ObjectItem(title: {
                Text("Rouja Pakiman")
            }, description: {
                Text("Rouja has worked for the company for ten years and has all of the skills that would be necessary for developing quality applications.  She is proficient in Java as well as CSS, Bootstrap, and Swift.")
            }, status: {
                Text("Available")
                //                    .foregroundColor(.green)
            }, detailImage: {
                ZStack(alignment: .bottomTrailing) {
                    Image("person_square4")
                        .resizable()
                        .frame(width: 45, height: 45)
                        .clipShape(Circle())
                    
                    if !self.isShowingDetailView {
                        Button(action: {
                            // Handle download action
                            print("Download tapped for person_square4")
                            // Add your download logic here
                        }) {
                            Image(systemName: "arrow.down.circle.fill")
                                .foregroundColor(.white)
                                .background(Color.blue)
                                .clipShape(Circle())
                                .frame(width: 16, height: 16)
                        }
                        .buttonStyle(PlainButtonStyle())
                        .contentShape(Circle())
                        .frame(width: 16, height: 16)
                        .offset(x: -2, y: -2)
                    }
                }
            })
            .splitPercent(0.33)
        case (0, 1):
            oi = ObjectItem(title: {
                Text("Rouja Pakiman")
            }, subtitle: {
                Text("Java Developer")
            }, description: {
                Text("Rouja has worked for the company for ten years and has all of the skills that would be necessary for developing quality applications.  She is proficient in Java as well as CSS, Bootstrap, and Swift.")
            }, status: {
                Text("Available")
                //                .foregroundColor(.green)
            }, detailImage: {
                Image("person_square4").resizable().frame(width: 45, height: 45).clipShape(Circle())
            })
            .splitPercent(0.33)
        case (0, 2):
            oi = ObjectItem(title: {
                Text("Transformer Overheating")
            }, description: {
                Text("Customer noticed that the transformer started to over heat within 45 minutes each time he turned it on at 7:30am.  The first technician who looked at this did not have the correct additional tools to complete the job.")
            }, status: {
                Image(systemName: "exclamationmark.square.fill").foregroundColor(.preferredColor(.negativeLabel)).accessibilityLabel("Warning")
            }, icons: {
                // Image(systemName: "circle.fill").foregroundColor(.preferredColor(.tintColorDark))
                Circle().fill(Color.preferredColor(.tintColor)).frame(width: 14, height: 14)
            })
            .splitPercent(0.43)
        case (0, 3):
            oi = ObjectItem(title: {
                Text("Rouja Pakiman Rouja Pakiman Rouja Pakiman Rouja Pakiman Rouja Pakiman Rouja Pakiman Rouja Pakiman Rouja Pakiman")
                    .lineLimit(2)
            }, description: {
                Text("Rouja has worked for the company for ten years and has all of the skills that would be necessary for developing quality applications.  She is proficient in Java as well as CSS, Bootstrap, and Swift.")
                    .lineLimit(3)
            }, status: {
                Text("Available")
                //                    .foregroundColor(.green)
            }, detailImage: {
                Image("person_square4").resizable().frame(width: 45, height: 45).clipShape(Circle())
            })
            .splitPercent(0.33)
        case (0, 4):
            oi = ObjectItem(title: {
                Text("Rouja Pakiman")
            }, description: {
                Text("Rouja has worked for the company for ten years and has all of the skills that would be necessary for developing quality applications.  She is proficient in Java as well as CSS, Bootstrap, and Swift.").lineLimit(1)
            }, status: {
                Text("Available")
                //                    .foregroundColor(.green)
            }, detailImage: {
                Image("person_square4").resizable().frame(width: 45, height: 45).clipShape(Circle())
            })
            .splitPercent(0.33)
        case (1, 0):
            oi = ObjectItem(title: {
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
                Image("productThumbnail").resizable().frame(width: 45, height: 45)
            })
        case (1, 1):
            oi = ObjectItem(title: {
                Text("Transformer Overheating")
            }, subtitle: {
                Text("Three Phase Pad Mounted Transformer (533423)")
            }, footnote: {
                Text("1000 - Hamburg, MECHANIK")
            }, description: {
                Text("Customer noticed that the transformer started to over heat within 45 minutes each time he turned it on at 7:30am.  The first technician who looked at this did not have the correct additional tools to complete the job.")
            }, status: {
                Image(systemName: "exclamationmark.square.fill").foregroundColor(.preferredColor(.negativeLabel)).accessibilityLabel("Warning")
            }, substatus: {
                Text("Scheduled")
            }, detailImage: {
                Image("productThumbnail").resizable().frame(width: 45, height: 45)
            })
        case (1, 2):
            oi = ObjectItem(title: {
                Text("Transformer Overheating")
            }, subtitle: {
                Text("Three Phase Pad Mounted Transformer (533423)")
            }, footnote: {
                Text("1000 - Hamburg, MECHANIK")
            }, description: {
                Text("Customer noticed that the transformer started to over heat within 45 minutes each time he turned it on at 7:30am.  The first technician who looked at this did not have the correct additional tools to complete the job.")
            }, status: {
                Image(systemName: "exclamationmark.square.fill").foregroundColor(.preferredColor(.negativeLabel)).accessibilityLabel("Warning")
            }, substatus: {
                Text("Scheduled")
            }, detailImage: {
                Image("productThumbnail").resizable().frame(width: 45, height: 45)
            })
        case (1, 3):
            oi = ObjectItem(title: {
                Text("Transformer Overheating")
            }, subtitle: {
                Text("Three Phase Pad Mounted Transformer (533423)")
            }, footnote: {
                Text("1000 - Hamburg, MECHANIK")
            }, description: {
                Text("Customer noticed that the transformer started to over heat within 45 minutes each time he turned it on at 7:30am.  The first technician who looked at this did not have the correct additional tools to complete the job.")
            }, status: {
                Text("High")
            }, detailImage: {
                Image("productThumbnail").resizable().frame(width: 45, height: 45)
            })
            .splitPercent(nil)
        case (1, 4):
            oi = ObjectItem(title: {
                Text("Transformer Overheating")
            }, subtitle: {
                Text("Three Phase Pad Mounted Transformer (533423)")
            }, footnote: {
                Text("1000 - Hamburg, MECHANIK")
            }, description: {
                Text("Customer noticed that the transformer started to over heat within 45 minutes each time he turned it on at 7:30am.  The first technician who looked at this did not have the correct additional tools to complete the job.")
            }, status: {
                Text("High")
            }, detailImage: {
                Image("productThumbnail").resizable().frame(width: 45, height: 45)
            })
            .splitPercent(nil)
        case (1, 5):
            oi = ObjectItem(title: {
                Text("Transformer Overheating")
            }, description: {
                Text("Customer noticed that the transformer started to over heat within 45 minutes each time he turned it on at 7:30am.  The first technician who looked at this did not have the correct additional tools to complete the job.")
            }, status: {
                Image(systemName: "exclamationmark.square.fill").foregroundColor(.preferredColor(.negativeLabel)).accessibilityLabel("Warning")
            }, icons: {
                //                Image(systemName: "circle.fill").foregroundColor(.preferredColor(.tintColorDark))
                Circle().fill(Color.preferredColor(.tintColor)).frame(width: 14, height: 14)
            })
            .splitPercent(0.43)
        case (1, 6):
            oi = ObjectItem(title: {
                Text("Transformer Overheating")
            }, subtitle: {
                Text("Three Phase Pad Mounted Transformer (533423)")
            }, footnote: {
                Text("1000 - Hamburg, MECHANIK")
            }, description: {
                Text("Customer noticed that the transformer started to over heat within 45 minutes each time he turned it on at 7:30am.  The first technician who looked at this did not have the correct additional tools to complete the job.")
            }, status: {
                Text("High")
            }, detailImage: {
                Image("productThumbnail").resizable().frame(width: 45, height: 45)
            })
            .splitPercent(nil)
        case (1, 7):
            oi = ObjectItem(title: {
                Text("Transformer Overheating")
            }, subtitle: {
                Text("Three Phase Pad Mounted Transformer (533423)")
            }, footnote: {
                Text("1000 - Hamburg, MECHANIK")
            }, description: {
                Text("Customer noticed that the transformer started to over heat within 45 minutes each time he turned it on at 7:30am.  The first technician who looked at this did not have the correct additional tools to complete the job.")
            }, status: {
                Text("High")
            }, detailImage: {
                Image("productThumbnail").resizable().frame(width: 45, height: 45)
            })
            .splitPercent(nil)
        case (1, 8):
            oi = ObjectItem(title: {
                Text("Rouja Pakiman")
            }, subtitle: {
                Text("Java Developer")
            }, description: {
                Text("Rouja has worked for the company for ten years and has all of the skills that would be necessary for developing quality applications.  She is proficient in Java as well as CSS, Bootstrap, and Swift.")
            }, status: {
                Text("Available")
                //                .foregroundColor(.green)
            }, detailImage: {
                Image("person_square4").resizable().frame(width: 45, height: 45).clipShape(Circle())
            })
            .splitPercent(0.33)
        case (1, 9):
            oi = ObjectItem(title: {
                Text("Transformer Overheating")
            }, subtitle: {
                Text("Three Phase Pad Mounted Transformer (533423)")
            }, footnote: {
                Text("1000 - Hamburg, MECHANIK")
            }, description: {
                Text("Customer noticed that the transformer started to over heat within 45 minutes each time he turned it on at 7:30am.  The first technician who looked at this did not have the correct additional tools to complete the job.")
            }, status: {
                Image(systemName: "exclamationmark.square.fill").foregroundColor(.preferredColor(.negativeLabel)).accessibilityLabel("Warning")
            }, substatus: {
                Text("Scheduled")
            }, detailImage: {
                Image("productThumbnail").resizable().frame(width: 45, height: 45)
            })
        case (1, 10):
            oi = ObjectItem(title: {
                Text("Transformer Overheating").lineLimit(1)
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
                Image("productThumbnail").resizable().frame(width: 45, height: 45)
            }, icons: {
                Text("1")
                Circle().fill(Color.preferredColor(.tintColor)).frame(width: 14, height: 14)
                Image(systemName: "paperclip").font(.system(size: 14))
            })
            .splitPercent(nil)
        case (1, 11):
            oi = ObjectItem(title: {
                Text("Transformer Overheating")
            }, subtitle: {
                Text("Three Phase Pad Mounted Transformer (533423)")
            }, footnote: {
                Text("1000 - Hamburg, MECHANIK")
            }, description: {
                Text("Customer noticed that the transformer started to over heat within 45 minutes each time he turned it on at 7:30am.  The first technician who looked at this did not have the correct additional tools to complete the job.")
            }, status: {
                Image(systemName: "exclamationmark.square.fill").foregroundColor(.preferredColor(.negativeLabel)).accessibilityLabel("Warning")
            }, substatus: {
                Text("Scheduled")
            }, detailImage: {
                Image("productThumbnail").resizable().frame(width: 45, height: 45)
            })
            .splitPercent(nil)
        case (1, 12):
            oi = ObjectItem(title: {
                Text("Transformer Overheating")
            }, subtitle: {
                Text("Three Phase Pad Mounted Transformer (533423)")
            }, footnote: {
                Text("1000 - Hamburg, MECHANIK")
            }, description: {
                Text("Customer noticed that the transformer started to over heat within 45 minutes each time he turned it on at 7:30am.  The first technician who looked at this did not have the correct additional tools to complete the job.")
            }, status: {
                Image(systemName: "exclamationmark.square.fill").foregroundColor(.preferredColor(.negativeLabel)).accessibilityLabel("Warning")
            }, substatus: {
                Text("Scheduled")
            }, detailImage: {
                Image("productThumbnail").resizable().frame(width: 45, height: 45)
            })
            .splitPercent(nil)
        case (1, 13):
            oi = ObjectItem(title: {
                Text("Transformer Overheating")
            }, subtitle: {
                Text("Three Phase Pad Mounted Transformer (533423)")
            }, footnote: {
                Text("1000 - Hamburg, MECHANIK")
            }, description: {
                Text("Customer noticed that the transformer started to over heat within 45 minutes each time he turned it on at 7:30am.  The first technician who looked at this did not have the correct additional tools to complete the job.")
            }, status: {
                Image(systemName: "exclamationmark.square.fill").foregroundColor(.preferredColor(.negativeLabel)).accessibilityLabel("Warning")
            }, substatus: {
                Text("Scheduled")
            }, detailImage: {
                Image("productThumbnail").resizable().frame(width: 45, height: 45)
            })
        // section 2: "Pages 10-13: DETAIL IMAGE"
        case (2, 0):
            oi = ObjectItem(title: {
                Text("Rouja Pakiman")
            }, description: {
                Text("Rouja has worked for the company for ten years and has all of the skills that would be necessary for developing quality applications.  She is proficient in Java as well as CSS, Bootstrap, and Swift.")
            }, status: {
                Text("Available")
            }, detailImage: {
                Image("person_square4").resizable().frame(width: 45, height: 45).clipShape(Circle())
            })
            .splitPercent(0.33)
        case (2, 1):
            oi = ObjectItem(title: {
                Text("Rouja Pakiman")
            }, subtitle: {
                Text("Java Developer")
            }, description: {
                Text("Rouja has worked for the company for ten years and has all of the skills that would be necessary for developing quality applications.  She is proficient in Java as well as CSS, Bootstrap, and Swift.")
            }, status: {
                Text("Available")
            }, detailImage: {
                Image("person_square4").resizable().frame(width: 45, height: 45).clipShape(Circle())
            })
            .splitPercent(0.33)
        case (2, 2):
            oi = ObjectItem(title: {
                Text("Rouja Pakiman")
            }, subtitle: {
                Text("Java Developer")
            }, description: {
                Text("Rouja has worked for the company for ten years and has all of the skills that would be necessary for developing quality applications.  She is proficient in Java as well as CSS, Bootstrap, and Swift.")
            }, status: {
                Text("Available")
            }, detailImage: {
                Image("generic-file_28px").resizable().frame(width: 32, height: 32).clipShape(Circle())
            })
            .splitPercent(0.33)
        case (2, 3):
            oi = ObjectItem(title: {
                Text("Rouja Pakiman")
            }, subtitle: {
                Text("Java Developer")
            }, description: {
                Text("Rouja has worked for the company for ten years and has all of the skills that would be necessary for developing quality applications.  She is proficient in Java as well as CSS, Bootstrap, and Swift.")
            }, status: {
                Text("Available")
            }, detailImage: {
                Image("person_square4").resizable().frame(width: 45, height: 45).clipShape(Circle())
            })
            .splitPercent(0.33)
        case (2, 4):
            oi = ObjectItem(title: {
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
                Image("productThumbnail").resizable().frame(width: 60, height: 60)
            })
        case (2, 5):
            oi = ObjectItem(title: "Multi-image profile not implemented")
        case (2, 6):
            oi = ObjectItem(title: "Prohibition on icons is not enforced programmatically")
        case (2, 7):
            oi = ObjectItem(title: {
                Text("Transformer Overheating")
            }, subtitle: {
                Text("Three Phase Pad Mounted Transformer (533423)")
            }, footnote: {
                Text("1000 - Hamburg, MECHANIK")
            }, description: {
                Text("Customer noticed that the transformer started to over heat within 45 minutes each time he turned it on at 7:30am.  The first technician who looked at this did not have the correct additional tools to complete the job.")
            }, status: {
                Text("Hign")
            }, substatus: {
                Text("Scheduled")
            }, detailImage: {
                Image("productThumbnail").resizable().frame(width: 45, height: 45)
            }, icons: {
                Text("1")
                Circle().fill(Color.preferredColor(.tintColor)).frame(width: 14, height: 14)
                Image(systemName: "paperclip").font(.system(size: 14))
            })
        case (2, 8):
            oi = ObjectItem(title: {
                Text("Rouja Pakiman")
            }, subtitle: {
                Text("Java Developer")
            }, footnote: {
                Text("Los Angeles")
            }, description: {
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
        case (3, 0):
            oi = ObjectItem(title: {
                Text("Transformer Overheating")
            }, subtitle: {
                Text("Three Phase Pad Mounted Transformer (533423)")
            }, footnote: {
                Text("1000 - Hamburg, MECHANIK")
            }, status: {
                Text("High")
            }, detailImage: {
                Image("productThumbnail").resizable().frame(width: 45, height: 45)
            })
        case (3, 1):
            oi = ObjectItem(title: {
                Text("Transformer Overheating")
            }, subtitle: {
                Text("Three Phase Pad Mounted Transformer (533423)")
            }, footnote: {
                Text("1000 - Hamburg, MECHANIK")
            }, status: {
                Text("High")
            }, detailImage: {
                Image("productThumbnail").resizable().frame(width: 45, height: 45)
            })
        case (3, 2):
            oi = ObjectItem(title: {
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
        // section: "Pages 16-18: IMAGE/ICON STACK"
        case (4, 0):
            oi = ObjectItem(title: {
                Text("Transformer Overheating")
            }, description: {
                Text("Customer noticed that the transformer started to over heat within 45 minutes each time he turned it on at 7:30am.  The first technician who looked at this did not have the correct additional tools to complete the job.")
            }, status: {
                Image(systemName: "exclamationmark.square.fill").foregroundColor(.preferredColor(.negativeLabel)).accessibilityLabel("Warning")
            }, icons: {
                Circle().fill(Color.preferredColor(.tintColor)).frame(width: 14, height: 14)
                Text("2")
            })
        case (4, 1):
            oi = ObjectItem(title: {
                Text("Rouja Pakiman")
            }, subtitle: {
                Text("Java Developer")
            }, description: {
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
        case (4, 2):
            oi = ObjectItem(title: {
                Text("Transformer Overheating")
            }, description: {
                Text("Customer noticed that the transformer started to over heat within 45 minutes each time he turned it on at 7:30am.  The first technician who looked at this did not have the correct additional tools to complete the job.")
            }, status: {
                Image(systemName: "exclamationmark.square.fill").foregroundColor(.preferredColor(.negativeLabel)).accessibilityLabel("Warning")
            }, icons: {
                Circle().fill(Color.preferredColor(.tintColor)).frame(width: 14, height: 14)
            })
        case (4, 3):
            oi = ObjectItem(title: {
                Text("Rouja Pakiman")
            }, subtitle: {
                Text("Java Developer")
            }, description: {
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
        case (4, 4):
            oi = ObjectItem(title: {
                Text("Rouja Pakiman")
            }, subtitle: {
                Text("Java Developer")
            }, footnote: {
                Text("Los Angeles")
            }, description: {
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
        case (5, 0):
            oi = ObjectItem(title: {
                Text("Rouja Pakiman")
            }, description: {
                Text("Rouja has worked for the company for ten years and has all of the skills that would be necessary for developing quality applications.  She is proficient in Java as well as CSS, Bootstrap, and Swift.")
            }, status: {
                Text("Available")
            }, detailImage: {
                Image("person_square4").resizable().frame(width: 45, height: 45).clipShape(Circle())
            })
            .splitPercent(0.33)
        case (5, 1):
            oi = ObjectItem(title: {
                Text("Rouja Pakiman")
            }, subtitle: {
                Text("Java Developer")
            }, description: {
                Text("Rouja has worked for the company for ten years and has all of the skills that would be necessary for developing quality applications.  She is proficient in Java as well as CSS, Bootstrap, and Swift.")
            }, status: {
                Text("Available")
            }, detailImage: {
                Image("person_square4").resizable().frame(width: 45, height: 45).clipShape(Circle())
            })
            .splitPercent(0.33)
        case (5, 2):
            oi = ObjectItem(title: {
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
                Image("productThumbnail").resizable().frame(width: 45, height: 45)
            })
        case (5, 3):
            oi = ObjectItem(title: {
                Text("Transformer Overheating When After Being on for 1 Hour or Longer Duration.").lineLimit(2)
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
                Image("productThumbnail").resizable().frame(width: 60, height: 60)
            })
        default:
            oi = ObjectItem(title: "Lorem ipseum dolor")
        }
        
        return oi.typeErased
    }
}
