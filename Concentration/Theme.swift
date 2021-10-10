//
//  Theme.swift
//  Concentration
//
//  Created by Steve Liddle on 9/30/21.
//

import Foundation
import SwiftUI

//enum GameType {
//    case emojiMojo
//    case shapeScape
//    case templeMatch
//}
//
//struct Theme: Identifiable, Hashable {
//    var id = UUID()
//    var name: String
//    var gameType: GameType
//    var content: [String]
//    var color:  Color
//    var numberOfPairsOfCards: Int
//}

let themes = [
    (
        name: "Food",
        content: ["🥨", "🥑", "🥭", "🌶", "🥐", "🥯", "🍒", "🥦"],
        color: Color.brown,
        numberOfPairsOfCards: 4,
        gameType: "emoji"
    ),
    (
        name: "Animals",
        content: ["🦉", "🐢", "🐙", "🦞", "🐳", "🐄", "🦨", "🦮"],
        color: Color.black,
        numberOfPairsOfCards: 4,
        gameType: "emoji"
    ),
    (
        name: "Smileys",
        content: ["🤕", "😥", "🤫", "🙄", "🤧", "😬", "🤥", "🥵"],
        color: Color.black,
        numberOfPairsOfCards: 4,
        gameType: "emoji"
    ),
    (
        name: "Activity",
        content: ["⛷", "🏄🏻‍♀️", "🏋🏼‍♀️", "🤺", "🚴🏽‍♀️", "🧗‍♀️", "🏇", "🪂"],
        color: Color.black,
        numberOfPairsOfCards: 4,
        gameType: "emoji"
    ),
    (
        name: "Clothing",
        content: ["👔", "🎩", "👟", "🧤", "🧦", "👑", "⛑", "👘"],
        color: Color.black,
        numberOfPairsOfCards: 4,
        gameType: "emoji"
    ),
    (
        name: "Balls",
        content: ["⚽️", "🏀", "🏈", "⚾️", "🎾", "🏐", "🏉", "🥏"],
        color: Color.black,
        numberOfPairsOfCards: 4,
        gameType: "emoji"
    ),
    (
        name: "Pioneer Temple",
        content: ["rect", "circle", "oval", "square"],
        color: Color.blue,
        numberOfPairsOfCards: 4,
        gameType: "shape"
    ),
    (
        name: "Food",
        content: ["slc", "provo", "boston"],
        color: Color.green,
        numberOfPairsOfCards: 4,
        gameType: "temple"
    )
]


struct ContentView: View {
    @State private var name = ""
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Games")) {
                    NavigationLink("Emoji Mojo", destination: {
                        Capsule().fill(.purple)
                            .padding()
                    })
                }
                .navigationTitle("Project 1")
            }
        }
    }
}

