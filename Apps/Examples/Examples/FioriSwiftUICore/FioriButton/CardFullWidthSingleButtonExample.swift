import FioriSwiftUICore
import FioriThemeManager
import SwiftUI

class CardFullWidthSingleButtonItem: Identifiable, ObservableObject {
    @Published var title: String
    @Published var loadingState: FioriButtonLoadingState
    @Published var id: UUID
    
    init(title: String, loadingState: FioriButtonLoadingState, id: UUID) {
        self.title = title
        self.loadingState = loadingState
        self.id = id
    }
}

struct CardFullWidthSingleButtonExample: View {
    @State private var buttonTitle = "Check in"
    @Environment(\.dismiss) private var dismiss
    @State private var isGridView = false
    
    @State private var _dataSource: [CardFullWidthSingleButtonItem] = [
        CardFullWidthSingleButtonItem(title: "1", loadingState: .unspecified, id: UUID()),
        CardFullWidthSingleButtonItem(title: "2", loadingState: .unspecified, id: UUID()),
        CardFullWidthSingleButtonItem(title: "3", loadingState: .unspecified, id: UUID()),
        CardFullWidthSingleButtonItem(title: "4", loadingState: .unspecified, id: UUID()),
        CardFullWidthSingleButtonItem(title: "5", loadingState: .unspecified, id: UUID())
    ]
    
    var profileHeader: some View {
        ProfileHeader(detailImage: {
            Image("rw").resizable()
                .accessibilityLabel("Photo")
        }, title: {
            Text("Harry Ford")
        }, subtitle: {
            Text("The boy wizard, the boy wizard")
        }, description: {
            Text("This is a description.")
                .accessibilityAddTraits(.isSummaryElement)
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
                .accessibilityLabel("Message")
                Spacer()
                
                Button {
                    print("tap email")
                } label: {
                    FioriIcon.actions.email
                        .imageScale(.large)
                        .fontWeight(.light)
                }
                .accessibilityLabel("Email")
                Spacer()
                
                Button {
                    print("tap call")
                } label: {
                    FioriIcon.actions.call
                        .imageScale(.large)
                        .fontWeight(.light)
                }
                .accessibilityLabel("Phone Call")
                Spacer()
                
                Button {
                    print("tap video")
                } label: {
                    FioriIcon.actions.video
                        .imageScale(.large)
                        .fontWeight(.light)
                }
                .accessibilityLabel("Video")
                Spacer()
                
                Button {
                    print("tap hint")
                } label: {
                    FioriIcon.actions.hint
                        .imageScale(.large)
                        .fontWeight(.light)
                }
                .accessibilityLabel("Hint")
                Spacer()
            }
        }
    }
    
    @State private var availableGridViewWidth: CGFloat = 0
    
    var body: some View {
        List {
            Section {
                Divider()
                HStack {
                    Text("My Schedule")
                        .font(.fiori(forTextStyle: .subheadline))
                        .foregroundStyle(Color.preferredColor(.secondaryLabel))
                        .accessibilityAddTraits(.isHeader)
                    Spacer()
                    Button {
                        withAnimation {
                            self.isGridView.toggle()
                        }
                    } label: {
                        Text(self.isGridView ? "Show Horizontal" : "See all (\(self._dataSource.count))")
                            .font(.fiori(forTextStyle: .subheadline, weight: .semibold))
                            .foregroundStyle(Color.preferredColor(.tintColor))
                    }
                }
                .padding(EdgeInsets(top: 5, leading: 20, bottom: 5, trailing: 20))
                
                if self.isGridView {
                    let count = self.availableGridViewWidth < 300 * 2 + 8 ? 1 : 2
                    let columns = Array(repeating: GridItem(.flexible(), spacing: 8), count: count)
                    ScrollViewReader { proxy in
                        LazyVGrid(columns: columns, spacing: 10) {
                            ForEach(self._dataSource) { item in
                                self.cardView(for: item)
                                    .frame(maxWidth: .infinity)
                                    .id(item.id)
                            }
                        }
                        .padding(.horizontal, 16)
                        .onAppear {
                            if let firstID = self._dataSource.first?.id {
                                proxy.scrollTo(firstID, anchor: .topLeading)
                            }
                        }
                    }
                    .padding(.horizontal, 16)
                    .onGeometryChange(for: CGFloat.self, of: { proxy in
                        proxy.size.width
                    }, action: { newValue in
                        self.availableGridViewWidth = newValue
                    })
                } else {
                    ScrollViewReader { proxy in
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 8) {
                                ForEach(0 ..< self._dataSource.count, id: \.self) { index in
                                    let item = self._dataSource[index]
                                    self.cardView(for: item)
                                        .frame(maxWidth: 300)
                                        .accessibility(sortPriority: Double(self._dataSource.count - index))
                                        .id(item.id)
                                }
                            }
                            .clipShape(RoundedRectangle(cornerRadius: 16))
                            .shadow(color: .preferredColor(.cardShadow), radius: 16)
                            .padding(EdgeInsets(top: 8, leading: 8, bottom: 8, trailing: 8))
                        }
                        .onAppear {
                            if let firstID = self._dataSource.first?.id {
                                proxy.scrollTo(firstID, anchor: .leading)
                            }
                        }
                        .clipShape(RoundedRectangle(cornerRadius: 16))
                        .shadow(color: .preferredColor(.cardShadow), radius: 16)
                        .padding(EdgeInsets(top: 8, leading: 8, bottom: 8, trailing: 8))
                    }
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
    func cardView(for item: CardFullWidthSingleButtonItem) -> some View {
        Card {
            Text("Schedule \(item.title)")
                .lineLimit(1)
                .minimumScaleFactor(0.1)
        } subtitle: {
            Text("Subtitle")
                .lineLimit(1)
                .minimumScaleFactor(0.1)
        } detailImage: {
            Image("ProfilePic")
                .resizable()
                .frame(width: 45, height: 45)
                .clipShape(RoundedRectangle(cornerRadius: 10))
        } headerAction: {
            FioriIcon.shopping.cart
        } row1: {
            Text("Body text could be really long description that requires wrapping, with suggested 2 lines from Fiori Design Guideline perspective to make the UI concise. SDK default setting of numberOfLines for body is 6. Application Developer can override it with : cell.body.numOfLines = preferredNumberOfLines.")
        } action: {
            FioriButton(action: { _ in
                self.updateDataSource(id: item.id)
            }, label: { _ in
                Text(self.titleStr(item.loadingState))
                    .multilineTextAlignment(.center)
            })
            .fioriButtonStyle(FioriPrimaryButtonStyle(.infinity, loadingState: item.loadingState))
            .disabled(item.loadingState != .unspecified)
        }
        .frame(width: 300)
        .fixedSize(horizontal: false, vertical: true)
        .background(Color.white)
        .accessibilityElement(children: .contain)
        .accessibilityLabel("Schedule \(item.title)")
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
                    UIAccessibility.post(notification: .announcement, argument: "Checking in for Schedule \(item.title).")
                } else if item.loadingState == .processing {
                    item.loadingState = .success
                    self._dataSource[i] = item
                    timeInterval = 1.0
                    UIAccessibility.post(notification: .announcement, argument: "Checked in for Schedule \(item.title).")
                } else {
                    let removedTitle = item.title
                    self._dataSource.remove(at: i)
                    let remaining = self._dataSource.count
                    if remaining == 0 {
                        UIAccessibility.post(notification: .announcement, argument: "All schedules checked in.")
                        self.dismiss()
                    } else {
                        UIAccessibility.post(
                            notification: .announcement,
                            argument: "Schedule \(removedTitle) removed. \(remaining) schedule\(remaining == 1 ? "" : "s") remaining."
                        )
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
    
    func titleStr(_ loadingState: FioriButtonLoadingState) -> AttributedString {
        switch loadingState {
        case .unspecified:
            "Check in"
        case .processing:
            "Checking in"
        case .success:
            "Checked in"
        }
    }
}

#Preview {
    CardFullWidthSingleButtonExample()
}
