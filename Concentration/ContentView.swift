//
//  ContentView.swift
//  Concentration
//
//  Created by Steve Liddle on 9/7/21.
//

import SwiftUI

struct ContentView: View {
    var emojiGame: EmojiConcentrationGame

    var fontForGameSize: Font {
        emojiGame.cards.count < 10 ? .largeTitle : .body
    }

    var body: some View {
        HStack {
            ForEach(emojiGame.cards) { card in
                CardView(card: card, emojiFont: fontForGameSize)
                    .onTapGesture {
                        emojiGame.choose(card: card)
                    }
            }
        }
        .padding()
        .foregroundColor(.blue)
    }
}

struct CardView: View {
    var card: ConcentrationGame<String>.Card
    var emojiFont: Font

    var body: some View {
        ZStack {
            if card.isFaceUp {
                RoundedRectangle(cornerRadius: 10).fill(.white)
                RoundedRectangle(cornerRadius: 10).stroke()
                Text(card.content)
                    .font(emojiFont)
            } else {
                RoundedRectangle(cornerRadius: 10)
            }
        }
        .aspectRatio(2/3, contentMode: .fit)
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(emojiGame: EmojiConcentrationGame())
    }
}
