//
//  RootView.swift
//  When
//
//  Created by Xiao Ma on 2023-01-21.
//

import ComposableArchitecture
import Foundation
import SwiftUI

struct RootView: View {
    let store: StoreOf<RootFeature>

    var body: some View {
        TabView {
            GroupListView(
                store: self.store.scope(state: \.groups, action: RootFeature.Action.groups))
                .tabItem {
                    Label("Groups", systemImage: "list.dash")
                }
            PersonListView(
                store: self.store.scope(state: \.persons, action: RootFeature.Action.persons))
                .tabItem {
                    Label("Persons", systemImage: "square")
                }
        }
    }
}
