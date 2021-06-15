import Foundation
import SwiftUI

// FIXME: - Implement Fiori style definitions

extension Fiori {
    enum MockSignatureCaptureView {
        typealias Title = EmptyModifier
        typealias TitleCumulative = EmptyModifier
        typealias StartActionText = EmptyModifier
        typealias StartActionTextCumulative = EmptyModifier
        typealias RestartActionText = EmptyModifier
        typealias RestartActionTextCumulative = EmptyModifier
        typealias CancelActionText = EmptyModifier
        typealias CancelActionTextCumulative = EmptyModifier
        typealias ClearActionText = EmptyModifier
        typealias ClearActionTextCumulative = EmptyModifier
        typealias SaveActionText = EmptyModifier
        typealias SaveActionTextCumulative = EmptyModifier
        typealias Signature = EmptyModifier
        typealias SignatureCumulative = EmptyModifier

        // TODO: - substitute type-specific ViewModifier for EmptyModifier
        /*
             // replace `typealias Subtitle = EmptyModifier` with:

             struct Subtitle: ViewModifier {
                 func body(content: Content) -> some View {
                     content
                         .font(.body)
                         .foregroundColor(.preferredColor(.primary3))
                 }
             }
         */
        static let title = Title()
        static let startActionText = StartActionText()
        static let restartActionText = RestartActionText()
        static let cancelActionText = CancelActionText()
        static let clearActionText = ClearActionText()
        static let saveActionText = SaveActionText()
        static let signature = Signature()
        static let titleCumulative = TitleCumulative()
        static let startActionTextCumulative = StartActionTextCumulative()
        static let restartActionTextCumulative = RestartActionTextCumulative()
        static let cancelActionTextCumulative = CancelActionTextCumulative()
        static let clearActionTextCumulative = ClearActionTextCumulative()
        static let saveActionTextCumulative = SaveActionTextCumulative()
        static let signatureCumulative = SignatureCumulative()
    }
}

// FIXME: - Implement MockSignatureCaptureView View body

extension MockSignatureCaptureView: View {
    public var body: some View {
        VStack {
            HStack {
                title
                cancelActionText
                    .onTapGesture {
                        self.isEditing = false
                    }
            }
            
            if let image = _signature.wrappedValue {
                image
            } else {
                drawingArea
            }
            
            if self.isEditing {
                HStack {
                    clearActionText
                        .onTapGesture {
                            scribbleView.clear()
                        }
                    saveActionText
                        .onTapGesture {
                            _signature.wrappedValue = scribbleView.getImage()
                            self.isEditing = false
                        }
                }
            } else {
                restartActionText
                    .onTapGesture {
                        scribbleView.clear()
                        self.isEditing = true
                    }
            }
        }
    }
    
    @ViewBuilder var drawingArea: some View {
        if self.isEditing {
            scribbleView
        } else {
            startActionText
                .onTapGesture {
                    self.isEditing = true
                }
        }
    }
}

/// The view component for drawing and convert it to an image. (Replace DrawingPad)
public struct ScribbleView: View {
    public var body: some View {
        // TODO: body implementation
        EmptyView()
    }
    
    public func clear() {}
    
    public func getImage() -> Image? {
        // TODO: create image based on path
        nil
    }
}

// FIXME: - Implement MockSignatureCaptureView specific LibraryContentProvider

// @available(iOS 14.0, *)
// struct MockSignatureCaptureViewLibraryContent: LibraryContentProvider {
//    @LibraryContentBuilder
//    var views: [LibraryItem] {
//        LibraryItem(MockSignatureCaptureView(model: LibraryPreviewData.Person.laurelosborn),
//                    category: .control)
//    }
// }
