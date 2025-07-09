// Source: https://github.com/siteline/swiftui-introspect
/**
 MIT License:
 
 Copyright 2019 Timber Software
 
 Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
 
 The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
 
 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 */
#if !os(watchOS)
    import SwiftUI

    #if canImport(UIKit)
        typealias PlatformView = UIView
        typealias PlatformViewController = UIViewController
        typealias _PlatformViewControllerRepresentable = UIViewControllerRepresentable
    #elseif canImport(AppKit)
        typealias PlatformView = NSView
        typealias PlatformViewController = NSViewController
        typealias _PlatformViewControllerRepresentable = NSViewControllerRepresentable
    #endif

    @MainActor
    protocol PlatformViewControllerRepresentable: _PlatformViewControllerRepresentable {
        #if canImport(UIKit)
            typealias ViewController = UIViewControllerType
        #elseif canImport(AppKit)
            typealias ViewController = NSViewControllerType
        #endif

        func makePlatformViewController(context: Context) -> ViewController
        func updatePlatformViewController(_ controller: ViewController, context: Context)
        static func dismantlePlatformViewController(_ controller: ViewController, coordinator: Coordinator)
    }

    extension PlatformViewControllerRepresentable {
        #if canImport(UIKit)
            func makeUIViewController(context: Context) -> ViewController {
                makePlatformViewController(context: context)
            }

            func updateUIViewController(_ controller: ViewController, context: Context) {
                updatePlatformViewController(controller, context: context)
            }

            static func dismantleUIViewController(_ controller: ViewController, coordinator: Coordinator) {
                dismantlePlatformViewController(controller, coordinator: coordinator)
            }

        #elseif canImport(AppKit)
            func makeNSViewController(context: Context) -> ViewController {
                makePlatformViewController(context: context)
            }

            func updateNSViewController(_ controller: ViewController, context: Context) {
                updatePlatformViewController(controller, context: context)
            }

            static func dismantleNSViewController(_ controller: ViewController, coordinator: Coordinator) {
                dismantlePlatformViewController(controller, coordinator: coordinator)
            }
        #endif
    }
#endif
