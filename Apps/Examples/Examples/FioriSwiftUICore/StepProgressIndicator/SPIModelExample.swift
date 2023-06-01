import FioriSwiftUICore
import SwiftUI

class SPIExampleModel: StepProgressIndicatorModel, ObservableObject {
    struct AllActionModel: ActionModel {
        let actionText: String? = "All Steps"
        
        let didSelectAction: (() -> Void)?
    }
    
    @Published var selection: String = "b"
    var title: String? = "SPI Title: b"
    
    var steps: [SingleStepModel] = ["a", "b", "c", "d", "e", "f"]
        .map {
            SingelExampleModel(id: $0,
                               title: "title: \($0)",
                               node: .icon(Image(systemName: "\($0).circle")))
        }
    
    lazy var action: ActionModel? = AllActionModel { [unowned self] in
        print("All steps button clicked")
    }
}

class SingelExampleModel: SingleStepModel {
    var id: String = ""
    var title: String? = ""
    var node: TextOrIcon
    var substeps: [SingleStepModel] = []
    
    init(id: String = UUID().uuidString,
         title: String? = nil,
         node: TextOrIcon,
         substeps: [SingleStepModel] = [])
    {
        self.id = id
        self.title = title
        self.node = node
        self.substeps = substeps
    }
}

struct SPIModelExample: View {
    @StateObject var model = SPIExampleModel()

    var body: some View {
        VStack(alignment: .leading) {
            Text("Initialized by Model").bold()
            StepProgressIndicator(model: model)
                .stepStyle { id in
                    CustomModelStyleExample(isLast: id == "f")
                }
            Spacer().padding(20)
            Button {
                completeStep()
            } label: {
                Text("Mark as Completed")
            }
            .padding(20)
        }
        .padding()
        .onChange(of: model.selection, perform: { _ in
            updateCurrentStepName()
        })
        .onAppear {
            updateCurrentStepName()
        }
    }
    
    func completeStep() {
        for (index, item) in self.model.steps.enumerated() {
            if item.id == self.model.selection {
                self.model.steps[index].node = .icon(Image(systemName: "circle.fill"))
                self.model.objectWillChange.send()
            }
        }
    }
    
    func updateCurrentStepName() {
        self.model.title = self.model.selection
        self.model.objectWillChange.send()
    }
}

struct CustomModelStyleExample: StepStyle {
    var isLast: Bool
    
    func makeNode(configuration: Self.Configuration) -> some View {
        let background = configuration.isPressed ? Color.red : configuration.isSelected ? Color.cyan : Color.gray
        configuration.node
            .foregroundColor(Color.black)
            .background(background.clipShape(Circle()))
    }

    func makeLine(configuration: Configuration) -> some View {
        configuration.line.foregroundColor(self.isLast ? Color.clear : Color.blue)
    }
}
