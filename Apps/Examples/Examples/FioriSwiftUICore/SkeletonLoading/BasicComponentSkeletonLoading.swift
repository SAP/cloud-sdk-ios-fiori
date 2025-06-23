import FioriSwiftUICore
import SwiftUI

struct BasicComponentSkeletonLoading: View {
    @State var text: String = "TextView Text Loaded"
    @State var isLoading: Bool = true
    @State var valueText1: String = "NoteFormView text content in two lines. This is the first line.\nThis is the second line."
    @State var valueText2: String = ""
    var body: some View {
        List {
            Toggle("Skeleton Loading", isOn: self.$isLoading)
                
            Text("Text View")
                .italic()
            
            Text("Text skeleton loading for one line")
                .ifApply(self.isLoading) {
                    $0.loadingStyle()
                }
            
            Text("TextFieldFormView")
                .italic()
            TextFieldFormView(title: self.isLoading ? "" : "TextFieldFormView title", text: self.isLoading ? self.$text : .constant("TextFieldFormView Text for one line"), placeholder: "", controlState: .normal)
                .environment(\.isLoading, self.isLoading)
            
            Text("NoteFormView")
                .italic()
            NoteFormView(text: self.$valueText2, placeholder: "Skeleton loading text plceholder", controlState: .normal)
                .environment(\.isLoading, self.isLoading)
            
            Text("NoteFormView AI loading")
                .italic()
            NoteFormView(text: self.$valueText2, placeholder: "Skeleton loading text plceholder", controlState: .normal)
                .environment(\.isLoading, self.isLoading)
            NoteFormView(text: self.$valueText1, placeholder: "", controlState: .normal)
                .environment(\.isLoading, self.isLoading)
                .environment(\.isAILoading, true)
            
            Text("Image")
                .italic()
            HStack {
                Image(fioriName: "fiori.person.placeholder")
                    .resizable()
                    .foregroundStyle(Color.preferredColor(self.isLoading ? .separator : .primaryLabel))
                    .frame(width: 20, height: 20)
                    .ifApply(self.isLoading) {
                        $0.skeletonLoading()
                    }
                
                Image(fioriName: "fiori.person.placeholder")
                    .resizable()
                    .foregroundStyle(Color.preferredColor(self.isLoading ? .separator : .primaryLabel))
                    .frame(width: 30, height: 30)
                    .clipShape(Circle())
                    .ifApply(self.isLoading) {
                        $0.skeletonLoading()
                    }

                Image(fioriName: "fiori.person.placeholder")
                    .resizable()
                    .frame(width: 40, height: 40)
                    .foregroundStyle(Color.preferredColor(self.isLoading ? .separator : .primaryLabel))
                    .ifApply(self.isLoading) {
                        $0.skeletonLoading()
                    }

                Image(fioriName: "fiori.person.placeholder")
                    .resizable()
                    .frame(width: 50, height: 50)
                    .clipShape(Circle())
                    .foregroundStyle(Color.preferredColor(self.isLoading ? .separator : .primaryLabel))
                    .clipShape(Circle())
                    .ifApply(self.isLoading) {
                        $0.skeletonLoading()
                    }
            }
            Text("Button")
                .italic()
            FioriButton(isSelectionPersistent: false, label: { _ in
                Text("Button Label")
            })
            .fioriButtonStyle(FioriPrimaryButtonStyle(isLoading: self.isLoading))
            .environment(\.isLoading, self.isLoading)
            
            FioriButton(isSelectionPersistent: false, label: { _ in
                Text("Button Label")
            })
            .fioriButtonStyle(FioriSecondaryButtonStyle(colorStyle: .normal, isLoading: self.isLoading))
            .environment(\.isLoading, self.isLoading)
            
            FioriButton(isSelectionPersistent: false, label: { _ in
                Text("Button Label")
            })
            .fioriButtonStyle(FioriTertiaryButtonStyle(colorStyle: .normal, isLoading: self.isLoading))
            .environment(\.isLoading, self.isLoading)
        }
        .navigationBarTitle("Basic Components", displayMode: .inline)
    }
}
