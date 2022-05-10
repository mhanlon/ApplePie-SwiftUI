import SwiftUI

struct TreeView: View {
    @Binding var guessesRemaining: Int
    
    var body: some View {
        Image("Tree \(guessesRemaining)")
            .resizable()
            .scaledToFit()
    }
}



