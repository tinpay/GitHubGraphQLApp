// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public class GetRepositoryQuery: GraphQLQuery {
  public static let operationName: String = "GetRepository"
  public static let document: ApolloAPI.DocumentType = .notPersisted(
    definition: .init(
      """
      query GetRepository($owner: String!, $name: String!) {
        repository(owner: $owner, name: $name) {
          __typename
          id
          name
          url
        }
      }
      """
    ))

  public var owner: String
  public var name: String

  public init(
    owner: String,
    name: String
  ) {
    self.owner = owner
    self.name = name
  }

  public var __variables: Variables? { [
    "owner": owner,
    "name": name
  ] }

  public struct Data: GitHubSchema.SelectionSet {
    public let __data: DataDict
    public init(data: DataDict) { __data = data }

    public static var __parentType: ParentType { GitHubSchema.Objects.Query }
    public static var __selections: [Selection] { [
      .field("repository", Repository?.self, arguments: [
        "owner": .variable("owner"),
        "name": .variable("name")
      ]),
    ] }

    /// Lookup a given repository by the owner and repository name.
    public var repository: Repository? { __data["repository"] }

    /// Repository
    ///
    /// Parent Type: `Repository`
    public struct Repository: GitHubSchema.SelectionSet {
      public let __data: DataDict
      public init(data: DataDict) { __data = data }

      public static var __parentType: ParentType { GitHubSchema.Objects.Repository }
      public static var __selections: [Selection] { [
        .field("id", ID.self),
        .field("name", String.self),
        .field("url", URI.self),
      ] }

      public var id: ID { __data["id"] }
      /// The name of the repository.
      public var name: String { __data["name"] }
      /// The HTTP URL for this repository
      public var url: URI { __data["url"] }
    }
  }
}
