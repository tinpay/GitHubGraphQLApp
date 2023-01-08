//
//  RepositoryUseCase.swift
//  GitHubGraphQLApp
//
//  Created by Shohei Fukui on 2023/01/08.
//

import Foundation
import GitHubSchema
protocol RepositoryUseCaseProtocol {
    func fetch(owner: String, name: String) async throws -> Repository?
}

class RepositoryUseCase: RepositoryUseCaseProtocol {
    static let shared = RepositoryUseCase()

    func fetch(owner: String, name: String) async throws -> Repository? {
        try await withCheckedThrowingContinuation { continuation in
            API.shared.apollo.fetch(query: GetRepositoryQuery(owner: owner, name: name)) { result in
                switch result {
                case.success(let result):
                    if let repository = result.data?.repository,
                       let url = URL(string: repository.url){
                        continuation.resume(returning: Repository(name: repository.name, url: url))
                    } else {
                        continuation.resume(returning: nil)
                    }
                case .failure(let error):
                    continuation.resume(throwing: error)
                }
            }
        }
    }
}
