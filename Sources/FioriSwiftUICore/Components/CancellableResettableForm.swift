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
        .frame(width: UIDevice.current.userInterfaceIdiom == .pad ? 375: UIScreen.main.bounds.size.width - 32)
        .padding([.leading, .trailing], 16)
        .padding([.top, .bottom], UIDevice.current.userInterfaceIdiom == .pad ? 13 : 16)
    }
}

struct ApplyButtonStyle: PrimitiveButtonStyle {
    @Environment(\.isEnabled) private var isEnabled: Bool

    func makeBody(configuration: Configuration) -> some View {
        if isEnabled {
            configuration.label
                .frame(minWidth: UIDevice.current.userInterfaceIdiom == .pad ? 375 : 200, maxWidth: .infinity)
                .padding(8)
                .font(.body)
                .fontWeight(.bold)
                .foregroundStyle(Color.preferredColor(.base2))
                .background(RoundedRectangle(cornerRadius: 8).fill(Color.preferredColor(.tintColor)))
                .onTapGesture {
                    configuration.trigger()
                }
                .padding([.top, .bottom], UIDevice.current.userInterfaceIdiom == .pad ? 16 : 8)
        } else {
            configuration.label
                .frame(minWidth: UIDevice.current.userInterfaceIdiom == .pad ? 375 : 200, maxWidth: .infinity)
                .padding(8)
                .font(.body)
                .fontWeight(.bold)
                .foregroundStyle(Color.preferredColor(.grey1))
                .background(RoundedRectangle(cornerRadius: 8).fill(Color.preferredColor(.grey5)))
                .padding([.top, .bottom], UIDevice.current.userInterfaceIdiom == .pad ? 16 : 8)
        }
    }
}

struct CancelButtonStyle: PrimitiveButtonStyle {    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.body)
            .fontWeight(.bold)
            .foregroundStyle(Color.preferredColor(.tintColor))
            .onTapGesture {
                configuration.trigger()
            }
    }
}

struct ResetButtonStyle: PrimitiveButtonStyle {
    @Environment(\.isEnabled) private var isEnabled: Bool

    func makeBody(configuration: Configuration) -> some View {
        if isEnabled {
            configuration.label
                .font(.body)
                .fontWeight(.bold)
                .foregroundStyle(Color.preferredColor(.tintColor))
                .onTapGesture {
                    configuration.trigger()
                }
        } else {
            configuration.label
                .font(.body)
                .fontWeight(.bold)
                .foregroundStyle(Color.preferredColor(.separator))
        }
    }
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
            Action(actionText: "Apply", didSelectAction: nil)
                .buttonStyle(ApplyButtonStyle())
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
