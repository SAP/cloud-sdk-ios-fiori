// Source: https://github.com/siteline/swiftui-introspect
/**
 MIT License:
 
 Copyright 2019 Timber Software
 
 Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
 
 The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
 
 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 */
#if !os(watchOS)

    @MainActor
    struct IntrospectionSelector<Target: PlatformEntity> {
        static var `default`: Self { .from(Target.self, selector: { $0 }) }

        static func from<Entry: PlatformEntity>(_ entryType: Entry.Type, selector: @MainActor @escaping (Entry) -> Target?) -> Self {
            .init(
                receiverSelector: { controller in
                    controller.as(Entry.Base.self)?.receiver(ofType: Entry.self).flatMap(selector)
                },
                ancestorSelector: { controller in
                    controller.as(Entry.Base.self)?.ancestor(ofType: Entry.self).flatMap(selector)
                }
            )
        }

        private var receiverSelector: @MainActor (IntrospectionPlatformViewController) -> Target?
        private var ancestorSelector: @MainActor (IntrospectionPlatformViewController) -> Target?

        private init(
            receiverSelector: @MainActor @escaping (IntrospectionPlatformViewController) -> Target?,
            ancestorSelector: @MainActor @escaping (IntrospectionPlatformViewController) -> Target?
        ) {
            self.receiverSelector = receiverSelector
            self.ancestorSelector = ancestorSelector
        }

        func withReceiverSelector(_ selector: @MainActor @escaping (PlatformViewController) -> Target?) -> Self {
            var copy = self
            copy.receiverSelector = selector
            return copy
        }

        func withAncestorSelector(_ selector: @MainActor @escaping (PlatformViewController) -> Target?) -> Self {
            var copy = self
            copy.ancestorSelector = selector
            return copy
        }

        func callAsFunction(_ controller: IntrospectionPlatformViewController, _ scope: IntrospectionScope) -> Target? {
            if
                scope.contains(.receiver),
                let target = receiverSelector(controller)
            {
                return target
            }
            if
                scope.contains(.ancestor),
                let target = ancestorSelector(controller)
            {
                return target
            }
            return nil
        }
    }

    extension PlatformViewController {
        func `as`<Base: PlatformEntity>(_ baseType: Base.Type) -> (any PlatformEntity)? {
            if Base.self == PlatformView.self {
                #if canImport(UIKit)
                    return viewIfLoaded
                #elseif canImport(AppKit)
                    return isViewLoaded ? view : nil
                #endif
            } else if Base.self == PlatformViewController.self {
                return self
            }
            return nil
        }
    }
#endif
