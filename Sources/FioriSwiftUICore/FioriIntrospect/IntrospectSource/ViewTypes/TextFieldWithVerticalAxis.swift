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

    /// An abstract representation of the `TextField` type in SwiftUI, with `.vertical` axis.
    ///
    /// ### iOS
    ///
    /// ```swift
    /// struct ContentView: View {
    ///     @State var text = "Lorem ipsum"
    ///
    ///     var body: some View {
    ///         TextField("Text Field", text: $text, axis: .vertical)
    ///             .introspect(.textField(axis: .vertical), on: .iOS(.v16, .v17, .v18, .v26)) {
    ///                 print(type(of: $0)) // UITextView
    ///             }
    ///     }
    /// }
    /// ```
    ///
    /// ### tvOS
    ///
    /// ```swift
    /// struct ContentView: View {
    ///     @State var text = "Lorem ipsum"
    ///
    ///     var body: some View {
    ///         TextField("Text Field", text: $text, axis: .vertical)
    ///             .introspect(.textField(axis: .vertical), on: .tvOS(.v16, .v17, .v18, .v26)) {
    ///                 print(type(of: $0)) // UITextField
    ///             }
    ///     }
    /// }
    /// ```
    ///
    /// ### macOS
    ///
    /// ```swift
    /// struct ContentView: View {
    ///     @State var text = "Lorem ipsum"
    ///
    ///     var body: some View {
    ///         TextField("Text Field", text: $text, axis: .vertical)
    ///             .introspect(.textField(axis: .vertical), on: .macOS(.v13, .v14, .v15, .v26)) {
    ///                 print(type(of: $0)) // NSTextField
    ///             }
    ///     }
    /// }
    /// ```
    ///
    /// ### visionOS
    ///
    /// ```swift
    /// struct ContentView: View {
    ///     @State var text = "Lorem ipsum"
    ///
    ///     var body: some View {
    ///         TextField("Text Field", text: $text, axis: .vertical)
    ///             .introspect(.textField(axis: .vertical), on: .visionOS(.v1, .v2, .v26)) {
    ///                 print(type(of: $0)) // UITextView
    ///             }
    ///     }
    /// }
    /// ```
    struct TextFieldWithVerticalAxisType: IntrospectableViewType {
        enum Axis: Sendable {
            case vertical
        }
    }

    extension IntrospectableViewType where Self == TextFieldWithVerticalAxisType {
        static func textField(axis: Self.Axis) -> Self { .init() }
    }

    // MARK: SwiftUI.TextField(..., axis: .vertical) - iOS

    #if canImport(UIKit)
        extension iOSViewVersion<TextFieldWithVerticalAxisType, UITextView> {
            @available(*, unavailable, message: "TextField(..., axis: .vertical) isn't available on iOS 13")
            static let v13 = Self.unavailable()
            @available(*, unavailable, message: "TextField(..., axis: .vertical) isn't available on iOS 14")
            static let v14 = Self.unavailable()
            @available(*, unavailable, message: "TextField(..., axis: .vertical) isn't available on iOS 15")
            static let v15 = Self.unavailable()

            static let v16 = Self(for: .v16)
            static let v17 = Self(for: .v17)
            static let v18 = Self(for: .v18)
            static let v26 = Self(for: .v26)
        }

        extension tvOSViewVersion<TextFieldWithVerticalAxisType, UITextField> {
            @available(*, unavailable, message: "TextField(..., axis: .vertical) isn't available on tvOS 13")
            static let v13 = Self.unavailable()
            @available(*, unavailable, message: "TextField(..., axis: .vertical) isn't available on tvOS 14")
            static let v14 = Self.unavailable()
            @available(*, unavailable, message: "TextField(..., axis: .vertical) isn't available on tvOS 15")
            static let v15 = Self.unavailable()

            static let v16 = Self(for: .v16)
            static let v17 = Self(for: .v17)
            static let v18 = Self(for: .v18)
            static let v26 = Self(for: .v26)
        }

        extension visionOSViewVersion<TextFieldWithVerticalAxisType, UITextView> {
            static let v1 = Self(for: .v1)
            static let v2 = Self(for: .v2)
            static let v26 = Self(for: .v26)
        }

    #elseif canImport(AppKit)
        extension macOSViewVersion<TextFieldWithVerticalAxisType, NSTextField> {
            @available(*, unavailable, message: "TextField(..., axis: .vertical) isn't available on macOS 10.15")
            static let v10_15 = Self.unavailable()
            @available(*, unavailable, message: "TextField(..., axis: .vertical) isn't available on macOS 11")
            static let v11 = Self.unavailable()
            @available(*, unavailable, message: "TextField(..., axis: .vertical) isn't available on macOS 12")
            static let v12 = Self.unavailable()

            static let v13 = Self(for: .v13)
            static let v14 = Self(for: .v14)
            static let v15 = Self(for: .v15)
            static let v26 = Self(for: .v26)
        }
    #endif
#endif
