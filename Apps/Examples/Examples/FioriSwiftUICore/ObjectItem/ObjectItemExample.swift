import FioriSwiftUICore
import SwiftUI

struct ObjectItemExample: View {
    var body: some View {
        List {
            Section(header: Text("SAPFiori Tests").textCase(nil)) {
                NavigationLink("Object Cell_Single Action_May2018.pdf", destination: ObjectItemSingleActionView())
                
                NavigationLink(
                    destination: ObjectItemListView(title: "ObjectCell_Spec_Jan2018", listDataType: ObjectCell_Spec_Jan2018.self)) {
                    Text("Object Cell Specifications_Jan2018.pdf")
                }
                
                NavigationLink(
                    destination: ObjectItemListView(title: "ObjectCell_Rules_&_Alignment.pdf", listDataType: ObjectCell_Rules_Alignment.self)) {
                    Text("ObjectCell_Rules_&_Alignment.pdf")
                }
            }
            
            Section(header: Text("Init Tests").textCase(nil)) {
                NavigationLink(
                    destination: ObjectItemTestView(title: "ObjectItem: First is a text, init with ViewBuilder", content: ObjectItemTextFirstExamples())) {
                    Text("ObjectItem: first is a text, init with ViewBuilder")
                }
//                NavigationLink(destination: ObjectItemTextFirstExamples()) {
//                    Text("ObjectItem: first is a text, init with ViewBuilder")
//                }
                
                NavigationLink(
                    destination: ObjectItemTestView(title: "ObjectItem: First is an icon, init with ViewBuilder", content: ObjectItemIconFirstExamples())) {
                    Text("ObjectItem: first is an icon, init with ViewBuilder")
                }
                
                NavigationLink(
                    destination: ObjectItemTestView(title: "ObjectItem inited with Model", content: ObjectItemModelTextFirstExamples())) {
                    Text("ObjectItem inited with Model")
                }
                
                NavigationLink(
                    destination: ObjectItemTestView(title: "ObjectItem other examples", content: ObjectItemOtherExamples())) {
                    Text("ObjectItem other examples")
                }
            }
        }.navigationBarTitle("ObjectItem", displayMode: .inline)
    }
}

struct ObjectItemSingleActionView: View {
    var body: some View {
        List {
            NavigationLink("Single Action P6: Follow Button", destination: ObjectItemListView(title: "Single Action P6: Follow Button", listDataType: SingleActionFollowButton.self))
            
            NavigationLink("Single Action P6: Follow Button LONG TEXT", destination: ObjectItemListView(title: "Single Action P6: Follow Button LONG TEXT", listDataType: SingleActionLongFollowButton.self))
            
//            NavigationLink("Single Action P7: Indicator", destination: ObjectItemListView(title: "Single Action P7: Indicator", listData: SingleActionFollowButton()))
            
            NavigationLink("Single Action P8-9: Profiles", destination: ObjectItemListView(title: "Single Action P8-9: Profiles", listDataType: SingleActionProfiles.self))
            
            NavigationLink("Single Action Collection Example", destination: SingleActionCollectionView())
        }
    }
}

struct ObjectItemListView<T: ListDataProtocol>: View {
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    let title: String
    let listDataType: T.Type
    let changeLeftMargin: Bool
    let showEditButton: Bool
    
    @State var cellTapped = false
    
    init(title: String, listDataType: T.Type, changeLeftMargin: Bool = true, showEditButton: Bool = true) {
        self.title = title
        self.listDataType = listDataType
        self.changeLeftMargin = changeLeftMargin
        self.showEditButton = showEditButton
    }
    
    func createInstance(typeThing: T.Type) -> T {
        typeThing.init(cellTapped: $cellTapped)
    }
    
    var body: some View {
        let listData = createInstance(typeThing: listDataType)
        
        return List {
            ForEach(0 ..< listData.numberOfSections(), id: \.self) { sectionIndex in
                Section(header: Text(listData.titleForHeaderInSection(sectionIndex))) {
                    ForEach(0 ..< listData.numberOfRowsInSection(sectionIndex), id: \.self) { index in
                        if listData.containAccessoryView(IndexPath(row: index, section: sectionIndex)) {
                            NavigationLink(destination: listData.cellForRow(IndexPath(row: index, section: sectionIndex))) {
                                listData.cellForRow(IndexPath(row: index, section: sectionIndex))
                            }
                        } else {
                            listData.cellForRow(IndexPath(row: index, section: sectionIndex))
                        }
                    }
                    .onDelete { indexSet in
                        print("delete \(indexSet)")
                    }
                }
            }.listRowBackground(Color.preferredColor(.primary6))
                .ifApply(horizontalSizeClass == .some(.compact) && changeLeftMargin) {
                    $0.listRowInsets(EdgeInsets(top: 0, leading: 32, bottom: 0, trailing: 32))
                }
        }
        .toolbar {
            if showEditButton {
                EditButton()
            }
        }
        .navigationBarTitle(title, displayMode: .inline)
        .sheet(isPresented: $cellTapped) {
            Text("Tapped the cell").padding()
            
            VStack {
                Button("Dismiss") {
                    self.cellTapped = false
                }
            }.padding()
        }
    }
}

struct ObjectItemTestView<Content: View>: View {
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    
    let title: String
    let content: Content
    @State var splitPercent: CGFloat = 0.5
    var body: some View {
        content
            .navigationBarTitle(title)
            .toolbar {
                EditButton()
            }
    }
}

struct ObjectItemModelTextFirstExamples: View {
    var body: some View {
        List {
            ObjectItem(title: "Transformer Overheating When After Being on for 1 Hour or Longer",
                       subtitle: "Three Phase Pad Mounted Transformer (533423)", footnote: "1000 - Hamburg, MECHANIK",
                       descriptionText: "Customer noticed that the transformer started to over heat within 45 minutes each time he turned it on at 7:30am.  The first technician who looked at this did not have the correct additional tools to complete the job.",
                       status: "High",
                       detailImage: Image(systemName: "person"),
                       icons: [IconStackItem.text("1"),
                               IconStackItem.icon(Image(systemName: "circle.fill")),
                               IconStackItem.icon(Image(systemName: "mail"))])
                .subtitleModifier {
                    $0.lineLimit(2)
                }
                .descriptionTextModifier {
                    $0.font(.system(size: 32, weight: .regular, design: .serif))
                }
            
            ObjectItem(title: "Transformer Overheating",
                       subtitle: "Three Phase Pad Mounted Transformer (533423)", footnote: "1000 - Hamburg, MECHANIK",
                       descriptionText: "Customer noticed that the transformer started to over heat within 45 minutes each time he turned it on at 7:30am.  The first technician who looked at this did not have the correct additional tools to complete the job.",
                       status: "High",
                       substatus: "Scheduled",
                       detailImage: Image(systemName: "person"),
                       icons: [IconStackItem.icon(Image(systemName: "circle.fill")),
                               IconStackItem.text("1"),
                               IconStackItem.icon(Image(systemName: "paperclip"))])
            
            ObjectItem(title: "Transformer Overheating",
                       subtitle: "Three Phase Pad Mounted Transformer (533423)", footnote: "1000 - Hamburg, MECHANIK",
                       descriptionText: "Customer noticed that the transformer started to over heat within 45 minutes each time he turned it on at 7:30am.  The first technician who looked at this did not have the correct additional tools to complete the job.",
                       status: "High",
                       detailImage: Image(systemName: "person"),
                       icons: [IconStackItem.icon(Image(systemName: "circle.fill")),
                               IconStackItem.text("1"),
                               IconStackItem.icon(Image(systemName: "paperclip"))])
                .titleModifier {
                    $0.font(.system(size: 32, weight: .regular, design: .serif))
                }
                .subtitleModifier {
                    $0.lineLimit(2)
                }
                .descriptionTextModifier {
                    $0.font(.system(size: 24, weight: .regular, design: .serif))
                }
        }
    }
}

struct ObjectItemOtherExamples: View {
    @State private var selection: Int? = nil
    
    var body: some View {
        List(selection: $selection) {
            // Everything is center aligned. Preserve Icon Stack Spacing.
            ObjectItem(title: {
                Text("Transformer Overheating")
            }, status: {
                Image(systemName: "exclamationmark.triangle").foregroundColor(.red)
            })
            
            // When only the headline label is used, everything in the cell is center aligned. Only 1 status can be used.
            ObjectItem(title: {
                Text("Transformer Overheating")
            }, status: {
                Text("High")
            }, detailImage: {
                Image(systemName: "person")
                    .font(.system(size: 32, weight: .bold, design: .serif))
                    .border(Color.black, width: 1)
            })
            
            // If only 1 status is being used, the body and subhead labels in the main content area should extend to the full width of the cell below the status.
            ObjectItem(title: {
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
            
            ObjectItem(title: {
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
            
            ObjectItem(title: "Transformer Overheating",
                       status: "High",
                       detailImage: Image(systemName: "person"),
                       icons: [IconStackItem.icon(Image(systemName: "circle.fill")),
                               IconStackItem.text("1"),
                               IconStackItem.icon(Image(systemName: "paperclip"))])
            
            ObjectItem(title: "Transformer Overheating",
                       subtitle: "Three Phase Pad Mounted Transformer (533423)", footnote: "1000 - Hamburg, MECHANIK",
                       descriptionText: "Customer noticed that the transformer started to over heat within 45 minutes each time he turned it on at 7:30am.  The first technician who looked at this did not have the correct additional tools to complete the job.",
                       status: "High",
                       detailImage: Image(systemName: "person"))
        }
    }
}

struct ObjectItemTextFirstExamples: View {
    var body: some View {
        List {
            // Regular, 1st is text, init with ViewBuilder
            ObjectItem(title: {
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
            // .splitPercent(0.3)
            
            // Regular, 1st is text, init with ViewBuilder
            ObjectItem(title: {
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
            
            // Regular, 1st is text, init with ViewBuilder
            ObjectItem(title: {
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
            
            // Regular, 1st is text, init with ViewBuilder
            ObjectItem(title: {
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
            
            // Regular, 1st is text, init with ViewBuilder
            ObjectItem(title: {
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
            
            // Regular, 1st is text, init with ViewBuilder
            ObjectItem(title: {
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
            
            // Regular, 1st is text, font size is 32, init with ViewBuilder
            ObjectItem(title: {
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
            
            ///////////////////////////////////////////////////////////////
            // Regular, 1st is text, init with ViewBuilder
            ObjectItem(title: {
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
            
            // Regular, 1st is text, init with ViewBuilder
            ObjectItem(title: {
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
            
            // Regular, 1st is text, font size is 32, init with ViewBuilder
            ObjectItem(title: {
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
        }
    }
}

struct ObjectItemIconFirstExamples: View {
    var body: some View {
        List {
            // Regular, 1st is text, init with ViewBuilder
            ObjectItem(title: {
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
            
            // Regular, 1st is text, init with ViewBuilder
            ObjectItem(title: {
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
            
            // Regular, 1st is text, init with ViewBuilder
            ObjectItem(title: {
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
            
            // Regular, 1st is text, init with ViewBuilder
            ObjectItem(title: {
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
            
            // Regular, 1st is text, init with ViewBuilder
            ObjectItem(title: {
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
            
            // Regular, 1st is text, init with ViewBuilder
            ObjectItem(title: {
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
            
            // Regular, 1st is text, font size is 32, init with ViewBuilder
            ObjectItem(title: {
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
            
            ///////////////////////////////////////////////////////////////
            // Regular, 1st is text, init with ViewBuilder
            ObjectItem(title: {
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
            
            // Regular, 1st is text, init with ViewBuilder
            ObjectItem(title: {
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
            
            // Regular, 1st is text, font size is 32, init with ViewBuilder
            ObjectItem(title: {
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
        }
    }
}

struct ObjectItemExample_Previews: PreviewProvider {
    static var previews: some View {
        ObjectItemExample()
    }
}
