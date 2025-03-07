import FioriSwiftUICore
import FioriThemeManager
import SwiftUI

struct StepProgressIndicatorExample: View {
    var body: some View {
        List {
            Section("New") {
                NavigationLink {
                    SPIExampleWithHeader(isDeprecated: false)
                } label: {
                    Text("Steps With Header")
                }
                NavigationLink {
                    SPIExampleWithoutHeader(isDeprecated: false)
                } label: {
                    Text("Steps Without Header")
                }
                NavigationLink {
                    SPIExampleWithoutName(isDeprecated: false)
                } label: {
                    Text("Steps Without Names")
                }
                NavigationLink {
                    SPICustomStyleExample(isDeprecated: false)
                } label: {
                    Text("Steps With Custom Style")
                }
                NavigationLink {
                    SPIExampleByBuilder(isDeprecated: false)
                } label: {
                    Text("Steps By Builder")
                }
                NavigationLink {
                    SPIExampleWithIcon(isDeprecated: false)
                } label: {
                    Text("Steps By Icon")
                }
            }
            
            Section("Deprecated") {
                NavigationLink {
                    SPIExampleWithHeader(isDeprecated: true)
                } label: {
                    Text("Steps With Header")
                }
                NavigationLink {
                    SPIExampleWithoutHeader(isDeprecated: true)
                } label: {
                    Text("Steps Without Header")
                }
                NavigationLink {
                    SPIExampleWithoutName(isDeprecated: true)
                } label: {
                    Text("Steps Without Names")
                }
                NavigationLink {
                    SPICustomStyleExample(isDeprecated: true)
                } label: {
                    Text("Steps With Custom Style")
                }
                NavigationLink {
                    SPIExampleByBuilder(isDeprecated: true)
                } label: {
                    Text("Steps By Builder")
                }
                NavigationLink {
                    SPIModelExample()
                } label: {
                    Text("Steps By Model")
                }
                NavigationLink {
                    SPIExampleWithIcon(isDeprecated: true)
                } label: {
                    Text("Steps By Icon")
                }
            }
        }
    }
}

struct SPIExampleWithIcon: View {
    let isDeprecated: Bool
    @State var title: String = ""
    @State var iconSteps = [StepItemData(title: "Sign In", node: .icon(FioriIcon.arrows.initiative), state: .completed),
                            StepItemData(title: "User Info", node: .icon(FioriIcon.people.personPlaceholder), state: .completed),
                            StepItemData(title: "Account Info", node: .icon(FioriIcon.actions.edit), state: .completed),
                            StepItemData(title: "Settings", node: .icon(FioriIcon.actions.actionSettings), state: .normal, substeps: [StepItemData(title: "Settings 1")]),
                            StepItemData(title: "Other0", node: .icon(Image(systemName: "app.dashed")), state: .disabled),
                            StepItemData(title: "Other1", node: .icon(Image(systemName: "app.dashed")), state: .completed),
                            StepItemData(title: "other2", node: .icon(Image(systemName: "app.dashed")), state: .error)]
    @State var textSteps = [StepItemData(title: "Sign In", state: .completed),
                            StepItemData(title: "User Info", node: .text("AB"), state: .completed),
                            StepItemData(title: "Account Info", state: .completed),
                            StepItemData(title: "Settings", node: .text("AD"), state: .normal, substeps: [StepItemData(title: "Settings 1")]),
                            StepItemData(title: "Other0", state: .disabled),
                            StepItemData(title: "Other1", state: .completed),
                            StepItemData(title: "other2", state: .error)]
    @State var iconSelection: String = ""
    @State var textSelection: String = ""
    var body: some View {
        VStack(alignment: .leading) {
            Text("Step: Only Icon Node").bold()
            Group {
                if self.isDeprecated {
                    _StepProgressIndicator(selection: self.$iconSelection,
                                           stepItems: self.iconSteps)
                    {
                        Text(self.$title.wrappedValue).lineLimit(1)
                    } action: {
                        Button {} label: {
                            HStack(spacing: 2) {
                                Text("All Steps(\(self.iconSteps.count))")
                                    .foregroundStyle(Color.preferredColor(.tintColor))
                                FioriIcon.actions.slimArrowRight
                                    .font(.fiori(forTextStyle: .subheadline, weight: .semibold))
                                    .foregroundStyle(Color.preferredColor(.separator))
                            }
                        }
                    }
                } else {
                    StepProgressIndicator(selection: self.$iconSelection,
                                          stepItems: self.iconSteps)
                    {
                        Text(self.$title.wrappedValue).lineLimit(1)
                    } action: {
                        Button {} label: {
                            HStack(spacing: 2) {
                                Text("All Steps(\(self.iconSteps.count))")
                                    .foregroundStyle(Color.preferredColor(.tintColor))
                                FioriIcon.actions.slimArrowRight
                                    .font(.fiori(forTextStyle: .subheadline, weight: .semibold))
                                    .foregroundStyle(Color.preferredColor(.separator))
                            }
                        }
                    }
                }
            }
            .padding()
            .onChange(of: self.iconSelection) {
                self.updateCurrentStepName()
            }
            .onAppear {
                self.updateCurrentStepName()
            }
            
            Text("Step: Only Text Node").bold()
            if self.isDeprecated {
                _StepProgressIndicator(selection: self.$textSelection,
                                       stepItems: self.textSteps)
                {
                    Text("Invariant title").lineLimit(1)
                } action: {}
                    .padding()
            } else {
                StepProgressIndicator(selection: self.$textSelection,
                                      stepItems: self.textSteps)
                {
                    Text("Invariant title").lineLimit(1)
                } action: {}
                    .padding()
            }
            Spacer().padding(20)
            Button {
                self.completeStep()
            } label: {
                Text("Mark as Completed")
            }
            .padding(20)
        }
    }
    
    func getStep() -> StepItem? {
        func findStep(in data: [StepItem]) -> StepItem? {
            for step in data {
                if step.id == self.iconSelection {
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
        return findStep(in: self.iconSteps)
    }
    
    func updateCurrentStepName() {
        let selectedTitle = "\(getStep()?.title ?? "no title")"
        if self.title != selectedTitle {
            self.title = selectedTitle
        }
    }
    
    func completeStep() {
        for index in self.iconSteps.indices {
            if self.iconSteps[index].id == self.iconSelection {
                self.iconSteps[index].state = .completed
            } else {
                let substeps = self.iconSteps[index].substeps
                guard !substeps.isEmpty else { continue }
                for subindex in substeps.indices {
                    if substeps[subindex].id == self.iconSelection {
                        self.iconSteps[index].substeps[subindex].state = .completed
                    }
                }
            }
        }
    }
}

struct SPIExampleWithoutHeader: View {
    let isDeprecated: Bool
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
            if self.isDeprecated {
                _StepProgressIndicator(selection: self.$selection,
                                       stepItems: self.steps)
            } else {
                StepProgressIndicator(selection: self.$selection,
                                      stepItems: self.steps)
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
    let isDeprecated: Bool
    
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
            if self.isDeprecated {
                _StepProgressIndicator(selection: self.$selection, stepItems: self.steps) {
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
            } else {
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
        .onChange(of: self.selection) {
            self.updateCurrentStepName()
        }
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
    let isDeprecated: Bool
    
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
            if self.isDeprecated {
                _StepProgressIndicator(selection: self.$selection,
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
            } else {
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
    let isDeprecated: Bool
    @State var selection: String = ""
    var body: some View {
        ScrollView(.vertical) {
            if self.isDeprecated {
                _StepProgressIndicator(selection: self.$selection, action: {
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
                    _SingleStep(id: "1") {
                        self.node("1")
                    } substeps: {
                        _SingleStep(id: "1.1") {
                            self.node("1.1")
                        }
                    }
                    
                    _SingleStep(id: "2") {
                        self.node("2")
                    } substeps: {
                        _SingleStep(id: "2.1") {
                            self.node("2.1")
                        } substeps: {
                            _SingleStep {
                                self.node("2.1.1")
                            }
                            .customStepId("2.1.1")
                        }
                        
                        _SingleStep(id: "2.2") {
                            self.node("2.2")
                        } substeps: {
                            _SingleStep {
                                self.node("2.2.1")
                            }
                            .customStepId("2.2.1")
                            .stepLineModifier {
                                $0.foregroundColor(.clear)
                            }
                        }
                    }
                })
            } else {
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
                        .nodeStyle { c in
                            c.node.foregroundStyle(Color.preferredColor(.negativeLabel))
                        }
                    }
                    .nodeStyle { c in
                        c.node.font(Font.fiori(fixedSize: 16))
                            .foregroundStyle(Color.preferredColor(.blue7))
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
                        }
                        
                        SingleStep(id: "2.2") {
                            self.node("2.2")
                        } substeps: {
                            SingleStep {
                                self.node("2.2.1")
                            }
                            // stepLineModifier will be deprecated, please use the latest modifier.
                            .lineStyle { c in
                                c.line.foregroundStyle(Color.clear)
                            }
                        }
                    }
                    .nodeStyle { c in
                        c.node.font(Font.fiori(fixedSize: 12))
                    }
                    .lineStyle { c in
                        c.line.foregroundStyle(Color.preferredColor(.negativeLabel))
                    }
                })
            }
            Spacer()
        }.padding()
            .onChange(of: self.selection) {
                print(self.selection)
            }
    }
    
    @ViewBuilder
    func node(_ s: String, _ background: Color = Color.random) -> some View {
        ZStack {
            background
            Text(s)
        }
        .frame(width: 40, height: 40)
        .border(self.selection == s ? Color.black : Color.clear, width: 2)
    }
}

struct SPICustomStyleExample: View {
    let isDeprecated: Bool
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
            if self.isDeprecated {
                _StepProgressIndicator(selection: self.$selection, stepItems: self.steps) {
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
            } else {
                StepProgressIndicator(selection: self.$selection, stepItems: self.steps) {
                    Text(self.title).lineLimit(1)
                } action: {
                    Button {} label: {
                        HStack(spacing: 2) {
                            Text("All Steps(\(self.steps.count)")
                            FioriIcon.actions.slimArrowRight
                                .font(.fiori(forTextStyle: .subheadline, weight: .semibold))
                                .foregroundStyle(Color.preferredColor(.separator))
                        }
                    }
                }
                .stepStyle { _ in
                    CustomStyleExample()
                }
                .titleStyle { c in
                    c.title.font(.fiori(forTextStyle: .title1, weight: .semibold))
                        .foregroundStyle(Color.preferredColor(.tintColor))
                }
                .actionStyle { c in
                    c.action.foregroundStyle(Color.preferredColor(.negativeLabel))
                }
                .cancelActionStyle { c in
                    c.cancelAction.font(.fiori(forTextStyle: .subheadline)).foregroundStyle(Color.preferredColor(.negativeLabel))
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
        .onChange(of: self.selection) {
            self.updateCurrentStepName()
        }
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
    /// Step node
    var node: TextOrIcon?
    /// Step state.
    var state: StepProgressIndicatorState = .normal
    /// Sub-steps for this one.
    var substeps: [StepItem] = []
    
    init(id: String = UUID().uuidString,
         title: String? = nil,
         node: TextOrIcon? = nil,
         state: StepProgressIndicatorState = [],
         substeps: [StepItemData] = [])
    {
        self.id = id
        self.title = title
        self.node = node
        self.state = state
        self.substeps = substeps
    }
}
