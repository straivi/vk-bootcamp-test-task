//
//  AppsListViewModel.swift
//  VkSummercamp
//
//  Created by Матвей Борисов on 13.07.2022.
//

import Combine
import SwiftUI

class AppsListViewModel: ObservableObject {

    @ObservedObject var stateMachine: StateMachine<[AppData]>

    var stateCancellable: AnyCancellable?

    init(state: ViewState<[AppData]>) {
        stateMachine = StateMachine(state)
        stateCancellable = stateMachine.$state.sink { [weak self] _ in
            self?.objectWillChange.send()
        }
    }
}


