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
    
    @IBAction func sharedClicked(_ sender: NSView) {
        guard let split = contentViewController as? NSSplitViewController else { return }
        guard let detail = split.children[1] as? DetailViewController else { return }
        guard let image = detail.imageView.image else { return }
        let picker = NSSharingServicePicker(items: [image])
        picker.show(relativeTo: .zero, of: sender, preferredEdge: .maxY)
    }
    
    @IBAction func infoClicked(_ sender: NSView) {
        guard let split = contentViewController as? NSSplitViewController else { return }
        guard let source = split.children[0] as? SourceViewController else { return }
        guard let tableView = source.tableView else { return }
        guard tableView.selectedRow != -1 else { return }
        
        let alert = NSAlert()
        alert.messageText = "Picture info"
        alert.informativeText = "You have chosen a picture \(source.pictures[tableView.selectedRow])"
        alert.runModal()
    }

}
