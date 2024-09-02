import FioriSwiftUICore
import FioriThemeManager
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
                SPICustomStyleExample()
            } label: {
                Text("Steps With Custom Style")
            }
            NavigationLink {
                SPIExampleByBuilder()
            } label: {
                Text("Steps By Builder")
            }
            NavigationLink {
                SPIModelExample()
            } label: {
                Text("Steps By Model")
            }
            NavigationLink {
                SPIExampleWithIcon()
            } label: {
                Text("Steps By Icon")
            }
        }
    }
}

struct StepProgressIndicatorExample_Previews: PreviewProvider {
    static var previews: some View {
        StepProgressIndicatorExample()
    }
}

struct SPIExampleWithIcon: View {
    static let icon = Image(systemName: "app.dashed")
    @State var title: String = ""
    @State var steps = [StepItemData(title: "Sign In", icon: FioriIcon.arrows.initiative, state: .completed),
                        StepItemData(title: "User Info", icon: FioriIcon.people.personPlaceholder, state: .completed),
                        StepItemData(title: "Account Info", icon: FioriIcon.actions.edit, state: .completed),
                        StepItemData(title: "Settings", icon: FioriIcon.actions.actionSettings, state: .normal, substeps: [StepItemData(title: "Settings 1")]),
                        StepItemData(title: "Other0", icon: icon, state: .disabled),
                        StepItemData(title: "Other1", icon: icon, state: .completed),
                        StepItemData(title: "other2", icon: icon, state: .error)]
    @State var selection: String = ""
    var body: some View {
        VStack(alignment: .leading) {
            Text("Icon").bold()
            StepProgressIndicator(selection: self.$selection,
                                  stepItems: self.steps)
            {
                Text(self.$title.wrappedValue).lineLimit(1)
            } action: {
                Button {} label: {
                    HStack(spacing: 2) {
                        Text("All Steps(\(self.steps.count))")
                            .foregroundStyle(Color.preferredColor(.tintColor))
                        FioriIcon.actions.slimArrowRight
                            .font(.fiori(forTextStyle: .subheadline, weight: .semibold))
                            .foregroundStyle(Color.preferredColor(.separator))
                    }
                }
            }
            .stepProgressIndicatorNodeType(.icon)
            Spacer().padding(20)
            Button {
                self.completeStep()
            } label: {
                Text("Mark as Completed")
            }
            .padding(20)
        }
        .padding()
        .onChange(of: self.selection, perform: { _ in
            self.updateCurrentStepName()
        })
        .onAppear {
            self.updateCurrentStepName()
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

struct SPIExampleWithoutHeader: View {
    @State var steps = [StepItemData(title: "Step A", state: .completed),
                        StepItemData(title: "Step B This is a very very long step name Step B This is a very very long step name Step B This is a very very long step name Step B This is a very very long step name Step B This is a very very long step name Step B This is a very very long step name Step B This is a very very long step name Step B This is a very very long step name Step B This is a very very long step name Step B This is a very very long step name Step B This is a very very long step name Step B This is a very very long step name"),
                        StepItemData(title: "Step 3", substeps: [
                            StepItemData(title: "Step 3.1"),
                            StepItemData(title: "Step 3.2", state: .disabled),
                            StepItemData(title: "Step 3.3", state: .error),
                            StepItemData(title: "Step 3.4", state: .error),
                            StepItemData(title: "Step 3.p", state: .completed)
                        ]),
                        StepItemData(title: "Step P", state: .disabled),
                        StepItemData(title: "Step D", state: .error),
                        StepItemData(title: "Step E", state: .error),
                        StepItemData(title: "Step F")]
    
    @State var selection: String = ""

    var body: some View {
        VStack(alignment: .leading) {
            Text("Without Header").bold()
            StepProgressIndicator(selection: self.$selection,
                                  stepItems: self.steps)
            Spacer().padding(20)
            Button {
                self.completeStep()
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
    @State var steps = [StepItemData(title: "Step A", state: .completed),
                        StepItemData(title: "Step B This is a very very long step name Step B This is a very very long step name Step B This is a very very long step name Step B This is a very very long step name Step B This is a very very long step name Step B This is a very very long step name Step B This is a very very long step name Step B This is a very very long step name Step B This is a very very long step name Step B This is a very very long step name Step B This is a very very long step name Step B This is a very very long step name"),
                        StepItemData(title: "Step 3", substeps: [
                            StepItemData(title: "Step 3.1"),
                            StepItemData(title: "Step 3.2", state: .disabled),
                            StepItemData(title: "Step 3.3", state: .error),
                            StepItemData(title: "Step 3.4", state: .error),
                            StepItemData(title: "Step 3.p", state: .completed)
                        ]),
                        StepItemData(title: "Step P", state: .disabled),
                        StepItemData(title: "Step D", state: .error),
                        StepItemData(title: "Step E", state: .error),
                        StepItemData(title: "Step F")]
    
    @State var selection: String = ""
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("With Header").bold()
            StepProgressIndicator(selection: self.$selection, stepItems: self.steps) {
                Text(self.title).lineLimit(1)
            } action: {
                Button {} label: {
                    HStack(spacing: 2) {
                        Text("All Steps(\(self.steps.count)")
                            .foregroundStyle(Color.preferredColor(.tintColor))
                        FioriIcon.actions.slimArrowRight
                            .font(.fiori(forTextStyle: .subheadline, weight: .semibold))
                            .foregroundStyle(Color.preferredColor(.separator))
                    }
                }
            }
            Spacer().padding(20)
            Button {
                self.completeStep()
            } label: {
                Text("Mark as Completed")
            }
            .padding(20)
        }
        .padding()
        .onChange(of: self.selection, perform: { _ in
            self.updateCurrentStepName()
        })
        .onAppear {
            self.updateCurrentStepName()
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
    @State var steps = [StepItemData(),
                        StepItemData(),
                        StepItemData(substeps: [
                            StepItemData(),
                            StepItemData(),
                            StepItemData(state: .completed),
                            StepItemData(state: .error)
                        ]),
                        StepItemData(state: .error),
                        StepItemData(state: .error),
                        StepItemData()]
    
    @State var selection: String = ""
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Steps Without Names").bold()
            
            StepProgressIndicator(selection: self.$selection,
                                  stepItems: self.steps) {} action: {
                Button {} label: {
                    HStack(spacing: 2) {
                        Text("All Steps(\(self.steps.count)")
                            .foregroundStyle(Color.preferredColor(.tintColor))
                        FioriIcon.actions.slimArrowRight
                            .font(.fiori(forTextStyle: .subheadline, weight: .semibold))
                            .foregroundStyle(Color.preferredColor(.separator))
                    }
                }
            }
            Spacer().padding(20)
            Button {
                self.completeStep()
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
            StepProgressIndicator(selection: self.$selection, action: {
                Button {} label: {
                    HStack(spacing: 2) {
                        Text("All Steps(2)")
                            .foregroundStyle(Color.preferredColor(.tintColor))
                        FioriIcon.actions.slimArrowRight
                            .font(.fiori(forTextStyle: .subheadline, weight: .semibold))
                            .foregroundStyle(Color.preferredColor(.separator))
                    }
                }
            }, steps: {
                SingleStep(id: "1") {
                    self.node("1")
                } substeps: {
                    SingleStep(id: "1.1") {
                        self.node("1.1")
                    }
                }

                SingleStep(id: "2") {
                    self.node("2")
                } substeps: {
                    SingleStep(id: "2.1") {
                        self.node("2.1")
                    } substeps: {
                        SingleStep {
                            self.node("2.1.1")
                        }
                        .customStepId("2.1.1")
                    }
                    
                    SingleStep(id: "2.2") {
                        self.node("2.2")
                    } substeps: {
                        SingleStep {
                            self.node("2.2.1")
                        }
                        .customStepId("2.2.1")
                        .stepLineModifier {
                            $0.foregroundColor(.clear)
                        }
                    }
                }
            })
            Spacer()
        }.padding()
            .onChange(of: self.selection) { newValue in
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

struct SPICustomStyleExample: View {
    @State var title: String = ""
    @State var steps = [StepItemData(id: "1", title: "Step A", state: .completed),
                        StepItemData(id: "2", title: "Step B This is a very very long step name Step B This is a very very long step name Step B This is a very very long step name Step B This is a very very long step name Step B This is a very very long step name Step B This is a very very long step name Step B This is a very very long step name Step B This is a very very long step name Step B This is a very very long step name Step B This is a very very long step name Step B This is a very very long step name Step B This is a very very long step name"),
                        StepItemData(id: "3", title: "Step 3", substeps: [
                            StepItemData(title: "Step 3.1"),
                            StepItemData(title: "Step 3.2", state: .disabled),
                            StepItemData(title: "Step 3.3", state: .error),
                            StepItemData(title: "Step 3.4", state: .error),
                            StepItemData(title: "Step 3.p", state: .completed)
                        ]),
                        StepItemData(title: "Step P", state: .disabled),
                        StepItemData(title: "Step D", state: .error),
                        StepItemData(title: "Step E", state: .error),
                        StepItemData(title: "Step F")]
    
    @State var selection: String = ""
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Custom Styles").bold()
            StepProgressIndicator(selection: self.$selection, stepItems: self.steps) {
                Text(self.title).lineLimit(1)
            } action: {
                Button {} label: {
                    HStack(spacing: 2) {
                        Text("All Steps(\(self.steps.count)")
                            .foregroundStyle(Color.preferredColor(.tintColor))
                        FioriIcon.actions.slimArrowRight
                            .font(.fiori(forTextStyle: .subheadline, weight: .semibold))
                            .foregroundStyle(Color.preferredColor(.separator))
                    }
                }
            }
            .stepStyle { _ in
                CustomStyleExample()
            }
            Spacer().padding(20)
            Button {
                self.completeStep()
            } label: {
                Text("Mark as Completed")
            }
            .padding(20)
        }
        .padding()
        .onChange(of: self.selection, perform: { _ in
            self.updateCurrentStepName()
        })
        .onAppear {
            self.updateCurrentStepName()
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

struct CustomStyleExample: StepStyle {
    func makeNode(configuration: Self.Configuration) -> some View {
        let background = configuration.state == .completed ? Color.black : Color.gray
        configuration.node
            .foregroundColor(Color.blue)
            .background(background.clipShape(Circle()))
    }

    func makeLine(configuration: Configuration) -> some View {
        let isLast = configuration.isLastStep
        configuration.line.foregroundColor(isLast ?? false ? Color.clear : nil)
    }
}

struct StepItemData: StepItem {
    var id: String = UUID().uuidString
    /// Step title.
    var title: String?
    /// Node icon
    var icon: Image?
    /// Step state.
    var state: StepProgressIndicatorState = .normal
    /// Sub-steps for this one.
    var substeps: [StepItem] = []
    
    init(id: String = UUID().uuidString,
         title: String? = nil,
         icon: Image? = nil,
         state: StepProgressIndicatorState = [],
         substeps: [StepItemData] = [])
    {
        self.id = id
        self.title = title
        self.icon = icon
        self.state = state
        self.substeps = substeps
    }
}
