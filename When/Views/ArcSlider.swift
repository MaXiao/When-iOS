//
//  ArcSlider.swift
//  When
//
//  Created by Xiao Ma on 2023-01-24.
//

import Foundation
import SwiftUI

private let THUMB_SIZE = 20.0
private let CIRCLE_RATIO = 1.5

struct ArcSlider: View {
    @State var toAngle: Double = 0

    var body: some View {
        GeometryReader { geometry in
            let width = geometry.size.width
            let height = geometry.size.height

            ZStack {
                Circle()
                    .path(in: CGRect(x: -width * ((CIRCLE_RATIO - 1) / 2.0), y: 0, width: width * CIRCLE_RATIO, height: width * CIRCLE_RATIO))
                    .stroke(.black, style: StrokeStyle(lineWidth: 1, dash: [4]))
                Image(systemName: "sun.max.circle")
                    .font(.system(size: 20))
                    .frame(width: 20, height: 20)
                    .background(.red)
                    .offset(y: -height / 2)
                    .rotationEffect(.init(degrees: toAngle), anchor: .init(x: 0.5, y: (width * CIRCLE_RATIO - height + THUMB_SIZE) / 2 / THUMB_SIZE))
                    .gesture(
                        DragGesture()
                            .onChanged { value in
                                onDrag(value: value, parentSize: geometry.size)
                            }
                    )
                Circle()
                    .frame(width: 2, height: 2)
                    .background(.red)
            }
        }
    }

    private func onDrag(value: DragGesture.Value, parentSize: CGSize) {
        let vector = CGVector(dx: value.location.x, dy: value.location.y)

        let radius = parentSize.width * CIRCLE_RATIO / 2
        let center = CGPoint(x: radius, y: radius)
        print("vector \(vector.dx - 10) \(vector.dy - 10)")
        let radians = atan2(center.y - parentSize.height / 2 - (vector.dy - 10), vector.dx - 10)
        var angle = radians * 180 / .pi
        if angle < 0 {
            angle = angle + 360
        }
        toAngle = 90 - angle
        let r = radiansFromAngle(angle)
        print("angle \(angle), radians: \(r), x: \(radius * cos(r)), y: \(radius * sin(r))")
    }

    private func angleFromRadians(_ radians: Double) -> Double {
        return radians * 180 / .pi
    }

    private func radiansFromAngle(_ angle: Double) -> Double {
        return angle * .pi / 180
    }
}

struct ArcSlider_Preview: PreviewProvider {
    static var previews: some View {
        ArcSlider()
            .frame(width: 300, height: 100)
            .background(.cyan)
    }
}
