import SwiftUI

struct PopoverSizeModifier<PopoverContent: View>: ViewModifier {
    @Binding var isPresented: Bool
    var arrowEdge: Edge = .top
    var popoverSize: CGSize? = nil
    let popoverContent: () -> PopoverContent
    
    func body(content: Content) -> some View {
        content
            .background(
                Wrapper(isPresented: self.$isPresented, popoverSize: self.popoverSize, popoverContent: self.popoverContent, arrowEdge: self.arrowEdge)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
            )
    }
    
    struct Wrapper<PopoverView: View>: UIViewControllerRepresentable {
        @Binding var isPresented: Bool
        let popoverSize: CGSize?
        var popoverContent: () -> PopoverView
        var arrowEdge: Edge = .top
        
        func makeUIViewController(context: UIViewControllerRepresentableContext<Wrapper<PopoverView>>) -> WrapperViewController<PopoverView> {
            WrapperViewController(
                popoverSize: self.popoverSize,
                arrowEdge: self.arrowEdge,
                popoverContent: self.popoverContent
            ) {
                self.isPresented = false
            }
        }
        
        func updateUIViewController(_ uiViewController: WrapperViewController<PopoverView>, context: UIViewControllerRepresentableContext<Wrapper<PopoverView>>) {
            uiViewController.updateSize(self.popoverSize)

            if self.isPresented {
                uiViewController.arrowEdge = self.arrowEdge
                uiViewController.showPopover()
            } else {
                uiViewController.hidePopover()
            }
            if let hostingController = uiViewController.popoverVC as? UIHostingController<PopoverView> {
                hostingController.rootView = self.popoverContent()
            }
        }
    }
    
    class WrapperViewController<PopoverView: View>: UIViewController, UIPopoverPresentationControllerDelegate {
        var popoverSize: CGSize?
        var popoverContent: () -> PopoverView
        let onDismiss: () -> Void
        var arrowEdge: Edge = .top
        
        var popoverVC: UIViewController?

        @available(*, unavailable)
        required init?(coder: NSCoder) { fatalError("") }
        
        init(popoverSize: CGSize?, arrowEdge: Edge = .top, popoverContent: @escaping () -> PopoverView, onDismiss: @escaping () -> Void) {
            self.popoverSize = popoverSize
            self.popoverContent = popoverContent
            self.onDismiss = onDismiss
            self.arrowEdge = arrowEdge
            super.init(nibName: nil, bundle: nil)
        }
        
        func showPopover() {
            guard self.popoverVC == nil else { return }
            let vc = UIHostingController(rootView: popoverContent())
            if let size = popoverSize { vc.preferredContentSize = size }
            vc.modalPresentationStyle = .popover
            
            if let popover = vc.popoverPresentationController {
                popover.sourceView = view
                switch self.arrowEdge {
                case .top:
                    popover.permittedArrowDirections = .up
                case .bottom:
                    popover.permittedArrowDirections = .down
                case .leading:
                    popover.permittedArrowDirections = .left
                case .trailing:
                    popover.permittedArrowDirections = .right
                }
                popover.delegate = self
            }
            
            self.popoverVC = vc
            self.present(vc, animated: true, completion: nil)
        }
        
        func hidePopover() {
            guard let vc = popoverVC, !vc.isBeingDismissed else { return }
            vc.dismiss(animated: true, completion: nil)
            self.popoverVC = nil
        }
        
        func presentationControllerWillDismiss(_ presentationController: UIPresentationController) {
            self.popoverVC = nil
            self.onDismiss()
        }
        
        func updateSize(_ size: CGSize?) {
            self.popoverSize = size
            if let vc = popoverVC, let size {
                vc.preferredContentSize = size
            }
        }
        
        func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle {
            if UIDevice.current.userInterfaceIdiom == .phone {
                return .automatic
            }
            return .none
        }
    }
}
