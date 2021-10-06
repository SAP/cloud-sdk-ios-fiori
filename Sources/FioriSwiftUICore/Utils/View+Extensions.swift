import Foundation
import SwiftUI

extension View {
    func onSimultaneousTapGesture(count: Int = 1, perform action: @escaping () -> Void) -> some View {
        self.simultaneousGesture(TapGesture(count: count).onEnded {
            action()
        })
    }
}

extension View {
    @ViewBuilder
    func alert(configuration: AlertConfiguration, isPresented: Binding<Bool>) -> some View {
        self.alert(isPresented: isPresented) {
            Alert(title: configuration.title, message: configuration.message_, primaryButton: .default(configuration.action.label_, action: configuration.action.didSelect ?? {}), secondaryButton: .cancel(configuration.secondaryAction.label_, action: configuration.secondaryAction.didSelect ?? {}))
        }
    }
    
    // Cause problem generating xcframework in SAPFiori
//    @ViewBuilder
//    func alert(configuration: AlertConfiguration, isPresented: Binding<Bool>) -> some View {
//        #if swift(>=5.5)
//            if #available(iOS 15, macOS 12, *) {
//                self.alert(configuration.title, isPresented: isPresented) {
//                    Button(action: configuration.action.didSelect ?? {}, label: { configuration.action.label })
//                    Button(role: .cancel, action: configuration.secondaryAction.didSelect ?? {}, label: { configuration.secondaryAction.label })
//                } message: {
//                    configuration.message
//                }
//            } else {
//                self.alert(isPresented: isPresented) {
//                    Alert(title: configuration.title, message: configuration.message_, primaryButton: .default(configuration.action.label_, action: configuration.action.didSelect ?? {}), secondaryButton: .cancel(configuration.secondaryAction.label_, action: configuration.secondaryAction.didSelect ?? {}))
//                }
//            }
//        #else
//            self.alert(isPresented: isPresented) {
//                Alert(title: configuration.title, message: configuration.message_, primaryButton: .default(configuration.action.label_, action: configuration.action.didSelect ?? {}), secondaryButton: .cancel(configuration.secondaryAction.label_, action: configuration.secondaryAction.didSelect ?? {}))
//            }
//        #endif
//    }
}
