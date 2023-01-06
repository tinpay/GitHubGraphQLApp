//
//  ViewerUseCase.swift
//  GitHubGraphQLApp
//
//  Created by Shohei Fukui on 2022/12/23.
//
import Foundation
import GitHubSchema

protocol ViewerUseCaseProtocol {
    func fetch() async throws -> Viewer
}

class ViewerUseCase: ViewerUseCaseProtocol {
    static let shared = ViewerUseCase()

    func fetch() async throws -> Viewer {
        try await withCheckedThrowingContinuation { continuation in
            print("ViewerUseCase fetch")
            API.shared.apollo.fetch(query: ShowViewerQuery()) { result in
                switch result {
                case.success(let result):
                    if let viewer = result.data?.viewer {
                        let githubViewer =  Viewer(id: viewer.id,
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
