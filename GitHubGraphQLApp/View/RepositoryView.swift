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
    
    @State private var comment = ""
    @State private var repository: Repository?
    @State private var url: URL?

    var body: some View {
        VStack {
            Text(repository?.name ?? "")
            Text(repository?.url.absoluteString ?? "")
            Image(systemName: "safari")
                .resizable()
                .frame(width: 50, height: 50)
                .onTapGesture {
                    if let url = repository?.url {
                        self.url = url
                    }
            }
            Spacer().frame(height: 100)
            TextField("コメントを入力してください", text: $comment)
            Button {
                Task {
                    do {
                        try await RepositoryUseCase.shared.createIssue(repositoryId: id, title: comment)
                        comment = ""
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

struct RepositoryView_Previews: PreviewProvider {
    static var previews: some View {
        RepositoryView(id: "a", owner: "b", name: "a")
    }
}
