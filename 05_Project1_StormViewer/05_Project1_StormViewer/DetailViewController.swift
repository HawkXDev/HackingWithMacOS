//
//  DetailedViewController.swift
//  05_Project1_StormViewer
//
//  Created by Sergey Sokolkin on 18.11.23.
//

import Cocoa

class DetailViewController: NSViewController {

    @IBOutlet var imageView: NSImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
    }
    
    func imageSelected(name: String) {
        imageView.image = NSImage(named: name)
    }
    
}
