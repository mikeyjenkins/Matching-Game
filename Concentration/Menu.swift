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
            }
        }
    }
}

struct Menu_Previews: PreviewProvider {
    static var previews: some View {
        Menu()
    }
}
