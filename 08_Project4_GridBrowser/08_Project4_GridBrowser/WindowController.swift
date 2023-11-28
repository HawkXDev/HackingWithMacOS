//
//  WindowController.swift
//  08_Project4_GridBrowser
//
//  Created by Sergey Sokolkin on 28.11.23.
//

import Cocoa

class WindowController: NSWindowController {
    
    @IBOutlet var addressEntry: NSTextField!
    
    override func windowDidLoad() {
        super.windowDidLoad()
    
        window?.titleVisibility = .hidden
    }

}
