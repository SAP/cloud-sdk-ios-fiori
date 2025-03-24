import PhotosUI
import SwiftUI
import UniformTypeIdentifiers

struct FilterCFG: View {
    @Binding var photoFilters: [PHPickerFilter]
    @Binding var fileFilters: [UTType]

    var body: some View {
        VStack {
            Section {
                ForEach(PhotoFilter.allCases, id: \.self) { option in
                    Toggle(isOn: Binding<Bool>(
                        get: { self.photoFilters.contains(option.filter) },
                        set: { newValue in
                            if newValue {
                                self.photoFilters.append(option.filter)
                            } else {
                                self.photoFilters.removeAll { $0 == option.filter }
                            }
                        }
                    )) {
                        Text(option.title)
                    }
                    .toggleStyle(.switch)
                }
            } header: {
                Text("Photo Selection Filter")
            }

            ForEach(self.photoFilters, id: \.self) { filter in
                Text("\(filter)")
            }

            Section {
                ForEach(FileFilter.allCases, id: \.self) { option in
                    Toggle(isOn: Binding<Bool>(
                        get: { self.fileFilters.contains(option.type) },
                        set: { newValue in
                            if newValue {
                                self.fileFilters.append(option.type)
                            } else {
                                self.fileFilters.removeAll { $0 == option.type }
                            }
                        }
                    )) {
                        Text(option.title)
                    }
                    .toggleStyle(.switch)
                }
            } header: { Text("File Selection Filter") }
            
            ForEach(self.fileFilters, id: \.self) { filter in
                Text("\(filter)")
            }
        }
        .border(Color.blue)
    }
}
