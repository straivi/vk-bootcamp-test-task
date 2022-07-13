//
//  StateMachine.swift
//  VkSummercamp
//
//  Created by Матвей Борисов on 13.07.2022.
//

import Foundation
import Combine

class StateMachine<T>: ObservableObject {
    private let delay: TimeInterval = 1

    @Published private(set) var state: ViewState<T>

    init(_ state: ViewState<T>) {
        self.state = state
    }

    func setState(_ newState: ViewState<T>) {
        switch self.state {
        case .loading:
            DispatchQueue.main.asyncAfter(deadline: .now() + delay) { [weak self] in
                self?.forceSetState(newState)
            }
        case .content:
            forceSetState(newState)
        case .empty:
            forceSetState(newState)
        case .error:
            forceSetState(newState)
        }
    }

    func forceSetState(_ state: ViewState<T>) {
        self.state = state
    }
}
