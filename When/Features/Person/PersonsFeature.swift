//
//  PersonsFeature.swift
//  When
//
//  Created by Xiao Ma on 2023-01-21.
//

import ComposableArchitecture
import Foundation

struct PersonsFeature: ReducerProtocol {
    struct State: Equatable {
        var persons: [Person] = Person.mockList
        var loadingList: Bool = false
        var createPerson: CreatePersonFeature.State?
        var isNavigationActive = false
    }

    enum Action: Equatable {
        case loadPersons
        case loadPersonsResponse(TaskResult<[Person]>)
        case createPerson(CreatePersonFeature.Action)
        case navigate(isActive: Bool)
    }

    var body: some ReducerProtocol<State, Action> {
        Reduce { state, action in
            switch action {
            case .loadPersons:
                state.loadingList = true
                return .task {
                    await .loadPersonsResponse(
                        TaskResult { Person.mockList }
                    )
                }
            case let .loadPersonsResponse(.success(persons)):
                state.persons = persons
                state.loadingList = false
                return .none
            case .loadPersonsResponse(.failure):
                state.loadingList = false
                return .none
            case .navigate(isActive: true):
                state.createPerson = CreatePersonFeature.State()
                state.isNavigationActive = true
                return .none
            case .navigate(isActive: false):
                state.createPerson = nil
                state.isNavigationActive = false
                return .none
            case .createPerson(.create):
                let person = Person(id: UUID(), name: state.createPerson!.name, city: state.createPerson!.cities.selectedCity!)
                state.persons = state.persons + [person]
                return .none
            default:
                return .none
            }
        }
        .ifLet(\.createPerson, action: /Action.createPerson) {
            CreatePersonFeature()
        }
    }
}
