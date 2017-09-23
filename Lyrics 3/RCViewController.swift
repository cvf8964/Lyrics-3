//
//  RCViewController.swift
//  Lyrics 3
//
//  Created by Felix D. on 8/5/17.
//  Copyright © 2017 Felix D. All rights reserved.
//

import Cocoa

let persistentID = "id1"

class RCViewController: NSViewController {

    @IBOutlet weak var visualView: NSVisualEffectView?
    @IBOutlet weak var titleLabel: NSTextField?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        DistributedNotificationCenter.default().addObserver(self, selector: #selector(iTunesPlayerStatusDidChange(_:)), name: NSNotification.Name(rawValue: "com.apple.iTunes.playerInfo"), object: nil)

        visualView?.material = RCUserDefaults.windowMode

        let _ = updateLyricsView()
    }
    
    deinit {
        DistributedNotificationCenter.default().removeObserver(self)
    }
    
    @objc func iTunesPlayerStatusDidChange(_ notification: NSNotification) {
        let _ = updateLyricsView()
    }

    func updateLyricsView() -> Bool {
        guard let properties = RCiTunesController.updatedTrackProperties() else { return false }
        
        let name = properties.value(forKey: eRCiTunesTrackProperty.name.rawValue) as! String
        let album = properties.value(forKey: eRCiTunesTrackProperty.album.rawValue) as! String
        let artist = properties.value(forKey: eRCiTunesTrackProperty.albumArtist.rawValue) as! String
        let title = "\(name)\n\(artist) - \(album)"
        
        let paragraphStyle = NSMutableParagraphStyle.init()
        paragraphStyle.alignment = NSTextAlignment.center
        
        let attributes : [NSAttributedStringKey: Any] = [
            NSAttributedStringKey.font : NSFont.boldSystemFont(ofSize: NSFont.systemFontSize),
            NSAttributedStringKey.paragraphStyle: paragraphStyle
        ]
        let attributedString = NSAttributedString.init(string: title, attributes: attributes)
        
        titleLabel?.attributedStringValue = attributedString
        
        return true
    }

    func modifiedLyrics() -> String? {
        return nil
    }

}

