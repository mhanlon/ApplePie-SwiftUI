import SwiftUI

struct ContentView: View {
    @StateObject private var game = GameViewModel()
    
    var body: some View {
        VStack {
            TreeView(guessesRemaining: $game.guessesRemaining)
            HStack {
                // top row letters
                ForEach(game.topRow, id:\.self) { letter in
                    Button("\(letter.rawValue)") { 
                        game.select(letter)
                    }
                    .disabled(letter.selected)
                    .font(.title)
                    .padding(4)
                }
            }
            HStack {
                ForEach(game.middleRow, id:\.self) { letter in
                    Button("\(letter.rawValue)") { 
                        game.select(letter)
                    }
                    .disabled(letter.selected)
                    .font(.title)
                    .padding(5)
                }
            }
            HStack {
                ForEach(game.bottomRow, id:\.self) { letter in
                    Button("\(letter.rawValue)") { 
                        game.select(letter)
                    }
                    .disabled(letter.selected)
                    .font(.title)
                    .padding(5)
                }
            }
            Text(game.formattedWord) // correct word label
                .font(.title)
            Text("Wins: \(game.totalWins), Losses: \(game.totalLosses)") // score label
                .font(.subheadline)
                .padding(.bottom)
        }
    }
}
