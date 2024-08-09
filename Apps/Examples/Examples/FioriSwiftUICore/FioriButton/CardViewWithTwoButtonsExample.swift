import FioriSwiftUICore
import SwiftUI

struct CardViewWithTwoButtonsExample: View {
    @State private var _loadingState: FioriButtonLoadingState = .unspecified
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        ScrollView {
            HStack {
                Card {
                    Image("card_image")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(height: 145)
                } description: {
                    Text("Title")
                } title: {
                    Text("Title that goes to three lines before truncating just like that")
                } subtitle: {
                    Text("Subtitle that goes to two lines before truncating just like that")
                } detailImage: {
                    Image(systemName: "person.crop.circle")
                        .frame(width: 90, height: 90)
                        .background(Color.gray.opacity(0.3))
                        .cornerRadius(45)
                } headerAction: {
                    Button {
                        print("tapped")
                    } label: {
                        Text("Long button")
                    }
                } counter: {
                    Text("1 of 3")
                } row1: {
                    FlowLayout(spacing: 8, lineSpacing: 2, lineLimit: 3) {
                        LabelItem(icon: Image(systemName: "exclamationmark.triangle.fill"), title: "Negative")
                            .titleStyle { config in
                                config.title.foregroundStyle(Color.preferredColor(.negativeLabel))
                            }
                        LabelItem(title: "Critical")
                            .titleStyle { config in
                                config.title.foregroundStyle(Color.preferredColor(.criticalLabel))
                            }
                        LabelItem(icon: Image(systemName: "checkmark.circle"), title: "Positive")
                            .titleStyle { config in
                                config.title.foregroundStyle(Color.preferredColor(.positiveLabel))
                            }
                        Image(systemName: "star")
                        LabelItem(title: "Long long long label")
                        Image(systemName: "star.fill")
                        LabelItem(title: "Multiple lines row1")
                    }
                } row2: {
                    HStack(spacing: 2) {
                        Image(systemName: "star.fill")
                        Image(systemName: "star.fill")
                        Image(systemName: "star")
                        Image(systemName: "star")
                        Image(systemName: "star")
                    }
                } row3: {} cardBody: {} action: {
                    FioriButton(title: { _ in
                        self.titleStr(self._loadingState)
                    }, action: { _ in
                        self.updateDataSource()
                    })
                    .fioriButtonStyle(FioriPrimaryButtonStyle(.infinity, loadingState: self._loadingState))
                    .disabled(self._loadingState != .unspecified)
                    
                } secondaryAction: {
                    FioriButton(title: "Decline", action: { _ in
                        print("tap Decline")
                    })
                    .fioriButtonStyle(FioriSecondaryButtonStyle(colorStyle: .negative, maxWidth: 118))
                }
                .background(Color.white)
            }
            .clipShape(RoundedRectangle(cornerRadius: 16))
            .shadow(color: .preferredColor(.cardShadow), radius: 16) //
            .padding(EdgeInsets(top: 8, leading: 8, bottom: 8, trailing: 8))
        }
        .padding(10)
        .navigationTitle("Card View - With Two Buttons")
    }
    
    func updateDataSource() {
        var timeInterval = 0.0
        if self._loadingState == .unspecified {
            self._loadingState = .processing
            timeInterval = 2.0
        } else if self._loadingState == .processing {
            self._loadingState = .success
            timeInterval = 1.0
        } else {
            self.dismiss()
            return
        }
        
        _ = Timer.scheduledTimer(withTimeInterval: timeInterval, repeats: false, block: { _ in
            self.updateDataSource()
        })
    }
    
    func titleStr(_ loadingState: FioriButtonLoadingState) -> AttributedString {
        switch loadingState {
        case .unspecified:
            "Check in"
        case .processing:
            "Checking in"
        case .success:
            "Checked in"
        }
    }
}

#Preview {
    CardViewWithTwoButtonsExample()
}
