import SwiftUI

/* Use this view to delay the creation of the view passed into the `LazyView`
 Otherwise such view might get constructed even when it's not going to be on screen, i.e. `NavigationLink` constructs its destination view immediately.
 See https://www.objc.io/blog/2019/07/02/lazy-loading/ for more information
 */
struct LazyView<Content: View>: View {
    let build: () -> Content
    init(_ build: @autoclosure @escaping () -> Content) {
        self.build = build
    }

    var body: Content {
        self.build()
    }
}
