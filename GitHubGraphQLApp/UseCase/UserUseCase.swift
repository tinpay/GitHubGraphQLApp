//
//  GitHubUserUseCase.swift
//  GitHubGraphQLApp
//
//  Created by Shohei Fukui on 2022/12/23.
//
import Foundation
import GitHubSchema
protocol UserUseCaseProtocol {
    func fetch(login: String) async throws -> User
}

class UserUseCase: UserUseCaseProtocol {
    static let shared = UserUseCase()

    func fetch(login: String) async throws -> User {
        try await withCheckedThrowingContinuation { continuation in
            print("UserUseCase fetch")
            API.shared.apollo.fetch(query: GetUserQuery(login: login)) { result in
                switch result {
                case.success(let result):
                    if let userResult = result.data?.user,
                        let nodes = userResult.repositories.nodes {
                        let repositories = nodes
                            .compactMap { $0 }
                            .map { node in
                                Repository(id: node.id, name: node.name, url: URL(string: node.url)!)
                            }
                        let user = User(login: userResult.login, name: userResult.name,
                                        repositories: repositories )
                        continuation.resume(returning: user)
                    }
                    

                case .failure(let error):
                    continuation.resume(throwing: error)
                }
            }
        }
    }
}
