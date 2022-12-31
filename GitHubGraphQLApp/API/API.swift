//
//  API.swift
//  GitHubGraphQLApp
//
//  Created by Shohei Fukui on 2022/12/26.
//
import Foundation
import Apollo
import GitHubSchema

final class API {
    static let shared = API()
    let apollo: ApolloClient
    
    private init() {
        let client = URLSessionClient()
        let cache = InMemoryNormalizedCache()
        let store = ApolloStore(cache: cache)
        let provider = NetworkInterceptorProvider(client: client, store: store)
        let url = URL(string: "https://api.github.com/graphql")!
        let transport = RequestChainNetworkTransport(
            interceptorProvider: provider,
            endpointURL: url
        )
        apollo = .init(networkTransport: transport, store: store)
    }
    
    final class TokenAddingInterceptor: ApolloInterceptor {
        func interceptAsync<Operation: GraphQLOperation>(
            chain: RequestChain,
            request: HTTPRequest<Operation>,
            response: HTTPResponse<Operation>?,
            completion: @escaping (Result<GraphQLResult<Operation.Data>, Error>) -> Void) {
            request.addHeader(name: "Authorization", value: "Bearer <GitHub Token>")
            chain.proceedAsync(request: request, response: response, completion: completion)
        }
    }

    final class NetworkInterceptorProvider: InterceptorProvider {
        private let client: URLSessionClient
        private let store: ApolloStore

        init(client: URLSessionClient, store: ApolloStore) {
            self.client = client
            self.store = store
        }

        func interceptors<Operation>(for operation: Operation) -> [ApolloInterceptor] where Operation : GraphQLOperation {
            [
                TokenAddingInterceptor(),
                NetworkFetchInterceptor(client: self.client),
                JSONResponseParsingInterceptor(),
            ]
        }
    }
}
