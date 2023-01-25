//
//  Color+Utils.swift
//  When
//
//  Created by Xiao Ma on 2023-01-24.
//

import Foundation
import SwiftUI

extension Color {
    init(r: Int, g: Int, b: Int) {
        self.init(red: Double(r)/255.0, green: Double(g)/255.0, blue: Double(b)/255.0)
    }
}
