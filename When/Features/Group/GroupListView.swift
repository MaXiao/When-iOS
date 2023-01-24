//
//  GroupListView.swift
//  When
//
//  Created by Xiao Ma on 2023-01-21.
//

import ComposableArchitecture
import Foundation
import SwiftUI

struct GroupListView: View {
    let store: StoreOf<GroupsFeature>

    var body: some View {
        /**
         * this setup has a potential navigation issue as described here
         * https://github.com/pointfreeco/swift-composable-architecture/discussions/1853
         *
         * need to limit the observe target
         */
        WithViewStore(store, observe: { $0 }) { viewStore in
            List(viewStore.groups) { group in
                NavigationLink(
                    destination: GroupView(
                        store: Store(
                            initialState: GroupFeature.State(group: group),
                            reducer: GroupFeature()
                        )
                    )
                ) {
                    Text(group.name)
                }
            }
        }
        .toolbar {
            ToolbarItem {
                NavigationLink(destination:
                    CreateGroupView(store: self.store.scope(state: \.createGroup, action: GroupsFeature.Action.createGroup))
                ) {
                    Text("New")
                }
            }
        }
    }
}
