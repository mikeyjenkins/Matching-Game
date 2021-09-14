//
//  CardView.swift
//  CardView
//
//  Created by Steve Liddle on 9/9/21.
//

import SwiftUI

struct CardView: View {
    var card: ConcentrationGame<String>.Card

    var body: some View {
        GeometryReader { geometry in
            ZStack {
                if card.isFaceUp {
                    RoundedRectangle(cornerRadius: Constants.cardCornerRadius).fill(.white)
                    RoundedRectangle(cornerRadius: Constants.cardCornerRadius).stroke()
                    Text(card.content)
                        .font(systemFont(for: geometry.size))
                } else {
                    RoundedRectangle(cornerRadius: Constants.cardCornerRadius)
                }
            }
        }
        .aspectRatio(2/3, contentMode: .fit)
    }

    private func systemFont(for size: CGSize) -> Font {
        Font.system(size: min(size.width, size.height) * Constants.fontScaleFactor)
    }

    private struct Constants {
        static let cardCornerRadius = 10.0
        static let fontScaleFactor = 0.75
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(card: ConcentrationGame<String>.Card(content: "🥝", id: 13))
            .padding(50)
    }
}
