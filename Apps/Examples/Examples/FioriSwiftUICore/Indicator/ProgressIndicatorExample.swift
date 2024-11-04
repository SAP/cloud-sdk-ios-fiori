import FioriSwiftUICore
import FioriThemeManager
import SwiftUI

struct ProgressIndicatorExample: View {
    @State var progress: Double = 0.0
    @State var textInput: String = "0.5"
    @State var isPaused: Bool = false
    @State var isProcessing1: Bool = true
    @State var isProcessing2: Bool = true
    
    var body: some View {
        VStack {
            HStack {
                TextField("", text: self.$textInput)
                Button("Set Progress") {
                    self.progress = Double(self.textInput) ?? 0.0
                }
            }.padding()
            HStack {
                Text("Loading Pausable")
                Spacer()
                if self.isProcessing1 {
                    ProgressIndicatorView(progress: self.$progress)
                        .progressIndicatorViewStyle(.processing)
                        .simultaneousGesture(TapGesture().onEnded {
                            self.isProcessing1.toggle()
                        })
                } else {
                    ProgressIndicatorView(progress: self.$progress)
                        .progressIndicatorViewStyle(ProgressIndicatorViewPausableStyle(isPaused: self.$isPaused))
                        .simultaneousGesture(TapGesture().onEnded {
                            self.isPaused.toggle()
                        })
                }
            }.padding()
            HStack {
                Text("Loading Stoppable")
                Spacer()
                if self.isProcessing2 {
                    ProgressIndicatorView(progress: self.$progress)
                        .progressIndicatorViewStyle(.processing)
                        .simultaneousGesture(TapGesture().onEnded {
                            self.isProcessing2.toggle()
                        })
                } else {
                    ProgressIndicatorView(progress: self.$progress)
                        .progressIndicatorViewStyle(.stoppable)
                }
            }.padding()
            HStack {
                Button("Set Loading") {
                    self.isProcessing1 = false
                    self.isProcessing2 = false
                }
                Spacer()
                Button("Set Paused") {
                    self.isPaused.toggle()
                }
            }.padding()
        }
    }
}

struct ProgressIndicatorExample_Previews: PreviewProvider {
    static var previews: some View {
        ProgressIndicatorExample()
    }
}
