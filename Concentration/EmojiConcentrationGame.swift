//
//  EmojiConcentrationGame.swift
//  EmojiConcentrationGame
//
//  Created by Steve Liddle on 9/8/21.
//

import SwiftUI

class EmojiConcentrationGame: ObservableObject {
    @Published private var game: ConcentrationGame<String>
        
    private var theme: (name: String, content: [String], numberOfPairsOfCards: Int, color: Color, gameType: String)
    
    init(theme: (name: String, content: [String], numberOfPairsOfCards: Int, color: Color, gameType: String), userNumberOfCards: String) {
        game = EmojiConcentrationGame.createGame(theme: theme, userNumberOfCards: userNumberOfCards)
        self.theme = theme
    }

    private static func createGame(theme: (name: String, content: [String], numberOfPairsOfCards: Int, color: Color, gameType: String), userNumberOfCards: String) -> ConcentrationGame<String> {
        
        var chosenCardCount = theme.numberOfPairsOfCards
        
        //only accept greater than 2
        if let cardCount = Int(userNumberOfCards){
            if(cardCount >= 2 && cardCount <= theme.content.count) {
                chosenCardCount = cardCount
            }
        }
        return ConcentrationGame<String>(numberOfPairsOfCards: chosenCardCount) { index in
            theme.content[index]
        }
    }

    // MARK: - Access to model

    var cards: Array<ConcentrationGame<String>.Card> {
        game.cards
    }

    var score: Int {
        game.score
    }

    // MARK: - Intents

    func choose(_ card: ConcentrationGame<String>.Card) {
        game.choose(card)
    }

    func newGame() {
        game = EmojiConcentrationGame.createGame(theme: theme, userNumberOfCards: "")
    }
}
