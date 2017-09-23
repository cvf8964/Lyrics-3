//
//  RCAppDelegate.swift
//  Lyrics 3
//
//  Created by Felix D. on 8/5/17.
//  Copyright © 2017 Felix D. All rights reserved.
//

import Cocoa

@NSApplicationMain
class RCAppDelegate: NSObject, NSApplicationDelegate {
    
    func applicationDidFinishLaunching(_ aNotification: Notification) {
        // removes title bar
        NSApplication.shared.windows[0].titlebarAppearsTransparent = true
    }

    func applicationWillTerminate(_ aNotification: Notification) {

    }


}

