import FioriSwiftUICore
import SwiftUI

struct StepProgressIndicatorExample: View {
    @State var selection: Int = 0
    @State var selection2: Int = 0
    @State var currentStepName: String = ""

    struct StepExampleData: StepModel {
        var name: String?
        var node: String?
        var state: StepIndicatorState
    }

    @State var steps = [StepExampleData(name: "Step A", node: "1", state: .completed),
                        StepExampleData(name: "Step B This is a very very long step name Step B This is a very very long step name Step B This is a very very long step name Step B This is a very very long step name Step B This is a very very long step name Step B This is a very very long step name Step B This is a very very long step name Step B This is a very very long step name Step B This is a very very long step name Step B This is a very very long step name Step B This is a very very long step name Step B This is a very very long step name", node: "2", state: .normal),
                        StepExampleData(name: "Step 3", node: "3", state: .normal),
                        StepExampleData(name: "Step 3.1", state: .normal),
                        StepExampleData(name: "Step 3.2", state: .disabled),
                        StepExampleData(name: "Step 3.3", state: .error),
                        StepExampleData(name: "Step 3.4", state: .error),
                        StepExampleData(name: "Step 3.p", state: .completed),
                        StepExampleData(name: "Step P", node: "4", state: .disabled),
                        StepExampleData(name: "Step D", node: "5", state: .error),
                        StepExampleData(name: "Step E", node: "6", state: .error),
                        StepExampleData(name: "Step F", node: "7", state: .normal)]

    var body: some View {
        ScrollView(.vertical) {
            VStack(alignment: .leading) {
                Text("Without Header").bold()
                StepProgressIndicator(selection: $selection,
                                      stepsData: steps)
                Text("With Header").bold()
                StepProgressIndicator(selection: $selection, stepsData: steps) {
                    Text(currentStepName).lineLimit(1)
                } allStepsAction: {
                    HStack(spacing: 2) {
                        Text("All Steps(7)")
                        Image(systemName: "chevron.right")
                    }
                }
                Text("Just Two Steps").bold()
                let steps2 = [StepExampleData(name: "Step A", node: "", state: .completed),
                              StepExampleData(name: "Step B", node: "2", state: .normal)]
                StepProgressIndicator(selection: $selection2,
                                      stepsData: steps2)
                
                Text("Steps Without Names").bold()
                let steps3 = [StepExampleData(node: "1", state: .completed),
                              StepExampleData(node: "2", state: .normal),
                              StepExampleData(node: "3", state: .normal),
                              StepExampleData(state: .normal),
                              StepExampleData(state: .normal),
                              StepExampleData(state: .completed),
                              StepExampleData(state: .error),
                              StepExampleData(node: "4", state: .error),
                              StepExampleData(node: "5", state: .error),
                              StepExampleData(node: "6", state: .normal)]
                StepProgressIndicator(selection: $selection2,
                                      stepsData: steps3)
                Spacer().padding(20)
                Button {
                    steps[selection].state = .completed
                } label: {
                    Text("Mark as Completed")
                }
                .padding(20)
            }
        }
        .padding()
        .onChange(of: selection, perform: { _ in
            updateCurrentStepName()
        })
        .onAppear {
            updateCurrentStepName()
        }
    }

    func updateCurrentStepName() {
        let step = self.steps[self.selection]
        let selectedName = "\(step.name ?? "no name")"
        if self.currentStepName != selectedName {
            self.currentStepName = selectedName
        }
    }
}

struct StepProgressIndicatorExample_Previews: PreviewProvider {
    static var previews: some View {
        StepProgressIndicatorExample()
    }
}
