//
//  ContentView.swift
//  GitHubGraphQLApp
//
//  Created by Shohei Fukui on 2022/12/19.
//
import Foundation
import ComposableArchitecture
import SwiftUI
import GitHubSchema

struct Home: ReducerProtocol {
    struct State: Equatable {
        var name: String = ""
        var avatarUrl: URL?
        var user: GetUserQuery.Data.User?
    }
    
    enum Action: Equatable {
        case initializeViewer
        case setViewerAndRepository(gitHubViewer: GitHubViewer?, user: GetUserQuery.Data.User?)
    }
    
    private enum DelayID {}
    
    func reduce(into state: inout State, action: Action) -> EffectTask<Action> {
        switch action {
        case .initializeViewer:
            return .task {
                let gitHubViewer = try? await GitHubViewerUseCase.shared.fetch()
                let user = try? await GitHubUserUseCase.shared.fetch()
                return .setViewerAndRepository(gitHubViewer: gitHubViewer, user: user)
            }.cancellable(id: DelayID.self)
        case .setViewerAndRepository(let gitHubViewer, let user):
            guard let gitHubViewer = gitHubViewer else { return .none }
            state.name = gitHubViewer.name ?? ""
            state.avatarUrl = URL(string: gitHubViewer.avatarUrl)
            state.user = user
            return .none
        }
    }
}


struct HomeView: View {
    let store: StoreOf<Home>

    var body: some View {
        WithViewStore(self.store, observe: { $0 }) { viewStore in
            
            VStack(spacing: 0) {
                AsyncImage(url: viewStore.avatarUrl) { image in
                    image.resizable()
                        .frame(width: 48,
                                height: 48)
                        .scaledToFit()
                        .clipShape(Circle())
                } placeholder: {
                    Image(systemName: "")
                }
                
                Text(viewStore.name)
                
                List {
                    if let user = viewStore.user,
                       let repositories = user.repositories {
                        ForEach(repositories.nodes ?? [], id: \.self) { repository in
                            Text(repository?.name ?? "")
                        }
                    }
                }
            }
            .onAppear {
                Task {
                    viewStore.send(.initializeViewer)
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(store:
                    Store(
                        initialState: Home.State(),
                        reducer: Home()
                    )
        )
    }
}
