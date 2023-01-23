//
//  PersonSelectionView.swift
//  When
//
//  Created by Xiao Ma on 2023-01-22.
//

import ComposableArchitecture
import Foundation
import SwiftUI

struct PersonSelectionView: View {
    let store: StoreOf<PersonSelectionFeature>
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        WithViewStore(self.store, observe: { $0 }) { viewStore in
            VStack {
                List(viewStore.persons) { person in
                    HStack {
                        Text(person.name)
                        Spacer()
                    }
                    .background(viewStore.selection.contains(person) ? Color.cyan : Color.clear)
                    .onTapGesture {
                        viewStore.send(.togglePerson(person))
                    }
                }
                Button("Confirm") {
                    dismiss()
                }
            }
            .task {
                viewStore.send(.loadPersons)
            }
        }
    }
}
