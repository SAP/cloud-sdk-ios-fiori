// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import FioriThemeManager
import Foundation
import SwiftUI

public protocol ToastMessageStyle: DynamicProperty {
    associatedtype Body: View

    func makeBody(_ configuration: ToastMessageConfiguration) -> Body
}

struct AnyToastMessageStyle: ToastMessageStyle {
    let content: (ToastMessageConfiguration) -> any View

    init(@ViewBuilder _ content: @escaping (ToastMessageConfiguration) -> any View) {
        self.content = content
    }

    public func makeBody(_ configuration: ToastMessageConfiguration) -> some View {
        self.content(configuration).typeErased
    }
}

public struct ToastMessageConfiguration {
    public let contentIdentifier = "FioriToastMessage_content"
    public let iconIdentifier = "FioriToastMessage_icon"
    public let titleIdentifier = "FioriToastMessage_title"

    public var componentIdentifier: String = "fiori_toastmessage_component"
    public let icon: Icon
    public let title: Title
    public let duration: Double

    public typealias Icon = ConfigurationViewWrapper
    public typealias Title = ConfigurationViewWrapper
}

extension ToastMessageConfiguration {
    func isDirectChild(_ componentIdentifier: String) -> Bool {
        componentIdentifier == self.componentIdentifier
    }
}

public struct ToastMessageFioriStyle: ToastMessageStyle {
    public func makeBody(_ configuration: ToastMessageConfiguration) -> some View {
        ToastMessage(configuration)
            .iconStyle(IconFioriStyle(toastMessageConfiguration: configuration))
            .titleStyle(TitleFioriStyle(toastMessageConfiguration: configuration))
    }
}

public struct ToastMessageNSSStyle: ToastMessageStyle {
    var isGlobal: Bool = false
    var data: NSSStyleData {
        self.isGlobal ? NSSTool.globalNSSStyle : NSSTool.mergeNSSStyle
    }

    public func makeBody(_ configuration: ToastMessageConfiguration) -> some View {
        ToastMessage(configuration)
            .iconStyle(IconNSSStyle(toastMessageConfiguration: configuration, nssData: self.data.value(configuration.iconIdentifier)))
            .titleStyle(TitleNSSStyle(toastMessageConfiguration: configuration, nssData: self.data.value(configuration.titleIdentifier)))
            .toastMessageStyle(ContentNSSStyle(toastMessageConfiguration: configuration, nssData: self.data.value(configuration.contentIdentifier)))
    }
}
