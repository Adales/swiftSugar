// CodableExtension.swift [SwiftSugar] created by: Adas Lesniak on: 24/01/2018
import Foundation


extension Encodable {
    public func toJsonString() -> String? {
        do {
            let data = try JSONEncoder().encode(self)
            return String(data: data, encoding: .utf8)
        } catch {
            //Log.error("failed to serialise: \(error)")
            return nil
        }
    }
}

extension Decodable {
    public static func fromJson<T:Decodable>(_ serialised: String) -> T? {
        do {
            guard let asData = serialised.data(using: .utf8) else {
                throw Exception.error("culdn't get string data (wrong encoding?)")
            }
            return try JSONDecoder().decode(T.self, from: asData)
        } catch {
            //Log.error("failed to deserialise from: \(serialised), \nerror: \(error)")
            return nil
        }
    }
}
