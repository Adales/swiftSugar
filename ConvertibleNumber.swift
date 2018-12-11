// ConvertibleNumber.swift [SwiftSugar] created by: Adas Lesniak on: 21/06/2018 

import Foundation

public protocol ConvertibleNumber {
    init (_ value: Int)
    init (_ value: Float)
    init (_ value: Double)
    init (_ value: CGFloat)
}

extension CGFloat : ConvertibleNumber {}
extension Double  : ConvertibleNumber {}
extension Float   : ConvertibleNumber {}
extension Int     : ConvertibleNumber {}

extension ConvertibleNumber {
    public func convert<T: ConvertibleNumber>() -> T {
        switch self {
        case let nr as CGFloat:
            return T(nr)
        case let nr as Float:
            return T(nr)
        case let nr as Double:
            return T(nr)
        case let nr as Int:
            return T(nr)
        default:
            assert(false, "NumberConvertible convert cast failed!")
            return T(0)
        }
    }
}

//FIXME: uncommenting this creates super weird compiler problems!
/*public func + <LHT:ConvertibleNumber, RHT:ConvertibleNumber, RT:ConvertibleNumber>(lhs: LHT, rhs: RHT) -> RT {
    let left: Double = lhs.convert()
    let right: Double = rhs.convert()
    return (left + right).convert()
}

public func - <LHT:ConvertibleNumber, RHT:ConvertibleNumber, RT:ConvertibleNumber>(lhs: LHT, rhs: RHT) -> RT {
    let left: Double = lhs.convert()
    let right: Double = rhs.convert()
    return (left - right).convert()
}

public func * <LHT:ConvertibleNumber, RHT:ConvertibleNumber, RT:ConvertibleNumber>(lhs: LHT, rhs: RHT) -> RT {
    let left: Double = lhs.convert()
    let right: Double = rhs.convert()
    return (left * right).convert()
}

public func / <LHT:ConvertibleNumber, RHT:ConvertibleNumber, RT:ConvertibleNumber>(lhs: LHT, rhs: RHT) -> RT {
    let left: Double = lhs.convert()
    let right: Double = rhs.convert()
    return (left / right).convert()
}*/

public func == <LHT:ConvertibleNumber, RHT:ConvertibleNumber>(lhs: LHT, rhs: RHT) -> Bool {
    let left: Double = lhs.convert()
    let right: Double = rhs.convert()
    return left == right
}

public func > <LHT:ConvertibleNumber, RHT:ConvertibleNumber>(lhs: LHT, rhs: RHT) -> Bool {
    let left: Double = lhs.convert()
    let right: Double = rhs.convert()
    return left > right
}

public func < <LHT:ConvertibleNumber, RHT:ConvertibleNumber>(lhs: LHT, rhs: RHT) -> Bool {
    let left: Double = lhs.convert()
    let right: Double = rhs.convert()
    return left < right
}

public func >= <LHT:ConvertibleNumber, RHT:ConvertibleNumber>(lhs: LHT, rhs: RHT) -> Bool {
    let left: Double = lhs.convert()
    let right: Double = rhs.convert()
    return left >= right
}

public func <= <LHT:ConvertibleNumber, RHT:ConvertibleNumber>(lhs: LHT, rhs: RHT) -> Bool {
    let left: Double = lhs.convert()
    let right: Double = rhs.convert()
    return left <= right
}
