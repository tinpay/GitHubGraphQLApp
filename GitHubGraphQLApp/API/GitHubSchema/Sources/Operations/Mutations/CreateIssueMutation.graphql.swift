// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public class CreateIssueMutation: GraphQLMutation {
  public static let operationName: String = "createIssue"
  public static let document: ApolloAPI.DocumentType = .notPersisted(
    definition: .init(
      """
      mutation createIssue($repositoryId: ID!, $title: String!) {
        createIssue(input: {title: $title, repositoryId: $repositoryId}) {
          __typename
          issue {
            __typename
            id
          }
        }
      }
      """
    ))

  public var repositoryId: ID
  public var title: String

  public init(
    repositoryId: ID,
    title: String
  ) {
    self.repositoryId = repositoryId
    self.title = title
  }

  public var __variables: Variables? { [
    "repositoryId": repositoryId,
    "title": title
  ] }

  public struct Data: GitHubSchema.SelectionSet {
    public let __data: DataDict
    public init(data: DataDict) { __data = data }

    public static var __parentType: ParentType { GitHubSchema.Objects.Mutation }
    public static var __selections: [Selection] { [
      .field("createIssue", CreateIssue?.self, arguments: ["input": [
        "title": .variable("title"),
        "repositoryId": .variable("repositoryId")
      ]]),
    ] }

    /// Creates a new issue.
    public var createIssue: CreateIssue? { __data["createIssue"] }

    /// CreateIssue
    ///
    /// Parent Type: `CreateIssuePayload`
    public struct CreateIssue: GitHubSchema.SelectionSet {
      public let __data: DataDict
      public init(data: DataDict) { __data = data }

      public static var __parentType: ParentType { GitHubSchema.Objects.CreateIssuePayload }
      public static var __selections: [Selection] { [
        .field("issue", Issue?.self),
      ] }

      /// The new issue.
      public var issue: Issue? { __data["issue"] }

      /// CreateIssue.Issue
      ///
      /// Parent Type: `Issue`
      public struct Issue: GitHubSchema.SelectionSet {
        public let __data: DataDict
        public init(data: DataDict) { __data = data }

        public static var __parentType: ParentType { GitHubSchema.Objects.Issue }
        public static var __selections: [Selection] { [
          .field("id", ID.self),
        ] }

        public var id: ID { __data["id"] }
      }
    }
  }
}
