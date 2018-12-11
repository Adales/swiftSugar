//  Color+.swift [SwiftSugar] created by: Adas Lesniak on: 01/06/2017.
import Foundation


extension UIColor {
    
    //for all fading operations it's convinent to not copy all color components if it's clear it's about the same color
    public func withAlpha(_ value: Float) -> UIColor {
        return UIColor(red: self.ciColor.red, green: self.ciColor.green, blue: self.ciColor.blue, alpha: CGFloat(value))
    }
    
    //for creating standard rgb:256 colors
    public convenience init(r: Int, g: Int, b: Int) {
        func cgf(_ int: Int) -> CGFloat { return CGFloat(int)/255.0 }
        self.init(red: cgf(r), green: cgf(g), blue: cgf(b), alpha: 1)
    }
}

