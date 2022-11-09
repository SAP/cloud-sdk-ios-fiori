import SwiftUI

class PopoverGestureContainer: UIView {
    var popView: AnyView
    var context: PopoverContext
    var popUIView: UIView
    
    required init(popView: AnyView, context: PopoverContext) {
        self.popView = popView
        self.context = context
        let hostVC = UIHostingController(rootView: popView)
        hostVC.view.frame = context.windowFrame
        hostVC.view.backgroundColor = .clear
        self.popUIView = hostVC.view
        
        super.init(frame: context.windowFrame)
        addSubview(self.popUIView)
        autoresizingMask = [.flexibleWidth, .flexibleHeight]
    }
    
    override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        guard event.map({ $0.type == .touches }) ?? true else { return nil }
        
        // hit on popup
        if self.context.frame.contains(point) {
            return super.hitTest(point, with: event)
        }

        // hit on source element
        if self.context.sourceFrame.contains(point) {
            return nil
        }

        // hit on background
        self.context.dismiss?()
        return nil
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("create this view programmatically")
    }
}
