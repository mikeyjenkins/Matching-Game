//
//  HighScores.swift
//  Concentration
//
//  Created by Michael Jenkins on 10/13/21.
//

import SwiftUI

struct HighScores: View {
    
    var body: some View {

            List{
                Text("Overall High Score: " + getOverallScore())
                Text("\(themes[0].name) High Score: " + getScore(for: 0))
                Text("\(themes[1].name) High Score: " + getScore(for: 1))
                Text("\(themes[2].name) High Score: " + getScore(for: 2))
                Text("\(themes[3].name) High Score: " + getScore(for: 3))
                Text("\(themes[4].name) High Score: " + getScore(for: 4))
                Text("\(themes[5].name) High Score: " + getScore(for: 5))
                Text("\(themes[6].name) High Score: " + getScore(for: 6))
                Text("\(themes[7].name) High Score: " + getScore(for: 7))
                Text("\(themes[8].name) High Score: " + getScore(for: 8))
            }
        
    }
    
    private func getScore(for index: Int) -> String {
        if(UserDefaults.standard.integer(forKey: themes[index].name) > 0){
            return String(UserDefaults.standard.integer(forKey: themes[index].name))
        }
        else {
            return "No High Score"
        }
    }
    
    private func getOverallScore() -> String {
        if(UserDefaults.standard.integer(forKey: "overall") > 0){
            return String(UserDefaults.standard.integer(forKey: "overall"))
        }
        else {
            return "No High Score"
        }
    }
}

struct HighScores_Previews: PreviewProvider {
    static var previews: some View {
        HighScores()
    }
}
