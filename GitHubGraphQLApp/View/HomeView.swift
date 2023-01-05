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
    let gitHubUserUseCase: GitHubUserUseCaseProtocol
    let gitHubViewerUseCase: GitHubViewerUseCaseProtocol


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
                async let user = try? await self.gitHubUserUseCase.fetch()
                print("end")
                return await .setViewerAndRepository(gitHubViewer: gitHubViewer, user: user)
            }.cancellable(id: DelayID.self)
        case .initializeSync:
            return .task {
                print("start")
                let gitHubViewer = try? await self.gitHubViewerUseCase.fetch()
                let user = try? await self.gitHubUserUseCase.fetch()
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
                            Text(repository.name )
                        }
                    }
                }
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
    
    private class GitHubViewerUseCaseMock: GitHubViewerUseCaseProtocol {
        func fetch() async throws -> Viewer {
            return Viewer(id: "",
                                name: "Preview_tinpay",
                                email: "demo@tinpay.com",
                                avatarUrl: "",
                                company: "")
            
        }
    }
    
    private class GitHubUserUseCaseMock: GitHubUserUseCaseProtocol {
        func fetch() async throws -> User {
            return User(name: "test",
                        repositories: [
                            Repository(name: "sample1"),
                            Repository(name: "sample2")
                            ])
        }
    }
}
