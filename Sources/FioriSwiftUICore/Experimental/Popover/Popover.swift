import SwiftUI

struct Popover {
    var popView: AnyView
    
    @ObservedObject var context = PopoverContext()
    @Binding var isPresented: Bool
    
    /// A pop over added on the window
    /// - Parameters:
    ///   - popView: pop over view
    ///   - isPresented: A binding to a bool which means the popover is presented.
    ///   - context: A popover context, that can set the animation and pop edges.
    init(popView: AnyView, isPresented: Binding<Bool>, context: PopoverContext = PopoverContext()) {
        self.popView = popView
        _isPresented = isPresented
        self.context = context
    }
}

extension Popover {
    func present(in window: UIWindow?) {
        guard let window = window else { return }
        self.context.windowFrame = window.bounds
        let containerView = PopoverContainerView(popView: popView, context: context)
        let container = PopoverGestureContainer(popView: AnyView(containerView), context: context)
        context.dismiss = {
            dismiss()
        }
        
        self.context.onDisappear = {
            removeContainer()
        }
        
        self.context.updatePopoverFrame = { rect in
            container.popUIView.frame = rect
        }
        
        window.addSubview(container)
        window.bringSubviewToFront(container)
        self.context.presentedPopoverContainer = container
        withTransaction(Transaction(animation: self.context.presentAnimation)) {
            context.showPopover = true
            context.reload()
        }
    }
    
    func dismiss() {
        withTransaction(Transaction(animation: self.context.dismissAnimation)) {
            isPresented = false
            context.showPopover = false
        }
    }
    
    func removeContainer() {
        self.context.presentedPopoverContainer?.removeFromSuperview()
        self.context.presentedPopoverContainer = nil
    }
}

class PopoverContext: ObservableObject {
    // pop edge insets
    var edgeInset = EdgeInsets(top: 8, leading: 20, bottom: 8, trailing: 20)
    let horizontalOffset: CGFloat = 10
    let verticalOffset: CGFloat = 10
    
    var presentAnimation = Animation.easeIn(duration: 0.25)
    var dismissAnimation = Animation.easeOut(duration: 0.25)
    
    var presentTransition = AnyTransition.opacity.combined(with: .scale)
    var dismissTransition = AnyTransition.opacity.combined(with: .scale)
    
    var presentedPopoverContainer: UIView?
    
    @Published var windowFrame: CGRect = .zero
    
    // source element frame
    @Published var sourceFrame: CGRect = .zero
    
    // pop size and frame
    @Published var popSize: CGSize = .zero
    @Published var frame: CGRect = .zero
    
    @Published var showPopover = false
    
    var isReady = false
    var scaleAnchor = UnitPoint()
    
    var dismiss: (() -> Void)?
    var onDisappear: (() -> Void)?
    var updatePopoverFrame: ((CGRect) -> Void)?

    func updateFrame(with size: CGSize) {
        self.popSize = size
        let position = calculateFrame()
        frame = position.0
        self.scaleAnchor = position.1

        if self.showPopover {
            self.updatePopoverFrame?(self.frame)
        }
    }
    
    func reload() {
        objectWillChange.send()
    }
}

extension PopoverContext {
    func calculateFrame() -> (CGRect, UnitPoint) {
        var popoverFrame = CGRect.zero
        popoverFrame.size = self.popSize
        let animationAnchor: UnitPoint
        
        var originX: CGFloat = 0
        var originY: CGFloat = 0
        
        let anchorX: CGFloat
        let anchorY: CGFloat
        
        if self.windowFrame.width > self.windowFrame.height {
            originY = self.sourceFrame.minY - self.verticalOffset
            if self.sourceFrame.midX > self.windowFrame.midX { // pop at left
                originX = self.sourceFrame.minX - self.horizontalOffset - self.popSize.width
                anchorX = 1
            } else { // pop at right
                originX = self.sourceFrame.maxX + self.horizontalOffset
                anchorX = 0
            }
            
            // adjust position to keep pop in window on vertical direction
            if originY < self.edgeInset.top {
                originY = self.edgeInset.top
            } else if originY + self.popSize.height + self.edgeInset.bottom > self.windowFrame.maxY {
                originY = self.windowFrame.maxY - self.edgeInset.bottom - self.popSize.height
            }
            
            anchorY = (self.sourceFrame.midY - originY) / self.popSize.height
            animationAnchor = UnitPoint(x: anchorX, y: anchorY)
        } else {
            originX = self.sourceFrame.maxX - self.popSize.width
            
            if self.sourceFrame.midY > self.windowFrame.midY { // pop at top
                originY = self.sourceFrame.minY - self.verticalOffset - self.popSize.height
                anchorY = 1
            } else { // pop at bottom
                originY = self.sourceFrame.maxY + self.verticalOffset
                anchorY = 0
            }
            
            // adjust position to keep pop in window on horizontal direction
            if originX < self.edgeInset.leading {
                originX = self.edgeInset.leading
            } else if originX + self.popSize.width + self.edgeInset.trailing > self.windowFrame.maxX {
                originX = self.windowFrame.maxX - self.edgeInset.trailing - self.popSize.width
            }
            
            anchorX = (self.sourceFrame.midX - originX) / self.popSize.width
            animationAnchor = UnitPoint(x: anchorX, y: anchorY)
        }
        
        popoverFrame.origin = CGPoint(x: originX, y: originY)
        
        self.presentTransition = AnyTransition.opacity.combined(with: AnyTransition.scale(scale: 1, anchor: animationAnchor))
        self.dismissTransition = AnyTransition.opacity.combined(with: AnyTransition.scale(scale: 0, anchor: animationAnchor))
        return (popoverFrame, animationAnchor)
    }
}
