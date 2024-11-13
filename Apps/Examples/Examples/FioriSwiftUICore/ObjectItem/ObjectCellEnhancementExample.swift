import FioriSwiftUICore
import FioriThemeManager
import SwiftUI

struct ObjectCellEnhancementExample: View {
    @State var isShowAccessoryMenu = false
    @State var menuSelect: String = "1"

    var body: some View {
        List {
            ObjectItem(title: {
                Text("Transformer Overheating")
            }, subtitle: {
                Text("Three Phase Pad Mounted Transformer (533423)")
            }, footnote: {
                Text("1000 - Hamburg, MECHANIK")
            }, description: {
                Text("Customer noticed that the transformer started to over heat within 45 minutes each time he turned it on at 7:30am.  The first technician who looked at this did not have the correct additional tools to complete the job.")
            }, detailImage: {
                Image("attachment009").resizable().frame(width: 45, height: 45)
            }, objectItemButton: {
                FioriButton(title: "Button", action: { _ in
                    print("accessory action button selected")
                })
                .fioriButtonStyle(FioriSecondaryButtonStyle(colorStyle: .normal).eraseToAnyFioriButtonStyle())
            })
            
            ObjectItem(title: {
                Text("Transformer Overheating")
            }, subtitle: {
                Text("Three Phase Pad Mounted Transformer (533423)")
            }, footnote: {
                Text("1000 - Hamburg, MECHANIK")
            }, description: {
                Text("Customer noticed that the transformer started to over heat within 45 minutes each time he turned it on at 7:30am.  The first technician who looked at this did not have the correct additional tools to complete the job.")
            }, status: {
                Text("High")
            }, detailImage: {
                Image("attachment009").resizable().frame(width: 45, height: 45)
            }, objectItemButton: {
                FioriButton(title: "Button", action: { _ in
                    print("accessory action button selected")
                })
                .fioriButtonStyle(FioriSecondaryButtonStyle(colorStyle: .normal).eraseToAnyFioriButtonStyle())
            })
            
            ObjectItem(title: {
                Text("Transformer Overheating")
            }, subtitle: {
                Text("Three Phase Pad Mounted Transformer (533423)")
            }, footnote: {
                Text("1000 - Hamburg, MECHANIK")
            }, description: {
                Text("Customer noticed that the transformer started to over heat within 45 minutes each time he turned it on at 7:30am.  The first technician who looked at this did not have the correct additional tools to complete the job.")
            }, status: {
                Text("High")
            }, substatus: {
                Text("Scheduled")
            }, detailImage: {
                Image("attachment009").resizable().frame(width: 45, height: 45)
            }, objectItemButton: {
                FioriButton(title: "Button", action: { _ in
                    print("accessory action button selected")
                })
                .fioriButtonStyle(FioriSecondaryButtonStyle(colorStyle: .normal).eraseToAnyFioriButtonStyle())
            })
            
            ObjectItem(title: {
                Text("Transformer Overheating")
            }, subtitle: {
                Text("Three Phase Pad Mounted Transformer (533423)")
            }, footnote: {
                Text("1000 - Hamburg, MECHANIK")
            }, description: {
                Text("Customer noticed that the transformer started to over heat within 45 minutes each time he turned it on at 7:30am.  The first technician who looked at this did not have the correct additional tools to complete the job.")
            }, detailImage: {
                Image("attachment009").resizable().frame(width: 45, height: 45)
            }, objectItemButton: {
                Menu {
                    Text("1").tag(1)
                    Text("2").tag(2)
                    Text("3").tag(3)
                    Text("4").tag(4)
                } label: {
                    FioriButton { state in
                        if state == .normal {
                            self.isShowAccessoryMenu = true
                        }
                    } image: { _ in
                        FioriIcon.actions.overflow
                    }
                    .fioriButtonStyle(FioriTertiaryButtonStyle(colorStyle: .normal).eraseToAnyFioriButtonStyle())
                }
            })
            
            ObjectItem(title: {
                Text("Transformer Overheating")
            }, subtitle: {
                Text("Three Phase Pad Mounted Transformer (533423)")
            }, footnote: {
                Text("1000 - Hamburg, MECHANIK")
            }, description: {
                Text("Customer noticed that the transformer started to over heat within 45 minutes each time he turned it on at 7:30am.  The first technician who looked at this did not have the correct additional tools to complete the job.")
            }, status: {
                Image(systemName: "exclamationmark.square.fill").foregroundColor(.preferredColor(.negativeLabel))
            }, detailImage: {
                Image("attachment009").resizable().frame(width: 45, height: 45)
            }, objectItemButton: {
                Menu {
                    Text("1").tag(1)
                    Text("2").tag(2)
                    Text("3").tag(3)
                    Text("4").tag(4)
                } label: {
                    FioriButton { state in
                        if state == .normal {
                            self.isShowAccessoryMenu = true
                        }
                    } image: { _ in
                        FioriIcon.actions.overflow
                    }
                    .fioriButtonStyle(FioriTertiaryButtonStyle(colorStyle: .normal).eraseToAnyFioriButtonStyle())
                }
            })
            
            ObjectItem(title: {
                Text("Transformer Overheating")
            }, subtitle: {
                Text("Three Phase Pad Mounted Transformer (533423)")
            }, footnote: {
                Text("1000 - Hamburg, MECHANIK")
            }, description: {
                Text("Customer noticed that the transformer started to over heat within 45 minutes each time he turned it on at 7:30am.  The first technician who looked at this did not have the correct additional tools to complete the job.")
            }, status: {
                Image(systemName: "exclamationmark.square.fill").foregroundColor(.preferredColor(.negativeLabel))
            }, substatus: {
                Text("Scheduled")
            }, detailImage: {
                Image("attachment009").resizable().frame(width: 45, height: 45)
            }, objectItemButton: {
                Menu {
                    Text("1").tag(1)
                    Text("2").tag(2)
                    Text("3").tag(3)
                    Text("4").tag(4)
                } label: {
                    FioriButton { state in
                        if state == .normal {
                            self.isShowAccessoryMenu = true
                        }
                    } image: { _ in
                        FioriIcon.actions.overflow
                    }
                    .fioriButtonStyle(FioriTertiaryButtonStyle(colorStyle: .normal).eraseToAnyFioriButtonStyle())
                }
            })
        }
        .navigationTitle("Object Cell Enhancement for Button")
    }
}
