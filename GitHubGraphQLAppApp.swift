//
//  GitHubGraphQLAppApp.swift
//  GitHubGraphQLApp
//
//  Created by Shohei Fukui on 2022/12/19.
//

import SwiftUI
import ComposableArchitecture

@main
struct GitHubGraphQLAppApp: App {
    var body: some Scene {
        WindowGroup {
            HomeView(store:
                        Store(
                            initialState: Home.State(),
                            reducer: Home(gitHubUserUseCase: UserUseCase.shared, gitHubViewerUseCase: ViewerUseCase.shared)
                        )
            )
        }
    }
}
