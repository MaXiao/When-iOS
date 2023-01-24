//
//  GroupPersonViewState.swift
//  When
//
//  Created by Xiao Ma on 2023-01-23.
//

import Foundation

struct GroupPersonViewState: Equatable, Identifiable {
    var person: Person
    var displayTime: Date
    var isNightTime = false
    var dateFormatter: DateFormatter

    var id: UUID {
        person.id
    }
    
    var timeString: String {
        dateFormatter.string(from: displayTime)
    }

    init(person: Person, displayTime: Date) {
        self.person = person
        self.displayTime = displayTime
        
        self.dateFormatter = {
            let formatter = DateFormatter()
            formatter.dateFormat = NORMAL_DATE_FORMAT
            formatter.timeZone = TimeZone(identifier: person.city.timezone)
            return formatter
        }()
    }
}
