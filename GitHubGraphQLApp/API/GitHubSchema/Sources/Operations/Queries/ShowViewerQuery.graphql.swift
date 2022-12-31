// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public class ShowViewerQuery: GraphQLQuery {
  public static let operationName: String = "ShowViewer"
  public static let document: ApolloAPI.DocumentType = .notPersisted(
    definition: .init(
      """
      query ShowViewer {
        viewer {
          __typename
          id
          name
          email
          avatarUrl
          company
        }
      }
      """
    ))

  public init() {}

  public struct Data: GitHubSchema.SelectionSet {
    public let __data: DataDict
    public init(data: DataDict) { __data = data }

    public static var __parentType: ParentType { GitHubSchema.Objects.Query }
    public static var __selections: [Selection] { [
      .field("viewer", Viewer.self),
    ] }

    /// The currently authenticated user.
    public var viewer: Viewer { __data["viewer"] }

    /// Viewer
    ///
    /// Parent Type: `User`
    public struct Viewer: GitHubSchema.SelectionSet {
      public let __data: DataDict
      public init(data: DataDict) { __data = data }

      public static var __parentType: ParentType { GitHubSchema.Objects.User }
      public static var __selections: [Selection] { [
        .field("id", ID.self),
        .field("name", String?.self),
        .field("email", String.self),
        .field("avatarUrl", URI.self),
        .field("company", String?.self),
      ] }

      public var id: ID { __data["id"] }
      /// The user's public profile name.
      public var name: String? { __data["name"] }
      /// The user's publicly visible profile email.
      public var email: String { __data["email"] }
      /// A URL pointing to the user's public avatar.
      public var avatarUrl: URI { __data["avatarUrl"] }
      /// The user's public profile company.
      public var company: String? { __data["company"] }
    }
  }
}
