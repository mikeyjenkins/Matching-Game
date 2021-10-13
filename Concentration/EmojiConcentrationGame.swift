//
//  EmojiConcentrationGame.swift
//  EmojiConcentrationGame
//
//  Created by Steve Liddle on 9/8/21.
//

import SwiftUI

class EmojiConcentrationGame: ObservableObject {
    @Published private var game: ConcentrationGame<String>
    
    private var player = SoundPlayer()
    
    private var theme: Theme
    
    init(theme: Theme, userNumberOfCards: String) {
        game = EmojiConcentrationGame.createGame(theme: theme, userNumberOfCards: userNumberOfCards)
        self.theme = theme
    }

    private static func createGame(theme: Theme, userNumberOfCards: String) -> ConcentrationGame<String> {
        
        if theme.name == "Random"{
            let themes_shu = theme.content.shuffled()
            let randomNumber = Int.random(in: 2..<10)
            
            func getRandomColor() -> Color{
                 let randomRed = CGFloat.random(in: 0...1)
                 let randomGreen = CGFloat.random(in: 0...1)
                 let randomBlue = CGFloat.random(in: 0...1)
                 return Color(red: Double(randomRed), green: Double(randomGreen), blue: Double(randomBlue))
            }
            
            return ConcentrationGame<String>(numberOfPairsOfCards: randomNumber, color: getRandomColor()) { index in
                themes_shu[index]
            }
        }
        
        
        var chosenCardCount = theme.numberOfPairsOfCards
        //only accept greater than 2
        if let cardCount = Int(userNumberOfCards){
            if(cardCount >= 2 && cardCount <= theme.content.count) {
                chosenCardCount = cardCount
            }
        }
        return ConcentrationGame<String>(numberOfPairsOfCards: chosenCardCount, color: theme.color) { index in
            theme.content[index]
        }
    }

    // MARK: - Access to model

    var cards: Array<ConcentrationGame<String>.Card> {
        game.cards
    }
    
    var gameType: GameType {
        theme.gameType
    }

    var score: Int {
        game.score
    }
    
    var themeColor: Color {
        game.color
    }
    
    var name: String {
        theme.name
    }
    

    // MARK: - Intents

    func choose(_ card: ConcentrationGame<String>.Card) {
        game.choose(card)
        player.playSound(name: "Flip.mp3")
        
        //check to see if high score for each game mode is affected by current game score
        if (UserDefaults.standard.integer(forKey: theme.name) < score || UserDefaults.standard.string(forKey: theme.name) == nil)  {
            UserDefaults.standard.set(score, forKey: theme.name)
        }
        //check if the high score is greater than the overall high score of any game mode
        if(UserDefaults.standard.integer(forKey: "overall") < score) || (UserDefaults.standard.string(forKey: "overall") == nil) {
            UserDefaults.standard.set(score, forKey: "overall")
        }
    }

    func newGame() {
        game = EmojiConcentrationGame.createGame(theme: theme, userNumberOfCards: "")
    }
}
