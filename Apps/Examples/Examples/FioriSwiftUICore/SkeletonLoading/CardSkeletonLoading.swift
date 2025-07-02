import FioriSwiftUICore
import SwiftUI

struct CardSkeletonLoading: View {
    @State var isLoading: Bool = true

    var body: some View {
        List {
            Toggle("Skeleton Loading", isOn: self.$isLoading)
               
            if self.isLoading {
                CardSkeletonLoadingPattern.oneLineCard
                    .padding()
                    .cardStyle(.card)
                
                CardSkeletonLoadingPattern.twoLineCard
                    .padding()
                    .cardStyle(.card)
        
            } else {
                Card(mediaImage: {
                    Image("card_image")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(height: 145)
                }, description: {
                    Text("Title")
                }, title: {
                    Text("Title for multiple lines")
                }, subtitle: {
                    Text("Subtitle")
                }, detailImage: {
                    Image(systemName: "person.crop.circle")
                        .frame(width: 90, height: 90)
                        .background(Color.gray.opacity(0.3))
                        .cornerRadius(45)
                }, headerAction: {
                    Button {
                        print("tapped")
                    } label: {
                        Text("Long button")
                    }
                }, counter: {
                    Text("1 of 3")
                }, row1: {
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
                }, row2: {
                    RatingControl(rating: .constant(2), ratingControlStyle: .standard)
                }, action: {
                    FioriButton(title: "Approve")
                }, secondaryAction: {
                    FioriButton(title: "Decline")
                })
                .padding()
                .cardStyle(.card)
                
                Card(title: {
                    Text("Kixo Q1 Deal ")
                }, subtitle: {
                    Text("Company Name")
                }, detailImage: {
                    Circle()
                        .strokeBorder(.gray, lineWidth: 1)
                        //                    .background(Circle().fill(Color.gray.opacity(0.3)))
                        .frame(width: 60, height: 60)
                        .overlay {
                            Image(systemName: "bus.fill")
                                .font(.title)
                        }
                }, headerAction: {
                    Text("99")
                        .font(.system(size: 22))
                        .frame(width: 38, height: 36)
                        .foregroundStyle(Color.white)
                        .background(RoundedRectangle(cornerRadius: 12.0).fill(Color.red))
                }, row2: {
                    Text("15 Jan,2025 • Discovery completed")
                        .font(.callout)
                }, row3: {
                    VStack {
                        Text("in  progress")
                            .font(.subheadline)
                    }
                })
                .padding()
                .cardStyle(.card)
            }
            
            CardSkeletonLoadingPattern.multipleLineCard
                .padding()
                .cardStyle(.card)
                .environment(\.isLoading, self.isLoading)
                     
            CardSkeletonLoadingPattern.genericCard
                .padding()
                .cardStyle(.card)
        }
        .environment(\.isLoading, self.isLoading)
        .listStyle(.plain)
        .navigationBarTitle("Cards", displayMode: .inline)
    }
}
