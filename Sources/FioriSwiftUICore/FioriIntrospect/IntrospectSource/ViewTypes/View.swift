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

    /// An abstract representation of a generic SwiftUI view type.
    ///
    /// ### iOS
    ///
    /// ```swift
    /// struct ContentView: View {
    ///     var body: some View {
    ///         HStack {
    ///             Image(systemName: "scribble")
    ///             Text("Some text")
    ///         }
    ///         .introspect(.view, on: .iOS(.v13, .v14, .v15, .v16, .v17, .v18, .v26)) {
    ///             print(type(of: $0)) // some subclass of UIView
    ///         }
    ///     }
    /// }
    /// ```
    ///
    /// ### tvOS
    ///
    /// ```swift
    /// struct ContentView: View {
    ///     var body: some View {
    ///         HStack {
    ///             Image(systemName: "scribble")
    ///             Text("Some text")
    ///         }
    ///         .introspect(.view, on: .tvOS(.v13, .v14, .v15, .v16, .v17, .v18, .v26)) {
    ///             print(type(of: $0)) // some subclass of UIView
    ///         }
    ///     }
    /// }
    /// ```
    ///
    /// ### macOS
    ///
    /// ```swift
    /// struct ContentView: View {
    ///     var body: some View {
    ///         HStack {
    ///             Image(systemName: "scribble")
    ///             Text("Some text")
    ///         }
    ///         .introspect(.view, on: .macOS(.v10_15, .v11, .v12, .v13, .v14, .v15, .v26)) {
    ///             print(type(of: $0)) // some subclass of NSView
    ///         }
    ///     }
    /// }
    /// ```
    ///
    /// ### visionOS
    ///
    /// ```swift
    /// struct ContentView: View {
    ///     var body: some View {
    ///         HStack {
    ///             Image(systemName: "scribble")
    ///             Text("Some text")
    ///         }
    ///         .introspect(.view, on: .visionOS(.v1, .v2, .v26)) {
    ///             print(type(of: $0)) // some subclass of UIView
    ///         }
    ///     }
    /// }
    /// ```
    struct ViewType: IntrospectableViewType {}

    extension IntrospectableViewType where Self == ViewType {
        static var view: Self { .init() }
    }

    #if canImport(UIKit)
        extension iOSViewVersion<ViewType, UIView> {
            static let v13 = Self(for: .v13)
            static let v14 = Self(for: .v14)
            static let v15 = Self(for: .v15)
            static let v16 = Self(for: .v16)
            static let v17 = Self(for: .v17)
            static let v18 = Self(for: .v18)
            static let v26 = Self(for: .v26)
        }

        extension tvOSViewVersion<ViewType, UIView> {
            static let v13 = Self(for: .v13)
            static let v14 = Self(for: .v14)
            static let v15 = Self(for: .v15)
            static let v16 = Self(for: .v16)
            static let v17 = Self(for: .v17)
            static let v18 = Self(for: .v18)
            static let v26 = Self(for: .v26)
        }

        extension visionOSViewVersion<ViewType, UIView> {
            static let v1 = Self(for: .v1)
            static let v2 = Self(for: .v2)
            static let v26 = Self(for: .v26)
        }

    #elseif canImport(AppKit)
        extension macOSViewVersion<ViewType, NSView> {
            static let v10_15 = Self(for: .v10_15)
            static let v11 = Self(for: .v11)
            static let v12 = Self(for: .v12)
            static let v13 = Self(for: .v13)
            static let v14 = Self(for: .v14)
            static let v15 = Self(for: .v15)
            static let v26 = Self(for: .v26)
        }
    #endif
#endif
