import SwiftUI

class GameViewModel: ObservableObject {
    @Published private var game = Game(word: Game.wordList.randomElement()!, incorrectMovesRemaining: Game.incorrectMovesAllowed)
    @Published var totalWins = 0 {
        didSet {
            game = Game(word: Game.wordList.randomElement()!, incorrectMovesRemaining: Game.incorrectMovesAllowed)
        }
    }
    @Published var totalLosses = 0 {
        didSet {
            game = Game(word: Game.wordList.randomElement()!, incorrectMovesRemaining: Game.incorrectMovesAllowed)
        }
    }
    
    var guessesRemaining: Int {
        get {
            game.incorrectMovesRemaining
        }
        set {
            game.incorrectMovesRemaining = newValue
        }
    }
    
    
    var topRow: [Letter] {
        game.topRow
    }
    var middleRow: [Letter] {
        game.middleRow
    }
    var bottomRow: [Letter] {
        game.bottomRow
    }
    
    var allLetters: [Letter] {
        game.topRow + game.middleRow + game.bottomRow
    }
    
    var formattedWord: String {
        var letters: [String] = []
        for letter in game.formattedWord {
            letters.append(String(letter))
        }
        return letters.joined(separator: " ")
    }
    
    // Actions
    public func select(_ letter: Letter) {
        game.select(letter)
        if !game.word.contains(letter.characterValue.lowercased()) {
            game.incorrectMovesRemaining -= 1
        }
        if game.incorrectMovesRemaining == 0 {
            print("one more los$!")
            totalLosses += 1
        } else if game.formattedWord == game.word {
            totalWins += 1
        }  
        print("guesed wird: \(game.formattedWord) \(game.word) - word")
    }
    
    
}
