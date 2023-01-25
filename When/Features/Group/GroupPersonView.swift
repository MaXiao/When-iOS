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

        HStack(alignment: .top, spacing: 10) {
            Rectangle()
                .fill(.black)
                .frame(width: 2, height: 110)
            VStack(alignment: .leading, spacing: 8) {
                GroupPersonIconView(isDayTime: viewState.isDayTime)
                    .frame(height: 50, alignment: .topLeading)
                Text(person.name)
                    .font(.system(size: 16))
                    .fontWeight(.semibold)
                Text(viewState.timeString)
                    .font(.system(size: 26))
                    .fontWeight(.bold)
                Text("\(person.city.name), \(person.city.country)")
                    .font(.system(size: 12))
                    .fontWeight(.thin)
            }
        }
    }
}

struct GroupPersonView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            GroupPersonView(viewState: GroupPersonViewState(person: Person.mockX, displayTime: Date()))
        }
    }
}
