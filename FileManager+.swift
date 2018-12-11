// FileManager+.swift [SwiftSugar] created by: Adas Lesniak on: 10/04/2018
import Foundation


var storage: FileManager { return FileManager.default }

extension FileManager {
    
    //Apple says "use URL" and they do not provide interface for that :/
    public func fileExist(_ fileUrl: URL) -> Bool {
        return fileExists(atPath: fileUrl.path)
    }
    
    //Apple says "use URL" and they do not provide interface for that :/
    public func contentsOfDirectory(_ folderUrl: URL) throws -> [URL] {
        return try contentsOfDirectory(atPath: folderUrl.path).map({ URL(fileURLWithPath: $0) })
    }
    
    public func removeItem(_ fileUrl: URL) throws -> Void {
        try removeItem(at: fileUrl)
    }
    
    //Apple says "use URL" and they do not provide interface for that :/
    public func createDirectory(_ folderUrl: URL) throws -> Void {
        try createDirectory(atPath: folderUrl.path, withIntermediateDirectories: true, attributes: nil)
    }
    
    public func createOrClearFolder(_ folderUrl: URL) throws -> Void {
        if fileExist(folderUrl) {
            let content = try contentsOfDirectory(folderUrl)
            for element in content {
                try removeItem(element)
            }
        } else {
            try createDirectory(folderUrl)
        }
    }
    
    public static var documentsDirectory: URL? {
        return FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first
    }
    
    public static var tempDirectory: URL {
        if #available(iOS 10.0, *) {
            return FileManager.default.temporaryDirectory
        } else {
            return URL(fileURLWithPath: NSTemporaryDirectory())
        }
    }
    
    public static var libraryDirectory: URL {
        return FileManager.default.urls(for: .libraryDirectory, in: .userDomainMask).first!
    }
}
