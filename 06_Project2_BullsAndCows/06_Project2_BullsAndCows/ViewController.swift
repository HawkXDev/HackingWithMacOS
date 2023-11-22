//
//  ViewController.swift
//  06_Project2_BullsAndCows
//
//  Created by Sergey Sokolkin on 22.11.23.
//

import Cocoa

class ViewController: NSViewController {

    @IBOutlet var tableView: NSTableView!
    @IBOutlet var guess: NSTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }
    
    @IBAction func submitGuess(_ sender: Any) {
    }

}
