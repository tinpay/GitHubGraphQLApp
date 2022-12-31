//
//  ViewerUseCase.swift
//  GitHubGraphQLApp
//
//  Created by Shohei Fukui on 2022/12/23.
//
import Apollo
import GitHubSchema

class ViewerUseCase {
    func fetch() async -> GitHubViewer {
        return await withCheckedContinuation { continuation in
            self.apollo().fetch(query: ShowViewerQuery()) { result in
                switch result {
                case.success(let result):
                    if let viewer = result.data?.viewer {
                        return Viewer(id: viewer.id,
                                      name: viewer.name,
                                      email: viewer.email,
                                      avatarUrl: viewer.avatarUrl,
                                      company: viewer.company)
                    }
                case .failure(let error):
                    print(error)
                }
            }
        }
    }
}
