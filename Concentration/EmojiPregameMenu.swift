//
//  EmojiPregameMenu.swift
//  Concentration
//
//  Created by Michael Jenkins on 10/8/21.
//

import SwiftUI

struct EmojiPregameMenu: View {
    @State private var cardUserInput = ""
    
    
    var body: some View {
        Form {
            Section {
                NavigationLink("Food", destination: EmojiGameView(emojiGame: EmojiConcentrationGame.init(theme: themes[0], userNumberOfCards: cardUserInput)))
                
                NavigationLink("Animals", destination: EmojiGameView(emojiGame: EmojiConcentrationGame.init(theme: themes[1], userNumberOfCards: cardUserInput)))
                
                NavigationLink("Smileys", destination: EmojiGameView(emojiGame: EmojiConcentrationGame.init(theme: themes[2], userNumberOfCards: cardUserInput)))
                
                NavigationLink("Activity", destination: EmojiGameView(emojiGame: EmojiConcentrationGame.init(theme: themes[3], userNumberOfCards: cardUserInput)))
                
                TextField("Enter Number of Cards", text: $cardUserInput)
                
                
            }
        }
    }
    
}

struct EmojiPregameMenu_Previews: PreviewProvider {
    static var previews: some View {
        EmojiPregameMenu()
    }
}
