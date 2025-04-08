import PhotosUI

struct PhotoFilter: Hashable {
    let title: String
    let filter: PHPickerFilter
    
    static let allCases: [PhotoFilter] = [
        PhotoFilter(title: "Images", filter: .images),
        PhotoFilter(title: "Videos", filter: .videos),
        PhotoFilter(title: "Live Photos", filter: .livePhotos),
        PhotoFilter(title: "Screenshots", filter: .screenshots)
    ]
}
