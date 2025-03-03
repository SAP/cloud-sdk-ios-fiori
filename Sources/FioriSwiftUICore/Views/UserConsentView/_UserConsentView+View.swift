/// - Important: to make `@Environment` properties (e.g. `horizontalSizeClass`), internally accessible
/// to extensions, add as sourcery annotation in `FioriSwiftUICore/Models/ModelDefinitions.swift`
/// to declare a wrapped property
/// e.g.:  `// sourcery: add_env_props = ["horizontalSizeClass"]`

import SwiftUI

// FIXME: - Implement Fiori style definitions

extension Fiori {
    enum _UserConsentView {
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
    }
}

// FIXME: - Implement UserConsentView View body
extension _UserConsentView: View {
    public var body: some View {
        _userConsentForms.view(at: _formIndex)
            .userConsentFormDidAllow {
                if !_allowedFormIndexes.contains(_formIndex) {
                    self._allowedFormIndexes.append(_formIndex)
                }
                self._didAllow?(_formIndex)
                
                if self._formIndex == self._userConsentForms.count - 1 {
                    self._didFinish?(_allowedFormIndexes)
                } else {
                    self._formIndex += 1
                }
            }
            .userConsentFormDidDeny { isRequired in
                self._didDeny?(_formIndex, isRequired)
                
                if self._formIndex == self._userConsentForms.count - 1 || isRequired {
                    self._didFinish?(_allowedFormIndexes)
                } else {
                    self._formIndex += 1
                }
            }
            .userConsentFormDidCancel {
                self._didCancel?(_formIndex)
                self._didFinish?(_allowedFormIndexes)
            }
    }
}

// FIXME: - Implement UserConsentView specific LibraryContentProvider

// @available(iOS 14.0, *)
// struct UserConsentViewLibraryContent: LibraryContentProvider {
//    @LibraryContentBuilder
//    var views: [LibraryItem] {
//        LibraryItem(UserConsentView(model: LibraryPreviewData.Person.laurelosborn),
//                    category: .control)
//    }
// }
