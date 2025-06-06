/**
 MIT License
 
 Copyright 2019 Timber Software

 Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

 The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 */
#if !os(watchOS)
    import SwiftUI
    import UIKit

    extension View {
        func introspect<PlatformSpecificEntity: PlatformEntity>(customize: @escaping (PlatformSpecificEntity) -> Void) -> some View {
            self.modifier(FioriIntrospectModifier(customize: customize))
        }
    }

    struct FioriIntrospectModifier<PlatformSpecificEntity: PlatformEntity>: ViewModifier {
        let id = IntrospectionViewID()
    
        let selector: IntrospectionSelector<PlatformSpecificEntity>?
        let customize: (PlatformSpecificEntity) -> Void
    
        @MainActor
        init(customize: @escaping (PlatformSpecificEntity) -> Void) {
            self.selector = IntrospectionSelector<PlatformSpecificEntity>.default
            self.customize = customize
        }
    
        func body(content: Content) -> some View {
            if let selector {
                content
                    .background(
                        Color.white
                            .opacity(0)
                            .accessibility(hidden: true)
                    )
                    .background(
                        IntrospectionAnchorView(id: self.id)
                            .frame(width: 0, height: 0)
                            .accessibility(hidden: true)
                    )
                    .overlay {
                        IntrospectionView(id: self.id, selector: { selector($0) }, customize: self.customize)
                            .frame(width: 0, height: 0)
                            .accessibility(hidden: true)
                    }
            } else {
                content
            }
        }
    }

    @MainActor
    protocol PlatformEntity: AnyObject {
        associatedtype Base: PlatformEntity
        var ancestor: Base? { get }
        var descendants: [Base] { get }
        func isDescendant(of other: Base) -> Bool
    }

    extension PlatformEntity {
        var ancestor: Base? { nil }
        var descendants: [Base] { [] }
        func isDescendant(of other: Base) -> Bool { false }
    }

    extension PlatformEntity {
        var ancestors: some Sequence<Base> {
            sequence(first: self~, next: { $0.ancestor~ }).dropFirst()
        }
    
        var allDescendants: some Sequence<Base> {
            recursiveSequence([self~], children: { $0.descendants~ }).dropFirst()
        }
    
        func nearestCommonAncestor(with other: Base) -> Base? {
            var nearestAncestor: Base? = self~
        
            while let currentEntity = nearestAncestor, !other.isDescendant(of: currentEntity~) {
                nearestAncestor = currentEntity.ancestor~
            }
        
            return nearestAncestor
        }
    
        func allDescendants(between bottomEntity: Base, and topEntity: Base) -> some Sequence<Base> {
            self.allDescendants
                .lazy
                .drop(while: { $0 !== bottomEntity })
                .prefix(while: { $0 !== topEntity })
        }
    
        func receiver<PlatformSpecificEntity: PlatformEntity>(
            ofType type: PlatformSpecificEntity.Type
        ) -> PlatformSpecificEntity? {
            let frontEntity = self
            guard
                let backEntity = frontEntity.introspectionAnchorEntity,
                let commonAncestor = backEntity.nearestCommonAncestor(with: frontEntity~)
            else {
                return nil
            }
        
            return commonAncestor
                .allDescendants(between: backEntity~, and: frontEntity~)
                .filter { !$0.isIntrospectionPlatformEntity }
                .compactMap { $0 as? PlatformSpecificEntity }
                .first
        }
    
        func ancestor<PlatformSpecificEntity: PlatformEntity>(
            ofType type: PlatformSpecificEntity.Type
        ) -> PlatformSpecificEntity? {
            self.ancestors
                .lazy
                .filter { !$0.isIntrospectionPlatformEntity }
                .compactMap { $0 as? PlatformSpecificEntity }
                .first
        }
    }

    extension PlatformView: PlatformEntity {
        var ancestor: PlatformView? {
            superview
        }
    
        var descendants: [PlatformView] {
            subviews
        }
    }

    extension PlatformViewController: PlatformEntity {
        var ancestor: PlatformViewController? {
            parent
        }
    
        var descendants: [PlatformViewController] {
            children
        }
    
        func isDescendant(of other: PlatformViewController) -> Bool {
            self.ancestors.contains(other)
        }
    }

    #if canImport(UIKit)
        extension UIPresentationController: PlatformEntity {
            typealias Base = UIPresentationController
        }

    #elseif canImport(AppKit)
        extension NSWindow: PlatformEntity {
            typealias Base = NSWindow
        }
    #endif
#endif
