//
//  GroupPersonIconView.swift
//  When
//
//  Created by Xiao Ma on 2023-01-24.
//

import Foundation
import SwiftUI

struct GroupPersonIconView: View {
    let isDayTime: Bool

    var body: some View {
        ZStack {
            Circle()
                .stroke(Color.black, style: StrokeStyle(lineWidth: 1, dash: [4]))
                .frame(width: 50)
                .padding(.top, 2)
            // animation doesn't work on dash length, so fake it in the ugly way
            Circle()
                .stroke(Color.black, style: StrokeStyle(lineWidth: 1))
                .frame(width: 50)
                .padding(.top, 2)
                .opacity(isDayTime ? 1 : 0)
                .animation(.easeInOut(duration: 0.3), value: isDayTime)
            Image(systemName: isDayTime ? "sun.max" : "moon.zzz")
                .font(.system(size: 25))
        }
        
    }
}
