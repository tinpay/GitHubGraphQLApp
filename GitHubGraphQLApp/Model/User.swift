//
//  User.swift
//  GitHubGraphQLApp
//
//  Created by Shohei Fukui on 2023/01/04.
//

struct User: Equatable {
    let login: String
    let name: String?
    let repositories: [Repository]
    
    
}
