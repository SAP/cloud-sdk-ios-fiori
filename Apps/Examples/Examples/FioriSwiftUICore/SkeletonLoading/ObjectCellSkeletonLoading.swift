import FioriSwiftUICore
import SwiftUI

struct ObjectCellSkeletonLoading: View {
    @State var isLoading: Bool = true
    @State var isUnlimitedLine: Bool = false
    
    var body: some View {
        List {
            Toggle("Skeleton Loading", isOn: self.$isLoading)
            Toggle("Unlimited Lines", isOn: self.$isUnlimitedLine)
                .ifApply(self.isLoading) {
                    $0.hidden()
                }
            if self.isLoading {
                ObjectItemSkeletonLoadingPattern.oneLine.id(self.isLoading)
                    .splitPercent(0.33)
                ObjectItemSkeletonLoadingPattern.twoLines.id(self.isLoading)
                    .splitPercent(0.33)
                ObjectItemSkeletonLoadingPattern.multiLines.id(self.isLoading)
                    .splitPercent(0.33)
                ObjectItemSkeletonLoadingPattern.generic.id(self.isLoading)
                    .splitPercent(0.33)
            } else {
                ObjectItem(title: {
                    Text("Rouja Pakiman")
                        .ifApply(self.isUnlimitedLine) {
                            $0.lineLimit(nil)
                        }
                }, status: {
                    Text("Available")
                }, detailImage: {
                    Image("person_square4").resizable().frame(width: 45, height: 45).clipShape(Circle())
                })
                .splitPercent(0.33)
                
                ObjectItem(title: {
                    Text("Rouja Pakiman Product Development")
                        .ifApply(self.isUnlimitedLine) {
                            $0.lineLimit(nil)
                        }
                }, subtitle: {
                    Text("Product Management")
                        .ifApply(self.isUnlimitedLine) {
                            $0.lineLimit(nil)
                        }
                }, status: {
                    Text("Available")
                }, detailImage: {
                    Image("person_square4").resizable().frame(width: 45, height: 45).clipShape(Circle())
                })
                .splitPercent(0.33)
                
                ObjectItem(title: {
                    Text("Transformer Overheating")
                        .ifApply(self.isUnlimitedLine) {
                            $0.lineLimit(nil)
                        }
                }, subtitle: {
                    Text("Three Phase Mounted Transformer")
                        .ifApply(self.isUnlimitedLine) {
                            $0.lineLimit(nil)
                        }
                }, footnote: {
                    Text("1000 - Hamburg, MECHANIK")
                        .ifApply(self.isUnlimitedLine) {
                            $0.lineLimit(nil)
                        }
                }, description: {
                    Text("Customer noticed that the transformer started to over heat within 45 minutes each time he turned it on at 7:30am.  The first technician who looked at this did not have the correct additional tools to complete the job.")
                        .ifApply(self.isUnlimitedLine) {
                            $0.lineLimit(nil)
                        }
                }, status: {
                    Text("Medium")
                }, substatus: {
                    Text("Verified")
                }, detailImage: {
                    Image("productThumbnail").resizable().frame(width: 45, height: 45)
                })
                .splitPercent(0.33)
                
                ObjectItem(title: {
                    Text("Transformer Overheating")
                        .ifApply(self.isUnlimitedLine) {
                            $0.lineLimit(nil)
                        }
                }, subtitle: {
                    Text("Three Phase Mounted Transformer")
                        .ifApply(self.isUnlimitedLine) {
                            $0.lineLimit(nil)
                        }
                }, footnote: {
                    Text("1000 - Hamburg, MECHANIK")
                        .ifApply(self.isUnlimitedLine) {
                            $0.lineLimit(nil)
                        }
                }, description: {
                    Text("Customer noticed that the transformer started to over heat within 45 minutes each time he turned it on at 7:30am.  The first technician who looked at this did not have the correct additional tools to complete the job.")
                        .ifApply(self.isUnlimitedLine) {
                            $0.lineLimit(nil)
                        }
                }, status: {
                    Text("Medium")
                })
                .splitPercent(0.33)
            }
        }
        .environment(\.isLoading, self.isLoading)
        .navigationBarTitle("Object Cell", displayMode: .inline)
    }
}
