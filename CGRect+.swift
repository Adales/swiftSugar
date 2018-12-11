// CGRect+.swift [SwiftSugar] created by: Adas Lesniak on: 17/10/2018

import Foundation

extension CGRect {
    
    //just to save writing always view.init(frame: CGRect(origin: CGPoint(x: 0, y:0), size: CGSize(....))) where ... is only meaningfull stuff
    public static func atZero(side: ConvertibleNumber) -> CGRect {
        return CGRect(x: 0, y: 0, width: side.convert(), height: side.convert())
    }
    
    public static func atZero(width: ConvertibleNumber, height: ConvertibleNumber) -> CGRect {
        return CGRect(x: 0, y: 0, width: width.convert(), height: height.convert())
    }
    
    public static func atZero(size: CGSize) -> CGRect{
        return CGRect(x: 0, y: 0, width: size.width, height: size.height)
    }
    
}
