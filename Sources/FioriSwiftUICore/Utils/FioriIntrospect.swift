import SwiftUI
import UIKit

extension UIScrollView: IntrospectType {}

protocol IntrospectType: AnyObject {}

extension View {
    func introspect<Target: IntrospectType>(introspection: @escaping (Target) -> Void) -> some View {
        self.modifier(FioriIntrospectModifier(introspection: introspection))
    }
}

struct FioriIntrospectModifier<Target: IntrospectType>: ViewModifier {
    let introspection: (Target) -> Void

    init(introspection: @escaping (Target) -> Void) {
        self.introspection = introspection
    }
    
    func body(content: Content) -> some View {
        content
            .background(
                Color.white
                    .opacity(0)
                    .accessibility(hidden: true)
            )
            .overlay {
                FioriIntrospectionView(introspection: self.introspection)
                    .frame(width: 0, height: 0)
                    .accessibility(hidden: true)
            }
    }
}

struct FioriIntrospectionView<Target: IntrospectType>: UIViewControllerRepresentable {
    typealias UIViewControllerType = FioriIntrospectionViewController
    
    @Binding
    private var observed: Void // workaround for state changes not triggering view updates
    private let introspection: (Target) -> Void
    
    init(introspection: @escaping (Target) -> Void) {
        self._observed = .constant(())
        self.introspection = introspection
    }
    
    final class TargetCache {
        weak var target: Target?
    }
    
    func makeCoordinator() -> TargetCache {
        TargetCache()
    }
    
    func makeUIViewController(context: Context) -> FioriIntrospectionViewController {
        let controller = FioriIntrospectionViewController { controller in
            guard let parent = controller.parent else { return }
            let s = recursiveSequence(parent.view.subviews, children: { $0.subviews }).dropFirst()
            guard let target = s.compactMap({ $0 as? Target }).first else { return }
            context.coordinator.target = target
            self.introspection(target)
            controller.handler = nil
        }
        return controller
    }
    
    func updateUIViewController(_ controller: FioriIntrospectionViewController, context: Context) {
        guard let target = context.coordinator.target else { return }
        self.introspection(target)
    }
}

class FioriIntrospectionViewController: UIViewController {
    var handler: (() -> Void)? = nil

    init(handler: ((FioriIntrospectionViewController) -> Void)?) {
        super.init(nibName: nil, bundle: nil)
        self.handler = { [weak self] in
            guard let self else {
                return
            }
            handler?(self)
        }
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.handler?()
    }

    override func didMove(toParent parent: UIViewController?) {
        super.didMove(toParent: parent)
        self.handler?()
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        self.handler?()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.handler?()
    }
}

// MARK: - Utils

func recursiveSequence<S: Sequence>(_ sequence: S, children: @escaping (S.Element) -> S) -> AnySequence<S.Element> {
    AnySequence {
        var mainIterator = sequence.makeIterator()
        // Current iterator, or `nil` if all sequences are exhausted:
        var iterator: AnyIterator<S.Element>?

        return AnyIterator {
            guard let iterator, let element = iterator.next() else {
                if let element = mainIterator.next() {
                    iterator = recursiveSequence(children(element), children: children).makeIterator()
                    return element
                }
                return nil
            }
            return element
        }
    }
}
