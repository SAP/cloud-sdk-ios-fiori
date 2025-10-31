import FioriSwiftUICore
import FioriThemeManager
import SwiftUI

struct HierarchyItemViewDemo: View {
    @State var showSettings = false
    
    @State var isEditing = false
    @State var isMultiline = false
    @State var showsDetailImage = false
    @State var status = HierarchyItemStatusMode.text
    @State var accessoryType = AccessoryType.disclosure
    let indicatorNumber = [2, 666, 1987, 23, 456, 99999, 2368, 22, 90, 789, 6]
    
    var body: some View {
        List {
            ForEach(0 ..< 11) { index in
                HierarchyItemView(
                    title: { Text(self.formattedText(for: index, value: "Water Pump")) },
                    subtitle: self.isMultiline ? { Text("Three Phase Pad Mounted Transformer (533423)") } : { EmptyView() },
                    footnote: self.isMultiline ? { Text(self.formattedText(for: index, value: "Hamburg, MECHANIK", isSuffix: false)) } : { EmptyView() },
                    icons: {
                        FioriIcon.message.badge.foregroundStyle(Color.preferredColor(.tintColor))
                        FioriIcon.actions.bookmark.foregroundStyle(Color.preferredColor(.tintColor))
                        FioriIcon.actions.attachment.foregroundStyle(Color.preferredColor(.tintColor))
                    },
                    detailImage: self.showsDetailImage ? { FioriIcon.message.messageInformation.resizable().foregroundStyle(Color.preferredColor(.tintColor)) } : { EmptyView() },
                    status: self.status == .icon ? { Image(systemName: "exclamationmark.square.fill").foregroundStyle(Color.preferredColor(.negativeLabel)) } : (self.status == .text ? { Text("Installed") } : { EmptyView() }),
                    accessoryType: self.accessoryType,
                    hierarchyIndicator: self.isEditing ? { EmptyView() } : {
                        HierarchyIndicator(
                            title: index == 4 ? { EmptyView() } : { Text(self.formatNumber(self.indicatorNumber[index])) },
                            isMultiline: self.isMultiline,
                            isSelected: false,
                            isClickable: false,
                        )
                    }
                )
                .padding(8)
            }
            .onDelete { _ in
            }
        }
        .environment(\.editMode, .constant(self.isEditing ? EditMode.active : EditMode.inactive))
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Button(action: {
                    self.showSettings.toggle()
                }) {
                    Image(systemName: "gear.circle")
                }
            }
        }
        .sheet(isPresented: self.$showSettings) {
            HierarchyItemViewSettingsView(
                isEditing: self.$isEditing,
                isMultiline: self.$isMultiline,
                showDetailImage: self.$showsDetailImage,
                status: self.$status,
                accessoryType: self.$accessoryType
            )
            .presentationDetents([.fraction(0.5), .large])
            .presentationDragIndicator(.visible)
        }
    }
    
    private func formattedText(for index: Int, value: String, isSuffix: Bool = true) -> AttributedString {
        let formattedIndex = String(format: "%02d", index)
        return isSuffix ? AttributedString("\(value) \(formattedIndex)") : AttributedString("\(formattedIndex) - \(value)")
    }
    
    private func formatNumber(_ number: Int) -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal // Use decimal style for thousand separators
        return formatter.string(from: NSNumber(value: number)) ?? "\(number)"
    }
}

struct HierarchyItemViewSettingsView: View {
    @Binding var isEditing: Bool
    @Binding var isMultiline: Bool
    @Binding var showDetailImage: Bool
    @Binding var status: HierarchyItemStatusMode
    @Binding var accessoryType: AccessoryType
    
    var body: some View {
        List {
            Toggle(isOn: self.$isEditing, label: { Text("Edit") })
            
            Toggle(isOn: self.$isMultiline, label: { Text("Multiline") })
            
            Picker("Status", selection: self.$status) {
                Text("None").tag(HierarchyItemStatusMode.none)
                Text("Icon").tag(HierarchyItemStatusMode.icon)
                Text("Text").tag(HierarchyItemStatusMode.text)
            }
            
            Picker("Accessory Icon", selection: self.$accessoryType) {
                Text("None").tag(AccessoryType.none)
                Text("Disclosure").tag(AccessoryType.disclosure)
                Text("Checkmark").tag(AccessoryType.checkmark)
                Text("Detail").tag(AccessoryType.detail)
            }
            
            Toggle(isOn: self.$showDetailImage, label: { Text("Show Detail Image") })
        }
    }
}
