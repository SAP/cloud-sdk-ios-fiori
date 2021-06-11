import Foundation
import SwiftUI

// FIXME: - Implement Fiori style definitions

extension Fiori {
    enum MockSignatureCaptureView {
        typealias Title = EmptyModifier
        typealias TitleCumulative = EmptyModifier
        typealias ActionText = EmptyModifier
        typealias ActionTextCumulative = EmptyModifier

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
        static let actionText = ActionText()
        static let titleCumulative = TitleCumulative()
        static let actionTextCumulative = ActionTextCumulative()
    }
}

// FIXME: - Implement MockSignatureCaptureView View body

extension MockSignatureCaptureView: View {
    public var body: some View {
        VStack {
            HStack {
                title
                actionText
            }
            
            scribbleView
        }
    }
}

public extension MockSignatureCaptureView where Title == Text,
    ActionText == _ConditionalContent<Action, EmptyView>,
    ScribbleView == FioriSwiftUICore.ScribbleView
{
    init(model: MockSignatureCaptureViewModel) {
        self.init(title: model.title_, actionText: model.actionText_, didSelectAction: model.didSelectAction)
    }

    init(title: String, actionText: String? = nil, didSelectAction: (() -> Void)? = nil) {
        self._title = Text(title)
        
        let scribbleView = ScribbleView()
        
        // handle ActionModel
        if actionText != nil {
            self._actionText = ViewBuilder.buildEither(first: Action(actionText: actionText, didSelectAction: didSelectAction))
        } else {
            self._actionText = ViewBuilder.buildEither(second: EmptyView())
        }
        self._scribbleView = scribbleView

        isModelInit = true
        isActionTextNil = actionText == nil ? true : false
    }
}

/// The view component for drawing and convert it to an image.
public struct ScribbleView: View {
    public var body: some View {
        EmptyView()
    }
    
    public func getImage() -> Image? {
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
