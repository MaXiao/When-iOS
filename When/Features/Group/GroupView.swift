//
//  GroupView.swift
//  When
//
//  Created by Xiao Ma on 2023-01-22.
//

import ComposableArchitecture
import Foundation
import SwiftUI

private let MIN_PER_DAY = 24 * 60.0

struct GroupView: View {
    let store: StoreOf<GroupFeature>

    let columns = [GridItem(.adaptive(minimum: 160, maximum: 200))]

    var body: some View {
        WithViewStore(self.store, observe: { $0 }) { viewStore in
            VStack {
                ScrollView {
                    LazyVGrid(columns: columns, spacing: 20) {
                        ForEachStore(
                            self.store.scope(
                                state: \.persons,
                                action: GroupFeature.Action.person(id:action:)))
                        { cellStore in
                            GroupPersonView(store: cellStore, displayTime: viewStore.binding(get: \.displayTime, send: GroupFeature.Action.updateDisplayTime))
                        }
                    }
                    .padding(.horizontal)
                }
                Text("\(viewStore.timeString)")
                    .padding(.top, 30)
                Slider(
                    value: viewStore.binding(get: \.sliderValue, send: GroupFeature.Action.sliderValueUpdate),
                    in: 0 ... MIN_PER_DAY,
                    step: 5)
                    .padding(.bottom, 30)
            }
            .onAppear {
                viewStore.send(.updateSliderValueByDate(Date()))
            }
            .navigationTitle(viewStore.group.name)
        }
    }
}
