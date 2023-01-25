//
//  GroupFeature.swift
//  When
//
//  Created by Xiao Ma on 2023-01-22.
//

import ComposableArchitecture
import Foundation

struct GroupFeature: ReducerProtocol {
    struct State: Equatable {
        var group: Group
        var displayTime: Date = .init()
        var sliderValue = 0.0
        let currentDate = Date()
        
        private var dateFormatter: DateFormatter {
            let formatter = DateFormatter()
            formatter.dateFormat = NORMAL_DATE_FORMAT
            return formatter
        }

        var timeString: String {
            dateFormatter.string(from: displayTime)
        }
    }

    enum Action: Equatable {
        case updateSliderValueByDate(Date)
        case sliderValueUpdate(Double)
        case updateDisplayTime(Date)
        case person(id: GroupPersonFeature.State.ID, action: GroupPersonFeature.Action)
    }

    var body: some ReducerProtocol<State, Action> {
        Reduce { state, action in
            switch action {
            case let .updateDisplayTime(date):
                state.displayTime = date
                return .none
            case let .sliderValueUpdate(value):
                state.sliderValue = value
                let date = state.currentDate
                return .task {
                    let hour = Int(value) / 60
                    let min = Int(value) % 60
                    guard let date = Calendar.current.date(bySettingHour: hour, minute: min, second: 0, of: date) else {
                        return .updateDisplayTime(date)
                    }
                    return .updateDisplayTime(date)
                }
            case let .updateSliderValueByDate(date):
                let cal = Calendar.current.dateComponents([.hour, .minute], from: date)
                let value = Double(cal.hour! * 60 + cal.minute!)
                print(value)
                state.sliderValue = value
                return .none
            default:
                return .none
            }
        }
    }
}
