import FioriSwiftUICore
import SwiftUI

struct LinearProgressIndicatorExample: View {
    @State var progress1: Double = 0.3
    @State var progress2: Double = 0.1
    @State var progress3: Double = 0.0
    @State var progress4: Double = 1.0
    
    var body: some View {
        VStack {
            Text("Determinate without Label")
            LinearProgressIndicator(indicatorProgress: $progress1)
                .linearProgressIndicatorStyle(.determinate)
                .padding(.bottom, 20)
            
            Text("Determinate with Label")
            LinearProgressIndicatorView(indicatorProgress: $progress2, icon: Image(systemName: "heart"), description: AttributedString("Loading..."))
                .linearProgressIndicatorStyle(.determinate)
                .padding(.bottom, 20)
            
            FioriButton(
                action: { _ in
                    if progress2 > 0.9 {
                        progress2 = 0
                    } else {
                        progress2 += 0.1
                    }
                },
                label: { _ in
                    Text("Increment Progress")
                }
            )
            .disabled(false)
            .fioriButtonStyle(FioriPrimaryButtonStyle().eraseToAnyFioriButtonStyle())
            .padding(.bottom, 20)
            
            Text("Error style")
            LinearProgressIndicatorView(indicatorProgress: $progress4, description: AttributedString("Loading..."))
                .linearProgressIndicatorViewStyle(.error)
                .padding(.bottom, 20)
            
            Text("Success style")
            LinearProgressIndicatorView(indicatorProgress: $progress4, description: AttributedString("Loading complete successfully. Please see the user registration view for more detail information."))
                .linearProgressIndicatorViewStyle(.success)
                .padding(.bottom, 20)
            
            Text("Indeterminate without Label")
            LinearProgressIndicator(indicatorProgress: $progress3)
                .linearProgressIndicatorStyle(.indeterminate)
                .padding(.bottom, 20)
            
            Text("Indeterminate with Label")
            LinearProgressIndicatorView(indicatorProgress: $progress3, icon: Image(systemName: "heart"), description: AttributedString("Loading..."))
                .linearProgressIndicatorStyle(.indeterminate)
                .padding(.bottom, 20)
            
            Text("Indeterminate customized")
            LinearProgressIndicatorView(indicatorProgress: $progress3, icon: Image(systemName: "clock"), description: AttributedString("Downloading..."))
                .iconStyle { iconConfiguration in
                    iconConfiguration.icon
                        .font(.fiori(forTextStyle: .headline)).bold()
                        .foregroundColor(.green)
                }
                .descriptionStyle { descriptionConfiguration in
                    descriptionConfiguration.description
                        .font(.fiori(forTextStyle: .headline))
                        .foregroundColor(.green)
                }
                .linearProgressIndicatorStyle(.indeterminate)
                .padding(.bottom, 20)
        }
        .padding()
    }
}
