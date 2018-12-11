// CGImage+.swift [SwiftSugar] created by: Adas Lesniak on: 09/05/2018
import Foundation


extension CGImage {
    
    public var resolution: CGSize {
        return CGSize(width: CGFloat(self.width), height: CGFloat(self.height))
    }
}
