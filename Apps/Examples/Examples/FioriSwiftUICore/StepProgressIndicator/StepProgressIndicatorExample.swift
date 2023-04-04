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
            
            NavigationLink {
                SPIExampleByBuilder()
            } label: {
                Text("Steps By Builder")
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
    @State var steps = [StepItem(title: "Step A", state: .completed),
                        StepItem(title: "Step B This is a very very long step name Step B This is a very very long step name Step B This is a very very long step name Step B This is a very very long step name Step B This is a very very long step name Step B This is a very very long step name Step B This is a very very long step name Step B This is a very very long step name Step B This is a very very long step name Step B This is a very very long step name Step B This is a very very long step name Step B This is a very very long step name"),
                        StepItem(title: "Step 3", substeps: [
                            StepItem(title: "Step 3.1"),
                            StepItem(title: "Step 3.2", state: .disabled),
                            StepItem(title: "Step 3.3", state: .error),
                            StepItem(title: "Step 3.4", state: .error),
                            StepItem(title: "Step 3.p", state: .completed)
                        ]),
                        StepItem(title: "Step P", state: .disabled),
                        StepItem(title: "Step D", state: .error),
                        StepItem(title: "Step E", state: .error),
                        StepItem(title: "Step F")]
    
    @State var selection: String = ""

    var body: some View {
        VStack(alignment: .leading) {
            Text("Without Header").bold()
            StepProgressIndicator(selection: $selection,
                                  stepItems: steps)
            Spacer().padding(20)
            Button {
                completeStep()
            } label: {
                Text("Mark as Completed")
            }
            .padding(20)
        }
        .padding()
    }
    
    func completeStep() {
        for index in self.steps.indices {
            if self.steps[index].id == self.selection {
                self.steps[index].state = .completed
            } else {
                let substeps = self.steps[index].substeps
                guard !substeps.isEmpty else { continue }
                for subindex in substeps.indices {
                    if substeps[subindex].id == self.selection {
                        self.steps[index].substeps[subindex].state = .completed
                    }
                }
            }
        }
    }
}

struct SPIExampleWithHeader: View {
    @State var title: String = ""
    @State var steps = [StepItem(title: "Step A", state: .completed),
                        StepItem(title: "Step B This is a very very long step name Step B This is a very very long step name Step B This is a very very long step name Step B This is a very very long step name Step B This is a very very long step name Step B This is a very very long step name Step B This is a very very long step name Step B This is a very very long step name Step B This is a very very long step name Step B This is a very very long step name Step B This is a very very long step name Step B This is a very very long step name"),
                        StepItem(title: "Step 3", substeps: [
                            StepItem(title: "Step 3.1"),
                            StepItem(title: "Step 3.2", state: .disabled),
                            StepItem(title: "Step 3.3", state: .error),
                            StepItem(title: "Step 3.4", state: .error),
                            StepItem(title: "Step 3.p", state: .completed)
                        ]),
                        StepItem(title: "Step P", state: .disabled),
                        StepItem(title: "Step D", state: .error),
                        StepItem(title: "Step E", state: .error),
                        StepItem(title: "Step F")]
    
    @State var selection: String = ""
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("With Header").bold()
            StepProgressIndicator(selection: $selection, stepItems: steps) {
                Text(title).lineLimit(1)
            } action: {
                HStack(spacing: 2) {
                    Text("All Steps(\(steps.count)")
                    Image(systemName: "chevron.right")
                }
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
        .onChange(of: selection, perform: { _ in
            updateCurrentStepName()
        })
        .onAppear {
            updateCurrentStepName()
        }
    }
    
    func getStep() -> StepItem? {
        func findStep(in data: [StepItem]) -> StepItem? {
            for step in data {
                if step.id == self.selection {
                    return step
                }
                
                if !step.substeps.isEmpty {
                    if let foundItem = findStep(in: step.substeps) {
                        return foundItem
                    } else {
                        continue
                    }
                }
            }
            
            return nil
        }
        return findStep(in: self.steps)
    }
    
    func updateCurrentStepName() {
        let selectedTitle = "\(getStep()?.title ?? "no title")"
        if self.title != selectedTitle {
            self.title = selectedTitle
        }
    }
    
    func completeStep() {
        for index in self.steps.indices {
            if self.steps[index].id == self.selection {
                self.steps[index].state = .completed
            } else {
                let substeps = self.steps[index].substeps
                guard !substeps.isEmpty else { continue }
                for subindex in substeps.indices {
                    if substeps[subindex].id == self.selection {
                        self.steps[index].substeps[subindex].state = .completed
                    }
                }
            }
        }
    }
}

struct SPIExampleWithoutName: View {
    @State var steps = [StepItem(),
                        StepItem(),
                        StepItem(substeps: [
                            StepItem(),
                            StepItem(),
                            StepItem(state: .completed),
                            StepItem(state: .error)
                        ]),
                        StepItem(state: .error),
                        StepItem(state: .error),
                        StepItem()]
    
    @State var selection: String = ""
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Steps Without Names").bold()
            
            StepProgressIndicator(selection: $selection,
                                  stepItems: steps) {} action: {
                HStack(spacing: 2) {
                    Text("All Steps(\(steps.count)")
                    Image(systemName: "chevron.right")
                }
            }
            Spacer().padding(20)
            Button {
                completeStep()
            } label: {
                Text("Mark as Completed")
            }
            .padding(20)
        }.padding()
    }
    
    func completeStep() {
        for index in self.steps.indices {
            if self.steps[index].id == self.selection {
                self.steps[index].state = .completed
            } else {
                let substeps = self.steps[index].substeps
                guard !substeps.isEmpty else { continue }
                for subindex in substeps.indices {
                    if substeps[subindex].id == self.selection {
                        self.steps[index].substeps[subindex].state = .completed
                    }
                }
            }
        }
    }
}

struct SPIExampleByBuilder: View {
    @State var selection: String = ""
    var body: some View {
        VStack {
            StepProgressIndicator(selection: $selection, action: {
                HStack(spacing: 2) {
                    Text("All Steps(2)")
                    Image(systemName: "chevron.right")
                }
            }, steps: {
                SingleStep(stepId: "1") {
                    node("1")
                } substeps: {
                    SingleStep(stepId: "1.1") {
                        node("1.1")
                        
                    }.stepLineColor(Color.random)
                }
                .stepLineColor(Color.random)

                SingleStep(stepId: "2") {
                    node("2")
                } substeps: {
                    SingleStep(stepId: "2.1") {
                        node("2.1")
                    } substeps: {
                        SingleStep {
                            node("2.1.1")
                        }
                        .customStepId("2.1.1")
                        .stepLineColor(Color.random)
                    }
                    .stepLineColor(Color.random)
                    
                    SingleStep(stepId: "2.2") {
                        node("2.2")
                    } substeps: {
                        SingleStep {
                            node("2.2.1")
                        }
                        .customStepId("2.2.1")
                        .stepLineColor(Color.random)
                    }
                    .stepLineColor(Color.random)
                }.stepLineColor(Color.random)
            })
            Spacer()
        }.padding()
            .onChange(of: selection) { newValue in
                print(newValue)
            }
    }
    
    @ViewBuilder
    func node(_ s: String, _ background: Color = Color.random) -> some View {
        ZStack {
            background
            Text(s).font(Font.fiori(fixedSize: 10))
        }
        .frame(width: 40, height: 40)
        .border(self.selection == s ? Color.black : Color.clear, width: 2)
    }
}
