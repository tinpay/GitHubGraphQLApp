//
//  ViewerUseCase.swift
//  GitHubGraphQLApp
//
//  Created by Shohei Fukui on 2022/12/23.
//
import Foundation
import GitHubSchema

class GitHubViewerUseCase {
    static let shared = GitHubViewerUseCase()

    func fetch() async throws -> GitHubViewer {
        try await withCheckedThrowingContinuation { continuation in
            API.shared.apollo.fetch(query: ShowViewerQuery()) { result in
                switch result {
                case.success(let result):
                    if let viewer = result.data?.viewer {
                        let githubViewer =  GitHubViewer(id: viewer.id,
                                      name: viewer.name,
                                      email: viewer.email,
                                      avatarUrl: viewer.avatarUrl,
                                      company: viewer.company)
                        continuation.resume(returning: githubViewer)
                    }
                case .failure(let error):
                    print(error)
                }
            }
        }
    }
}
