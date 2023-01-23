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
        NavigationView {
            WithViewStore(store, observe: { $0 }) { viewStore in
                List(viewStore.groups) { group in
                    Text(group.name)
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
}
