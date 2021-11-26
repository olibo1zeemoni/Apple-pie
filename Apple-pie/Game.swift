//
//  Game.swift
//  Apple-pie
//
//  Created by Olibo moni on 23/11/2021.
//

import Foundation

struct Game {
    var word: String
    var incorrectMOvesRemaining: Int
    var guessedLetters: [Character]
    
    
    
    mutating func playerGuessed(letter: Character) {
        guessedLetters.append(letter)
        if !word.contains(letter) {
            incorrectMOvesRemaining -= 1
        }
    }
    
    var formattedWord: String {
        var guessedWord = ""
        for letter in word {
            if guessedLetters.contains(letter){
                guessedWord += String(letter)
            } else {
                guessedWord += "_"
            }
        }
        return guessedWord
    }
    
    
    
}
