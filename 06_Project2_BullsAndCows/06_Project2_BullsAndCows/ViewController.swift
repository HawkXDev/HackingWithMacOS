//
//  ViewController.swift
//  06_Project2_BullsAndCows
//
//  Created by Sergey Sokolkin on 22.11.23.
//

import Cocoa

class ViewController: NSViewController, NSTableViewDataSource, NSTableViewDelegate {
    
    @IBOutlet var tableView: NSTableView!
    @IBOutlet var guess: NSTextField!
    
    var answer = ""
    var guesses = [String]()
    var steps = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        startNewGame()
    }
    
    override var representedObject: Any? {
        didSet {
            // Update the view, if already loaded.
        }
    }
    
    @IBAction func submitGuess(_ sender: Any) {
        steps += 1
        
        // check for 4 unique characters
        let guessString = guess.stringValue
        guard Set(guessString).count == 4 else { return }
        
        // ensure there are no non-digit characters
        let badCharacters = CharacterSet(charactersIn: "0123456789").inverted
        guard guessString.rangeOfCharacter(from: badCharacters) == nil else { return }
        
        // add the guess to the array and table view
        guesses.insert(guessString, at: 0)
        tableView.insertRows(at: IndexSet(integer: 0), withAnimation: .slideDown)
        
        // did the player win?
        let resultString = result(for: guessString)
        
        if (resultString.contains("4b")) {
            var messageText = "You win! \(steps) steps.\n"
            
            if (steps < 10) {
                messageText += "That's the great result!"
            } else if (steps < 20) {
                messageText += "Good result!"
            } else {
                messageText += "Could be better!"
            }

            let alert = NSAlert()
            alert.messageText = messageText
            alert.informativeText = "Congratulations! Click OK to play again."
            alert.runModal()
            
            startNewGame()
        }
    }
    
    func numberOfRows(in tableView: NSTableView) -> Int {
        return guesses.count
    }
    
    func result(for guess: String) -> String {
        var bulls = 0
        var cows = 0
        
        let guessLetters = Array(guess)
        let answerLetters = Array(answer)
        
        for (index, letter) in guessLetters.enumerated() {
            if letter == answerLetters[index] {
                bulls += 1
            } else if answerLetters.contains(letter) {
                cows += 1
            }
        }
        
        return "\(bulls)b \(cows)c"
    }
    
    func tableView(_ tableView: NSTableView, viewFor tableColumn: NSTableColumn?, row: Int) -> NSView? {
        guard let vw = tableView.makeView(withIdentifier: tableColumn!.identifier, owner: self) as? NSTableCellView else { return nil }
        
        if (tableColumn?.title == "Guess") {
            // this is the Guess column, show a previous guess
            vw.textField?.stringValue = guesses[row]
        } else {
            // this is the Result colunb, call our new method
            vw.textField?.stringValue = result(for: guesses[row])
        }
        
        return vw
    }
    
    func tableView(_ tableView: NSTableView, shouldSelectRow row: Int) -> Bool {
        return true
    }
    
    func startNewGame() {
        guess.stringValue = ""
        guesses.removeAll()
        answer = ""
        steps = 0
        
        var numbers = Array(0...9)
        numbers.shuffle()
        
        for _ in 0 ..< 4 {
            answer.append(String(numbers.removeLast()))
        }
        
        tableView.reloadData()
    }
    
}
