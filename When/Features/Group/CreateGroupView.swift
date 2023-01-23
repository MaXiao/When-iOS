//
//  CreateGroupView.swift
//  When
//
//  Created by Xiao Ma on 2023-01-22.
//

import ComposableArchitecture
import Foundation
import SwiftUI

struct CreateGroupView: View {
    let store: StoreOf<CreateGroupFeature>

    var body: some View {
        VStack {
            WithViewStore(self.store, observe: { $0 }) { viewStore in
                TextField("group name", text: viewStore.binding(get: \.name, send: CreateGroupFeature.Action.nameUpdated))
                    .padding(30)
                List(viewStore.personSelection.selection) { person in
                    Text(person.name)
                }
            }
            NavigationLink(
                destination: PersonSelectionView(store: self.store.scope(state: \.personSelection, action: CreateGroupFeature.Action.personSelection)))
            {
                Text("Select")
            }
        }
    }
}
