//
//  CreateGroupFeature.swift
//  When
//
//  Created by Xiao Ma on 2023-01-22.
//

import ComposableArchitecture
import Foundation

struct CreateGroupFeature: ReducerProtocol {
    struct State: Equatable {
        var name = ""
        var personSelection = PersonSelectionFeature.State()
    }

    enum Action: Equatable {
        case nameUpdated(String)
        case personSelection(PersonSelectionFeature.Action)
    }

    var body: some ReducerProtocol<State, Action> {
        Reduce { state, action in
            switch action {
            case let .nameUpdated(input):
                state.name = input
                return .none
            default:
                return .none
            }
        }
        Scope(state: \.personSelection, action: /Action.personSelection) {
            PersonSelectionFeature()
        }
    }
}
