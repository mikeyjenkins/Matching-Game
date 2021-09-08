//
//  ConcentrationGame.swift
//  ConcentrationGame
//
//  Created by Steve Liddle on 9/8/21.
//

import Foundation

struct ConcentrationGame<CardContent> {
    var cards: Array<Card>

    init(numberOfPairsOfCards: Int, cardContentFactory: (Int) -> CardContent) {
        cards = Array<Card>()

        for pairIndex in 0..<numberOfPairsOfCards {
            let content = cardContentFactory(pairIndex)

            cards.append(Card(content: content, id: pairIndex * 2))
            cards.append(Card(content: content, id: pairIndex * 2 + 1))
        }

        cards.shuffle()
    }

    func choose(card: Card) {
        print("You chose \(card)")
    }

    struct Card: Identifiable {
        var isFaceUp = true
        var isMatched = false
        var content: CardContent
        var id: Int
    }
}
