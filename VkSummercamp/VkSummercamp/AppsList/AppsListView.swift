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
        VStack {
            switch viewModel.stateMachine.state {
            case .content(let list):
                List(list) {
                    AppItemView(viewModel: AppItemViewModel(data: $0))
                }
                .refreshable {
                    viewModel.pullToRefreshAction()
                }
            case .loading:
                LoadingView()
            case .empty:
                EmptyView {
                    viewModel.requestAction()
                }
            case .error:
                ErrorView {
                    viewModel.requestAction()
                }
            }
        }
        .onAppear {
            viewModel.requestAction()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let appsList = [AppData(name: "VK",
                                description: "Самая популярная соцсеть и первое суперприложение в России",
                                link: "https://vk.com/",
                                iconUrl: "https://publicstorage.hb.bizmrg.com/sirius/vk.png"),
                        AppData(name: "My.Games",
                                description: "Игры для ПК, консолей и смартфонов, в которые играют сотни геймеров",
                                link: "https://my.games/",
                                iconUrl: "https://publicstorage.hb.bizmrg.com/sirius/mygames.png")]
        AppsListView(viewModel: AppsListViewModel(state: .content(appsList),
                                                  networkService: NetworkService(session: .shared)))

        AppsListView(viewModel: AppsListViewModel(state: .loading, networkService: NetworkService(session: .shared)))

        AppsListView(viewModel: AppsListViewModel(state: .empty, networkService: NetworkService(session: .shared)))

        AppsListView(viewModel: AppsListViewModel(state: .error, networkService: NetworkService(session: .shared)))
    }
}
