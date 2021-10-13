//
//  Menu.swift
//  Concentration
//
//  Created by Michael Jenkins on 10/8/21.
//

import SwiftUI

struct Menu: View {
    
    
    var body: some View {
        NavigationView {
            List {
                NavigationLink(destination: EmojiPregameMenu()){
                    Text("Emoji Mojo")
                }
                NavigationLink(destination: TemplePregameMenu()){
                    Text("Temple Match")
                }
                NavigationLink("Shapes", destination: EmojiGameView(emojiGame: EmojiConcentrationGame.init(theme: themes[9], userNumberOfCards: "4")))
                NavigationLink(destination: HighScores()){
                    Text("High Scores")
                }
            }
        }
    }
}

struct Menu_Previews: PreviewProvider {
    static var previews: some View {
        Menu()
    }
}
