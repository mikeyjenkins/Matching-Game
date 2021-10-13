//
//  EmojiGameView.swift
//  Concentration
//
//  Created by Steve Liddle on 9/7/21.
//

import SwiftUI


struct EmojiGameView: View {
    @ObservedObject var emojiGame: EmojiConcentrationGame

    @State private var dealtCards = Set<UUID>()
    @Namespace private var dealingCards

    var body: some View {
        VStack {
            ZStack(alignment: .bottom) {
                gameBody
                deckBody
            }
            .edgesIgnoringSafeArea(.bottom)
            .navigationBarItems(leading: Button("New Game") {
                withAnimation {
                    emojiGame.newGame()
                }
            }, trailing: Text("GHS:" + String(UserDefaults.standard.integer(forKey: emojiGame.name)) +  " Score: \(emojiGame.score)"))
            .navigationBarTitleDisplayMode(.inline)
        }
    }

    var deckBody: some View {
        ZStack {
            ForEach(emojiGame.cards) { card in
                if isUndealt(card) {
                    CardView(card: card, gameType: emojiGame.gameType)
                        .zIndex(zIndex(for: card))
                        .matchedGeometryEffect(id: card.id, in: dealingCards)
                        .transition(AnyTransition.asymmetric(insertion: .opacity, removal: .identity))
                }
            }
        }
        .foregroundColor(emojiGame.themeColor)
        .frame(width: CardConstants.deckWidth, height: CardConstants.deckHeight)
        .padding(.bottom)
        .onTapGesture {
            for card in emojiGame.cards {
                withAnimation(dealAnimation(for: card)) {
                    deal(card)
                }
            }
        }
    }

    var gameBody: some View {
        GeometryReader { geometry in
            AspectVGrid(items: emojiGame.cards, aspectRatio: CardConstants.aspectRatio) { card in
                if !isUndealt(card) {
                    CardView(card: card, gameType: emojiGame.gameType)
                        .zIndex(zIndex(for: card))
                        .matchedGeometryEffect(id: card.id, in: dealingCards)
                        .transition(AnyTransition.asymmetric(insertion: .identity, removal: .scale))
                        .padding(geometry.size.width * 0.01)
                        .onTapGesture {
                            withAnimation {
                                emojiGame.choose(card)
                            }
                        }
                }
            }
            .padding(geometry.size.width * 0.01)
            .foregroundColor(emojiGame.themeColor)
        }
    }

    private func dealAnimation(for card: ConcentrationGame<String>.Card) -> Animation {
        var delay = 0.0

        if let index = emojiGame.cards.firstIndex(matching: card) {
            delay = Double(index) * CardConstants.totalDealDuration / Double(emojiGame.cards.count)
        }

        return Animation.easeInOut(duration: CardConstants.dealDuration).delay(delay)
    }

    private func deal(_ card: ConcentrationGame<String>.Card) {
        dealtCards.insert(card.id)
    }

    private func isUndealt(_ card: ConcentrationGame<String>.Card) -> Bool {
        !dealtCards.contains(card.id)
    }

    private func zIndex(for card: ConcentrationGame<String>.Card) -> Double {
        -Double(emojiGame.cards.firstIndex(matching: card) ?? 0)
    }

    private struct CardConstants {
        static let aspectRatio: CGFloat = 2/3
        static let dealDuration = 0.5
        static let deckHeight: CGFloat = 150
        static let deckWidth = deckHeight * aspectRatio
        static let totalDealDuration = 2.0
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        EmojiGameView(emojiGame: EmojiConcentrationGame(theme: themes[7], userNumberOfCards: ""))
    }
}
