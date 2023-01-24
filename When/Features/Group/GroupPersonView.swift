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
    let store: StoreOf<GroupPersonFeature>
    @Binding var displayTime: Date

    var body: some View {
        WithViewStore(self.store, observe: { $0 }) { viewStore in
            let person = viewStore.person
            VStack(alignment: .leading) {
                Text(person.name)
                Text(viewStore.dateFormatter.string(from: displayTime))
                Text("\(person.city.name), \(person.city.country)")
            }
        }
    }
}
