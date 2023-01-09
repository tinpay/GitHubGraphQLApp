// @generated
// This file was automatically generated and should not be edited.

import ApolloAPI

public typealias ID = String

public protocol SelectionSet: ApolloAPI.SelectionSet & ApolloAPI.RootSelectionSet
where Schema == GitHubSchema.SchemaMetadata {}

public protocol InlineFragment: ApolloAPI.SelectionSet & ApolloAPI.InlineFragment
where Schema == GitHubSchema.SchemaMetadata {}

public protocol MutableSelectionSet: ApolloAPI.MutableRootSelectionSet
where Schema == GitHubSchema.SchemaMetadata {}

public protocol MutableInlineFragment: ApolloAPI.MutableSelectionSet & ApolloAPI.InlineFragment
where Schema == GitHubSchema.SchemaMetadata {}

public enum SchemaMetadata: ApolloAPI.SchemaMetadata {
  public static let configuration: ApolloAPI.SchemaConfiguration.Type = SchemaConfiguration.self

  public static func objectType(forTypename typename: String) -> Object? {
    switch typename {
    case "Query": return GitHubSchema.Objects.Query
    case "User": return GitHubSchema.Objects.User
    case "AddedToProjectEvent": return GitHubSchema.Objects.AddedToProjectEvent
    case "App": return GitHubSchema.Objects.App
    case "AssignedEvent": return GitHubSchema.Objects.AssignedEvent
    case "AutomaticBaseChangeFailedEvent": return GitHubSchema.Objects.AutomaticBaseChangeFailedEvent
    case "AutomaticBaseChangeSucceededEvent": return GitHubSchema.Objects.AutomaticBaseChangeSucceededEvent
    case "AutoMergeDisabledEvent": return GitHubSchema.Objects.AutoMergeDisabledEvent
    case "AutoMergeEnabledEvent": return GitHubSchema.Objects.AutoMergeEnabledEvent
    case "AutoRebaseEnabledEvent": return GitHubSchema.Objects.AutoRebaseEnabledEvent
    case "AutoSquashEnabledEvent": return GitHubSchema.Objects.AutoSquashEnabledEvent
    case "BaseRefChangedEvent": return GitHubSchema.Objects.BaseRefChangedEvent
    case "BaseRefDeletedEvent": return GitHubSchema.Objects.BaseRefDeletedEvent
    case "BaseRefForcePushedEvent": return GitHubSchema.Objects.BaseRefForcePushedEvent
    case "Blob": return GitHubSchema.Objects.Blob
    case "Commit": return GitHubSchema.Objects.Commit
    case "Discussion": return GitHubSchema.Objects.Discussion
    case "CommitComment": return GitHubSchema.Objects.CommitComment
    case "DiscussionComment": return GitHubSchema.Objects.DiscussionComment
    case "GistComment": return GitHubSchema.Objects.GistComment
    case "Issue": return GitHubSchema.Objects.Issue
    case "PullRequest": return GitHubSchema.Objects.PullRequest
    case "Milestone": return GitHubSchema.Objects.Milestone
    case "Bot": return GitHubSchema.Objects.Bot
    case "EnterpriseUserAccount": return GitHubSchema.Objects.EnterpriseUserAccount
    case "Mannequin": return GitHubSchema.Objects.Mannequin
    case "Organization": return GitHubSchema.Objects.Organization
    case "Repository": return GitHubSchema.Objects.Repository
    case "Gist": return GitHubSchema.Objects.Gist
    case "Topic": return GitHubSchema.Objects.Topic
    case "Team": return GitHubSchema.Objects.Team
    case "CheckRun": return GitHubSchema.Objects.CheckRun
    case "StatusContext": return GitHubSchema.Objects.StatusContext
    case "ClosedEvent": return GitHubSchema.Objects.ClosedEvent
    case "ConvertToDraftEvent": return GitHubSchema.Objects.ConvertToDraftEvent
    case "CrossReferencedEvent": return GitHubSchema.Objects.CrossReferencedEvent
    case "MergedEvent": return GitHubSchema.Objects.MergedEvent
    case "PullRequestCommit": return GitHubSchema.Objects.PullRequestCommit
    case "ReadyForReviewEvent": return GitHubSchema.Objects.ReadyForReviewEvent
    case "Release": return GitHubSchema.Objects.Release
    case "IssueComment": return GitHubSchema.Objects.IssueComment
    case "PullRequestReview": return GitHubSchema.Objects.PullRequestReview
    case "CommitCommentThread": return GitHubSchema.Objects.CommitCommentThread
    case "DependabotUpdate": return GitHubSchema.Objects.DependabotUpdate
    case "DiscussionCategory": return GitHubSchema.Objects.DiscussionCategory
    case "PinnedDiscussion": return GitHubSchema.Objects.PinnedDiscussion
    case "PullRequestCommitCommentThread": return GitHubSchema.Objects.PullRequestCommitCommentThread
    case "PullRequestReviewComment": return GitHubSchema.Objects.PullRequestReviewComment
    case "RepositoryVulnerabilityAlert": return GitHubSchema.Objects.RepositoryVulnerabilityAlert
    case "TeamDiscussion": return GitHubSchema.Objects.TeamDiscussion
    case "TeamDiscussionComment": return GitHubSchema.Objects.TeamDiscussionComment
    case "RepositoryTopic": return GitHubSchema.Objects.RepositoryTopic
    case "ReviewDismissedEvent": return GitHubSchema.Objects.ReviewDismissedEvent
    case "WorkflowRun": return GitHubSchema.Objects.WorkflowRun
    case "Project": return GitHubSchema.Objects.Project
    case "ProjectNext": return GitHubSchema.Objects.ProjectNext
    case "ProjectV2": return GitHubSchema.Objects.ProjectV2
    case "Tag": return GitHubSchema.Objects.Tag
    case "Tree": return GitHubSchema.Objects.Tree
    case "BranchProtectionRule": return GitHubSchema.Objects.BranchProtectionRule
    case "BypassForcePushAllowance": return GitHubSchema.Objects.BypassForcePushAllowance
    case "BypassPullRequestAllowance": return GitHubSchema.Objects.BypassPullRequestAllowance
    case "CheckSuite": return GitHubSchema.Objects.CheckSuite
    case "CodeOfConduct": return GitHubSchema.Objects.CodeOfConduct
    case "CommentDeletedEvent": return GitHubSchema.Objects.CommentDeletedEvent
    case "Comparison": return GitHubSchema.Objects.Comparison
    case "ConnectedEvent": return GitHubSchema.Objects.ConnectedEvent
    case "ConvertedNoteToIssueEvent": return GitHubSchema.Objects.ConvertedNoteToIssueEvent
    case "ConvertedToDiscussionEvent": return GitHubSchema.Objects.ConvertedToDiscussionEvent
    case "CWE": return GitHubSchema.Objects.CWE
    case "DemilestonedEvent": return GitHubSchema.Objects.DemilestonedEvent
    case "DeployedEvent": return GitHubSchema.Objects.DeployedEvent
    case "DeployKey": return GitHubSchema.Objects.DeployKey
    case "Deployment": return GitHubSchema.Objects.Deployment
    case "DeploymentEnvironmentChangedEvent": return GitHubSchema.Objects.DeploymentEnvironmentChangedEvent
    case "DeploymentReview": return GitHubSchema.Objects.DeploymentReview
    case "DeploymentStatus": return GitHubSchema.Objects.DeploymentStatus
    case "DisconnectedEvent": return GitHubSchema.Objects.DisconnectedEvent
    case "DiscussionPoll": return GitHubSchema.Objects.DiscussionPoll
    case "DiscussionPollOption": return GitHubSchema.Objects.DiscussionPollOption
    case "DraftIssue": return GitHubSchema.Objects.DraftIssue
    case "Enterprise": return GitHubSchema.Objects.Enterprise
    case "EnterpriseAdministratorInvitation": return GitHubSchema.Objects.EnterpriseAdministratorInvitation
    case "EnterpriseIdentityProvider": return GitHubSchema.Objects.EnterpriseIdentityProvider
    case "EnterpriseRepositoryInfo": return GitHubSchema.Objects.EnterpriseRepositoryInfo
    case "EnterpriseServerInstallation": return GitHubSchema.Objects.EnterpriseServerInstallation
    case "EnterpriseServerUserAccount": return GitHubSchema.Objects.EnterpriseServerUserAccount
    case "EnterpriseServerUserAccountEmail": return GitHubSchema.Objects.EnterpriseServerUserAccountEmail
    case "EnterpriseServerUserAccountsUpload": return GitHubSchema.Objects.EnterpriseServerUserAccountsUpload
    case "Environment": return GitHubSchema.Objects.Environment
    case "ExternalIdentity": return GitHubSchema.Objects.ExternalIdentity
    case "HeadRefDeletedEvent": return GitHubSchema.Objects.HeadRefDeletedEvent
    case "HeadRefForcePushedEvent": return GitHubSchema.Objects.HeadRefForcePushedEvent
    case "HeadRefRestoredEvent": return GitHubSchema.Objects.HeadRefRestoredEvent
    case "IpAllowListEntry": return GitHubSchema.Objects.IpAllowListEntry
    case "Label": return GitHubSchema.Objects.Label
    case "LabeledEvent": return GitHubSchema.Objects.LabeledEvent
    case "Language": return GitHubSchema.Objects.Language
    case "License": return GitHubSchema.Objects.License
    case "LinkedBranch": return GitHubSchema.Objects.LinkedBranch
    case "LockedEvent": return GitHubSchema.Objects.LockedEvent
    case "MarkedAsDuplicateEvent": return GitHubSchema.Objects.MarkedAsDuplicateEvent
    case "MarketplaceCategory": return GitHubSchema.Objects.MarketplaceCategory
    case "MarketplaceListing": return GitHubSchema.Objects.MarketplaceListing
    case "MembersCanDeleteReposClearAuditEntry": return GitHubSchema.Objects.MembersCanDeleteReposClearAuditEntry
    case "MembersCanDeleteReposDisableAuditEntry": return GitHubSchema.Objects.MembersCanDeleteReposDisableAuditEntry
    case "MembersCanDeleteReposEnableAuditEntry": return GitHubSchema.Objects.MembersCanDeleteReposEnableAuditEntry
    case "OauthApplicationCreateAuditEntry": return GitHubSchema.Objects.OauthApplicationCreateAuditEntry
    case "OrgOauthAppAccessApprovedAuditEntry": return GitHubSchema.Objects.OrgOauthAppAccessApprovedAuditEntry
    case "OrgOauthAppAccessDeniedAuditEntry": return GitHubSchema.Objects.OrgOauthAppAccessDeniedAuditEntry
    case "OrgOauthAppAccessRequestedAuditEntry": return GitHubSchema.Objects.OrgOauthAppAccessRequestedAuditEntry
    case "OrgAddBillingManagerAuditEntry": return GitHubSchema.Objects.OrgAddBillingManagerAuditEntry
    case "OrgAddMemberAuditEntry": return GitHubSchema.Objects.OrgAddMemberAuditEntry
    case "OrgBlockUserAuditEntry": return GitHubSchema.Objects.OrgBlockUserAuditEntry
    case "OrgConfigDisableCollaboratorsOnlyAuditEntry": return GitHubSchema.Objects.OrgConfigDisableCollaboratorsOnlyAuditEntry
    case "OrgConfigEnableCollaboratorsOnlyAuditEntry": return GitHubSchema.Objects.OrgConfigEnableCollaboratorsOnlyAuditEntry
    case "OrgCreateAuditEntry": return GitHubSchema.Objects.OrgCreateAuditEntry
    case "OrgDisableOauthAppRestrictionsAuditEntry": return GitHubSchema.Objects.OrgDisableOauthAppRestrictionsAuditEntry
    case "OrgDisableSamlAuditEntry": return GitHubSchema.Objects.OrgDisableSamlAuditEntry
    case "OrgDisableTwoFactorRequirementAuditEntry": return GitHubSchema.Objects.OrgDisableTwoFactorRequirementAuditEntry
    case "OrgEnableOauthAppRestrictionsAuditEntry": return GitHubSchema.Objects.OrgEnableOauthAppRestrictionsAuditEntry
    case "OrgEnableSamlAuditEntry": return GitHubSchema.Objects.OrgEnableSamlAuditEntry
    case "OrgEnableTwoFactorRequirementAuditEntry": return GitHubSchema.Objects.OrgEnableTwoFactorRequirementAuditEntry
    case "OrgInviteMemberAuditEntry": return GitHubSchema.Objects.OrgInviteMemberAuditEntry
    case "OrgInviteToBusinessAuditEntry": return GitHubSchema.Objects.OrgInviteToBusinessAuditEntry
    case "OrgRemoveBillingManagerAuditEntry": return GitHubSchema.Objects.OrgRemoveBillingManagerAuditEntry
    case "OrgRemoveMemberAuditEntry": return GitHubSchema.Objects.OrgRemoveMemberAuditEntry
    case "OrgRemoveOutsideCollaboratorAuditEntry": return GitHubSchema.Objects.OrgRemoveOutsideCollaboratorAuditEntry
    case "OrgRestoreMemberAuditEntry": return GitHubSchema.Objects.OrgRestoreMemberAuditEntry
    case "OrgRestoreMemberMembershipOrganizationAuditEntryData": return GitHubSchema.Objects.OrgRestoreMemberMembershipOrganizationAuditEntryData
    case "OrgUnblockUserAuditEntry": return GitHubSchema.Objects.OrgUnblockUserAuditEntry
    case "OrgUpdateDefaultRepositoryPermissionAuditEntry": return GitHubSchema.Objects.OrgUpdateDefaultRepositoryPermissionAuditEntry
    case "OrgUpdateMemberAuditEntry": return GitHubSchema.Objects.OrgUpdateMemberAuditEntry
    case "OrgUpdateMemberRepositoryCreationPermissionAuditEntry": return GitHubSchema.Objects.OrgUpdateMemberRepositoryCreationPermissionAuditEntry
    case "OrgUpdateMemberRepositoryInvitationPermissionAuditEntry": return GitHubSchema.Objects.OrgUpdateMemberRepositoryInvitationPermissionAuditEntry
    case "PrivateRepositoryForkingDisableAuditEntry": return GitHubSchema.Objects.PrivateRepositoryForkingDisableAuditEntry
    case "OrgRestoreMemberMembershipRepositoryAuditEntryData": return GitHubSchema.Objects.OrgRestoreMemberMembershipRepositoryAuditEntryData
    case "PrivateRepositoryForkingEnableAuditEntry": return GitHubSchema.Objects.PrivateRepositoryForkingEnableAuditEntry
    case "RepoAccessAuditEntry": return GitHubSchema.Objects.RepoAccessAuditEntry
    case "RepoAddMemberAuditEntry": return GitHubSchema.Objects.RepoAddMemberAuditEntry
    case "RepoAddTopicAuditEntry": return GitHubSchema.Objects.RepoAddTopicAuditEntry
    case "RepoRemoveTopicAuditEntry": return GitHubSchema.Objects.RepoRemoveTopicAuditEntry
    case "RepoArchivedAuditEntry": return GitHubSchema.Objects.RepoArchivedAuditEntry
    case "RepoChangeMergeSettingAuditEntry": return GitHubSchema.Objects.RepoChangeMergeSettingAuditEntry
    case "RepoConfigDisableAnonymousGitAccessAuditEntry": return GitHubSchema.Objects.RepoConfigDisableAnonymousGitAccessAuditEntry
    case "RepoConfigDisableCollaboratorsOnlyAuditEntry": return GitHubSchema.Objects.RepoConfigDisableCollaboratorsOnlyAuditEntry
    case "RepoConfigDisableContributorsOnlyAuditEntry": return GitHubSchema.Objects.RepoConfigDisableContributorsOnlyAuditEntry
    case "RepoConfigDisableSockpuppetDisallowedAuditEntry": return GitHubSchema.Objects.RepoConfigDisableSockpuppetDisallowedAuditEntry
    case "RepoConfigEnableAnonymousGitAccessAuditEntry": return GitHubSchema.Objects.RepoConfigEnableAnonymousGitAccessAuditEntry
    case "RepoConfigEnableCollaboratorsOnlyAuditEntry": return GitHubSchema.Objects.RepoConfigEnableCollaboratorsOnlyAuditEntry
    case "RepoConfigEnableContributorsOnlyAuditEntry": return GitHubSchema.Objects.RepoConfigEnableContributorsOnlyAuditEntry
    case "RepoConfigEnableSockpuppetDisallowedAuditEntry": return GitHubSchema.Objects.RepoConfigEnableSockpuppetDisallowedAuditEntry
    case "RepoConfigLockAnonymousGitAccessAuditEntry": return GitHubSchema.Objects.RepoConfigLockAnonymousGitAccessAuditEntry
    case "RepoConfigUnlockAnonymousGitAccessAuditEntry": return GitHubSchema.Objects.RepoConfigUnlockAnonymousGitAccessAuditEntry
    case "RepoCreateAuditEntry": return GitHubSchema.Objects.RepoCreateAuditEntry
    case "RepoDestroyAuditEntry": return GitHubSchema.Objects.RepoDestroyAuditEntry
    case "RepoRemoveMemberAuditEntry": return GitHubSchema.Objects.RepoRemoveMemberAuditEntry
    case "TeamAddRepositoryAuditEntry": return GitHubSchema.Objects.TeamAddRepositoryAuditEntry
    case "OrgRestoreMemberMembershipTeamAuditEntryData": return GitHubSchema.Objects.OrgRestoreMemberMembershipTeamAuditEntryData
    case "TeamAddMemberAuditEntry": return GitHubSchema.Objects.TeamAddMemberAuditEntry
    case "TeamChangeParentTeamAuditEntry": return GitHubSchema.Objects.TeamChangeParentTeamAuditEntry
    case "TeamRemoveMemberAuditEntry": return GitHubSchema.Objects.TeamRemoveMemberAuditEntry
    case "TeamRemoveRepositoryAuditEntry": return GitHubSchema.Objects.TeamRemoveRepositoryAuditEntry
    case "RepositoryVisibilityChangeDisableAuditEntry": return GitHubSchema.Objects.RepositoryVisibilityChangeDisableAuditEntry
    case "RepositoryVisibilityChangeEnableAuditEntry": return GitHubSchema.Objects.RepositoryVisibilityChangeEnableAuditEntry
    case "MentionedEvent": return GitHubSchema.Objects.MentionedEvent
    case "MigrationSource": return GitHubSchema.Objects.MigrationSource
    case "MilestonedEvent": return GitHubSchema.Objects.MilestonedEvent
    case "MovedColumnsInProjectEvent": return GitHubSchema.Objects.MovedColumnsInProjectEvent
    case "OIDCProvider": return GitHubSchema.Objects.OIDCProvider
    case "OrganizationIdentityProvider": return GitHubSchema.Objects.OrganizationIdentityProvider
    case "OrganizationInvitation": return GitHubSchema.Objects.OrganizationInvitation
    case "Package": return GitHubSchema.Objects.Package
    case "PackageFile": return GitHubSchema.Objects.PackageFile
    case "PackageTag": return GitHubSchema.Objects.PackageTag
    case "PackageVersion": return GitHubSchema.Objects.PackageVersion
    case "PinnedEvent": return GitHubSchema.Objects.PinnedEvent
    case "PinnedIssue": return GitHubSchema.Objects.PinnedIssue
    case "ProjectCard": return GitHubSchema.Objects.ProjectCard
    case "ProjectColumn": return GitHubSchema.Objects.ProjectColumn
    case "ProjectNextField": return GitHubSchema.Objects.ProjectNextField
    case "ProjectNextItem": return GitHubSchema.Objects.ProjectNextItem
    case "ProjectNextItemFieldValue": return GitHubSchema.Objects.ProjectNextItemFieldValue
    case "ProjectV2Field": return GitHubSchema.Objects.ProjectV2Field
    case "ProjectV2IterationField": return GitHubSchema.Objects.ProjectV2IterationField
    case "ProjectV2SingleSelectField": return GitHubSchema.Objects.ProjectV2SingleSelectField
    case "ProjectV2Item": return GitHubSchema.Objects.ProjectV2Item
    case "ProjectV2ItemFieldDateValue": return GitHubSchema.Objects.ProjectV2ItemFieldDateValue
    case "ProjectV2ItemFieldIterationValue": return GitHubSchema.Objects.ProjectV2ItemFieldIterationValue
    case "ProjectV2ItemFieldNumberValue": return GitHubSchema.Objects.ProjectV2ItemFieldNumberValue
    case "ProjectV2ItemFieldSingleSelectValue": return GitHubSchema.Objects.ProjectV2ItemFieldSingleSelectValue
    case "ProjectV2ItemFieldTextValue": return GitHubSchema.Objects.ProjectV2ItemFieldTextValue
    case "ProjectV2View": return GitHubSchema.Objects.ProjectV2View
    case "ProjectView": return GitHubSchema.Objects.ProjectView
    case "PublicKey": return GitHubSchema.Objects.PublicKey
    case "PullRequestReviewThread": return GitHubSchema.Objects.PullRequestReviewThread
    case "PullRequestThread": return GitHubSchema.Objects.PullRequestThread
    case "Push": return GitHubSchema.Objects.Push
    case "PushAllowance": return GitHubSchema.Objects.PushAllowance
    case "Reaction": return GitHubSchema.Objects.Reaction
    case "Ref": return GitHubSchema.Objects.Ref
    case "ReferencedEvent": return GitHubSchema.Objects.ReferencedEvent
    case "ReleaseAsset": return GitHubSchema.Objects.ReleaseAsset
    case "RemovedFromProjectEvent": return GitHubSchema.Objects.RemovedFromProjectEvent
    case "RenamedTitleEvent": return GitHubSchema.Objects.RenamedTitleEvent
    case "ReopenedEvent": return GitHubSchema.Objects.ReopenedEvent
    case "RepositoryInvitation": return GitHubSchema.Objects.RepositoryInvitation
    case "RepositoryMigration": return GitHubSchema.Objects.RepositoryMigration
    case "ReviewDismissalAllowance": return GitHubSchema.Objects.ReviewDismissalAllowance
    case "ReviewRequest": return GitHubSchema.Objects.ReviewRequest
    case "ReviewRequestedEvent": return GitHubSchema.Objects.ReviewRequestedEvent
    case "ReviewRequestRemovedEvent": return GitHubSchema.Objects.ReviewRequestRemovedEvent
    case "SavedReply": return GitHubSchema.Objects.SavedReply
    case "SecurityAdvisory": return GitHubSchema.Objects.SecurityAdvisory
    case "SponsorsActivity": return GitHubSchema.Objects.SponsorsActivity
    case "Sponsorship": return GitHubSchema.Objects.Sponsorship
    case "SponsorshipNewsletter": return GitHubSchema.Objects.SponsorshipNewsletter
    case "SponsorsListing": return GitHubSchema.Objects.SponsorsListing
    case "SponsorsListingFeaturedItem": return GitHubSchema.Objects.SponsorsListingFeaturedItem
    case "SponsorsTier": return GitHubSchema.Objects.SponsorsTier
    case "Status": return GitHubSchema.Objects.Status
    case "StatusCheckRollup": return GitHubSchema.Objects.StatusCheckRollup
    case "SubscribedEvent": return GitHubSchema.Objects.SubscribedEvent
    case "TransferredEvent": return GitHubSchema.Objects.TransferredEvent
    case "UnassignedEvent": return GitHubSchema.Objects.UnassignedEvent
    case "UnlabeledEvent": return GitHubSchema.Objects.UnlabeledEvent
    case "UnlockedEvent": return GitHubSchema.Objects.UnlockedEvent
    case "UnmarkedAsDuplicateEvent": return GitHubSchema.Objects.UnmarkedAsDuplicateEvent
    case "UnpinnedEvent": return GitHubSchema.Objects.UnpinnedEvent
    case "UnsubscribedEvent": return GitHubSchema.Objects.UnsubscribedEvent
    case "UserBlockedEvent": return GitHubSchema.Objects.UserBlockedEvent
    case "UserContentEdit": return GitHubSchema.Objects.UserContentEdit
    case "UserStatus": return GitHubSchema.Objects.UserStatus
    case "VerifiableDomain": return GitHubSchema.Objects.VerifiableDomain
    case "Workflow": return GitHubSchema.Objects.Workflow
    case "RepositoryConnection": return GitHubSchema.Objects.RepositoryConnection
    case "Mutation": return GitHubSchema.Objects.Mutation
    case "CreateIssuePayload": return GitHubSchema.Objects.CreateIssuePayload
    default: return nil
    }
  }
}

public enum Objects {}
public enum Interfaces {}
public enum Unions {}
