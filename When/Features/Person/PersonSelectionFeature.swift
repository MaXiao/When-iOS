//
//  PersonSelectionFeature.swift
//  When
//
//  Created by Xiao Ma on 2023-01-22.
//

import ComposableArchitecture
import Foundation

struct PersonSelectionFeature: ReducerProtocol {
    struct State: Equatable {
        var persons: [Person] = []
        var selection: [Person] = []
    }

    enum Action: Equatable {
        case loadPersons
        case loadPersonsResponse(TaskResult<[Person]>)
        case togglePerson(Person)
        case confirm
    }

    func reduce(into state: inout State, action: Action) -> EffectTask<Action> {
        switch action {
        case .loadPersons:
            return .task {
                await .loadPersonsResponse(
                    TaskResult { Person.mockList }
                )
            }
        case let .loadPersonsResponse(.success(persons)):
            state.persons = persons
            return .none
        case .loadPersonsResponse(.failure):
            return .none
        case let .togglePerson(person):
            if state.selection.contains(person) {
                state.selection = state.selection.filter { p in p.id != person.id }
            } else {
                state.selection.append(person)
            }
            return .none
        case .confirm:
            return .none
        }
    }
}
