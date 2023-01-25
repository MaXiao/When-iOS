//
//  ArcSlider.swift
//  When
//
//  Created by Xiao Ma on 2023-01-24.
//

import Foundation
import SwiftUI

struct ArcSlider: View {
    var body: some View {
        GeometryReader { geometry in
            let width = geometry.size.width
            let height = geometry.size.height

            ZStack {
                Circle()
                    .path(in: CGRect(x: 0 - width * 0.25, y: 0, width: width * 1.5, height: width * 1.5))
                    .stroke(.black, style: StrokeStyle(lineWidth: 1, dash: [4]))
                Image(systemName: "sun.max.circle")
                    .font(.system(size: 20))
                    .offset(y: -height / 2)
                    .gesture(DragGesture())
            }
        }
    }
}

struct ArcSlider_Preview: PreviewProvider {
    static var previews: some View {
        ArcSlider()
            .frame(width: 300, height: 100)
            .background(.cyan)
    }
}
