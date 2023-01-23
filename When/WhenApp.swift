//
//  WhenApp.swift
//  When
//
//  Created by Xiao Ma on 2023-01-21.
//

import ComposableArchitecture
import SwiftUI

@main
struct WhenApp: App {
    var body: some Scene {
        WindowGroup {
            RootView(store: Store(
                initialState: RootFeature.State(),
                reducer: RootFeature()
            ))
        }
    }
}
