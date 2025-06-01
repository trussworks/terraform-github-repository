# keep-sorted start block=yes

variable "allow_auto_merge" {
  default     = false
  description = "value"
  type        = bool
}
variable "allow_merge_commit" {
  description = "value"
  default     = false
  type        = bool
}
variable "allow_rebase_merge" {
  default     = false
  description = "value"
  type        = bool
}
variable "allow_squash_merge" {
  description = "value"
  type        = bool
  default     = true
}
variable "allow_update_branch" {
  default     = true
  description = "value"
  type        = bool
}
variable "archived" {
  default     = false
  description = "value"
  type        = bool
}
variable "auto_init" {
  default     = false
  description = "value"
  type        = bool
}
variable "default_branch_name" {
  default     = "main"
  description = "Name of default branch."
  type        = string
}
variable "delete_branch_on_merge" {
  default     = true
  description = "value"
  type        = bool
}
variable "has_discussions" {
  default     = false
  description = "value"
  type        = bool
}
variable "has_downloads" {
  default     = false
  description = "value"
  type        = bool
}
variable "has_issues" {
  default     = true
  description = "value"
  type        = bool
}
variable "has_projects" {
  default     = false
  description = "value"
  type        = bool
}
variable "has_wiki" {
  default     = false
  description = "value"
  type        = bool
}
variable "is_template" {
  default     = false
  description = "value"
  type        = bool
}
variable "repo_description" {
  default     = ""
  description = "Description of the repository. Displayed in right-hand column on repo home page."
  type        = string

}
variable "repo_name" {
  description = "Name of repository."
  type        = string
}
variable "repo_visibility" {
  description = "Whether repo should be `public` or `private`."
  type        = string
  default     = "private"

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
    repo_visibility             = "private",
    vulnerability_alerts        = optional(bool, true),
    web_commit_signoff_required = optional(bool, false),
  }))
}

variable "vulnerability_alerts" {
  default     = true
  description = "value"
  type        = bool
}
variable "web_commit_signoff_required" {
  default     = false
  description = "value"
  type        = bool
}

# keep-sorted end
