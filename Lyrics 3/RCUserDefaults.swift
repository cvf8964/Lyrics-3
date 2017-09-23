//
//  RCUserDefaults.swift
//  Lyrics 3
//
//  Created by Felix Dai on 8/11/17.
//  Copyright © 2017 Felix D. All rights reserved.
//

import Cocoa

class RCUserDefaults {
    
//    static let windowMode: RCUserDefaultColorMode = {
//        guard var colorMode = _userDefaultsController.value(forKey: sRCUserDefaultColorMode) as? RCUserDefaultColorMode else { return RCUserDefaultColorMode.darkMode }
//        return colorMode
//    }()
    
    private static var _windowMode: NSVisualEffectView.Material? = nil
    static var windowMode: NSVisualEffectView.Material {
        get {
            if _windowMode == nil {
                if let mode = UserDefaults.standard.value(forKey: sRCUserDefaultColorMode) {
                    _windowMode = NSVisualEffectView.Material(rawValue: mode as! Int)
                }
                else {
                    _windowMode = NSVisualEffectView.Material.ultraDark
                }
            }
            return _windowMode!
        }
        set {
            _windowMode = newValue
            UserDefaults.standard.setValue(_windowMode?.rawValue, forKey: sRCUserDefaultColorMode)
        }
    }
}
