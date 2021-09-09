//
//  ConcentrationApp.swift
//  Concentration
//
//  Created by Steve Liddle on 9/7/21.
//

import SwiftUI

@main
struct ConcentrationApp: App {
    var body: some Scene {
        WindowGroup {
            EmojiGameView(emojiGame: EmojiConcentrationGame())
        }
    }
}
