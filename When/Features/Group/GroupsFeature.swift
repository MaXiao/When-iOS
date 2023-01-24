//
//  GroupsFeature.swift
//  When
//
//  Created by Xiao Ma on 2023-01-21.
//

import ComposableArchitecture
import Foundation

struct GroupsFeature: ReducerProtocol {
    struct State: Equatable {
        var groups: [Group] = Group.mockList
        var createGroup = CreateGroupFeature.State()
    }

    enum Action: Equatable {
        case loadGroup
        case createGroup(CreateGroupFeature.Action)
    }

    var body: some ReducerProtocol<State, Action> {
        Reduce { _, action in
            switch action {
            case .loadGroup:
                return .none
            default:
                return .none
            }
        }
        Scope(state: \.createGroup, action: /Action.createGroup) {
            CreateGroupFeature()._printChanges()
        }
    }
}
