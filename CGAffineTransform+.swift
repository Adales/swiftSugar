// CGAffineTransform+.swift [DiveDataModel] created by: Adas Lesniak on: 04/10/2018 
// Copyright ©Adas Lesniak   All rights reserved.

import Foundation

public extension CGAffineTransform {
    
    public var rotation: CGFloat {
        return  CGFloat(atan2f(Float(b), Float(a)))
    }
    
    public var xScale: CGFloat {
        return sqrt(a * a + c * c)
    }
    
    public var yScale: CGFloat {
        return sqrt(b * b + d * d)
    }
    
    public var xTranslation: CGFloat {
        return tx;
    }
    
    public var yTranslation: CGFloat {
        return ty;
    }
}
