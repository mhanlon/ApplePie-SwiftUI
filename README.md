# ApplePie-SwiftUI

This project is a SwiftUI implementation of the ApplePie project from [Develop in Swift Fundamentals](https://apple.co/developinswiftfundamentals).

Some of the biggest differences are the way we organize the data in the project. Of course, there are a million ways to do this. In this model we have our `Game` struct, which stores the basic game data, like the number of guesses left, the word we're trying to guess, the letters in each row of the 'keyboard.' Our `Letter` struct, which stores the letter value for each letter as well as whether or not it's been selected.

There is then the "ViewModel" piece, our `GameViewModel` class, which publishes changes to the model to the UI, which will update accordingly.

You'll note that a lot of our work in the UIKit version, where we called `updateUI()` is gone in this edition of the project due to the nature of SwiftUI.