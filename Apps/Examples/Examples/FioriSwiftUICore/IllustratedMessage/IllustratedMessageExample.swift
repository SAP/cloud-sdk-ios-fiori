import FioriSwiftUICore
import SwiftUI

struct SizeOption: Identifiable {
    let value: CGFloat
    var id: CGFloat { self.value }
    
    init(_ value: CGFloat) {
        self.value = value
    }
}

let sizeOptions: [SizeOption] = [.init(100), .init(200), .init(300), .init(500), .init(600), .init(800)]

struct IllustratedMessageExample: View {
    @State var selectedWidth: CGFloat = sizeOptions[2].value
    @State var selectedHeight: CGFloat = sizeOptions[1].value
    
    var body: some View {
        HStack {
            Text("Size:")
            Picker("Width", selection: $selectedWidth) {
                ForEach(sizeOptions) { option in
                    Text("\(Int(option.value))").tag(option.value)
                }
            }
            Text("by")
            Picker("Height", selection: $selectedHeight) {
                ForEach(sizeOptions) { option in
                    Text("\(Int(option.value))").tag(option.value)
                }
            }
        }
        List {
            // MARK: vertical orientation

            // no image and no action
            IllustratedMessage(title: {
                Text("This is an IllustratedMessageView with no image or action button")
            }, description: {
                Text("Subtitle")
            })
                .border(Color.gray)
                .frame(width: selectedWidth, height: selectedHeight)
            
            // action but no image
            IllustratedMessage(title: {
                Text("IllustratedMessage Title")
            }, description: {
                Text("Subtitle: abc def ghi jkl mno pqr stu vwx yz abc def ghi jkl mno pqr stu vwx yz")
            }, action: {
                FioriButton(title: "ActionTitle", action: { _ in print("Action tapped") })
            })
                .border(Color.gray)
                .frame(width: selectedWidth, height: selectedHeight)

            // image but no action
            IllustratedMessage(detailImage: {
                Image("wheel")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 50)
            }, title: {
                Text("IllustratedMessage Title")
            }, description: {
                Text("Subtitle")
            })
                .border(Color.gray)
                .frame(width: selectedWidth, height: selectedHeight)

            // all components
            IllustratedMessage(detailImage: {
                Image("wheel")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 100)
            }, title: {
                Text("Unable to load data")
            }, description: {
                Text("Reload to try again or contact your administrator to update your permission.")
            }, action: {
                FioriButton(title: "ActionTitle", action: { _ in print("Action tapped") })
            })
                .border(Color.gray)
                .frame(width: selectedWidth, height: selectedHeight)

            // MARK: horizontal orientation

            // no image and no action
            IllustratedMessage(title: {
                Text("IllustratedMessage Title")
            }, description: {
                Text("Subtitle")
            })
                .illustratedMessageStyle(.horizontal)
                .border(Color.gray)
                .frame(width: selectedWidth, height: selectedHeight)

            // action but no image
            IllustratedMessage(title: {
                Text("IllustratedMessage Title")
            }, description: {
                Text("Subtitle")
            }, action: {
                FioriButton(title: "ActionTitle", action: { _ in print("Action tapped") })
            })
                .illustratedMessageStyle(.horizontal)
                .border(Color.gray)
                .frame(width: selectedWidth, height: selectedHeight)

            // image but no action
            IllustratedMessage(detailImage: {
                Image("wheel")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            }, title: {
                Text("IllustratedMessage Title")
            }, description: {
                Text("Subtitle")
            })
                .illustratedMessageStyle(.horizontal)
                .border(Color.gray)
                .frame(width: selectedWidth, height: selectedHeight)

            // all components
            IllustratedMessage(detailImage: {
                Image("wheel")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 100)
            }, title: {
                Text("IllustratedMessage Title")
            }, description: {
                Text("Subtitle")
            }, action: {
                FioriButton(title: "ActionTitle", action: { _ in print("Action tapped") })
//                Button(action: { print("Action tapped") }, label: { Text("Sign In") })
            })
                .illustratedMessageStyle(.horizontal)
                .border(Color.gray)
                .frame(width: selectedWidth, height: selectedHeight)
        }
    }
}
