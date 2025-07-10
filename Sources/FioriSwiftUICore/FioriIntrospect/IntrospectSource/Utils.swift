// Source: https://github.com/siteline/swiftui-introspect
/**
 MIT License:
 
 Copyright 2019 Timber Software

 Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

 The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 */
postfix operator ~

postfix func ~ <T>(lhs: some Any) -> T {
    lhs as! T
}

postfix func ~ <T>(lhs: (some Any)?) -> T? {
    lhs as? T
}

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
