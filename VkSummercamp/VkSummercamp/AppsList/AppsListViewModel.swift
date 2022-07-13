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

    private let networkService: NetworkService

    private var stateCancellable: AnyCancellable?
    private var networkCancellable: AnyCancellable?

    init(state: ViewState<[AppData]>, networkService: NetworkService) {
        stateMachine = StateMachine(state)
        self.networkService = networkService
        stateCancellable = stateMachine.$state.sink { [weak self] _ in
            self?.objectWillChange.send()
        }
    }

    private func requestData() {
        networkCancellable = networkService.request().sink(receiveCompletion: { [weak self] completion in
            switch completion {
            case.finished:
                break
            case.failure:
                self?.stateMachine.setState(.error)
            }
        }, receiveValue: { [weak self] appsList in
            if appsList.isEmpty {
                self?.stateMachine.setState(.empty)
            } else {
                self?.stateMachine.setState(.content(appsList))
            }
        })
    }

    func requestAction() {
        stateMachine.setState(.loading)
        requestData()
    }

    func pullToRefreshAction() {
        requestData()
    }
}
