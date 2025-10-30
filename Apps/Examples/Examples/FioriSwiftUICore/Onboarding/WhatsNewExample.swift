import FioriSwiftUICore
import FioriThemeManager
import SwiftUI

struct WhatsNewExample: View {
    @State var presentPageViewExample = false
    @State var presentListViewExample = false
    @State var showIndexControl: Bool = false
    
    var body: some View {
        List {
            Button("Page View") {
                self.presentPageViewExample.toggle()
            }
            .sheet(isPresented: self.$presentPageViewExample, content: {
                WhatsNewPageViewExample(showIndexControl: self.showIndexControl)
            })

            Button("List View") {
                self.presentListViewExample.toggle()
            }
            .sheet(isPresented: self.$presentListViewExample, content: {
                WhatsNewListViewExample()
            })
            
            Toggle("Test page view index selection", isOn: self.$showIndexControl)
        }
    }
}

struct WhatsNewPageViewExample: View {
    @Environment(\.dismiss) var dismiss
    @State var selectedIndex: Int? = nil
    var showIndexControl: Bool

    var body: some View {
        VStack {
            WhatsNewPageView(whatsNewPages: {
                // title
                WhatsNewPage(title: "Track your deal pipeline from anywhere")
                // title and description
                WhatsNewPage(title: "Track your deal pipeline from anywhere", description: "You can visualize the health of your entire sales pipeline right from the palm of your hand. Easily sort, filter, and view activity and track details and changes in real time so you can stay on top of deals and instantly spot when others go off track. You can visualize the health of your entire sales pipeline right from the palm of your hand. Easily sort, filter, and view activity and track details and changes in real time so you can stay on top of deals and instantly spot when others go off track. You can visualize the health of your entire sales pipeline right from the palm of your hand. Easily sort, filter, and view activity and track details and changes in real time so you can stay on top of deals and instantly spot when others go off track. You can visualize the health of your entire sales pipeline right from the palm of your hand.")
                // title and small image (manually resized)
                WhatsNewPage(detailImage: {
                    FioriIcon.illustrations.beforeSearchDot.resizable()
                }, title: {
                    Text("Track your deal pipeline from anywhere")
                }, imageSize: CGSize(width: 80, height: 80))
                // title and small image (isImageExpanded = true)
                WhatsNewPage(detailImage: FioriIcon.illustrations.beforeSearchDot.resizable(), title: "Track your deal pipeline from anywhere", isImageExpanded: true)
                // title and small image (isImageExpanded = true, image size set)
                WhatsNewPage(detailImage: {
                    FioriIcon.illustrations.beforeSearchDot.resizable()
                }, title: {
                    Text("Track your deal pipeline from anywhere")
                }, imageSize: CGSize(width: 100, height: 200),
                isImageExpanded: true)
                // title, description and medium image
                WhatsNewPage(detailImage: FioriIcon.illustrations.successScreenDialog.resizable(), title: "Track your deal pipeline from anywhere", description: "You can visualize the health of your entire sales pipeline right from the palm of your hand. Easily sort, filter, and view activity and track details and changes in real time so you can stay on top of deals and instantly spot when others go off track. You can visualize the health of your entire sales pipeline right from the palm of your hand. Easily sort, filter, and view activity and track details and changes in real time so you can stay on top of deals and instantly spot when others go off track. You can visualize the health of your entire sales pipeline right from the palm of your hand. Easily sort, filter, and view activity and track details and changes in real time so you can stay on top of deals and instantly spot when others go off track. You can visualize the health of your entire sales pipeline right from the palm of your hand.", isImageExpanded: false)
                // title, description and medium image (isImageExpanded = true)
                WhatsNewPage(detailImage: FioriIcon.illustrations.successScreenDialog.resizable(), title: "Track your deal pipeline from anywhere", description: "You can visualize the health of your entire sales pipeline right from the palm of your hand. Easily sort, filter, and view activity and track details and changes in real time so you can stay on top of deals and instantly spot when others go off track. You can visualize the health of your entire sales pipeline right from the palm of your hand. Easily sort, filter, and view activity and track details and changes in real time so you can stay on top of deals and instantly spot when others go off track. You can visualize the health of your entire sales pipeline right from the palm of your hand. Easily sort, filter, and view activity and track details and changes in real time so you can stay on top of deals and instantly spot when others go off track. You can visualize the health of your entire sales pipeline right from the palm of your hand.", isImageExpanded: true)
                // list view
                WhatsNewListItem(detailImage: Image("wheel").resizable(), title: "Track your deal pipeline from anywhere", subtitle: "You can visualize the health of your entire sales pipeline right from the palm of your hand. Easily sort, filter, and view activity and track details and changes in real time so you can stay on top of deals and instantly spot when others go off track.")
                VStack(alignment: .leading, spacing: 30) {
                    WhatsNewListItem(detailImage: Image("wheel").resizable(), title: "Track your deal pipeline from anywhere", subtitle: "You can visualize the health of your entire sales pipeline right from the palm of your hand. Easily sort, filter, and view activity and track details and changes in real time so you can stay on top of deals and instantly spot when others go off track.")
                    WhatsNewListItem(detailImage: Image("ProfilePic").resizable(), title: "Never let leads slip through the cracks")
                    WhatsNewListItem(title: "Manage your entire day from the palm of your hand", subtitle: "Mobile app keeps you organized and helps you stay on top of new leads and current opportunities that need nurturing while you’re on the road.")
                    WhatsNewListItem(detailImage: Image("SAPLogo"), title: "Track your deal pipeline from anywhere", subtitle: "You can visualize the health of your entire sales pipeline right from the palm of your hand. Easily sort, filter, and view activity and track details and changes in real time so you can stay on top of deals and instantly spot when others go off track.")
                    WhatsNewListItem(detailImage: nil, title: "Never let leads slip through the cracks")
                    WhatsNewListItem(title: "Manage your entire day from the palm of your hand", subtitle: "Mobile app keeps you organized and helps you stay on top of new leads and current opportunities that need nurturing while you’re on the road.")
                    WhatsNewListItem(detailImage: Image("wheel").resizable(),
                                     title: "Track your deal pipeline from anywhere", subtitle: "You can visualize the health of your entire sales pipeline right from the palm of your hand. Easily sort, filter, and view activity and track details and changes in real time so you can stay on top of deals and instantly spot when others go off track.")
                    WhatsNewListItem(detailImage: Image("rw").resizable(), title: "Never let leads slip through the cracks")
                    WhatsNewListItem(title: "Manage your entire day from the palm of your hand", subtitle: "Mobile app keeps you organized and helps you stay on top of new leads and current opportunities that need nurturing while you’re on the road.")
                }
            }, currentIndex: self.$selectedIndex, didClose: {
                print("tapped close button")
                self.dismiss()
            }, didFinish: {
                print("tapped start button")
                self.dismiss()
            })
            if self.showIndexControl {
                HStack {
                    Text("Index:")
                    Button("nil") {
                        withAnimation {
                            self.selectedIndex = nil
                        }
                    }
                    ForEach(0 ..< 10, id: \.self) { index in
                        Button("\(index)") {
                            withAnimation {
                                self.selectedIndex = index
                            }
                        }
                    }
                }
            }
        }
        .onChange(of: self.selectedIndex) {
            print("selectedIndex changed to: \(String(describing: self.selectedIndex))")
        }
    }
}

struct WhatsNewListViewExample: View {
    @Environment(\.dismiss) var dismiss
    var body: some View {
        WhatsNewListView(whatsNewListItems: {
            WhatsNewListItem(detailImage: Image("wheel").resizable(), title: "Track your deal pipeline from anywhere", subtitle: "You can visualize the health of your entire sales pipeline right from the palm of your hand. Easily sort, filter, and view activity and track details and changes in real time so you can stay on top of deals and instantly spot when others go off track.")
            WhatsNewListItem(detailImage: Image("ProfilePic").resizable(), title: "Never let leads slip through the cracks")
            WhatsNewListItem(title: "Manage your entire day from the palm of your hand", subtitle: "Mobile app keeps you organized and helps you stay on top of new leads and current opportunities that need nurturing while you’re on the road.")
            WhatsNewListItem(detailImage: Image("SAPLogo"), title: "Track your deal pipeline from anywhere", subtitle: "You can visualize the health of your entire sales pipeline right from the palm of your hand. Easily sort, filter, and view activity and track details and changes in real time so you can stay on top of deals and instantly spot when others go off track.")
            WhatsNewListItem(detailImage: nil, title: "Never let leads slip through the cracks")
            WhatsNewListItem(title: "Manage your entire day from the palm of your hand", subtitle: "Mobile app keeps you organized and helps you stay on top of new leads and current opportunities that need nurturing while you’re on the road.")
            WhatsNewListItem(detailImage: Image("wheel").resizable(),
                             title: "Track your deal pipeline from anywhere", subtitle: "You can visualize the health of your entire sales pipeline right from the palm of your hand. Easily sort, filter, and view activity and track details and changes in real time so you can stay on top of deals and instantly spot when others go off track.")
            WhatsNewListItem(detailImage: Image("rw").resizable(), title: "Never let leads slip through the cracks")
            WhatsNewListItem(title: "Manage your entire day from the palm of your hand", subtitle: "Mobile app keeps you organized and helps you stay on top of new leads and current opportunities that need nurturing while you’re on the road.")
        }, didClose: {
            self.dismiss()
        }, didFinish: {
            self.dismiss()
        })
    }
}
