import FioriSwiftUICore
import SwiftUI

struct StepProgressIndicatorExample: View {
    var body: some View {
        List {
            NavigationLink {
                SPIExampleWithHeader()
            } label: {
                Text("Steps With Header")
            }
            NavigationLink {
                SPIExampleWithoutHeader()
            } label: {
                Text("Steps Without Header")
            }
            NavigationLink {
                SPIExampleWithoutName()
            } label: {
                Text("Steps Without Names")
            }
        }
    }
}

struct StepProgressIndicatorExample_Previews: PreviewProvider {
    static var previews: some View {
        StepProgressIndicatorExample()
    }
}

struct SPIExampleWithoutHeader: View {
    @State var selection: Int = 0
    @State var steps = StepExampleData().steps

    var body: some View {
        VStack(alignment: .leading) {
            Text("Without Header").bold()
            StepProgressIndicator(selection: $selection,
                                  stepsData: steps)
            Spacer().padding(20)
            Button {
                steps[selection].state = .completed
            } label: {
                Text("Mark as Completed")
            }
            .padding(20)
        }
    }
}

struct SPIExampleWithHeader: View {
    @State var selection: Int = 0
    @State var title: String = ""
    @State var steps = StepExampleData().steps
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("With Header").bold()
            StepProgressIndicator(selection: $selection, stepsData: steps) {
                Text(title).lineLimit(1)
            } action: {
                HStack(spacing: 2) {
                    Text("All Steps(7)")
                    Image(systemName: "chevron.right")
                }
            }
            Spacer().padding(20)
            Button {
                steps[selection].state = .completed
            } label: {
                Text("Mark as Completed")
            }
            .padding(20)
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
        let selectedTitle = "\(step.title ?? "no title")"
        if self.title != selectedTitle {
            self.title = selectedTitle
        }
    }
}

struct SPIExampleWithoutName: View {
    @State var selection: Int = 0
    @State var steps = [StepExampleModel(node: "1", state: .completed),
                        StepExampleModel(node: "2", state: .normal),
                        StepExampleModel(node: "3", state: .normal),
                        StepExampleModel(state: .normal),
                        StepExampleModel(state: .normal),
                        StepExampleModel(state: .completed),
                        StepExampleModel(state: .error),
                        StepExampleModel(node: "4", state: .error),
                        StepExampleModel(node: "5", state: .error),
                        StepExampleModel(node: "6", state: .normal)]
    var body: some View {
        VStack(alignment: .leading) {
            Text("Steps Without Names").bold()
            
            StepProgressIndicator(selection: $selection,
                                  stepsData: steps)
            Spacer().padding(20)
            Button {
                steps[selection].state = .completed
            } label: {
                Text("Mark as Completed")
            }
            .padding(20)
        }
    }
}

struct StepExampleModel: StepModel {
    var title: String?
    var node: String?
    var state: StepIndicatorState
}

struct StepExampleData {
    @State var steps = [StepExampleModel(title: "Step A", node: "1", state: .completed),
                        StepExampleModel(title: "Step B This is a very very long step name Step B This is a very very long step name Step B This is a very very long step name Step B This is a very very long step name Step B This is a very very long step name Step B This is a very very long step name Step B This is a very very long step name Step B This is a very very long step name Step B This is a very very long step name Step B This is a very very long step name Step B This is a very very long step name Step B This is a very very long step name", node: "2", state: .normal),
                        StepExampleModel(title: "Step 3", node: "3", state: .normal),
                        StepExampleModel(title: "Step 3.1", state: .normal),
                        StepExampleModel(title: "Step 3.2", state: .disabled),
                        StepExampleModel(title: "Step 3.3", state: .error),
                        StepExampleModel(title: "Step 3.4", state: .error),
                        StepExampleModel(title: "Step 3.p", state: .completed),
                        StepExampleModel(title: "Step P", node: "4", state: .disabled),
                        StepExampleModel(title: "Step D", node: "5", state: .error),
                        StepExampleModel(title: "Step E", node: "6", state: .error),
                        StepExampleModel(title: "Step F", node: "7", state: .normal)]
}
