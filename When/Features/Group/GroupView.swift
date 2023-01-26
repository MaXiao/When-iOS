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
private let STEP = 5.0

struct GroupView: View {
    let store: StoreOf<GroupFeature>

    let columns = [GridItem(.fixed(160)), GridItem(.fixed(160))]

    var body: some View {
        WithViewStore(self.store, observe: { $0 }) { viewStore in
            VStack {
                ScrollView {
                    LazyVGrid(columns: columns, spacing: 20) {
                        ForEach(viewStore.group.persons) { p in
                            GroupPersonView(
                                viewState: GroupPersonViewState(
                                    person: p,
                                    displayTime: viewStore.displayTime)
                            )
                            .frame(width: 160, alignment: .leading)
                        }
                    }
                    .padding(.horizontal, 10)
                    .frame(maxWidth: .infinity)
                }

                ZStack(alignment: .topTrailing) {
                    VStack(alignment: .trailing, spacing: 0) {
                        Text("\(viewStore.timeString)")
                            .fontWeight(.bold)
                            .font(.system(size: 20))
                            .padding(.bottom, 4)
                        Text("Your local time")
                            .font(.system(size: 12))
                            .fontWeight(.thin)
                    }
                    .padding(.top, 10)
                    .padding(.trailing, 20)
                    .alignmentGuide(HorizontalAlignment.trailing) { d in
                        d[.trailing]
                    }
//                    Slider(
//                        value: viewStore.binding(get: \.sliderValue, send: GroupFeature.Action.sliderValueUpdate),
//                        in: 0 ... MIN_PER_DAY,
//                        step: STEP)
//                        .padding(.bottom, 30)
//                        .alignmentGuide(.top) { d in
//                            return d[.top] - 100
//                        }
                    ArcSlider()
                        .frame(width:300, height: 300)
                        .background(.cyan)
                        .alignmentGuide(.top) { d in
                            return d[.top] - 50
                        }
                }
                .frame(height: 150, alignment: .top)
                .background(
                    RadialGradient(
                        colors: [
                            Color(r: 215, g: 103, b: 170).opacity(0.8),
                            Color(r: 237, g: 134, b: 83).opacity(0.3),
                            Color(r: 255, g: 159, b: 14).opacity(0.1)
                        ],
                        center: .init(x: 0.5, y: 2),
                        startRadius: 0.0,
                        endRadius: UIScreen.width * 0.8))
            }
            .padding(.top, 20)
            .onAppear {
                viewStore.send(.updateSliderValueByDate(Date()))
            }
            .navigationTitle(viewStore.group.name)
        }
    }
}

struct GroupView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            GroupView(
                store: Store(
                    initialState: GroupFeature.State(group: Group.mockList[0]),
                    reducer: GroupFeature()))
        }
    }
}
