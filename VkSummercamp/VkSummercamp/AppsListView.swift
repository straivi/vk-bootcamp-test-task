//
//  AppsListView.swift
//  VkSummercamp
//
//  Created by Матвей Борисов on 12.07.2022.
//

import SwiftUI

struct AppsListView: View {

    @ObservedObject var viewModel: AppsListViewModel

    var body: some View {
        switch viewModel.stateMachine.state {
        case .content(let list):
            List(list) {
                Text($0.name)
            }
        case .loading:
            Text("Loading")
        case .empty:
            Text("Empty")
        case .error:
            Text("Error")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        AppsListView(viewModel: AppsListViewModel(state: .content([AppData(name: "VK"), AppData(name: "Mail")])))

        AppsListView(viewModel: AppsListViewModel(state: .loading))

        AppsListView(viewModel: AppsListViewModel(state: .empty))

        AppsListView(viewModel: AppsListViewModel(state: .error))
    }
}
