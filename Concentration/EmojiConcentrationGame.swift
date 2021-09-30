//
//  EmojiConcentrationGame.swift
//  EmojiConcentrationGame
//
//  Created by Steve Liddle on 9/8/21.
//

import SwiftUI

class EmojiConcentrationGame: ObservableObject {
    @Published private var game = createGame()

    private static func createGame() -> ConcentrationGame<String> {
        ConcentrationGame<String>(numberOfPairsOfCards: Int.random(in: 3...Theme.emojis.count)) { index in
            Theme.emojis[index]
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
        game = EmojiConcentrationGame.createGame()
    }
}
