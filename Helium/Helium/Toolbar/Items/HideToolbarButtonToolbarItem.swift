//
//  BrowserToolbar.swift
//  Helium
//
//  Created by Jaden Geller on 4/25/20.
//  Copyright © 2020 Jaden Geller. All rights reserved.
//

import Cocoa

class HideToolbarButtonToolbarItem: NSToolbarItem {
    let hideToolbar: () -> Void
    init(_ handleNavigation: @escaping () -> Void) {
        self.hideToolbar = handleNavigation
        super.init(itemIdentifier: .directionalNavigationButtons)
        let control = NSSegmentedControl()
        control.trackingMode = .momentary
        control.isContinuous = false
        control.segmentCount = 1
        control.target = self
        control.action = #selector(hideToolbar(_:))
        view = control
    }
    
    @objc func hideToolbar(_ control: NSSegmentedControl) {
        self.hideToolbar()
    }
}

extension NSToolbarItem.Identifier {
    static var hideToolbarButton = NSToolbarItem.Identifier("hideToolbarButton")
}
