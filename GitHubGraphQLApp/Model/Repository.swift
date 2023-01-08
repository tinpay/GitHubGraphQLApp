//
//  Repository.swift
//  GitHubGraphQLApp
//
//  Created by Shohei Fukui on 2023/01/04.
//
import Foundation

struct Repository: Equatable, Hashable {
    let name: String
    let url: URL
}
