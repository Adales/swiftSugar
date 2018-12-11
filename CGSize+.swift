// CGSizeExtension.swift [SwiftSugar] created by: Adas Lesniak on: 07/05/2018
import Foundation


extension CGSize {
    
    public var isValidResolution: Bool {
        return width.remainder(dividingBy: 1) == 0 && height.remainder(dividingBy: 0) == 0
    }
    
    //video is encoded in 16x16 blocks, so both width and height need to be multiplies of 16 otherway coders will cut it or worse fill it with trash data
    public var isValidVideoResolution: Bool {
        return width.remainder(dividingBy: 16) == 0 && height.remainder(dividingBy: 16) == 0
    }
    
    public static func square(_ side: CGFloat) -> CGSize {
        return CGSize(width: side, height: side)
    }
    
    public var aspectRatio: CGFloat {
        return width/height
    }
    
    static public func * (lhs: CGSize, rhs: ConvertibleNumber) -> CGSize {
        return CGSize(width: lhs.width * rhs.convert(), height: lhs.height * rhs.convert())
    }
}
