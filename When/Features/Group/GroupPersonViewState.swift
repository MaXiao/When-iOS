//
//  GroupPersonViewState.swift
//  When
//
//  Created by Xiao Ma on 2023-01-24.
//

import Foundation

// TODO: should this be better in a feature reducer?
struct GroupPersonViewState: Equatable {
    var person: Person
    var displayTime: Date
    var timeString: String {
        dateFormatter.string(from: displayTime)
    }
    var isDayTime: Bool {
        let localHour = localCalendar.component(.hour, from: displayTime)
        return (8 ..< 20).contains(localHour)
    }
    
    private var localTimeZone: TimeZone {
        return TimeZone(identifier: person.city.timezone) ?? TimeZone.current
    }

    private var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = NORMAL_DATE_FORMAT
        formatter.timeZone = localTimeZone
        return formatter
    }

    private var localCalendar: Calendar {
        var cal = Calendar(identifier: .gregorian)
        cal.timeZone = localTimeZone
        return cal
    }
}

extension GroupPersonViewState: Identifiable {
    var id: UUID {
        person.id
    }
}
