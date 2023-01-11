//
//  RepositoryView.swift
//  GitHubGraphQLApp
//
//  Created by Shohei Fukui on 2023/01/06.
//

import SwiftUI
import ComposableArchitecture

struct RepositoryViewState: ReducerProtocol {
    let repositoryUseCase: RepositoryUseCaseProtocol
    
    struct State: Equatable {
        var repository: Repository?
       var comment: String?

    }
    
    enum Action: Equatable {
        case initialize(owner: String, name: String)
        case createIssue(repositoryId: String, title: String)
        case clearComment
        case setRepository(repository: Repository?)
    }
    
    private enum DelayID {}
    
    func reduce(into state: inout State, action: Action) -> EffectTask<Action> {
        switch action {
        case .initialize(let owner, let name):
            return .task {
                let repository = try? await RepositoryUseCase.shared.fetch(owner: owner, name: name)
                return .setRepository(repository: repository)
            }.cancellable(id: DelayID.self)
        case .createIssue(let repositoryID, let title):
            return .task {
                do {
                    try await RepositoryUseCase.shared.createIssue(repositoryId: repositoryID, title: title)
                    return .clearComment
                } catch {
                    // TODO: 
                    return .clearComment
                }
            }.cancellable(id: DelayID.self)
        case .clearComment:
            state.comment = ""
            return .none
        case .setRepository(let repository):
            state.repository = repository
            return .none
        }
    }
}
struct RepositoryView: View {
    let store: StoreOf<RepositoryViewState>

    let repositoryID: String
    let owner: String
    let name: String

    @State private var url: URL?

    var body: some View {
        WithViewStore(self.store, observe: { $0 }) { viewStore in
            VStack {
                Text(viewStore.state.repository?.name ?? "")
                Text(viewStore.state.repository?.url.absoluteString ?? "")
                Image(systemName: "safari")
                    .resizable()
                    .frame(width: 50, height: 50)
                    .onTapGesture {
                        if let url = viewStore.repository?.url {
                            self.url = url
                        }
                    }
                Spacer().frame(height: 100)
//                TextField("コメントを入力してください", text: viewStore.state.$comment)
                Button {
                    Task {
                        if let comment = viewStore.state.comment {
                            viewStore.send(.createIssue(repositoryId: self.repositoryID, title: comment))
                        }
                    }
                } label: {
                    Text("Add Issue")
                }
                
            }
            .onAppear {
                Task {
                }
            }
            .sheet(isPresented: .init(get: {
                self.url != nil
            }, set: { newValue in
                if !newValue {
                    self.url = nil
                }
            })) {
                if let url = self.url {
                    SafariView(url: url)
                }
            }
        }
    }
}

//struct RepositoryView_Previews: PreviewProvider {
//    static var previews: some View {
//        RepositoryView(repositoryID: "a", owner: "b", name: "a")
//    }
//}
