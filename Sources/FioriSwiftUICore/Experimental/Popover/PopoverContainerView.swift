import SwiftUI

struct PopoverContainerView: View {
    var popView: AnyView
    @ObservedObject var context: PopoverContext
    @State var showWithAnimation: Bool = false
    
    var body: some View {
        if context.showPopover {
            popView
                .opacity(context.isReady && showWithAnimation ? 1 : 0)
                .scaleEffect(context.isReady && showWithAnimation ? 1 : 0, anchor: context.scaleAnchor)
                .transition(AnyTransition.asymmetric(insertion: context.presentTransition,
                                                     removal: context.dismissTransition))
                .frameReader { rect in
                    guard !context.isReady else { return }
                    context.updateFrame(with: rect.size)
                    withTransaction(Transaction(animation: context.presentAnimation)) {
                        context.isReady = true
                        showWithAnimation = true
                        context.reload()
                    }
                }
                .onDisappear {
                    context.onDisappear?()
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
