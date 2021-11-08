import Foundation
import UIKit

public protocol SignatureCaptureViewModel: AnyObject {
    var title: String? { get }

    var startAction: ActionModel? { get }

    var restartAction: ActionModel? { get }

    var cancelAction: ActionModel? { get }

    var clearAction: ActionModel? { get }

    var saveAction: ActionModel? { get }

    var signatureImage: UIImage? { get }

    var onSave: ((UIImage) -> Void)? { get }

    var onDelete: (() -> Void)? { get }
}
