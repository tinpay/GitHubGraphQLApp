//
//  GitHubUserUseCase.swift
//  GitHubGraphQLApp
//
//  Created by Shohei Fukui on 2022/12/23.
//
import Foundation
import GitHubSchema
protocol UserUseCaseProtocol {
    func fetch() async throws -> User
}

class UserUseCase: UserUseCaseProtocol {
    static let shared = UserUseCase()

    func fetch() async throws -> User {
        try await withCheckedThrowingContinuation { continuation in
            print("UserUseCase fetch")
            API.shared.apollo.fetch(query: GetUserQuery()) { result in
                switch result {
                case.success(let result):
                    if let user = result.data?.user {
                        let repositories = user.repositories.nodes?.compactMap({ node in
                            Repository(name: node?.name ?? "")
                        })
                        let user = User(name: user.name,
                                        repositories: repositories ?? [])
                        continuation.resume(returning: user)
                    }
                    

                case .failure(let error):
                    print(error)
                }
            }
        }
    }
}
