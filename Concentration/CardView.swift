//
//  CardView.swift
//  CardView
//
//  Created by Steve Liddle on 9/9/21.
//

import SwiftUI

struct CardView: View {
    var card: ConcentrationGame<String>.Card
    var gameType: GameType

    @State private var animatedBonusRemaining = 0.0

    var body: some View {
        GeometryReader { geometry in
            if !card.isMatched || card.isFaceUp {
                ZStack {
                    if card.isConsumingBonusTime {
                        Pie(startAngle: angle(for: 0),
                            endAngle: angle(for: -animatedBonusRemaining))
                            .padding(geometry.size.width * 0.04)
                            .opacity(0.4)
                            .onAppear {
                                animatedBonusRemaining = card.bonusRemaining
                                withAnimation(.linear(duration: card.bonusTimeRemaining)) {
                                    animatedBonusRemaining = 0
                                }
                            }
                    } else {
                        Pie(startAngle: angle(for: 0),
                            endAngle: angle(for: -card.bonusRemaining))
                            .padding(geometry.size.width * 0.04)
                            .opacity(0.4)
                    }
                    
                    if(gameType == .templeMatch) {
                        Image(card.content).resizable()
                            .scaledToFit()
                            .opacity(card.isMatched ? 0 : 1)
                            .animation(card.isMatched ? .linear(duration: 2.0)
                                       : .default, value: card.isMatched)
                    } else if (gameType == .shapeScape) {
                        if(card.content == "rect"){
                            Rectangle()
                                .fill(Color.red)
                                .frame(width: 75, height: 75)
                        }
                        if(card.content == "circle"){
                            Circle()
                                .fill(Color.blue)
                                .frame(width: 75, height: 75)
                        }
                        if(card.content == "roundRect"){
                            Rectangle()
                                .fill(Color.green)
                                .frame(width: 75, height: 100)
                        }
                        if(card.content == "capsule"){
                            Capsule()
                                .fill(Color.yellow)
                                .frame(width: 100, height: 50)
                        }
                        if(card.content) == "triangle"{
                            Triangle()
                                .fill(Color.purple)
                                .frame(width: 100, height: 100)
                        }
                        
                    }
                    else {
                        Text(card.content).font(systemFont(for: geometry.size))
                            .rotationEffect(Angle.degrees(card.isMatched ? 360 : 0))
                            .animation(card.isMatched ? .linear(duration: 1.0).repeatForever(autoreverses: false)
                                       : .default, value: card.isMatched)
                    }
                }
                .cardify(isFaceUp: card.isFaceUp)
                .transition(.scale)
            }
        }
    }
    
    struct Triangle: Shape {
        func path(in rect: CGRect) -> Path {
            var path = Path()

            path.move(to: CGPoint(x: rect.midX, y: rect.minY))
            path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
            path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
            path.addLine(to: CGPoint(x: rect.midX, y: rect.minY))

            return path
        }
    }
    
    private func angle(for degrees: Double) -> Angle {
        Angle.degrees(degrees * 360 - 90)
    }

    private func systemFont(for size: CGSize) -> Font {
        Font.system(size: min(size.width, size.height) * Constants.fontScaleFactor)
    }

    private struct Constants {
        static let cardCornerRadius = 10.0
        static let fontScaleFactor = 0.75
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(card: ConcentrationGame<String>.Card(isFaceUp: true, isMatched: false, content: "triangle"), gameType: .shapeScape)
            .foregroundColor(.orange)
            .padding(50)
    }
}
