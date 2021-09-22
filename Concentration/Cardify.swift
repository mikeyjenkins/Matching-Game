//
//  Cardify.swift
//  Concentration
//
//  Created by Steve Liddle on 9/21/21.
//

import SwiftUI

struct Cardify: ViewModifier {
    var isFaceUp: Bool

    func body(content: Content) -> some View {
        ZStack {
            if isFaceUp {
                RoundedRectangle(cornerRadius: Constants.cardCornerRadius).fill(.white)
                RoundedRectangle(cornerRadius: Constants.cardCornerRadius).stroke()
            } else {
                RoundedRectangle(cornerRadius: Constants.cardCornerRadius)
            }

            content.opacity(isFaceUp ? 1 : 0)
        }
        .rotation3DEffect(Angle.degrees(isFaceUp ? 0 : 180), axis: (0, 1, 0))
    }

    private struct Constants {
        static let cardCornerRadius = 10.0
    }
}

extension View {
    func cardify(isFaceUp: Bool) -> some View {
        modifier(Cardify(isFaceUp: isFaceUp))
    }
}
