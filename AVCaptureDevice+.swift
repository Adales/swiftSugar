// AVCaptureDevice+.swift [SwiftSugar] created by: Adas Lesniak on: 23/11/2018
import Foundation
import AVFoundation


extension AVCaptureDevice {
    public func resolution() -> CGSize {
        let size = CMVideoFormatDescriptionGetDimensions(activeFormat.formatDescription)
        return CGSize(width: CGFloat(size.width), height: CGFloat(size.height))
    }
}
