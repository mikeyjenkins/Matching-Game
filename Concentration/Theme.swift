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
        numberOfPairsOfCards: 4,
        color: Color.brown,
        gameType: "emoji"
    ),
    (
        name: "Animals",
        content: ["🦉", "🐢", "🐙", "🦞", "🐳", "🐄", "🦨", "🦮"],
        numberOfPairsOfCards: 4,
        color: Color.black,
        gameType: "emoji"
    ),
    (
        name: "Smileys",
        content: ["🤕", "😥", "🤫", "🙄", "🤧", "😬", "🤥", "🥵"],
        numberOfPairsOfCards: 4,
        color: Color.black,
        gameType: "emoji"
    ),
    (
        name: "Activity",
        content: ["⛷", "🏄🏻‍♀️", "🏋🏼‍♀️", "🤺", "🚴🏽‍♀️", "🧗‍♀️", "🏇", "🪂"],
        numberOfPairsOfCards: 4,
        color: Color.black,
        gameType: "emoji"
    ),
    (
        name: "Clothing",
        content: ["👔", "🎩", "👟", "🧤", "🧦", "👑", "⛑", "👘"],
        numberOfPairsOfCards: 4,
        color: Color.black,
        gameType: "emoji"
    ),
    (
        name: "Balls",
        content: ["⚽️", "🏀", "🏈", "⚾️", "🎾", "🏐", "🏉", "🥏"],
        numberOfPairsOfCards: 4,
        color: Color.black,
        gameType: "emoji"
    ),
    (
        name: "Utah",
        content: ["SLC", "PROVO", "OGDEN", "MANTAI", "PROVO-CENTER", "LOGAN", "BOUNTIFUL", "TIMPANOGOS"],
        numberOfPairsOfCards: 4,
        color: Color.blue,
        gameType: "temple"
    ),
    (
        name: "shapes",
        content: ["rect", "circle", "roundRect", "capsule"],
        numberOfPairsOfCards: 4,
        color: Color.green,
        gameType: "shapes"
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

