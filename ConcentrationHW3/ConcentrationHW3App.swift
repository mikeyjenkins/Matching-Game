//
//  ConcentrationHW3App.swift
//  ConcentrationHW3
//
//  Created by Steve Liddle on 9/7/21.
//

import SwiftUI

@main
struct ConcentrationHW3App: App {
    var body: some Scene {
        WindowGroup {
            ContentView(emojiGame: EmojiConcentrationGame())
        }
    }
}
