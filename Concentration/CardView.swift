//
//  CardView.swift
//  CardView
//
//  Created by Steve Liddle on 9/9/21.
//

import SwiftUI

struct CardView: View {
    var card: ConcentrationGame<String>.Card
    var emojiFont: Font

    var body: some View {
        ZStack {
            if card.isFaceUp {
                RoundedRectangle(cornerRadius: cardCornerRadius).fill(.white)
                RoundedRectangle(cornerRadius: cardCornerRadius).stroke()
                Text(card.content)
                    .font(emojiFont)
            } else {
                RoundedRectangle(cornerRadius: cardCornerRadius)
            }
        }
        .aspectRatio(2/3, contentMode: .fit)
    }

    // MARK: - Drawing constants

    private let cardCornerRadius = 10.0
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(card: ConcentrationGame<String>.Card(content: "🥝", id: 13), emojiFont: .largeTitle)
            .padding(50)
    }
}
