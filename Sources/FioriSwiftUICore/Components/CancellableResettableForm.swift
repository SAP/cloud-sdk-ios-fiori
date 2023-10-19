import Foundation
import SwiftUI

struct CancellableResettableDialogForm<Title: View, CancelAction: View, ResetAction: View, ApplyAction: View, Components: View>: View {
    let title: Title
    
    let components: Components
    
    var cancelAction: CancelAction
    var resetAction: ResetAction
    var applyAction: ApplyAction
    
    public init(@ViewBuilder title: () -> Title,
                @ViewBuilder cancelAction: () -> CancelAction,
                @ViewBuilder resetAction: () -> ResetAction,
                @ViewBuilder applyAction: () -> ApplyAction,
                @ViewBuilder components: () -> Components)
    {
        self.title = title()
        self.cancelAction = cancelAction()
        self.resetAction = resetAction()
        self.applyAction = applyAction()
        self.components = components()
    }
    
    var body: some View {
        VStack(spacing: UIDevice.current.userInterfaceIdiom == .pad ? 8 : 16) {
            HStack {
                cancelAction
                Spacer()
                title
                Spacer()
                resetAction
            }
            components
            applyAction
        }
        .frame(minWidth: 375)
        .padding(UIDevice.current.userInterfaceIdiom == .pad ? 13 : 16)
    }
}

// fileprivate extension View {
//    func readHeight() -> some View {
//        self.modifier(ReadHeightModifier())
//    }
// }
//
// private struct ReadHeightModifier: ViewModifier {
//    private var sizeView: some View {
//        GeometryReader { geometry in
//            Color.clear.preference(key: HeightPreferenceKey.self, value: geometry.size.height)
//        }
//    }
//
//    func body(content: Content) -> some View {
//        content.background(sizeView)
//    }
// }
//
//

struct ApplyButtonStyle: PrimitiveButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
//        GeometryReader { geometry in
        //        HStack {
        //            Spacer()
        configuration.label
            .frame(minWidth: 375, maxWidth: .infinity)
            //            Spacer()
            //        }
            .onTapGesture {
                configuration.trigger()
            }
            .padding(15)
            .font(.system(size: 16, weight: .bold))
            .background(RoundedRectangle(cornerRadius: 5).fill(Color.preferredColor(.tintColor)))
            .foregroundColor(.white)
    }

//    }
}

#Preview {
    VStack {
        Spacer()
        CancellableResettableDialogForm {
            Text("Date of Completion")
        } cancelAction: {
            Action(actionText: "Cancel", didSelectAction: nil)
        } resetAction: {
            Action(actionText: "Reset", didSelectAction: nil)
        } applyAction: {
            Button {} label: {
                Text("Apply")
                    .frame(width: 375)
            }
//            Action(actionText: "Apply", didSelectAction: nil)
//                .buttonStyle(ApplyButtonStyle())
        } components: {
            DatePicker(
                "date",
                selection: Binding<Date>(get: { Date() }, set: { print($0) }),
                displayedComponents: [.date]
            )
            .datePickerStyle(.graphical)
        }
    }
}
