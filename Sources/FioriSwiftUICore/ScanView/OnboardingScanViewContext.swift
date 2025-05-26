import FioriThemeManager
import Foundation
import SwiftUI

/// strings configuration in OnboardingScanView
public class OnboardingScanViewContext {
    public init() {}
    
    /**
     The title on the OnboardingScanView.
     The default string is from localized strings file -
     "Scan"
     */
    public var scanViewTitleString: String = "Scan".localizedFioriString()

    /**
     The title of the alert when user selects an image from photo library
     for a QR code on scanner but scanner could not find a valid QR code
     on that image.
     The default string is from localized strings file -
     "Scan Unsuccessful"
     */
    public var scanUnsuccessfulTitleString: String = "Scan Unsuccessful".localizedFioriString()

    /**
     The message of the alert when user selects an image from photo library
     for a QR code on scanner but scanner could not find a valid QR code
     on that image.
     The default string is from localized strings file -
     "Please select a QR code image."
     */
    public var scanUnsuccessfulMessageString: String = "Please select a QR code image.".localizedFioriString()

    /**
     The string to be used on the button to dismiss the alert.
     The default string is from localized strings file -
     "OK"
     */
    public var okButtonString: String = "OK".localizedFioriString()

    /**
     The title of the alert when user got the QR code from either scanner
     or photo library for onboarding activation. However, the system
     does not recognize the QR code.
     The default string is from localized strings file -
     "Invalid QR Code"
     */
    public var invalidQRCodeTitleString: String = "Invalid QR Code".localizedFioriString()

    /**
     The message of the alert when user got the QR code from either scanner
     or photo library for onboarding activation. However, the system
     does not recognize the QR code.
     The default string is from localized strings file -
     "The QR code was not recognized."
     */
    public var invalidQRCodeMessageString: String = "The QR code was not recognized.".localizedFioriString()

    /**
     The title of the alert when user tapped the "Choose Photo icon"
     but the permission to access to the photo library was not granted.
     The default string is from localized strings file -
     "Allow Access to Photos"
     */
    public var allowPhotoAccessTitleString: String = "Allow Access to Photos".localizedFioriString()

    /**
     The message of the alert when user tapped the "Choose Photo icon"
     but the permission to access to the photo library was not granted.
     The default string is from localized strings file -
     "To choose a QR code image, please give access to your photos in your device's privacy settings."
     */
    public var allowPhotoAccessMessageString: String = "To choose a QR code image, please give access to your photos in your device's privacy settings.".localizedFioriString()

    /**
     The title of the alert when user enter this scan view
     but the permission to access camera was not granted.
     The default string is from localized strings file -
     "Allow Access to Camera"
     */
    public var allowCameraAccessTitleString: String = "Allow Access to Camera".localizedFioriString()

    /**
     The message of the alert when user enter this scan view
     but the permission to access camera was not granted.
     The default string is from localized strings file -
     "To scan using the camera, please give access to your camera in your device's privacy settings."
     */
    public var allowCameraAccessMessageString: String = "To scan using the camera, please give access to your camera in your device's privacy settings.".localizedFioriString()

    /**
     The action title string not to go to the Settings app
     for the alert when the permission
     to access camera or photo library was not granted.
     The default string is from localized strings file -
     "Not Now"
     */
    public var notNowActionString: String = "Not Now".localizedFioriString()

    /**
     The action title string for going to the Settings app
     for the alert when the permission
     to access camera or photo library was not granted.
     The default string is from localized strings file -
     "Settings"
     */
    public var settingsActionString: String = "Settings".localizedFioriString()
}
