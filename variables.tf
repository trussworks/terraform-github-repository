# keep-sorted start block=yes

variable "default_branch_name" {
  default     = "main"
  description = "Name of default branch."
  type        = string
}
variable "repositories" {
  description = "A object representing a log group."
  default     = []
  type = list(object({
    name                        = string,
    allow_auto_merge            = optional(bool, false),
    allow_merge_commit          = optional(bool, false),
    allow_rebase_merge          = optional(bool, false),
    allow_squash_merge          = optional(bool, true),
    allow_update_branch         = optional(bool, true),
    archived                    = optional(bool, false),
    auto_init                   = optional(bool, false),
    default_branch_name         = optional(string, "main"),
    delete_branch_on_merge      = optional(bool, true),
    has_discussions             = optional(bool, false),
    has_downloads               = optional(bool, false),
    has_issues                  = optional(bool, true),
    has_projects                = optional(bool, false),
    has_wiki                    = optional(bool, false),
    is_template                 = optional(bool, false),
    repo_description            = optional(string),
    repo_visibility             = optional(string, "private"),
    vulnerability_alerts        = optional(bool, true),
    web_commit_signoff_required = optional(bool, false),
  }))
}

# keep-sorted end
