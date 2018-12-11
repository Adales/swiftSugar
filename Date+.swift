//  Date+.swift [SwiftSugar] created by: Adas Lesniak on 01/06/2017.
import Foundation


extension Date {
    private enum IsoFormat : String {
        
        case full = "yyyy-MM-dd'T'HH:mm:ssZZZZZ"
        case noZone = "yyyy-MM-dd'T'HH:mm:ss"  //2018-02-23T06:21:20
        case miliseconds = "yyyy-MM-dd'T'HH:mm:ss.SSSZZZZZ"
        
        func formatter() -> DateFormatter {
            let formatter = DateFormatter()
            formatter.timeZone = TimeZone(secondsFromGMT: 0)
            formatter.dateFormat = rawValue
            return formatter
        }
        static let allCases = [full, noZone, miliseconds]
    }
    
    public func iso8061string() -> String {
        let formatter = IsoFormat.noZone.formatter()
        formatter.timeZone = TimeZone(secondsFromGMT: 0) //backend doesn't look at TimeZones
        return formatter.string(from: (self))
    }
    
    public static func fromIso8061string(_ serialised: String) -> Date? {
        for format in IsoFormat.allCases {
            if let date = format.formatter().date(from: serialised) {
                return date
            }
        }
        //Log.warning(">\(serialised)< is not iso8061 date string") //if you handle this, this is no error, if returned value is nullable that's just OK behaviour
        return nil
    }
}
