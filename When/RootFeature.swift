//
//  RootFeature.swift
//  When
//
//  Created by Xiao Ma on 2023-01-21.
//

import Foundation
import ComposableArchitecture

struct RootFeature: ReducerProtocol {
    struct State: Equatable {
        var groups = GroupsFeature.State()
        var persons = PersonsFeature.State()
        var cities = CitiesFeature.State()
    }
    
    enum Action: Equatable {
        case groups(GroupsFeature.Action)
        case persons(PersonsFeature.Action)
        case cities(CitiesFeature.Action)
    }
    
    var body: some ReducerProtocol<State, Action> {
        Scope(state: \.groups, action: /Action.groups) {
            GroupsFeature()
        }
        Scope(state: \.persons, action: /Action.persons) {
            PersonsFeature()._printChanges()
        }
        Scope(state: \.cities, action: /Action.cities) {
            CitiesFeature()
        }
    }
}
