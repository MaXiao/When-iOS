//
//  CitiesFeature.swift
//  When
//
//  Created by Xiao Ma on 2023-01-21.
//

import ComposableArchitecture
import Foundation

struct CitiesFeature: ReducerProtocol {
    struct State: Equatable {
        var cities: [City] = []
        var selectedCity: City? = nil
    }

    enum Action: Equatable {
        case loadCities
        case loadCitiesResponse(TaskResult<[City]>)
        case selectCity(City)
    }

    func reduce(into state: inout State, action: Action) -> EffectTask<Action> {
        switch action {
        case .loadCities:
            return .task {
                await .loadCitiesResponse(
                    TaskResult { City.mockList }
                )
            }
        case let .loadCitiesResponse(.success(cities)):
            state.cities = cities
            return .none
        case .loadCitiesResponse(.failure):
            return .none
        case let .selectCity(city):
            state.selectedCity = city
            return .none
        }
    }
}
