//
//  ConcentrationGame.swift
//  ConcentrationGame
//
//  Created by Steve Liddle on 9/8/21.
//

import Foundation

struct ConcentrationGame<CardContent> where CardContent: Equatable {
    private(set) var cards: Array<Card>

    var score: Int {
        cards.reduce(0) { total, card in
            total + card.score
        }
    }

    private var indexOfTheOneAndOnlyFaceUpCard: Int? {
        get { cards.indices.filter { cards[$0].isFaceUp }.only }
        set { cards.indices.forEach { cards[$0].isFaceUp = ($0 == newValue) } }
    }

    init(numberOfPairsOfCards: Int, cardContentFactory: (Int) -> CardContent) {
        cards = Array<Card>()

        for pairIndex in 0..<numberOfPairsOfCards {
            let content = cardContentFactory(pairIndex)

            cards.append(Card(content: content))
            cards.append(Card(content: content))
        }

        cards.shuffle()
    }

    mutating func choose(_ card: Card) {
        if let chosenIndex = cards.firstIndex(matching: card),
               !cards[chosenIndex].isFaceUp,
               !cards[chosenIndex].isMatched {

            if let potentialMatchIndex = indexOfTheOneAndOnlyFaceUpCard {
                if cards[potentialMatchIndex].content == cards[chosenIndex].content {
                    cards[chosenIndex].isMatched = true
                    cards[potentialMatchIndex].isMatched = true
                }

                cards[chosenIndex].isFaceUp = true
            } else {
                indexOfTheOneAndOnlyFaceUpCard = chosenIndex
            }

            cards[chosenIndex].viewCount += 1
        }
    }

    struct Card: Identifiable {
        fileprivate(set) var isFaceUp = false
        fileprivate(set) var isMatched = false
        fileprivate(set) var viewCount = 0
        fileprivate(set) var content: CardContent
        fileprivate(set) var id = UUID()

        var score: Int {
            if isMatched {
                return 3 - viewCount
            }

            if viewCount > 0 {
                return -viewCount + 1
            }

            return 0
        }
    }
}
