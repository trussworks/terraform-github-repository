# keep-sorted start block=yes

variable "allow_auto_merge" {
  description = "Whether auto-merge is allowed."
  type        = bool
  default     = false
}

variable "allow_merge_commit" {
  description = "Whether merge commits are allowed."
  type        = bool
  default     = false
}

variable "allow_rebase_merge" {
  description = "Whether rebase merges are allowed."
  type        = bool
  default     = false
}

variable "allow_squash_merge" {
  description = "Whether squash merges are allowed."
  type        = bool
  default     = true
}

variable "allow_update_branch" {
  description = "Whether branches can be updated automatically."
  type        = bool
  default     = true
}

variable "archived" {
  description = "Whether the repository is archived."
  type        = bool
  default     = false
}

variable "auto_init" {
  description = "Whether an initial commit is automatically produced in the repository."
  type        = bool
  default     = false
}

variable "autolink_reference_prefix" {
  description = "This prefix appended by a number generates a link any time it is found in an issue, PR, or commit. Required if `autolink_reference_url_template` is set."
  type        = string
  default     = ""
}

variable "autolink_reference_url_template" {
  description = "The target URL template for the autolink reference. Use `<num>` as a placeholder for the number. Required if `autolink_reference_prefix` is set."
  type        = string
  default     = ""
}

variable "default_branch_name" {
  description = "Name of the default branch."
  type        = string
  default     = "main"
}

variable "delete_branch_on_merge" {
  description = "Whether to delete branch on merge."
  type        = bool
  default     = true
}

variable "description" {
  description = "Description of the repository."
  type        = string
  default     = ""
}

variable "enable_default_ruleset" {
  description = "Whether to create a secure default branch protection ruleset."
  type        = bool
  default     = true
}

variable "has_discussions" {
  description = "Whether the repository has discussions enabled."
  type        = bool
  default     = false
}

variable "has_downloads" {
  description = "Whether the repository has downloads enabled."
  type        = bool
  default     = false
}

variable "has_issues" {
  description = "Whether the repository has issues enabled."
  type        = bool
  default     = true
}

variable "has_projects" {
  description = "Whether the repository has projects enabled."
  type        = bool
  default     = false
}

variable "has_wiki" {
  description = "Whether the repository has wiki enabled."
  type        = bool
  default     = false
}

variable "is_template" {
  description = "Whether the repository is a template."
  type        = bool
  default     = false
}

variable "name" {
  description = "Name of the repository."
  type        = string
}

variable "pr_dismiss_stale_reviews_on_push" {
  description = "Whether to dismiss stale reviews on a PR when new commits are pushed."
  type        = bool
  default     = true
}

variable "pr_require_code_owner_review" {
  description = "Whether to require code owner review on a PR before merging."
  type        = bool
  default     = false
}

variable "pr_require_last_push_approval" {
  description = "Whether the most recent pusher to a PR must approve the PR."
  type        = bool
  default     = false
}

variable "pr_required_approving_review_count" {
  description = "Number of required PR approving reviews."
  type        = number
  default     = 0
}

variable "pr_required_review_thread_resolution" {
  description = "Whether to require all review threads on a PR to be resolved before merging."
  type        = bool
  default     = false
}

variable "rules_creation" {
  description = "If true, only allows users with bypass permission to create matching refs."
  type        = bool
  default     = false
}

variable "rules_deletion" {
  description = "If true, only allows users with bypass permissions to delete matching refs."
  type        = bool
  default     = true
}

variable "rules_non_fast_forward" {
  description = "If true, prevents users with push access from force pushing to branches."
  type        = bool
  default     = true
}

variable "rules_required_linear_history" {
  description = "If true, prevents merge commits from being pushed to matching branches. In other words, any PRs merged into the branch must use a squash merge or a rebase merge."
  type        = bool
  default     = true
}

variable "rules_required_signatures" {
  description = "If true, commits pushed to matching branches must have verified signatures."
  type        = bool
  default     = true
}

variable "rules_update" {
  description = "If true, only allows users with bypass permission to update matching refs."
  type        = bool
  default     = false
}

variable "rules_update_allows_fetch_and_merge" {
  description = "If true, the branch can pull changes from its upstream repository. This is only applicable to forked repositories. Requires `update` to be set to true."
  type        = bool
  default     = false
}

variable "topics" {
  description = "A list of topics for the repository."
  type        = list(string)
  default     = []
}

variable "visibility" {
  description = "Repository visibility: private, public, or internal."
  type        = string
  default     = "private"
}

variable "vulnerability_alerts" {
  description = "Whether to enable vulnerability alerts."
  type        = bool
  default     = true
}

variable "web_commit_signoff_required" {
  description = "Whether contributor signoff is required on web commits."
  type        = bool
  default     = false
}

# keep-sorted end
