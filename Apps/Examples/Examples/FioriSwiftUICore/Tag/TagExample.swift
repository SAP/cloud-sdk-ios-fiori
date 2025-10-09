import FioriSwiftUICore
import FioriThemeManager
import SwiftUI

struct TagExample: View {
    @State private var selectedTag: String? = nil
    let tags = [
        "Default",
        "With Icon",
        "Custom Style",
        "Long Label Tag",
        "Emoji 😀",
        "Empty Label",
        "Multiline Label\nSecond Line",
        "Custom View"
    ]
    // AttributedString for tag
    var attributedTag: AttributedString {
        AttributedString("Bold and colored tag")
    }
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 24) {
                Group {
                    Text("Default Tag")
                    Tag(tag: { Text("Default") })
                }
                Group {
                    Text("Tag with Icon")
                    Tag(tag: { HStack { Image(systemName: "star.fill").foregroundColor(.yellow); Text("With Icon") } })
                }
                Group {
                    Text("Tag with Custom Style")
                    Tag(tag: { Text("Custom Style") })
                        .tagStyle(TagStyleCustom())
                }
                Group {
                    Text("Tag with Long Label")
                    Tag(tag: { Text("This is a very long label for a tag component to test overflow and layout behavior.") })
                }
                Group {
                    Text("Tag with Emoji")
                    Tag(tag: { Text("😀 Emoji Tag") })
                }
                Group {
                    Text("Tag with Empty Label")
                    Tag(tag: { Text("") })
                }
                Group {
                    Text("Tag with Multiline Label")
                    Tag(tag: { Text("Multiline Label\nSecond Line") })
                }
                Group {
                    Text("Tag with Custom View")
                    Tag(tag: { HStack { Circle().fill(Color.purple).frame(width: 16, height: 16); Text("Custom View") } })
                }
                Group {
                    Text("TagStack (Group of Tags)")
                    TagStack(tags: self.tags)
                }
                Group {
                    Text("Interactive Tag (Tap to Select)")
                    Tag(tag: { Text(self.selectedTag ?? "Tap Me") })
                        .onTapGesture {
                            self.selectedTag = "Selected!"
                        }
                }
                Group {
                    Text("Tag with AttributedString")
                    Tag(tag: { Text(self.attributedTag).bold().foregroundColor(.red) })
                }
                Group {
                    Text("Tag with AttributedString and Icon")
                    Tag(tag: {
                        HStack(spacing: 4) {
                            FioriIcon.status.badge.renderingMode(.template).foregroundColor(.yellow)
                            Text(self.attributedTag).bold().foregroundColor(.blue)
                        }
                    })
                }
            }
            .padding()
        }
        .navigationTitle("Tag Example")
    }
}

struct TagStyleCustom: TagStyle {
    func makeBody(_ configuration: TagConfiguration) -> some View {
        configuration.tag
            .padding(.horizontal, 12)
            .padding(.vertical, 6)
            .background(RoundedRectangle(cornerRadius: 12).fill(Color.green.opacity(0.2)))
            .overlay(RoundedRectangle(cornerRadius: 12).stroke(Color.green, lineWidth: 2))
            .foregroundColor(.green)
    }
}

struct TagExample_Previews: PreviewProvider {
    static var previews: some View {
        TagExample()
    }
}
