//
//  CreatePersonView.swift
//  When
//
//  Created by Xiao Ma on 2023-01-21.
//

import ComposableArchitecture
import Foundation
import SwiftUI

struct CreatePersonView: View {
    let store: StoreOf<CreatePersonFeature>
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        WithViewStore(self.store, observe: { $0 }) { viewStore in
            VStack(alignment: .center) {
                TextField(
                    "Name",
                    text: viewStore.binding(get: \.name, send: CreatePersonFeature.Action.nameTextChanged)
                )
                .multilineTextAlignment(.center)
                .frame(width: 200)
                .padding(.vertical, 30)
                .autocorrectionDisabled(true)

                NavigationLink(
                    destination: CityListView(
                        store: self.store.scope(
                            state: \.cities,
                            action: CreatePersonFeature.Action.cities
                        )
                    )
                ) {
                    Text(viewStore.cities.selectedCity?.name ?? "select city")
                }
                .padding(.bottom, 30)

                Button("Create") {
                    viewStore.send(.create)
                    dismiss()
                }
                .disabled(viewStore.createDisabled)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
            .navigationTitle("Create person")
        }
    }
}
