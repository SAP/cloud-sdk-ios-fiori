import SwiftUI

struct PopoverContainerView: View {
    var popView: AnyView
    @ObservedObject var context: PopoverContext
    @State var showWithAnimation: Bool = false

    var body: some View {
        if self.context.showPopover {
            self.popView
                .opacity(self.context.isReady && self.showWithAnimation ? 1 : 0)
                .scaleEffect(self.context.isReady && self.showWithAnimation ? 1.0 : 0.001, anchor: self.context.scaleAnchor)
                .transition(AnyTransition.asymmetric(insertion: self.context.presentTransition,
                                                     removal: self.context.dismissTransition))
                .frameReader { rect in
                    guard !self.context.isReady else { return }
                    self.context.updateFrame(with: rect.size)
                    withTransaction(Transaction(animation: self.context.presentAnimation)) {
                        self.context.isReady = true
                        self.showWithAnimation = true
                        self.context.reload()
                    }
                }
                .onDisappear {
                    self.context.onDisappear?()
                }
        } else {
            EmptyView()
        }
    }

    func popoverOffset() -> CGSize {
        let frame = self.context.frame
        let offset = CGSize(width: frame.origin.x,
                            height: frame.origin.y)
        return offset
    }
}
