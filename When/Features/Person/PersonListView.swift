//
//  PersonListView.swift
//  When
//
//  Created by Xiao Ma on 2023-01-21.
//

import ComposableArchitecture
import Foundation
import SwiftUI

struct PersonListView: View {
    let store: StoreOf<PersonsFeature>

    var body: some View {
        WithViewStore(self.store, observe: { $0 }) { viewStore in

            List(viewStore.persons) { person in
                Text(person.name)
            }
            .toolbar {
                ToolbarItem(placement: .primaryAction) {
                    NavigationLink(
                        destination: IfLetStore(
                            self.store.scope(state: \.createPerson, action: PersonsFeature.Action.createPerson)
                        ) {
                            CreatePersonView(store: $0)
                        },
                        isActive: viewStore.binding(get: \.isNavigationActive, send: PersonsFeature.Action.navigate)
                    ) {
                        Text("Add")
                    }
                }
            }
        }
    }
}
