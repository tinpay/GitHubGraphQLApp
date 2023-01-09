// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public class GetUserQuery: GraphQLQuery {
  public static let operationName: String = "GetUser"
  public static let document: ApolloAPI.DocumentType = .notPersisted(
    definition: .init(
      """
      query GetUser($login: String!) {
        user(login: $login) {
          __typename
          login
          name
          url
          repositories(last: 20) {
            __typename
            totalCount
            nodes {
              __typename
              id
              name
              description
              createdAt
              updatedAt
              url
            }
          }
        }
      }
      """
    ))

  public var login: String

  public init(login: String) {
    self.login = login
  }

  public var __variables: Variables? { ["login": login] }

  public struct Data: GitHubSchema.SelectionSet {
    public let __data: DataDict
    public init(data: DataDict) { __data = data }

    public static var __parentType: ParentType { GitHubSchema.Objects.Query }
    public static var __selections: [Selection] { [
      .field("user", User?.self, arguments: ["login": .variable("login")]),
    ] }

    /// Lookup a user by login.
    public var user: User? { __data["user"] }

    /// User
    ///
    /// Parent Type: `User`
    public struct User: GitHubSchema.SelectionSet {
      public let __data: DataDict
      public init(data: DataDict) { __data = data }

      public static var __parentType: ParentType { GitHubSchema.Objects.User }
      public static var __selections: [Selection] { [
        .field("login", String.self),
        .field("name", String?.self),
        .field("url", URI.self),
        .field("repositories", Repositories.self, arguments: ["last": 20]),
      ] }

      /// The username used to login.
      public var login: String { __data["login"] }
      /// The user's public profile name.
      public var name: String? { __data["name"] }
      /// The HTTP URL for this user
      public var url: URI { __data["url"] }
      /// A list of repositories that the user owns.
      public var repositories: Repositories { __data["repositories"] }

      /// User.Repositories
      ///
      /// Parent Type: `RepositoryConnection`
      public struct Repositories: GitHubSchema.SelectionSet {
        public let __data: DataDict
        public init(data: DataDict) { __data = data }

        public static var __parentType: ParentType { GitHubSchema.Objects.RepositoryConnection }
        public static var __selections: [Selection] { [
          .field("totalCount", Int.self),
          .field("nodes", [Node?]?.self),
        ] }

        /// Identifies the total count of items in the connection.
        public var totalCount: Int { __data["totalCount"] }
        /// A list of nodes.
        public var nodes: [Node?]? { __data["nodes"] }

        /// User.Repositories.Node
        ///
        /// Parent Type: `Repository`
        public struct Node: GitHubSchema.SelectionSet {
          public let __data: DataDict
          public init(data: DataDict) { __data = data }

          public static var __parentType: ParentType { GitHubSchema.Objects.Repository }
          public static var __selections: [Selection] { [
            .field("id", ID.self),
            .field("name", String.self),
            .field("description", String?.self),
            .field("createdAt", DateTime.self),
            .field("updatedAt", DateTime.self),
            .field("url", URI.self),
          ] }

          public var id: ID { __data["id"] }
          /// The name of the repository.
          public var name: String { __data["name"] }
          /// The description of the repository.
          public var description: String? { __data["description"] }
          /// Identifies the date and time when the object was created.
          public var createdAt: DateTime { __data["createdAt"] }
          /// Identifies the date and time when the object was last updated.
          public var updatedAt: DateTime { __data["updatedAt"] }
          /// The HTTP URL for this repository
          public var url: URI { __data["url"] }
        }
      }
    }
  }
}
