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
    let gitHubUserUseCase: UserUseCaseProtocol
    let gitHubViewerUseCase: ViewerUseCaseProtocol


    struct State: Equatable {
        var name: String = ""
        var avatarUrl: URL?
        var user: User?
    }
    
    enum Action: Equatable {
        case initializeAsync
        case initializeSync
        case setViewerAndRepository(gitHubViewer: Viewer?, user: User?)
    }
    
    private enum DelayID {}
    
    func reduce(into state: inout State, action: Action) -> EffectTask<Action> {
        switch action {
        case .initializeAsync:
            return .task {
                print("start")
                async let gitHubViewer = try? await self.gitHubViewerUseCase.fetch()
                async let user = try? await self.gitHubUserUseCase.fetch(login: "cw-fukui")
                print("end")
                return await .setViewerAndRepository(gitHubViewer: gitHubViewer, user: user)
            }.cancellable(id: DelayID.self)
        case .initializeSync:
            return .task {
                print("start")
                let gitHubViewer = try? await self.gitHubViewerUseCase.fetch()
                let user = try? await self.gitHubUserUseCase.fetch(login: "cw-fukui")
                print("end")
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
            
            NavigationStack {
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
                            ForEach(repositories , id: \.self) { repository in
                                NavigationLink {
                                    if let owner = user.login,
                                          let name = repository.name {
                                        RepositoryView(
                                            store: Store(
                                                initialState: RepositoryViewState.State(),
                                                reducer: RepositoryViewState(
                                                    repositoryUseCase: RepositoryUseCase.shared)),
                                            repositoryID: repository.id,
                                            owner: owner ,
                                            name: name)
                                    }
                                } label: {
                                    Text(repository.name)
                                }
                            }
                        }
                    }
                }.navigationTitle(Text("GitHub Repositories"))
            }
            .onAppear {
                Task {
                    viewStore.send(.initializeAsync)    // asynchronized
//                    viewStore.send(.initializeSync)     // synchronized
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
                        reducer: Home(gitHubUserUseCase: GitHubUserUseCaseMock(), gitHubViewerUseCase: GitHubViewerUseCaseMock())
                    )
        )
    }
    
    private class GitHubViewerUseCaseMock: ViewerUseCaseProtocol {
        func fetch() async throws -> Viewer {
            return Viewer(id: "",
                                name: "Preview_tinpay",
                                email: "demo@tinpay.com",
                                avatarUrl: "",
                                company: "")
            
        }
    }
    
    private class GitHubUserUseCaseMock: UserUseCaseProtocol {
        func fetch(login: String) async throws -> User {
            return User(login: "tinpay", name: "test",
                        repositories: [
                            Repository(id: "a", name: "sample1", url: URL(string: "https://www.yahoo.co.jp")!),
                            Repository(id: "b", name: "sample2", url: URL(string: "https://www.yahoo.co.jp")!)
                            ])
        }
    }
}
