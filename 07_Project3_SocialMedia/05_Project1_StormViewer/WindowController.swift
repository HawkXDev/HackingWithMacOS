//
//  WindowController.swift
//  05_Project1_StormViewer
//
//  Created by Sergey Sokolkin on 27.11.23.
//

import Cocoa

class WindowController: NSWindowController {

    @IBOutlet var shareButton: NSButton!
    
    override func windowDidLoad() {
        super.windowDidLoad()
    
        shareButton.sendAction(on: .leftMouseDown)
    }

}
