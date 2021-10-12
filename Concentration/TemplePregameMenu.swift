//
//  TemplePregameMenu.swift
//  Concentration
//
//  Created by Michael Jenkins on 10/9/21.
//

import SwiftUI

struct TemplePregameMenu: View {
    @State private var cardUserInput = ""
    
    var body: some View {
        Form {
            Section {
                NavigationLink("Utah", destination: EmojiGameView(emojiGame: EmojiConcentrationGame.init(theme: themes[6], userNumberOfCards: cardUserInput)))
                
                TextField("Enter Number of Cards", text: $cardUserInput)
                
                
            }
        }
    }
}

struct TemplePregameMenu_Previews: PreviewProvider {
    static var previews: some View {
        TemplePregameMenu()
    }
}
