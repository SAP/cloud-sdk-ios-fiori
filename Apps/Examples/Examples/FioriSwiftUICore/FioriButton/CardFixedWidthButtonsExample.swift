import FioriSwiftUICore
import FioriThemeManager
import SwiftUI

struct CardFixedWidthButtonsExample: View {
    @State private var buttonTitle = "Check in"
    
    @Environment(\.dismiss) private var dismiss
    
    @State private var _dataSource: [CardFullWidthSingleButtonItem] = [
        CardFullWidthSingleButtonItem(title: "1", loadingState: .unspecified, id: UUID()),
        CardFullWidthSingleButtonItem(title: "2", loadingState: .unspecified, id: UUID()),
        CardFullWidthSingleButtonItem(title: "3", loadingState: .unspecified, id: UUID()),
        CardFullWidthSingleButtonItem(title: "4", loadingState: .unspecified, id: UUID()),
        CardFullWidthSingleButtonItem(title: "5", loadingState: .unspecified, id: UUID())
    ]
    
    private var profileHeader: some View {
        ProfileHeader(detailImage: {
            Image("rw").resizable()
        }, title: {
            Text("Harry Ford")
        }, subtitle: {
            Text("The boy wizard, the boy wizard")
        }, description: {
            Text("This is a description.")
        }) {
            HStack {
                Spacer()
                Button {
                    print("tap message")
                } label: {
                    FioriIcon.callout.discussion
                        .imageScale(.large)
                        .fontWeight(.light)
                }
                Spacer()
                
                Button {
                    print("tap email")
                } label: {
                    FioriIcon.actions.email
                        .imageScale(.large)
                        .fontWeight(.light)
                }
                Spacer()
                
                Button {
                    print("tap call")
                } label: {
                    FioriIcon.actions.call
                        .imageScale(.large)
                        .fontWeight(.light)
                }
                Spacer()
                
                Button {
                    print("tap video")
                } label: {
                    FioriIcon.actions.video
                        .imageScale(.large)
                        .fontWeight(.light)
                }
                Spacer()
                
                Button {
                    print("tap hint")
                } label: {
                    FioriIcon.actions.hint
                        .imageScale(.large)
                        .fontWeight(.light)
                }
                Spacer()
            }
        }
    }
    
    var body: some View {
        List {
            Section {
                Divider()
                    .padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 0))
                    
                HStack {
                    Text("My Schedule")
                        .font(.fiori(forTextStyle: .subheadline))
                        .foregroundStyle(Color.preferredColor(.secondaryLabel))
                    Spacer()
                    Button {
                        print("see all")
                    } label: {
                        Text("See all (\(self._dataSource.count))")
                            .font(.fiori(forTextStyle: .body))
                            .foregroundStyle(Color.preferredColor(.tintColor))
                    }
                }
                .padding(EdgeInsets(top: 5, leading: 20, bottom: 5, trailing: 20))
                
                ScrollView(.horizontal) {
                    HStack(spacing: 8, content: {
                        ForEach(0 ..< self._dataSource.count, id: \.self) { index in
                            let item = self._dataSource[index]
                            HStack {
                                Card {
                                    Text("Schedule\(item.title)")
                                } subtitle: {
                                    Text("Subtitle")
                                } detailImage: {
                                    Image("ProfilePic")
                                        .resizable()
                                        .frame(width: 45, height: 45)
                                        .clipShape(RoundedRectangle(cornerRadius: 10))
                                } headerAction: {
                                    FioriIcon.shopping.cart
                                } row1: {
                                    Text("Body text could be really long description that requires wrapping, with suggested 2 lines from Fiori Design Guideline perspective to make the UI concise. SDK default setting of numberOfLines for body is 6. Application Developer can override it with : cell.body.numOfLines = preferredNumberOfLines.")
                                        .lineLimit(2)
                                } action: {
                                    FioriButton(isSelectionPersistent: false, action: { _ in
                                        self.updateDataSource(id: item.id)
                                    }, label: { _ in
                                        self.primaryActionLabel(item.loadingState)
                                    }, image: { _ in
                                        EmptyView()
                                    }, imagePosition: .leading, imageTitleSpacing: 8.0)
                                        .fioriButtonStyle(FioriPrimaryButtonStyle(118, loadingState: item.loadingState))
                                        .disabled(item.loadingState != .unspecified)
                                } secondaryAction: {
                                    FioriButton(isSelectionPersistent: false, title: "Decline", action: { _ in
                                        print("tap Decline")
                                    })
                                    .fioriButtonStyle(FioriSecondaryButtonStyle(colorStyle: .negative, maxWidth: 118))
                                }
                                .frame(width: 300, height: 192)
                                .background(Color.white)
                            }
                            .clipShape(RoundedRectangle(cornerRadius: 16))
                            .shadow(color: .preferredColor(.cardShadow), radius: 16) //
                            .padding(EdgeInsets(top: 8, leading: 8, bottom: 8, trailing: 8))
                        }
                    })
                    .padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10))
                }
                Spacer()
            } header: {
                self.profileHeader
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.preferredColor(.secondaryGroupedBackground))
            }
            .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
            .listRowSeparator(.hidden)
        }
        .listStyle(.grouped)
        .navigationTitle("Object Card - Full Width  Single Button")
        .navigationBarTitleDisplayMode(.inline)
    }
    
    @ViewBuilder
    func primaryActionLabel(_ loadingState: FioriButtonLoadingState) -> any View {
        loadingState != .unspecified ? AnyView(EmptyView()) : AnyView(Text("Check in"))
    }
    
    func updateDataSource(id: UUID) {
        for i in 0 ..< self._dataSource.count {
            let item = self._dataSource[i]
            if item.id == id {
                var timeInterval = 0.0
                if item.loadingState == .unspecified {
                    item.loadingState = .processing
                    self._dataSource[i] = item
                    timeInterval = 2.0
                } else if item.loadingState == .processing {
                    item.loadingState = .success
                    self._dataSource[i] = item
                    timeInterval = 1.0
                } else {
                    self._dataSource.remove(at: i)
                    if self._dataSource.isEmpty {
                        self.dismiss()
                    }
                    return
                }
                
                _ = Timer.scheduledTimer(withTimeInterval: timeInterval, repeats: false, block: { _ in
                    self.updateDataSource(id: id)
                })
                break
            }
        }
    }
}

#Preview {
    CardFixedWidthButtonsExample()
}
