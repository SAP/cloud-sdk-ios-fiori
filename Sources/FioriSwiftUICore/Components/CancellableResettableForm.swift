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
                self.cancelAction
                Spacer()
                self.title
                Spacer()
                self.resetAction
            }
            .padding([.leading, .trailing], UIDevice.current.userInterfaceIdiom == .pad ? 13 : 16)

            self.components.background(Color.preferredColor(.secondaryGroupedBackground))
            self.applyAction
        }
        .frame(width: UIDevice.current.userInterfaceIdiom == .pad ? 375 : Screen.bounds.size.width)
        .padding([.top, .bottom], UIDevice.current.userInterfaceIdiom == .pad ? 13 : 16)
        .background(Color.preferredColor(.chromeSecondary))
    }
}

struct ApplyButtonStyle: PrimitiveButtonStyle {
    @Environment(\.isEnabled) private var isEnabled: Bool

    func makeBody(configuration: Configuration) -> some View {
        if self.isEnabled {
            configuration.label
                .frame(width: UIDevice.current.userInterfaceIdiom == .pad ? 375 - 13 * 2 :
                    Screen.bounds.size.width - 16 * 2)
                .padding([.top, .bottom], 8)
                .font(.body)
                .fontWeight(.bold)
                .foregroundStyle(Color.preferredColor(.base2))
                .background(RoundedRectangle(cornerRadius: 8).fill(Color.preferredColor(.tintColor)))
                .onTapGesture {
                    configuration.trigger()
                }
                .padding([.top], UIDevice.current.userInterfaceIdiom == .pad ? 16 : 8)
        } else {
            configuration.label
                .frame(width: UIDevice.current.userInterfaceIdiom == .pad ? 375 - 13 * 2 :
                    Screen.bounds.size.width - 16 * 2)
                .padding([.top, .bottom], 8)
                .font(.body)
                .fontWeight(.bold)
                .foregroundStyle(Color.preferredColor(.grey1))
                .background(RoundedRectangle(cornerRadius: 8).fill(Color.preferredColor(.grey5)))
                .padding([.top], UIDevice.current.userInterfaceIdiom == .pad ? 16 : 8)
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
        if self.isEnabled {
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
            _Action(actionText: "Cancel", didSelectAction: nil)
        } resetAction: {
            _Action(actionText: "Reset", didSelectAction: nil)
        } applyAction: {
            _Action(actionText: "Apply", didSelectAction: nil)
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
