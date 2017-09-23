//
//  RCLyricsManager.swift
//  Lyrics 3
//
//  Created by Felix D. on 8/5/17.
//  Copyright © 2017 Felix D. All rights reserved.
//

import Foundation

class RCLyricsManager {

    static let lyricsDirectory: String = {
        #if DEBUG
        struct StaticMember {
            static var times = 1
        }
        print("RCLyricsManager.lyricsDirectory was called \(StaticMember.times) time(s).")
        StaticMember.times += 1
        #endif

        let path: String = NSSearchPathForDirectoriesInDomains(.libraryDirectory, .userDomainMask, true)[0].appendingPathComponent(path: "/Application Support/org.realCovfefe.lyrics")

        var isDirectory: ObjCBool = true
        let fileExists = FileManager.default.fileExists(atPath: path, isDirectory: &isDirectory)

        do {
            if !isDirectory.boolValue {
                try FileManager.default.removeItem(atPath: path)
            }
            else if !fileExists {
                try FileManager.default.createDirectory(atPath: path, withIntermediateDirectories: true, attributes: nil)
            }
        }
        catch let error {
            print(error.localizedDescription)
        }

        return path
    }()

    class func getLyricsLocally(forSongWithID persistentID: String) throws -> String? {
        var contents: String?
        let filePath = lyricsDirectory.appendingPathComponent(path: persistentID)

        var isDirectory: ObjCBool = false
        let fileExists = FileManager.default.fileExists(atPath: filePath, isDirectory: &isDirectory)

        if isDirectory.boolValue {
            try FileManager.default.removeItem(atPath: filePath)
        }
        else if fileExists {
            contents = try? String(contentsOfFile: filePath)
        }

        return contents
    }

    class func saveLyricsLocally(lyrics: String, withID persistentID: String) throws {
        let filePath = lyricsDirectory.appendingPathComponent(path: persistentID)
        let fileExists = FileManager.default.fileExists(atPath: filePath, isDirectory: nil)

        if fileExists {
            guard FileManager.default.isWritableFile(atPath: filePath) else {
                throw RCFileHandlingError.nonwritablePath(path: filePath)
            }
        }

        try lyrics.write(toFile: filePath, atomically: true, encoding: .unicode)
    }
    
    
    // MARK: - method stubs
    class func getLyricsFromAppleMusic(forSongWithID persistentID: String) throws -> String? {

        return nil
    }
    
    class func saveLyricsToAppleMusic(lyrics: String, withID persistentID: String) throws {
        
    }
}
