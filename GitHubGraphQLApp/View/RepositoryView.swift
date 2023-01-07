//
//  RepositoryView.swift
//  GitHubGraphQLApp
//
//  Created by Shohei Fukui on 2023/01/06.
//

import SwiftUI

struct RepositoryView: View {
    let repository: Repository
    var body: some View {
        Text(repository.name)
    }
}

struct RepositoryView_Previews: PreviewProvider {
    static var previews: some View {
        RepositoryView(repository: Repository(name: "repo"))
    }
}
