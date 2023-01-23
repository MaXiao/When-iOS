//
//  CreatePersonFeature.swift
//  When
//
//  Created by Xiao Ma on 2023-01-21.
//

import ComposableArchitecture
import Foundation

struct CreatePersonFeature: ReducerProtocol {
    struct State: Equatable {
        var name: String = ""
        var cities = CitiesFeature.State()
        var createDisabled: Bool {
            name.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty || cities.selectedCity == nil
        }
    }

    enum Action: Equatable {
        case nameTextChanged(String)
        case create
        case cities(CitiesFeature.Action)
    }

    var body: some ReducerProtocol<State, Action> {
        Reduce { state, action in
            switch action {
            case let .nameTextChanged(input):
                state.name = input
                return .none
            case .create:
                return .none
            default:
                return .none
            }
        }
        Scope(state: \.cities, action: /Action.cities) {
            CitiesFeature()
        }
    }
}
