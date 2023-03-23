import FioriSwiftUICore
import SwiftUI

struct StepProgressIndicatorExample: View {
    @State var selection = IndexPath(item: 0, section: 0)
    @State var selection2 = IndexPath(item: 0, section: 0)
    @State var currentStepName: String = ""
    
    struct StepExampleData: StepModel {
        var name: String?
        var overText: String?
        var state: StepIndicatorState
    }
    
    @State var steps = [[StepExampleData(name: "Step A", overText: "1", state: .completed)],
                        [StepExampleData(name: "Step B This is a very very long step name Step B This is a very very long step name Step B This is a very very long step name Step B This is a very very long step name Step B This is a very very long step name Step B This is a very very long step name Step B This is a very very long step name Step B This is a very very long step name Step B This is a very very long step name Step B This is a very very long step name Step B This is a very very long step name Step B This is a very very long step name", overText: "2", state: .active)],
                        [StepExampleData(name: "Step 3", overText: "3", state: .inactive),
                         StepExampleData(name: "Step 3.1", state: .inactive),
                         StepExampleData(name: "Step 3.2", state: .disabled),
                         StepExampleData(name: "Step 3.3", state: .error),
                         StepExampleData(name: "Step 3.4", state: .errorActive),
                         StepExampleData(name: "Step 3.p", state: .completed)],
                        [StepExampleData(name: "Step P", overText: "4", state: .disabled)],
                        [StepExampleData(name: "Step D", overText: "5", state: .errorActive)],
                        [StepExampleData(name: "Step E", overText: "6", state: .error)],
                        [StepExampleData(name: "Step F", overText: "7", state: .inactive)]]
    
    var body: some View {
        ScrollView(.vertical) {
            VStack(alignment: .leading) {
                Text("Without Header").bold()
                StepProgressIndicatorView(selection: $selection,
                                          stepsData: steps)
                Text("With Header").bold()
                StepProgressIndicatorView(selection: $selection, stepsData: steps) {
                    Text(currentStepName).lineLimit(1)
                } allStepsAction: {
                    HStack(spacing: 2) {
                        Text("All Steps(7)")
                        Image(systemName: "chevron.right")
                    }
                }
                Text("Just Two Steps").bold()
                let steps2 = [[StepExampleData(name: "Step A", overText: "1", state: .completed)],
                              [StepExampleData(name: "Step B", overText: "2", state: .inactive)]]
                StepProgressIndicatorView(selection: $selection2,
                                          stepsData: steps2)
                
                Text("Steps Without Names").bold()
                let steps3 = [[StepExampleData(state: .completed)],
                              [StepExampleData(state: .inactive)],
                              [StepExampleData(state: .active)],
                              [StepExampleData(state: .inactive),
                               StepExampleData(state: .active),
                               StepExampleData(state: .completed),
                               StepExampleData(state: .error),
                               StepExampleData(state: .errorActive)],
                              [StepExampleData(state: .error)],
                              [StepExampleData(state: .errorActive)]]
                StepProgressIndicatorView(selection: $selection2,
                                          stepsData: steps3)
                Spacer().padding(20)
                Button {
                    steps[selection.section][selection.row].state = .completed
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
        let step = self.steps[self.selection.section][self.selection.row]
        let selectedName = "\(selection.section + 1).\(self.selection.row): \(step.name ?? "")"
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
