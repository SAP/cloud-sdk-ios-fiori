import FioriSwiftUICore
import FioriThemeManager
import SwiftUI

struct ProgressIndicatorExample: View {
    @State var progress: Double = 0.0
    @State var textInput: String = "0.5"
    @State var progressState1 = ProgressViewState.processing
    @State var progressState2 = ProgressViewState.processing
    
    var body: some View {
        VStack {
            HStack {
                TextField("", text: self.$textInput)
                Button("Set Progress") {
                    self.progress = Double(self.textInput) ?? 0.0
                }
            }.padding()
            HStack {
                Text("Loading Pausable").onTapGesture(perform: { print("test") })
                Spacer()
                ProgressIndicatorView(indicatorProgress: self.$progress, progressState: self.$progressState1)
                    .simultaneousGesture(TapGesture().onEnded {
                        self.pausableTapped(state: &self.progressState1)
                    })
            }
            .padding()
            HStack {
                Text("Loading Stoppable")
                Spacer()
                ProgressIndicatorView(indicatorProgress: self.$progress, progressState: self.$progressState2)
                    .simultaneousGesture(TapGesture().onEnded {
                        self.stoppableTapped(state: &self.progressState2)
                    })
            }.padding()
            HStack {
                Button("Set Loading") {
                    self.progressState1 = .loadingPausable
                    self.progressState2 = .loadingStoppable
                }
                Spacer()
                Button("Set Paused") {
                    self.progressState1 = .paused
                }
            }.padding()
        }
    }
    
    func pausableTapped(state: inout ProgressViewState) {
        if state == .processing {
            state = .loadingPausable
        } else if state == .loadingPausable {
            state = .paused
        } else if state == .paused {
            state = .loadingPausable
        }
    }
    
    func stoppableTapped(state: inout ProgressViewState) {
        if state == .processing {
            state = .loadingStoppable
        } else {
            state = .processing
        }
    }
}

struct ProgressIndicatorExample_Previews: PreviewProvider {
    static var previews: some View {
        ProgressIndicatorExample()
    }
}
