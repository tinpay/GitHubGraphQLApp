//
//  GitHubUserUseCase.swift
//  GitHubGraphQLApp
//
//  Created by Shohei Fukui on 2022/12/23.
//
import Foundation
import GitHubSchema
protocol GitHubUserUseCaseProtocol {
    func fetch() async throws -> GetUserQuery.Data.User
}

class GitHubUserUseCase: GitHubUserUseCaseProtocol {
    static let shared = GitHubUserUseCase()

    func fetch() async throws -> GetUserQuery.Data.User {
        try await withCheckedThrowingContinuation { continuation in
            API.shared.apollo.fetch(query: GetUserQuery()) { result in
                switch result {
                case.success(let result):
                    if let user = result.data?.user {
                        continuation.resume(returning: user)
                    }
                case .failure(let error):
                    print(error)
                }
            }
        }
    }
}
