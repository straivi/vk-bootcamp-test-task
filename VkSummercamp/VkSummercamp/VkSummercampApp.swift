//
//  VkSummercampApp.swift
//  VkSummercamp
//
//  Created by Матвей Борисов on 12.07.2022.
//

import SwiftUI

@main
struct VkSummercampApp: App {
    var body: some Scene {
        WindowGroup {
            TabView {
                AppsListView(viewModel: AppsListViewModel(state: .empty,
                                                          networkService: NetworkService(session: .shared)))
                    .tabItem {
                        Label("Apps", systemImage: "list.bullet")
                    }
            }
        }
    }
}
