//
//  RCiTunesController.swift
//  Lyrics 3
//
//  Created by Felix D. on 8/5/17.
//  Copyright © 2017 Felix D. All rights reserved.
//

import Cocoa
import ScriptingBridge

@objc protocol iTunesTrack {
    @objc optional var lyrics: String {get set}
    @objc optional var persistentID: String {get}
    @objc optional var properties: NSDictionary {get}
}

@objc protocol iTunesApplication {
    @objc optional var currentTrack: iTunesTrack {get}
    @objc optional var properties: NSDictionary {get}
}

extension SBApplication : iTunesApplication {}

class RCiTunesController {
    
    private static var savedPersistentID: String = ""

    private static let app: iTunesApplication = {
        return SBApplication(bundleIdentifier: "com.apple.iTunes")!
    }()

    
    
    class func iTunesProperties() -> NSDictionary? {
        return app.properties
    }

    // returns nil if currentTrack is nil,
    //   or if currentTrack == saved track
    class func updatedTrackProperties() -> NSDictionary? {
        guard let persistentID = app.currentTrack!.persistentID else { return nil }
        guard persistentID != savedPersistentID else { return nil }

        savedPersistentID = persistentID
        return app.currentTrack!.properties
    }
    
}


