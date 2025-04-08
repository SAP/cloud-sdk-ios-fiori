import FioriSwiftUICore
import FioriThemeManager
import SwiftUI

struct WhatsNewExample: View {
    @State private var showPageViewModal = false
    @State private var showListViewModal = false

    var body: some View {
        List {
            Button("WhatsNewPageView") {
                self.showPageViewModal = true
            }
            Button("WhatsNewListView") {
                self.showListViewModal = true
            }
        }
        .sheet(isPresented: self.$showPageViewModal) {
            WhatsNewPageViewExample()
        }
        .sheet(isPresented: self.$showListViewModal) {
            WhatsNewListViewExample()
        }
    }
}

struct WhatsNewPageViewExample: View {
    @Environment(\.dismiss) var dismiss

    var body: some View {
        WhatsNewPageView(whatsNewPages: {
            WhatsNewPage(detailImage: FioriIcon.illustrations.successScreenScene, title: "Track your deal pipeline from anywhere", description: "You can visualize the health of your entire sales pipeline right from the palm of your hand. Easily sort, filter, and view activity and track details and changes in real time so you can stay on top of deals and instantly spot when others go off track.You can visualize the health of your entire sales pipeline right from the palm of your hand. Easily sort, filter, and view activity and track details and changes in real time so you can stay on top of deals and instantly spot when others go off track. You can visualize the health of your entire sales pipeline right from the palm of your hand. Easily sort, filter, and view activity and track details and changes in real time so you can stay on top of deals and instantly spot when others go off track")
            WhatsNewPage(detailImage: FioriIcon.illustrations.balloonSkyDialog, title: "Never let leads slip through the cracks", description: "Mobile app makes it easy to enter lead details and log activities and notes by speaking into your phone—no typing needed. Just say what you need into the app, and it’s logged everywhere")
            WhatsNewPage(detailImage: FioriIcon.illustrations.tentDot, title: "Manage your entire day from the palm of your hand", description: "Mobile app keeps you organized and helps you stay on top of new leads and current opportunities that need nurturing while you’re on the road.")
        }, didClose: {
            print("tapped close button")
            self.dismiss()
        }, didFinish: {
            print("tapped start button")
            self.dismiss()
        })
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
            print("tapped close button")
            self.dismiss()
        }, didFinish: {
            print("tapped start button")
            self.dismiss()
        })
    }
}
