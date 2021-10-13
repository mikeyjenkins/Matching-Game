//
//  SettingsView.swift
//  SettingsView
//
//  Created by Paolo Poemape on 10/12/21.
//
import SwiftUI

struct Settings: View {
    static let flipSound = "FlipSound"
    @State private var playFlipSound = UserDefaults.standard.bool(forKey: flipSound)

    var body: some View {
        Form{
            Section{
                Toggle("Play sound", isOn: $playFlipSound).padding(.horizontal)

            }
        }
        .onAppear{
            playFlipSound = UserDefaults.standard.bool(forKey: Settings.flipSound)
        }
        .onDisappear{
            UserDefaults.standard.set(playFlipSound, forKey: Settings.flipSound)
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        Settings()
    }
}
