//
//  Theme.swift
//  Concentration
//
//  Created by Steve Liddle on 9/30/21.
//

import Foundation
import SwiftUI

enum GameType {
    case emojiMojo
    case shapeScape
    case templeMatch
}

struct Theme: Identifiable, Hashable {
    var id = UUID()
    var name: String
    var content: [String]
    var numberOfPairsOfCards: Int
    var color:  Color
    var gameType: GameType

}

let themes = [
    Theme(
        name: "Food",
        content: ["🥨", "🥑", "🥭", "🌶", "🥐", "🥯", "🍒", "🥦"],
        numberOfPairsOfCards: 4,
        color: Color.brown,
        gameType: .emojiMojo
    ),
    Theme(
        name: "Animals",
        content: ["🦉", "🐢", "🐙", "🦞", "🐳", "🐄", "🦨", "🦮"],
        numberOfPairsOfCards: 4,
        color: Color.cyan,
        gameType: .emojiMojo
    ),
    Theme(
        name: "Smileys",
        content: ["🤕", "😥", "🤫", "🙄", "🤧", "😬", "🤥", "🥵"],
        numberOfPairsOfCards: 4,
        color: Color.gray,
        gameType: .emojiMojo
    ),
    Theme(
        name: "Activity",
        content: ["⛷", "🏄🏻‍♀️", "🏋🏼‍♀️", "🤺", "🚴🏽‍♀️", "🧗‍♀️", "🏇", "🪂"],
        numberOfPairsOfCards: 4,
        color: Color.yellow,
        gameType: .emojiMojo
    ),
    Theme(
        name: "Clothing",
        content: ["👔", "🎩", "👟", "🧤", "🧦", "👑", "⛑", "👘"],
        numberOfPairsOfCards: 4,
        color: Color.green,
        gameType: .emojiMojo
    ),
    Theme(
        name: "Random",
        content: ["👔", "🎩", "👟", "🧤", "🧦", "👑", "⛑", "👘","⛷", "🏄🏻‍♀️", "🏋🏼‍♀️", "🤺", "🚴🏽‍♀️", "🧗‍♀️", "🏇", "🪂","🤕", "😥", "🤫", "🙄", "🤧", "😬", "🤥", "🥵","🦉", "🐢", "🐙", "🦞", "🐳", "🐄", "🦨", "🦮","🥨", "🥑", "🥭", "🌶", "🥐", "🥯", "🍒", "🥦"],
        numberOfPairsOfCards: 4,
        color: Color.black,
        gameType: .emojiMojo
    ),
    Theme(
        name: "Utah",
        content: ["SLC", "PROVO", "OGDEN", "MANTAI", "PROVO-CENTER", "LOGAN", "BOUNTIFUL", "TIMPANOGOS"],
        numberOfPairsOfCards: 4,
        color: Color.pink,
        gameType: .templeMatch
    ),
    Theme(
        name: "East",
        content: ["BOSTON", "PHILADELPHIA", "RICHMOND", "COLUMBIA", "HARTFORD", "DC", "NYC", "FORT-LAUD"],
        numberOfPairsOfCards: 4,
        color: Color.pink,
        gameType: .templeMatch
    ),
    Theme(
        name: "Abroad",
        content: ["LONDON", "PARIS", "TOKYO", "SWEDEN", "SEOUL", "ROME", "RIO", "MEXICO-CITY", "TAIPEI"],
        numberOfPairsOfCards: 4,
        color: Color.pink,
        gameType: .templeMatch
    ),
    Theme(
        name: "Shapes",
        content: ["rect", "circle", "roundRect", "capsule", "triangle"],
        numberOfPairsOfCards: 4,
        color: Color.mint,
        gameType: .shapeScape
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

