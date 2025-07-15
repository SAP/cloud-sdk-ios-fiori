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
    protocol IntrospectableViewType {
        /// The scope of introspection for this particular view type, i.e. where introspect
        /// should look to find the desired target view relative to the applied
        /// `.introspect(...)` modifier.
        ///
        /// While the scope can be overridden by the user in their `.introspect(...)` call,
        /// most of the time it's preferable to defer to the view type's own scope,
        /// as it guarantees introspection is working as intended by the vendor.
        ///
        /// Defaults to `.receiver` if left unimplemented, which is a sensible one in
        /// most cases if you're looking to implement your own view type.
        var scope: IntrospectionScope { get }
    }

    extension IntrospectableViewType {
        var scope: IntrospectionScope { .receiver }
    }
#endif
