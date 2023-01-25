//
//  GroupPersonFeature.swift
//  When
//
//  Created by Xiao Ma on 2023-01-22.
//

import ComposableArchitecture
import Foundation

struct GroupPersonFeature: ReducerProtocol {
    struct State: Equatable, Identifiable {
        var person: Person
        var isNightTime = false
        var dateFormatter: DateFormatter

        var id: UUID {
            person.id
        }

        init(person: Person) {
            self.person = person
            self.dateFormatter = {
                let formatter = DateFormatter()
                formatter.dateFormat = NORMAL_DATE_FORMAT
                formatter.timeZone = TimeZone(identifier: person.city.timezone)
                return formatter
            }()
        }
        
        func stringFrom(_ time: Date) -> String {
            return dateFormatter.string(from: time)
        }
    }

    enum Action: Equatable {
        // potential cell actions like lock an attendee
        // to make sure one can only choose time that works for them
    }

    func reduce(into state: inout State, action: Action) -> EffectTask<Action> {}
}
