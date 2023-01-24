//
//  GroupPersonView.swift
//  When
//
//  Created by Xiao Ma on 2023-01-22.
//

import ComposableArchitecture
import Foundation
import SwiftUI

struct GroupPersonView: View {
    let viewState: GroupPersonViewState

    var body: some View {
        let person = viewState.person
        VStack(alignment: .leading) {
            Text(person.name)
            Text(viewState.timeString)
            Text("\(person.city.name), \(person.city.country)")
        }
    }
}
