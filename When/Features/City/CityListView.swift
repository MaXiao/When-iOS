//
//  CityListView.swift
//  When
//
//  Created by Xiao Ma on 2023-01-21.
//

import Foundation

import ComposableArchitecture
import SwiftUI

struct CityListView: View {
    let store: StoreOf<CitiesFeature>
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        WithViewStore(self.store, observe: { $0 }) { viewStore in
            List(viewStore.cities) { city in
                HStack {
                    Text(city.name)
                    Spacer()
                }
                .contentShape(Rectangle())
                .onTapGesture {
                    viewStore.send(.selectCity(city))
                    dismiss()
                }
            }
            .task {
                viewStore.send(.loadCities)
            }
        }
    }
}
