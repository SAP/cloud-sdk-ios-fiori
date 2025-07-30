import FioriSwiftUICore
import SwiftUI

struct BasicComponentSkeletonLoading: View {
    @State var text: String = "TextView Text content for one line."
    @State var text2: String = ""
    @State var isLoading: Bool = true
    @State var valueText1: String = "NoteFormView text content in two lines. This is the first line.\nThis is the second line."
    @State var valueText2: String = ""
    var body: some View {
        List {
            Toggle("Skeleton Loading", isOn: self.$isLoading)
                
            Text("Text View")
                .italic()
            
            Text("Text skeleton loading for one line")
                .skeletonLoading(isLoading: self.isLoading)
            
            Text("TextFieldFormView")
                .italic()
            TextFieldFormView(title: self.isLoading ? "" : "TextFieldFormView title", text: self.isLoading ? self.$text2 : .constant("TextFieldFormView Text for one line"), placeholder: "TextFieldFormView Text plceholder for one line", controlState: .normal)
                .environment(\.isLoading, self.isLoading)
            
            Text("TextFieldFormView AI loading")
                .italic()
            TextFieldFormView(title: "TextFieldFormView title", text: self.isLoading ? self.$text2 : .constant("TextFieldFormView Text for one line"), placeholder: "TextFieldFormView Text plceholder for one line", controlState: .normal)
                .environment(\.isLoading, self.isLoading)
                .environment(\.isAILoading, self.isLoading)
            
            Text("NoteFormView")
                .italic()
            NoteFormView(text: self.$valueText2, placeholder: "Skeleton loading text plceholder", controlState: .normal)
                .environment(\.isLoading, self.isLoading)
            NoteFormView(text: self.$valueText1, placeholder: "", controlState: .normal)
                .environment(\.isLoading, self.isLoading)
            
            Text("NoteFormView AI loading")
                .italic()
            NoteFormView(text: self.$valueText2, placeholder: "Skeleton loading text plceholder", controlState: .normal)
                .environment(\.isLoading, self.isLoading)
                .environment(\.isAILoading, self.isLoading)
            NoteFormView(text: self.$valueText2, placeholder: "Skeleton loading text plceholder for multiple lines. Skeleton loading text plceholder for multiple lines. Skeleton loading text plceholder for multiple lines. Skeleton loading text plceholder for multiple lines. ", controlState: .normal)
                .environment(\.isLoading, self.isLoading)
                .environment(\.isAILoading, self.isLoading)
            NoteFormView(text: self.$valueText1, placeholder: "", controlState: .normal)
                .environment(\.isLoading, self.isLoading)
                .environment(\.isAILoading, self.isLoading)
            
            Text("Image")
                .italic()
            
            HStack {
                Image(fioriName: "fiori.person.placeholder")
                    .resizable()
                    .foregroundStyle(Color.preferredColor(.separator))
                    .frame(width: 40, height: 40)
                    .padding(16)
                    .overlay(
                        Circle()
                            .fill(Color.preferredColor(.tertiaryFill))
                            .frame(width: 80, height: 80)
                    )
                    .skeletonLoading(isLoading: self.isLoading)
               
                Image(fioriName: "fiori.person.placeholder")
                    .resizable()
                    .foregroundStyle(Color.preferredColor(.separator))
                    .frame(width: 30, height: 30)
                    .padding(16)
                    .overlay(
                        Rectangle()
                            .fill(Color.preferredColor(.tertiaryFill))
                            .frame(width: 60, height: 60)
                    )
                    .skeletonLoading(isLoading: self.isLoading)
                
                Image("flower")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 60, height: 60)
                    .imageSkeletonLoading(isLoading: self.isLoading, frame: CGSize(width: 60, height: 60))
                    .padding(16)
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
