//
//  RepositoryView.swift
//  GitHubGraphQLApp
//
//  Created by Shohei Fukui on 2023/01/06.
//

import SwiftUI

struct RepositoryView: View {
    let id: String
    let owner: String
    let name: String
    
    @State private var repository: Repository?
    
    var body: some View {
        VStack {
            Text(repository?.name ?? "")
            Text(repository?.url.absoluteString ?? "")
            Button {
                Task {
                    do {
                        try await RepositoryUseCase.shared.createIssue(repositoryId: id)
                    } catch {
                        print(error)
                    }
                }
            } label: {
                Text("Add Issue")
            }

        }
        .onAppear {
            Task {
                repository = try? await RepositoryUseCase.shared.fetch(owner: owner, name: name)
            }
        }
    }
}

struct RepositoryView_Previews: PreviewProvider {
    static var previews: some View {
        RepositoryView(id: "a", owner: "b", name: "a")
    }
}
