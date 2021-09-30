//
//  EmojiGameView.swift
//  Concentration
//
//  Created by Steve Liddle on 9/7/21.
//

import SwiftUI

struct EmojiGameView: View {
    @ObservedObject var emojiGame: EmojiConcentrationGame

    private func columns(for size: CGSize) -> [GridItem] {
        Array(repeating: GridItem(.fixed(Constants.desiredCardWidth)), count: Int(size.width / Constants.desiredCardWidth))
    }

    var body: some View {
        NavigationView {
            GeometryReader { geometry in
                AspectVGrid(items: emojiGame.cards, aspectRatio: 2/3) { card in
                    CardView(card: card)
                        .padding(geometry.size.width * 0.01)
                        .onTapGesture {
                            withAnimation {
                                emojiGame.choose(card)
                            }
                        }
                }
                    .padding(geometry.size.width * 0.01)
                    .foregroundColor(.blue)
            }
            .navigationTitle("Concentration")
            .navigationBarItems(leading: Button("New Game") {
                withAnimation {
                    emojiGame.newGame()
                }
            }, trailing: Text("Score: \(emojiGame.score)"))
            .navigationBarTitleDisplayMode(.inline)
        }
    }

    private struct Constants {
        static let desiredCardWidth: CGFloat = 110
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        EmojiGameView(emojiGame: EmojiConcentrationGame())
    }
}
