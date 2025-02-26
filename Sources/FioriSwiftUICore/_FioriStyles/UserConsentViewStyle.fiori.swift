import FioriThemeManager
import Foundation
import SwiftUI

// Base Layout style
public struct UserConsentViewBaseStyle: UserConsentViewStyle {
    @State var formIndex = 0
    @State var allowedFormIndexes: [Int] = []

    public func makeBody(_ configuration: UserConsentViewConfiguration) -> some View {
        configuration.userConsentForms.view(at: self.formIndex).typeErased
            .userConsentFormDidAllow {
                if self.allowedFormIndexes.contains(self.formIndex) {
                    self.allowedFormIndexes.append(self.formIndex)
                }
                configuration.didAllow?(self.formIndex)
                if self.formIndex == configuration.userConsentForms.count - 1 {
                    configuration.didFinish?(self.allowedFormIndexes)
                } else {
                    self.formIndex += 1
                }
            }
            .userConsentFormDidDeny { isRequired in
                configuration.didDeny?(self.formIndex, isRequired)
                
                if self.formIndex == configuration.userConsentForms.count - 1 || isRequired {
                    configuration.didFinish?(self.allowedFormIndexes)
                } else {
                    self.formIndex += 1
                }
            }
            .userConsentFormDidCancel {
                configuration.didCancel?(self.formIndex)
                configuration.didFinish?(self.allowedFormIndexes)
            }
    }
}

// Default fiori styles
extension UserConsentViewFioriStyle {
    struct ContentFioriStyle: UserConsentViewStyle {
        func makeBody(_ configuration: UserConsentViewConfiguration) -> some View {
            UserConsentView(configuration)
        }
    }
}
