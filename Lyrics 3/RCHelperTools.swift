//
//  RCHelperTools.swift
//  Lyrics 3
//
//  Created by Felix D. on 8/6/17.
//  Copyright © 2017 Felix D. All rights reserved.
//

import Foundation

extension String {
    func appendingPathComponent(path: String) -> String {
        let nsSt = self as NSString
        return nsSt.appendingPathComponent(path)
    }
}

enum RCFileHandlingError: Error {
    case nonwritablePath(path: String)
}

let sRCUserDefaultColorMode = "ColorMode"

enum eRCiTunesNotificationKey: String {
    case playerState = "Player State"
}

enum eRCiTunesTrackProperty: String {
    case persistentID = "persistentID"
    case name = "name"
    case album = "album"
    case artist = "artist"
    case albumArtist = "albumArtist"
    case playedCount = "playedCount"
    case year = "year"
    case loved = "loved"
}
