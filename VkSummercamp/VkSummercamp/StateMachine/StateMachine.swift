//
//  StateMachine.swift
//  VkSummercamp
//
//  Created by Матвей Борисов on 13.07.2022.
//

import Combine

class StateMachine<T>: ObservableObject {

    @Published private(set) var state: ViewState<T>

    init(_ state: ViewState<T>) {
        self.state = state
    }

    func setState(_ state: ViewState<T>) {
        //        stateSetupTime = Date()
        //        switch self.state {
        //        case .loading(_):
        //            loadingCondition.setState(state, with: self)
        //        case .content(_):
        //            contentCondition.setState(state, with: self)
        //        case .empty(_):
        //            emptyCondition.setState(state, with: self)
        //        case .error(_):
        //            errorCondition.setState(state, with: self)
        //        }
    }

    func forceSetState(_ state: ViewState<T>) {
        self.state = state
    }
}
