import FioriSwiftUICore
import SwiftUI

struct ObjectItemInitExamples: ObjectItemListDataProtocol {
    var isNewObjectItem: Bool = false
    
    init(cellTapped: Binding<Bool>) {}
    init() {}
    
    func numberOfSections() -> Int {
        4
    }
    
    func numberOfRowsInSection(_ section: Int) -> Int {
        switch section {
        case 0:
            return 10
        case 1:
            return 10
        case 2:
            return 3
        case 3:
            return 6
        default:
            return 1
        }
    }
    
    func titleForHeaderInSection(_ section: Int) -> String {
        switch section {
        case 0:
            return "First is a text, init with ViewBuilder"
        case 1:
            return "First is an icon, init with ViewBuilder"
        case 2:
            return "Inited with Model"
        case 3:
            return "Other examples"
        default:
            return ""
        }
    }
    
    func containAccessoryView(_ indexPath: IndexPath) -> Bool {
        false
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
            // Regular, 1st is text, init with ViewBuilder
            let oi = ObjectItem(title: {
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
            }, showsDescriptionInCompact: true)
            return AnyView(oi)
            
        case (0, 1):
            // Regular, 1st is text, init with ViewBuilder
            let oi = ObjectItem(title: {
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
            }, icons: {
                Text("1").font(.system(size: 32, weight: .regular, design: .serif))
                Image(systemName: "circle.fill").foregroundColor(.blue)
                Image(systemName: "paperclip").frame(width: 16, height: 16)
            })
            // .splitPercent(0.3)
            return AnyView(oi)
            
        case (0, 2):
            // Regular, 1st is text, init with ViewBuilder
            let oi = ObjectItem(title: {
                Text("Transformer Overheating").font(.system(size: 32, weight: .regular, design: .serif))
            }, subtitle: {
                Text("Three Phase Pad Mounted Transformer (533423)")
            }, footnote: {
                Text("1000 - Hamburg, MECHANIK")
            }, description: {
                Text("Customer noticed that the transformer started to over heat within 45 minutes each time he turned it on at 7:30am.  The first technician who looked at this did not have the correct additional tools to complete the job.")
            }, status: {
                Text("High")
            }, detailImage: {
                Image(systemName: "person")
                    .font(.system(size: 45, weight: .regular, design: .serif))
                    .border(Color.black, width: 1)
            }, icons: {
                Text("1")
                Image(systemName: "circle.fill").foregroundColor(.blue)
                Image(systemName: "paperclip").frame(width: 16, height: 16)
            })
            // .splitPercent(0.3)
            return AnyView(oi)
            
        case (0, 3):
            // Regular, 1st is text, init with ViewBuilder
            let oi = ObjectItem(title: {
                Text("Transformer Overheating")
            }, subtitle: {
                Text("Three Phase Pad Mounted Transformer (533423)")
            }, footnote: {
                Text("1000 - Hamburg, MECHANIK")
            }, description: {
                Text("Customer noticed that the transformer started to over heat within 45 minutes each time he turned it on at 7:30am.  The first technician who looked at this did not have the correct additional tools to complete the job.").font(.system(size: 32, weight: .regular, design: .serif))
            }, status: {
                Image(systemName: "exclamationmark.triangle").foregroundColor(.red)
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
            })
            // .splitPercent(0.3)
            return AnyView(oi)
            
        case (0, 4):
            // Regular, 1st is text, init with ViewBuilder
            let oi = ObjectItem(title: {
                Text("Transformer Overheating")
            }, subtitle: {
                Text("Three Phase Pad Mounted Transformer (533423)")
            }, footnote: {
                Text("1000 - Hamburg, MECHANIK")
            }, description: {
                Text("Customer noticed that the transformer started to over heat within 45 minutes each time he turned it on at 7:30am.  The first technician who looked at this did not have the correct additional tools to complete the job.")
            }, status: {
                Text("High")
                    .font(.system(size: 32, weight: .regular, design: .serif))
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
            })
            // .splitPercent(0.3)
            return AnyView(oi)
            
        case (0, 5):
            // Regular, 1st is text, init with ViewBuilder
            let oi = ObjectItem(title: {
                Text("Transformer Overheating")
                    .font(.system(size: 32, weight: .regular, design: .serif))
            }, subtitle: {
                Text("Three Phase Pad Mounted Transformer (533423)")
            }, footnote: {
                Text("1000 - Hamburg, MECHANIK")
            }, description: {
                Text("Customer noticed that the transformer started to over heat within 45 minutes each time he turned it on at 7:30am.  The first technician who looked at this did not have the correct additional tools to complete the job.")
                    .font(.system(size: 48, weight: .regular, design: .serif))
            }, status: {
                Text("High")
                    .font(.system(size: 24, weight: .regular, design: .serif))
            }, substatus: {
                Text("Scheduled")
            }, detailImage: {
                Image(systemName: "person")
                    .font(.system(size: 45, weight: .regular, design: .serif))
                    .border(Color.black, width: 1)
            }, icons: {
                Text("1")
                    .font(.system(size: 12, weight: .regular, design: .serif))
                Image(systemName: "circle.fill").foregroundColor(.blue)
                Image(systemName: "paperclip").frame(width: 16, height: 16)
            })
            // .splitPercent(0.3)
            return AnyView(oi)
            
        case (0, 6):
            // Regular, 1st is text, font size is 32, init with ViewBuilder
            let oi = ObjectItem(title: {
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
            }, detailImage: {
                Image(systemName: "person")
                    .font(.system(size: 45, weight: .regular, design: .serif))
                    .border(Color.black, width: 1)
            }, icons: {
                Text("1")
                    .font(.system(size: 32, weight: .regular, design: .serif))
                Image(systemName: "circle.fill").foregroundColor(.blue)
                Image(systemName: "paperclip").frame(width: 16, height: 16)
            })
            .splitPercent(0.3)
            return AnyView(oi)
            
        case (0, 7):
            ///////////////////////////////////////////////////////////////
            // Regular, 1st is text, init with ViewBuilder
            let oi = ObjectItem(title: {
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
            }, icons: {
                Text("1")
                Image(systemName: "circle.fill").foregroundColor(.blue)
                Image(systemName: "paperclip").frame(width: 16, height: 16)
            })
            .splitPercent(0.5)
            return AnyView(oi)
            
        case (0, 8):
            // Regular, 1st is text, init with ViewBuilder
            let oi = ObjectItem(title: {
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
            })
            .splitPercent(0.6)
            return AnyView(oi)
            
        case (0, 9):
            // Regular, 1st is text, font size is 32, init with ViewBuilder
            let oi = ObjectItem(title: {
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
            })
            .splitPercent(0.7)
            return AnyView(oi)
            
        case (1, 0):
            // Regular, 1st is text, init with ViewBuilder
            let oi = ObjectItem(title: {
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
                Image(systemName: "circle.fill").foregroundColor(.blue)
                Text("1")
                Image(systemName: "paperclip").frame(width: 16, height: 16)
            })
            // .splitPercent(0.3)
            return AnyView(oi)
            
        case (1, 1):
            // Regular, 1st is text, init with ViewBuilder
            let oi = ObjectItem(title: {
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
            }, icons: {
                Image(systemName: "circle.fill")
                    .font(.system(size: 32, weight: .regular, design: .serif))
                    .foregroundColor(.blue)
                Text("1")
                Image(systemName: "paperclip").frame(width: 16, height: 16)
            })
            // .splitPercent(0.3)
            return AnyView(oi)
            
        case (1, 2):
            // Regular, 1st is text, init with ViewBuilder
            let oi = ObjectItem(title: {
                Text("Transformer Overheating").font(.system(size: 32, weight: .regular, design: .serif))
            }, subtitle: {
                Text("Three Phase Pad Mounted Transformer (533423)")
            }, footnote: {
                Text("1000 - Hamburg, MECHANIK")
            }, description: {
                Text("Customer noticed that the transformer started to over heat within 45 minutes each time he turned it on at 7:30am.  The first technician who looked at this did not have the correct additional tools to complete the job.")
            }, status: {
                Text("High")
            }, detailImage: {
                Image(systemName: "person")
                    .font(.system(size: 45, weight: .regular, design: .serif))
                    .border(Color.black, width: 1)
            }, icons: {
                Image(systemName: "circle.fill").foregroundColor(.blue)
                Text("1")
                Image(systemName: "paperclip").frame(width: 16, height: 16)
            })
            // .splitPercent(0.3)
            return AnyView(oi)
            
        case (1, 3):
            // Regular, 1st is text, init with ViewBuilder
            let oi = ObjectItem(title: {
                Text("Transformer Overheating")
            }, subtitle: {
                Text("Three Phase Pad Mounted Transformer (533423)")
            }, footnote: {
                Text("1000 - Hamburg, MECHANIK")
            }, description: {
                Text("Customer noticed that the transformer started to over heat within 45 minutes each time he turned it on at 7:30am.  The first technician who looked at this did not have the correct additional tools to complete the job.").font(.system(size: 32, weight: .regular, design: .serif))
            }, status: {
                Image(systemName: "exclamationmark.triangle").foregroundColor(.red)
            }, substatus: {
                Text("Scheduled")
            }, detailImage: {
                Image(systemName: "person")
                    .font(.system(size: 45, weight: .regular, design: .serif))
                    .border(Color.black, width: 1)
            }, icons: {
                Image(systemName: "circle.fill").foregroundColor(.blue)
                Text("1")
                Image(systemName: "paperclip").frame(width: 16, height: 16)
            })
            .splitPercent(0.3)
            
            return AnyView(oi)
            
        case (1, 4):
            // Regular, 1st is text, init with ViewBuilder
            let oi = ObjectItem(title: {
                Text("Transformer Overheating")
            }, subtitle: {
                Text("Three Phase Pad Mounted Transformer (533423)")
            }, footnote: {
                Text("1000 - Hamburg, MECHANIK")
            }, description: {
                Text("Customer noticed that the transformer started to over heat within 45 minutes each time he turned it on at 7:30am.  The first technician who looked at this did not have the correct additional tools to complete the job.")
            }, status: {
                Text("High")
                    .font(.system(size: 32, weight: .regular, design: .serif))
            }, substatus: {
                Text("Scheduled")
            }, detailImage: {
                Image(systemName: "person")
                    .font(.system(size: 45, weight: .regular, design: .serif))
                    .border(Color.black, width: 1)
            }, icons: {
                Image(systemName: "circle.fill").foregroundColor(.blue)
                Text("1")
                Image(systemName: "paperclip").frame(width: 16, height: 16)
            })
            .splitPercent(0.3)
            
            return AnyView(oi)
            
        case (1, 5):
            // Regular, 1st is text, init with ViewBuilder
            let oi = ObjectItem(title: {
                Text("Transformer Overheating")
                    .font(.system(size: 32, weight: .regular, design: .serif))
            }, subtitle: {
                Text("Three Phase Pad Mounted Transformer (533423)")
            }, footnote: {
                Text("1000 - Hamburg, MECHANIK")
            }, description: {
                Text("Customer noticed that the transformer started to over heat within 45 minutes each time he turned it on at 7:30am.  The first technician who looked at this did not have the correct additional tools to complete the job.")
                    .font(.system(size: 48, weight: .regular, design: .serif))
            }, status: {
                Text("High")
                    .font(.system(size: 24, weight: .regular, design: .serif))
            }, substatus: {
                Text("Scheduled")
            }, detailImage: {
                Image(systemName: "person")
                    .font(.system(size: 45, weight: .regular, design: .serif))
                    .border(Color.black, width: 1)
            }, icons: {
                Image(systemName: "circle.fill")
                    .font(.system(size: 12, weight: .regular, design: .serif))
                    .foregroundColor(.blue)
                Text("1")
                Image(systemName: "paperclip").frame(width: 16, height: 16)
            })
            .splitPercent(0.3)
            return AnyView(oi)
            
        case (1, 6):
            // Regular, 1st is text, font size is 32, init with ViewBuilder
            let oi = ObjectItem(title: {
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
            }, substatus: {
                Text("Scheduled")
            }, detailImage: {
                Image(systemName: "person")
                    .font(.system(size: 45, weight: .regular, design: .serif))
                    .border(Color.black, width: 1)
            }, icons: {
                Image(systemName: "circle.fill")
                    .font(.system(size: 32, weight: .regular, design: .serif))
                    .foregroundColor(.blue)
                Text("1")
                Image(systemName: "paperclip").frame(width: 16, height: 16)
            })
            .splitPercent(0.3)
            return AnyView(oi)
            
        case (1, 7):
            ///////////////////////////////////////////////////////////////
            // Regular, 1st is text, init with ViewBuilder
            let oi = ObjectItem(title: {
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
            }, icons: {
                Image(systemName: "circle.fill").foregroundColor(.blue)
                Text("1")
            })
            .splitPercent(0.5)
            return AnyView(oi)
            
        case (1, 8):
            // Regular, 1st is text, init with ViewBuilder
            let oi = ObjectItem(title: {
                Text("Transformer Overheating")
            }, subtitle: {
                Text("Three Phase Pad Mounted Transformer (533423)")
            }, footnote: {
                Text("1000 - Hamburg, MECHANIK")
            }, description: {
                Text("Customer noticed that the transformer started to over heat within 45 minutes each time he turned it on at 7:30am.  The first technician who looked at this did not have the correct additional tools to complete the job.")
            }, status: {
                Image(systemName: "exclamationmark.triangle").foregroundColor(.red)
            }, detailImage: {
                Image(systemName: "person")
                    .font(.system(size: 45, weight: .regular, design: .serif))
                    .border(Color.black, width: 1)
            })
            .splitPercent(0.6)
            return AnyView(oi)
            
        case (1, 9):
            // Regular, 1st is text, font size is 32, init with ViewBuilder
            let oi = ObjectItem(title: {
                Text("Transformer Overheating When After Being on for 1 Hour or Longer")
                    .font(.system(size: 28, weight: .regular, design: .serif))
            }, subtitle: {
                Text("Three Phase Pad Mounted Transformer (533423)")
            }, footnote: {
                Text("1000 - Hamburg, MECHANIK")
            }, description: {
                Text("Customer noticed that the transformer started to over heat within 45 minutes each time he turned it on at 7:30am.  The first technician who looked at this did not have the correct additional tools to complete the job.")
                    .font(.system(size: 24, weight: .regular, design: .serif))
            }, icons: {
                Image(systemName: "circle.fill")
                    .font(.system(size: 32, weight: .regular, design: .serif))
                    .foregroundColor(.blue)
                Text("1")
                Image(systemName: "paperclip").frame(width: 16, height: 16)
            })
            .splitPercent(0.7)
            return AnyView(oi)
            
        case (2, 0):
            let oi = ObjectItem(title: "Transformer Overheating When After Being on for 1 Hour or Longer",
                                subtitle: "Three Phase Pad Mounted Transformer (533423)", footnote: "1000 - Hamburg, MECHANIK",
                                description: "Customer noticed that the transformer started to over heat within 45 minutes each time he turned it on at 7:30am.  The first technician who looked at this did not have the correct additional tools to complete the job.",
                                status: TextOrIcon.text("High"),
                                detailImage: Image(systemName: "person"),
                                icons: [TextOrIcon.text("1"),
                                        TextOrIcon.icon(Image(systemName: "circle.fill")),
                                        TextOrIcon.icon(Image(systemName: "mail"))])
                .subtitleModifier {
                    $0.lineLimit(2)
                }
                .descriptionTextModifier {
                    $0.font(.system(size: 32, weight: .regular, design: .serif))
                }
            return AnyView(oi)
            
        case (2, 1):
            let oi = ObjectItem(title: "Transformer Overheating",
                                subtitle: "Three Phase Pad Mounted Transformer (533423)", footnote: "1000 - Hamburg, MECHANIK",
                                description: "Customer noticed that the transformer started to over heat within 45 minutes each time he turned it on at 7:30am.  The first technician who looked at this did not have the correct additional tools to complete the job.",
                                status: TextOrIcon.text("Scheduled"),
                                substatus: TextOrIcon.icon(Image(systemName: "mail")),
                                detailImage: Image(systemName: "person"),
                                icons: [TextOrIcon.icon(Image(systemName: "circle.fill")),
                                        TextOrIcon.text("1"),
                                        TextOrIcon.icon(Image(systemName: "paperclip"))])
            return AnyView(oi)
            
        case (2, 2):
            let oi = ObjectItem(title: "Transformer Overheating",
                                subtitle: "Three Phase Pad Mounted Transformer (533423)", footnote: "1000 - Hamburg, MECHANIK",
                                description: "Customer noticed that the transformer started to over heat within 45 minutes each time he turned it on at 7:30am.  The first technician who looked at this did not have the correct additional tools to complete the job.",
                                status: TextOrIcon.text("High"),
                                detailImage: Image(systemName: "person"),
                                icons: [TextOrIcon.icon(Image(systemName: "circle.fill")),
                                        TextOrIcon.text("1"),
                                        TextOrIcon.icon(Image(systemName: "paperclip"))])
                .titleModifier {
                    $0.font(.system(size: 32, weight: .regular, design: .serif))
                }
                .subtitleModifier {
                    $0.lineLimit(2)
                }
                .descriptionTextModifier {
                    $0.font(.system(size: 24, weight: .regular, design: .serif))
                }
            return AnyView(oi)
            
        case (3, 0):
            // Everything is center aligned. Preserve Icon Stack Spacing.
            let oi = ObjectItem(title: {
                Text("Transformer Overheating")
            }, status: {
                Image(systemName: "exclamationmark.triangle").foregroundColor(.red)
            })
            return AnyView(oi)
            
        case (3, 1):
            // When only the headline label is used, everything in the cell is center aligned. Only 1 status can be used.
            let oi = ObjectItem(title: {
                Text("Transformer Overheating")
            }, status: {
                Text("High")
            }, detailImage: {
                Image(systemName: "person")
                    .font(.system(size: 32, weight: .bold, design: .serif))
                    .border(Color.black, width: 1)
            })
            return AnyView(oi)
            
        case (3, 2):
            // If only 1 status is being used, the body and subhead labels in the main content area should extend to the full width of the cell below the status.
            let oi = ObjectItem(title: {
                Text("Transformer Overheating")
            }, subtitle: {
                Text("Three Phase Pad Mounted Transformer (533423)")
            }, footnote: {
                Text("1000 - Hamburg, MECHANIK")
            }, status: {
                Text("High")
            }, detailImage: {
                Image(systemName: "person")
                    .font(.system(size: 32, weight: .bold, design: .serif))
                    .border(Color.black, width: 1)
            }, icons: {
                Text("12345")
                    .font(.system(size: 6))
                Circle().fill(Color.blue).frame(width: 12, height: 12)
                Image(systemName: "paperclip").frame(width: 16, height: 16)
            })
            return AnyView(oi)
            
        case (3, 3):
            let oi = ObjectItem(title: {
                Text("Transformer Overheating")
            }, subtitle: {
                Text("Three Phase Pad Mounted Transformer (533423)")
                    .font(.headline)
                    .foregroundColor(.green)
                    .lineLimit(2)
            }, footnote: {
                Text("1000 - Hamburg, MECHANIK")
            }, status: {
                Text("High")
            }, substatus: {
                Text("ScheduledScheduledScheduledScheduledScheduled")
            }, detailImage: {
                Image(systemName: "person")
                    .font(.system(size: 32, weight: .bold, design: .serif))
                    .border(Color.black, width: 1)
            }, icons: {
                Text("1")
                Circle().fill(Color.blue).frame(width: 12, height: 12)
                Image(systemName: "paperclip").frame(width: 16, height: 16)
            })
            return AnyView(oi)
            
        case (3, 4):
            let oi = ObjectItem(title: "Transformer Overheating",
                                status: TextOrIcon.text("High"),
                                detailImage: Image(systemName: "person"),
                                icons: [TextOrIcon.icon(Image(systemName: "circle.fill")),
                                        TextOrIcon.text("1"),
                                        TextOrIcon.icon(Image(systemName: "paperclip"))])
            
            return AnyView(oi)
            
        case (3, 5):
            let oi = ObjectItem(title: "Transformer Overheating",
                                subtitle: "Three Phase Pad Mounted Transformer (533423)", footnote: "1000 - Hamburg, MECHANIK",
                                description: "Customer noticed that the transformer started to over heat within 45 minutes each time he turned it on at 7:30am.  The first technician who looked at this did not have the correct additional tools to complete the job.",
                                status: TextOrIcon.text("High"),
                                detailImage: Image(systemName: "person"))
            return AnyView(oi)
            
        default:
            return AnyView(ObjectItem(title: "Lorem ipseum dolor"))
        }
    }
    
    func getObjectItem(for indexPath: IndexPath) -> some View {
        switch (indexPath.section, indexPath.row) {
        case (0, 0):
            // Regular, 1st is text, init with ViewBuilder
            let oi = _ObjectItem(title: {
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
                Image(systemName: "person")
                    .font(.system(size: 45, weight: .regular, design: .serif))
                    .border(Color.black, width: 1)
            }, icons: {
                Text("1")
                Image(systemName: "circle.fill").foregroundColor(.blue)
                Image(systemName: "paperclip").frame(width: 16, height: 16)
            })
            return AnyView(oi)
            
        case (0, 1):
            // Regular, 1st is text, init with ViewBuilder
            let oi = _ObjectItem(title: {
                Text("Transformer Overheating")
            }, subtitle: {
                Text("Three Phase Pad Mounted Transformer (533423)")
            }, footnote: {
                Text("1000 - Hamburg, MECHANIK")
            }, descriptionText: {
                Text("Customer noticed that the transformer started to over heat within 45 minutes each time he turned it on at 7:30am.  The first technician who looked at this did not have the correct additional tools to complete the job.")
            }, status: {
                Image(systemName: "exclamationmark.triangle").foregroundColor(.red)
            }, substatus: {
                Text("Scheduled")
            }, detailImage: {
                Image(systemName: "person")
                    .font(.system(size: 45, weight: .regular, design: .serif))
                    .border(Color.black, width: 1)
            }, icons: {
                Text("1").font(.system(size: 32, weight: .regular, design: .serif))
                Image(systemName: "circle.fill").foregroundColor(.blue)
                Image(systemName: "paperclip").frame(width: 16, height: 16)
            })
            // .splitPercent(0.3)
            return AnyView(oi)
            
        case (0, 2):
            // Regular, 1st is text, init with ViewBuilder
            let oi = _ObjectItem(title: {
                Text("Transformer Overheating").font(.system(size: 32, weight: .regular, design: .serif))
            }, subtitle: {
                Text("Three Phase Pad Mounted Transformer (533423)")
            }, footnote: {
                Text("1000 - Hamburg, MECHANIK")
            }, descriptionText: {
                Text("Customer noticed that the transformer started to over heat within 45 minutes each time he turned it on at 7:30am.  The first technician who looked at this did not have the correct additional tools to complete the job.")
            }, status: {
                Text("High")
            }, detailImage: {
                Image(systemName: "person")
                    .font(.system(size: 45, weight: .regular, design: .serif))
                    .border(Color.black, width: 1)
            }, icons: {
                Text("1")
                Image(systemName: "circle.fill").foregroundColor(.blue)
                Image(systemName: "paperclip").frame(width: 16, height: 16)
            })
            // .splitPercent(0.3)
            return AnyView(oi)
            
        case (0, 3):
            // Regular, 1st is text, init with ViewBuilder
            let oi = _ObjectItem(title: {
                Text("Transformer Overheating")
            }, subtitle: {
                Text("Three Phase Pad Mounted Transformer (533423)")
            }, footnote: {
                Text("1000 - Hamburg, MECHANIK")
            }, descriptionText: {
                Text("Customer noticed that the transformer started to over heat within 45 minutes each time he turned it on at 7:30am.  The first technician who looked at this did not have the correct additional tools to complete the job.").font(.system(size: 32, weight: .regular, design: .serif))
            }, status: {
                Image(systemName: "exclamationmark.triangle").foregroundColor(.red)
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
            })
            // .splitPercent(0.3)
            return AnyView(oi)
            
        case (0, 4):
            // Regular, 1st is text, init with ViewBuilder
            let oi = _ObjectItem(title: {
                Text("Transformer Overheating")
            }, subtitle: {
                Text("Three Phase Pad Mounted Transformer (533423)")
            }, footnote: {
                Text("1000 - Hamburg, MECHANIK")
            }, descriptionText: {
                Text("Customer noticed that the transformer started to over heat within 45 minutes each time he turned it on at 7:30am.  The first technician who looked at this did not have the correct additional tools to complete the job.")
            }, status: {
                Text("High")
                    .font(.system(size: 32, weight: .regular, design: .serif))
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
            })
            // .splitPercent(0.3)
            return AnyView(oi)
            
        case (0, 5):
            // Regular, 1st is text, init with ViewBuilder
            let oi = _ObjectItem(title: {
                Text("Transformer Overheating")
                    .font(.system(size: 32, weight: .regular, design: .serif))
            }, subtitle: {
                Text("Three Phase Pad Mounted Transformer (533423)")
            }, footnote: {
                Text("1000 - Hamburg, MECHANIK")
            }, descriptionText: {
                Text("Customer noticed that the transformer started to over heat within 45 minutes each time he turned it on at 7:30am.  The first technician who looked at this did not have the correct additional tools to complete the job.")
                    .font(.system(size: 48, weight: .regular, design: .serif))
            }, status: {
                Text("High")
                    .font(.system(size: 24, weight: .regular, design: .serif))
            }, substatus: {
                Text("Scheduled")
            }, detailImage: {
                Image(systemName: "person")
                    .font(.system(size: 45, weight: .regular, design: .serif))
                    .border(Color.black, width: 1)
            }, icons: {
                Text("1")
                    .font(.system(size: 12, weight: .regular, design: .serif))
                Image(systemName: "circle.fill").foregroundColor(.blue)
                Image(systemName: "paperclip").frame(width: 16, height: 16)
            })
            // .splitPercent(0.3)
            return AnyView(oi)
            
        case (0, 6):
            // Regular, 1st is text, font size is 32, init with ViewBuilder
            let oi = _ObjectItem(title: {
                Text("Transformer Overheating When After Being on for 1 Hour or Longer")
                    .font(.system(size: 28, weight: .regular, design: .serif))
            }, subtitle: {
                Text("Three Phase Pad Mounted Transformer (533423)")
            }, footnote: {
                Text("1000 - Hamburg, MECHANIK")
            }, descriptionText: {
                Text("Customer noticed that the transformer started to over heat within 45 minutes each time he turned it on at 7:30am.  The first technician who looked at this did not have the correct additional tools to complete the job.")
                    .font(.system(size: 24, weight: .regular, design: .serif))
            }, status: {
                Image(systemName: "exclamationmark.triangle")
                    .font(.system(size: 30, weight: .regular, design: .serif))
                    .foregroundColor(.red)
            }, detailImage: {
                Image(systemName: "person")
                    .font(.system(size: 45, weight: .regular, design: .serif))
                    .border(Color.black, width: 1)
            }, icons: {
                Text("1")
                    .font(.system(size: 32, weight: .regular, design: .serif))
                Image(systemName: "circle.fill").foregroundColor(.blue)
                Image(systemName: "paperclip").frame(width: 16, height: 16)
            })
            .splitPercent(0.3)
            return AnyView(oi)
            
        case (0, 7):
            ///////////////////////////////////////////////////////////////
            // Regular, 1st is text, init with ViewBuilder
            let oi = _ObjectItem(title: {
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
            }, icons: {
                Text("1")
                Image(systemName: "circle.fill").foregroundColor(.blue)
                Image(systemName: "paperclip").frame(width: 16, height: 16)
            })
            .splitPercent(0.5)
            return AnyView(oi)
            
        case (0, 8):
            // Regular, 1st is text, init with ViewBuilder
            let oi = _ObjectItem(title: {
                Text("Transformer Overheating")
            }, subtitle: {
                Text("Three Phase Pad Mounted Transformer (533423)")
            }, footnote: {
                Text("1000 - Hamburg, MECHANIK")
            }, descriptionText: {
                Text("Customer noticed that the transformer started to over heat within 45 minutes each time he turned it on at 7:30am.  The first technician who looked at this did not have the correct additional tools to complete the job.")
            }, status: {
                Image(systemName: "exclamationmark.triangle").foregroundColor(.red)
            }, substatus: {
                Text("Scheduled")
            }, detailImage: {
                Image(systemName: "person")
                    .font(.system(size: 45, weight: .regular, design: .serif))
                    .border(Color.black, width: 1)
            })
            .splitPercent(0.6)
            return AnyView(oi)
            
        case (0, 9):
            // Regular, 1st is text, font size is 32, init with ViewBuilder
            let oi = _ObjectItem(title: {
                Text("Transformer Overheating When After Being on for 1 Hour or Longer")
                    .font(.system(size: 28, weight: .regular, design: .serif))
            }, subtitle: {
                Text("Three Phase Pad Mounted Transformer (533423)")
            }, footnote: {
                Text("1000 - Hamburg, MECHANIK")
            }, descriptionText: {
                Text("Customer noticed that the transformer started to over heat within 45 minutes each time he turned it on at 7:30am.  The first technician who looked at this did not have the correct additional tools to complete the job.")
                    .font(.system(size: 24, weight: .regular, design: .serif))
            }, status: {
                Image(systemName: "exclamationmark.triangle")
                    .font(.system(size: 30, weight: .regular, design: .serif))
                    .foregroundColor(.red)
            })
            .splitPercent(0.7)
            return AnyView(oi)
            
        case (1, 0):
            // Regular, 1st is text, init with ViewBuilder
            let oi = _ObjectItem(title: {
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
                Image(systemName: "person")
                    .font(.system(size: 45, weight: .regular, design: .serif))
                    .border(Color.black, width: 1)
            }, icons: {
                Image(systemName: "circle.fill").foregroundColor(.blue)
                Text("1")
                Image(systemName: "paperclip").frame(width: 16, height: 16)
            })
            // .splitPercent(0.3)
            return AnyView(oi)
            
        case (1, 1):
            // Regular, 1st is text, init with ViewBuilder
            let oi = _ObjectItem(title: {
                Text("Transformer Overheating")
            }, subtitle: {
                Text("Three Phase Pad Mounted Transformer (533423)")
            }, footnote: {
                Text("1000 - Hamburg, MECHANIK")
            }, descriptionText: {
                Text("Customer noticed that the transformer started to over heat within 45 minutes each time he turned it on at 7:30am.  The first technician who looked at this did not have the correct additional tools to complete the job.")
            }, status: {
                Image(systemName: "exclamationmark.triangle").foregroundColor(.red)
            }, substatus: {
                Text("Scheduled")
            }, detailImage: {
                Image(systemName: "person")
                    .font(.system(size: 45, weight: .regular, design: .serif))
                    .border(Color.black, width: 1)
            }, icons: {
                Image(systemName: "circle.fill")
                    .font(.system(size: 32, weight: .regular, design: .serif))
                    .foregroundColor(.blue)
                Text("1")
                Image(systemName: "paperclip").frame(width: 16, height: 16)
            })
            // .splitPercent(0.3)
            return AnyView(oi)
            
        case (1, 2):
            // Regular, 1st is text, init with ViewBuilder
            let oi = _ObjectItem(title: {
                Text("Transformer Overheating").font(.system(size: 32, weight: .regular, design: .serif))
            }, subtitle: {
                Text("Three Phase Pad Mounted Transformer (533423)")
            }, footnote: {
                Text("1000 - Hamburg, MECHANIK")
            }, descriptionText: {
                Text("Customer noticed that the transformer started to over heat within 45 minutes each time he turned it on at 7:30am.  The first technician who looked at this did not have the correct additional tools to complete the job.")
            }, status: {
                Text("High")
            }, detailImage: {
                Image(systemName: "person")
                    .font(.system(size: 45, weight: .regular, design: .serif))
                    .border(Color.black, width: 1)
            }, icons: {
                Image(systemName: "circle.fill").foregroundColor(.blue)
                Text("1")
                Image(systemName: "paperclip").frame(width: 16, height: 16)
            })
            // .splitPercent(0.3)
            return AnyView(oi)
            
        case (1, 3):
            // Regular, 1st is text, init with ViewBuilder
            let oi = _ObjectItem(title: {
                Text("Transformer Overheating")
            }, subtitle: {
                Text("Three Phase Pad Mounted Transformer (533423)")
            }, footnote: {
                Text("1000 - Hamburg, MECHANIK")
            }, descriptionText: {
                Text("Customer noticed that the transformer started to over heat within 45 minutes each time he turned it on at 7:30am.  The first technician who looked at this did not have the correct additional tools to complete the job.").font(.system(size: 32, weight: .regular, design: .serif))
            }, status: {
                Image(systemName: "exclamationmark.triangle").foregroundColor(.red)
            }, substatus: {
                Text("Scheduled")
            }, detailImage: {
                Image(systemName: "person")
                    .font(.system(size: 45, weight: .regular, design: .serif))
                    .border(Color.black, width: 1)
            }, icons: {
                Image(systemName: "circle.fill").foregroundColor(.blue)
                Text("1")
                Image(systemName: "paperclip").frame(width: 16, height: 16)
            })
            .splitPercent(0.3)
            
            return AnyView(oi)
            
        case (1, 4):
            // Regular, 1st is text, init with ViewBuilder
            let oi = _ObjectItem(title: {
                Text("Transformer Overheating")
            }, subtitle: {
                Text("Three Phase Pad Mounted Transformer (533423)")
            }, footnote: {
                Text("1000 - Hamburg, MECHANIK")
            }, descriptionText: {
                Text("Customer noticed that the transformer started to over heat within 45 minutes each time he turned it on at 7:30am.  The first technician who looked at this did not have the correct additional tools to complete the job.")
            }, status: {
                Text("High")
                    .font(.system(size: 32, weight: .regular, design: .serif))
            }, substatus: {
                Text("Scheduled")
            }, detailImage: {
                Image(systemName: "person")
                    .font(.system(size: 45, weight: .regular, design: .serif))
                    .border(Color.black, width: 1)
            }, icons: {
                Image(systemName: "circle.fill").foregroundColor(.blue)
                Text("1")
                Image(systemName: "paperclip").frame(width: 16, height: 16)
            })
            .splitPercent(0.3)
            
            return AnyView(oi)
            
        case (1, 5):
            // Regular, 1st is text, init with ViewBuilder
            let oi = _ObjectItem(title: {
                Text("Transformer Overheating")
                    .font(.system(size: 32, weight: .regular, design: .serif))
            }, subtitle: {
                Text("Three Phase Pad Mounted Transformer (533423)")
            }, footnote: {
                Text("1000 - Hamburg, MECHANIK")
            }, descriptionText: {
                Text("Customer noticed that the transformer started to over heat within 45 minutes each time he turned it on at 7:30am.  The first technician who looked at this did not have the correct additional tools to complete the job.")
                    .font(.system(size: 48, weight: .regular, design: .serif))
            }, status: {
                Text("High")
                    .font(.system(size: 24, weight: .regular, design: .serif))
            }, substatus: {
                Text("Scheduled")
            }, detailImage: {
                Image(systemName: "person")
                    .font(.system(size: 45, weight: .regular, design: .serif))
                    .border(Color.black, width: 1)
            }, icons: {
                Image(systemName: "circle.fill")
                    .font(.system(size: 12, weight: .regular, design: .serif))
                    .foregroundColor(.blue)
                Text("1")
                Image(systemName: "paperclip").frame(width: 16, height: 16)
            })
            .splitPercent(0.3)
            return AnyView(oi)
            
        case (1, 6):
            // Regular, 1st is text, font size is 32, init with ViewBuilder
            let oi = _ObjectItem(title: {
                Text("Transformer Overheating When After Being on for 1 Hour or Longer")
                    .font(.system(size: 28, weight: .regular, design: .serif))
            }, subtitle: {
                Text("Three Phase Pad Mounted Transformer (533423)")
            }, footnote: {
                Text("1000 - Hamburg, MECHANIK")
            }, descriptionText: {
                Text("Customer noticed that the transformer started to over heat within 45 minutes each time he turned it on at 7:30am.  The first technician who looked at this did not have the correct additional tools to complete the job.")
                    .font(.system(size: 24, weight: .regular, design: .serif))
            }, status: {
                Image(systemName: "exclamationmark.triangle")
                    .font(.system(size: 30, weight: .regular, design: .serif))
                    .foregroundColor(.red)
            }, substatus: {
                Text("Scheduled")
            }, detailImage: {
                Image(systemName: "person")
                    .font(.system(size: 45, weight: .regular, design: .serif))
                    .border(Color.black, width: 1)
            }, icons: {
                Image(systemName: "circle.fill")
                    .font(.system(size: 32, weight: .regular, design: .serif))
                    .foregroundColor(.blue)
                Text("1")
                Image(systemName: "paperclip").frame(width: 16, height: 16)
            })
            .splitPercent(0.3)
            return AnyView(oi)
            
        case (1, 7):
            ///////////////////////////////////////////////////////////////
            // Regular, 1st is text, init with ViewBuilder
            let oi = _ObjectItem(title: {
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
            }, icons: {
                Image(systemName: "circle.fill").foregroundColor(.blue)
                Text("1")
            })
            .splitPercent(0.5)
            return AnyView(oi)
            
        case (1, 8):
            // Regular, 1st is text, init with ViewBuilder
            let oi = _ObjectItem(title: {
                Text("Transformer Overheating")
            }, subtitle: {
                Text("Three Phase Pad Mounted Transformer (533423)")
            }, footnote: {
                Text("1000 - Hamburg, MECHANIK")
            }, descriptionText: {
                Text("Customer noticed that the transformer started to over heat within 45 minutes each time he turned it on at 7:30am.  The first technician who looked at this did not have the correct additional tools to complete the job.")
            }, status: {
                Image(systemName: "exclamationmark.triangle").foregroundColor(.red)
            }, detailImage: {
                Image(systemName: "person")
                    .font(.system(size: 45, weight: .regular, design: .serif))
                    .border(Color.black, width: 1)
            })
            .splitPercent(0.6)
            return AnyView(oi)
            
        case (1, 9):
            // Regular, 1st is text, font size is 32, init with ViewBuilder
            let oi = _ObjectItem(title: {
                Text("Transformer Overheating When After Being on for 1 Hour or Longer")
                    .font(.system(size: 28, weight: .regular, design: .serif))
            }, subtitle: {
                Text("Three Phase Pad Mounted Transformer (533423)")
            }, footnote: {
                Text("1000 - Hamburg, MECHANIK")
            }, descriptionText: {
                Text("Customer noticed that the transformer started to over heat within 45 minutes each time he turned it on at 7:30am.  The first technician who looked at this did not have the correct additional tools to complete the job.")
                    .font(.system(size: 24, weight: .regular, design: .serif))
            }, icons: {
                Image(systemName: "circle.fill")
                    .font(.system(size: 32, weight: .regular, design: .serif))
                    .foregroundColor(.blue)
                Text("1")
                Image(systemName: "paperclip").frame(width: 16, height: 16)
            })
            .splitPercent(0.7)
            return AnyView(oi)
            
        case (2, 0):
            let oi = _ObjectItem(title: "Transformer Overheating When After Being on for 1 Hour or Longer",
                                 subtitle: "Three Phase Pad Mounted Transformer (533423)", footnote: "1000 - Hamburg, MECHANIK",
                                 descriptionText: "Customer noticed that the transformer started to over heat within 45 minutes each time he turned it on at 7:30am.  The first technician who looked at this did not have the correct additional tools to complete the job.",
                                 status: TextOrIcon.text("High"),
                                 detailImage: Image(systemName: "person"),
                                 icons: [TextOrIcon.text("1"),
                                         TextOrIcon.icon(Image(systemName: "circle.fill")),
                                         TextOrIcon.icon(Image(systemName: "mail"))])
                .subtitleModifier {
                    $0.lineLimit(2)
                }
                .descriptionTextModifier {
                    $0.font(.system(size: 32, weight: .regular, design: .serif))
                }
            return AnyView(oi)
            
        case (2, 1):
            let oi = _ObjectItem(title: "Transformer Overheating",
                                 subtitle: "Three Phase Pad Mounted Transformer (533423)", footnote: "1000 - Hamburg, MECHANIK",
                                 descriptionText: "Customer noticed that the transformer started to over heat within 45 minutes each time he turned it on at 7:30am.  The first technician who looked at this did not have the correct additional tools to complete the job.",
                                 status: TextOrIcon.text("Scheduled"),
                                 substatus: TextOrIcon.icon(Image(systemName: "mail")),
                                 detailImage: Image(systemName: "person"),
                                 icons: [TextOrIcon.icon(Image(systemName: "circle.fill")),
                                         TextOrIcon.text("1"),
                                         TextOrIcon.icon(Image(systemName: "paperclip"))])
            return AnyView(oi)
            
        case (2, 2):
            let oi = _ObjectItem(title: "Transformer Overheating",
                                 subtitle: "Three Phase Pad Mounted Transformer (533423)", footnote: "1000 - Hamburg, MECHANIK",
                                 descriptionText: "Customer noticed that the transformer started to over heat within 45 minutes each time he turned it on at 7:30am.  The first technician who looked at this did not have the correct additional tools to complete the job.",
                                 status: TextOrIcon.text("High"),
                                 detailImage: Image(systemName: "person"),
                                 icons: [TextOrIcon.icon(Image(systemName: "circle.fill")),
                                         TextOrIcon.text("1"),
                                         TextOrIcon.icon(Image(systemName: "paperclip"))])
                .titleModifier {
                    $0.font(.system(size: 32, weight: .regular, design: .serif))
                }
                .subtitleModifier {
                    $0.lineLimit(2)
                }
                .descriptionTextModifier {
                    $0.font(.system(size: 24, weight: .regular, design: .serif))
                }
            return AnyView(oi)
            
        case (3, 0):
            // Everything is center aligned. Preserve Icon Stack Spacing.
            let oi = _ObjectItem(title: {
                Text("Transformer Overheating")
            }, status: {
                Image(systemName: "exclamationmark.triangle").foregroundColor(.red)
            })
            return AnyView(oi)
            
        case (3, 1):
            // When only the headline label is used, everything in the cell is center aligned. Only 1 status can be used.
            let oi = _ObjectItem(title: {
                Text("Transformer Overheating")
            }, status: {
                Text("High")
            }, detailImage: {
                Image(systemName: "person")
                    .font(.system(size: 32, weight: .bold, design: .serif))
                    .border(Color.black, width: 1)
            })
            return AnyView(oi)
            
        case (3, 2):
            // If only 1 status is being used, the body and subhead labels in the main content area should extend to the full width of the cell below the status.
            let oi = _ObjectItem(title: {
                Text("Transformer Overheating")
            }, subtitle: {
                Text("Three Phase Pad Mounted Transformer (533423)")
            }, footnote: {
                Text("1000 - Hamburg, MECHANIK")
            }, status: {
                Text("High")
            }, detailImage: {
                Image(systemName: "person")
                    .font(.system(size: 32, weight: .bold, design: .serif))
                    .border(Color.black, width: 1)
            }, icons: {
                Text("12345")
                    .font(.system(size: 6))
                Circle().fill(Color.blue).frame(width: 12, height: 12)
                Image(systemName: "paperclip").frame(width: 16, height: 16)
            })
            return AnyView(oi)
            
        case (3, 3):
            let oi = _ObjectItem(title: {
                Text("Transformer Overheating")
            }, subtitle: {
                Text("Three Phase Pad Mounted Transformer (533423)")
                    .font(.headline)
                    .foregroundColor(.green)
                    .lineLimit(2)
            }, footnote: {
                Text("1000 - Hamburg, MECHANIK")
            }, status: {
                Text("High")
            }, substatus: {
                Text("ScheduledScheduledScheduledScheduledScheduled")
            }, detailImage: {
                Image(systemName: "person")
                    .font(.system(size: 32, weight: .bold, design: .serif))
                    .border(Color.black, width: 1)
            }, icons: {
                Text("1")
                Circle().fill(Color.blue).frame(width: 12, height: 12)
                Image(systemName: "paperclip").frame(width: 16, height: 16)
            })
            return AnyView(oi)
            
        case (3, 4):
            let oi = _ObjectItem(title: "Transformer Overheating",
                                 status: TextOrIcon.text("High"),
                                 detailImage: Image(systemName: "person"),
                                 icons: [TextOrIcon.icon(Image(systemName: "circle.fill")),
                                         TextOrIcon.text("1"),
                                         TextOrIcon.icon(Image(systemName: "paperclip"))])
            
            return AnyView(oi)
            
        case (3, 5):
            let oi = _ObjectItem(title: "Transformer Overheating",
                                 subtitle: "Three Phase Pad Mounted Transformer (533423)", footnote: "1000 - Hamburg, MECHANIK",
                                 descriptionText: "Customer noticed that the transformer started to over heat within 45 minutes each time he turned it on at 7:30am.  The first technician who looked at this did not have the correct additional tools to complete the job.",
                                 status: TextOrIcon.text("High"),
                                 detailImage: Image(systemName: "person"))
            return AnyView(oi)
            
        default:
            return AnyView(_ObjectItem(title: "Lorem ipseum dolor"))
        }
    }
}
