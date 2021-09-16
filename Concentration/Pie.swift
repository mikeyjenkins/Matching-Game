//
//  Pie.swift
//  Concentration
//
//  Created by Steve Liddle on 9/16/21.
//

import SwiftUI

struct Pie: Shape {
    var startAngle: Angle
    var endAngle: Angle
    var clockwise = true

    func path(in rect: CGRect) -> Path {
        let center = CGPoint(x: rect.midX, y: rect.midY)
        let radius = min(rect.width, rect.height) / 2
        let start = CGPoint(
            x: center.x + radius * cos(startAngle.radians),
            y: center.y + radius * sin(startAngle.radians)
        )

        var p = Path()

        p.move(to: center)
        p.addLine(to: start)
        p.addArc(center: center, radius: radius, startAngle: startAngle, endAngle: endAngle, clockwise: clockwise)
        // I didn't tell you this in class or in the video, but if you do
        // not move back to the center, when you end the Path it will
        // automatically close the path by moving back to the place you
        // started.  In this case, since we first drew from the center,
        // that's the point we want to finish on as well.
        p.move(to: center)

        return p
    }
}

struct Pie_Previews: PreviewProvider {
    static var previews: some View {
        Pie(startAngle: Angle(degrees: 0-90), endAngle: Angle(degrees: 105-90))
            .foregroundColor(.orange)
            .opacity(0.4)
            .padding()
    }
}
