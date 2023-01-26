//
//  ArcSlider.swift
//  When
//
//  Created by Xiao Ma on 2023-01-24.
//

import Foundation
import SwiftUI

private let THUMB_SIZE = 30.0
private let CIRCLE_RATIO = 1.5

struct ArcSlider: View {
    @Binding var value: Double
    var range: ClosedRange<Double> = 0.0 ... 1.0
    var step: Double = 0.01

    private let boundAngle = asin(1.0 / CIRCLE_RATIO)

    var body: some View {
        GeometryReader { geometry in
            let width = geometry.size.width
            let height = geometry.size.height
            let radius = width * CIRCLE_RATIO / 2

            ZStack {
                Circle()
                    .path(in: CGRect(x: -width * ((CIRCLE_RATIO - 1) / 2.0), y: 0, width: radius * 2, height: radius * 2))
                    .stroke(.black, style: StrokeStyle(lineWidth: 1, dash: [4]))
                Image(systemName: "sun.max.circle")
                    .font(.system(size: THUMB_SIZE))
                    .fontWeight(.light)
                    .frame(width: THUMB_SIZE, height: THUMB_SIZE)
                    .offset(y: -height / 2)
                    .rotationEffect(.init(degrees: angleFrom(value: value)), anchor: .init(x: 0.5, y: (width * CIRCLE_RATIO - height + THUMB_SIZE) / 2 / THUMB_SIZE))
                    .gesture(
                        DragGesture()
                            .onChanged { value in
                                onDrag(value: value, parentSize: geometry.size)
                            }
                    )
            }
        }
    }

    private func onDrag(value: DragGesture.Value, parentSize: CGSize) {
        let vector = value.location
        let radius = parentSize.width * CIRCLE_RATIO / 2
        let center = CGPoint(x: radius, y: radius)
        let radians = atan2(center.y - parentSize.height / 2 - (vector.y - THUMB_SIZE / 2), vector.x - THUMB_SIZE / 2)
        var angle = angleFromRadians(radians)
        if angle < 0 {
            angle = angle + 360
        }
        // origin location is 90 degrees
        angle = 90 - angle
        // keep angle in the range of [-bound, bound]
        let boundDegree = angleFromRadians(boundAngle)

        angle = max(min(angle, boundDegree), -boundDegree)
        let progress = (angle + boundDegree) / (boundDegree * 2)
        let convertToValue = (range.upperBound - range.lowerBound) * progress + range.lowerBound
        let trimWithStep = floor(convertToValue / step) * step
        self.value = trimWithStep
    }

    private func angleFrom(value: Double) -> Double {
        let percent = (value - range.lowerBound) / (range.upperBound - range.lowerBound)
        let angle = boundAngle * 2 * percent - boundAngle
        return angleFromRadians(angle)
    }

    private func angleFromRadians(_ radians: Double) -> Double {
        return radians * 180 / .pi
    }
}

struct ArcSlider_Preview: PreviewProvider {
    @State var value: Double = 0

    static var previews: some View {
        ArcSlider(value: .constant(0.75))
            .frame(width: 300, height: 100)
            .background(.cyan)
    }
}
