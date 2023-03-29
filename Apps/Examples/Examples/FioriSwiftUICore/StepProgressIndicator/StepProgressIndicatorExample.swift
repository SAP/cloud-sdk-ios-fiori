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
    @State var steps = [StepItem(title: "Step A", state: .completed),
                        StepItem(title: "Step B This is a very very long step name Step B This is a very very long step name Step B This is a very very long step name Step B This is a very very long step name Step B This is a very very long step name Step B This is a very very long step name Step B This is a very very long step name Step B This is a very very long step name Step B This is a very very long step name Step B This is a very very long step name Step B This is a very very long step name Step B This is a very very long step name"),
                        StepItem(title: "Step 3", children: [
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
    
    @State var selection = UUID()

    var body: some View {
        VStack(alignment: .leading) {
            Text("Without Header").bold()
            StepProgressIndicator(selection: $selection,
                                  stepsData: steps)
            Spacer().padding(20)
            Button {
                completeStep()
            } label: {
                Text("Mark as Completed")
            }
            .padding(20)
        }
    }
    
    func completeStep() {
        for index in self.steps.indices {
            if self.steps[index].id == self.selection {
                self.steps[index].state = .completed
            } else {
                if let children = steps[index].children {
                    for subindex in children.indices {
                        if children[subindex].id == self.selection {
                            self.steps[index].children?[subindex].state = .completed
                        }
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
                        StepItem(title: "Step 3", children: [
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
    
    @State var selection = UUID()
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("With Header").bold()
            StepProgressIndicator(selection: $selection, stepsData: steps) {
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
    
    func updateCurrentStepName() {
        for index in self.steps.indices {
            if self.steps[index].id == self.selection {
                let selectedTitle = "\(steps[index].title ?? "no title")"
                if self.title != selectedTitle {
                    self.title = selectedTitle
                }
            }
        }
    }
    
    func completeStep() {
        for index in self.steps.indices {
            if self.steps[index].id == self.selection {
                self.steps[index].state = .completed
            } else {
                if let children = steps[index].children {
                    for subindex in children.indices {
                        if children[subindex].id == self.selection {
                            self.steps[index].children?[subindex].state = .completed
                        }
                    }
                }
            }
        }
    }
}

struct SPIExampleWithoutName: View {
    @State var steps = [StepItem(),
                        StepItem(),
                        StepItem(children: [
                            StepItem(),
                            StepItem(),
                            StepItem(state: .completed),
                            StepItem(state: .error)
                        ]),
                        StepItem(state: .error),
                        StepItem(state: .error),
                        StepItem()]
    
    @State var selection = UUID()
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Steps Without Names").bold()
            
            StepProgressIndicator(selection: $selection,
                                  stepsData: steps)
            Spacer().padding(20)
            Button {
                completeStep()
            } label: {
                Text("Mark as Completed")
            }
            .padding(20)
        }
    }
    
    func completeStep() {
        for index in self.steps.indices {
            if self.steps[index].id == self.selection {
                self.steps[index].state = .completed
            } else {
                if let children = steps[index].children {
                    for subindex in children.indices {
                        if children[subindex].id == self.selection {
                            self.steps[index].children?[subindex].state = .completed
                        }
                    }
                }
            }
        }
    }
}
