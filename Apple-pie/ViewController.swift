//
//  ViewController.swift
//  Apple-pie
//
//  Created by Olibo moni on 23/11/2021.
//

import UIKit



class ViewController: UIViewController {
    
    var listOfWords = ["xcode","bug", "swift","apple", "mac", "tree","honda"]
    var incorrectMovesAllowed = 4
    var totalWins = 0 {
        didSet {
            newRound()
        }
    }
    var totalLosses = 0 {
        didSet {
            newRound()
        }
    }
    
    var currentGame: Game!
    
    
    
    @IBOutlet weak var treeImageView: UIImageView!
    @IBOutlet weak var correctWordLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    
    @IBOutlet var letterButtons: [UIButton]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        newRound()
        
    }
    
    func newRound(){
        if !listOfWords.isEmpty{
            let newWord = listOfWords.removeFirst()
            currentGame = Game(word: newWord, incorrectMOvesRemaining: incorrectMovesAllowed, guessedLetters: [])
            enableLetterButtons(true)
            updateUI()
        } else {
            enableLetterButtons(false)
        }
        
    }
    
    func enableLetterButtons(_ enable: Bool){
        for button in letterButtons {
            button.isEnabled = enable
        }
    }
    
    func updateUI(){
        var letters = [String]()
        for letter in currentGame.formattedWord {
            letters.append(String(letter))
        }
        
        let wordWithSpacing = letters.joined(separator: " ")
        correctWordLabel.text = wordWithSpacing
        scoreLabel.text = "Wins: \(totalWins), Losses: \(totalLosses)"
        treeImageView.image = UIImage(named: "Tree \(currentGame.incorrectMOvesRemaining)")
        
    }
    
    func updateGameState(){
        if currentGame.incorrectMOvesRemaining == 0 {
            totalLosses += 1
        } else if currentGame.word == currentGame.formattedWord{
            totalWins += 1 }
        else {
            updateUI()
        }
    }
    
    @IBAction func letterButtonPressed(_ sender: UIButton) {
        sender.isEnabled = false
        let letterString = sender.titleLabel?.text
        
        //(sender.title(for: .normal)) != nil ? sender.titleLabel?.text : ""
        let letter = Character(letterString!.lowercased() )
            currentGame.playerGuessed(letter: letter)
           
        
        
        updateGameState()
        
    }
    
    
    @IBAction func restartBtnPressed(_ sender: UIButton) {
        
        incorrectMovesAllowed = 4
        currentGame.guessedLetters = []
        listOfWords = ["xcode","bug", "swift","apple", "mac", "tree","honda"]
        let newWord = listOfWords.removeFirst()
        currentGame = Game(word: newWord, incorrectMOvesRemaining: incorrectMovesAllowed, guessedLetters: [])
        enableLetterButtons(true)
        totalWins = 0
        totalLosses = 0
        print("restart button pressed")
    }
    
    
}

