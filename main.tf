locals {
  github_repository_role = {
    org_admin = 1
    maintain  = 2
    write     = 4
    admin     = 5
  }
}

resource "github_repository" "this" {
  allow_auto_merge            = var.allow_auto_merge
  allow_merge_commit          = var.allow_merge_commit
  allow_rebase_merge          = var.allow_rebase_merge
  allow_squash_merge          = var.allow_squash_merge
  allow_update_branch         = var.allow_update_branch
  archived                    = var.archived
  auto_init                   = var.auto_init
  delete_branch_on_merge      = var.delete_branch_on_merge
  description                 = var.description
  has_discussions             = var.has_discussions
  has_downloads               = var.has_downloads
  has_issues                  = var.has_issues
  has_projects                = var.has_projects
  has_wiki                    = var.has_wiki
  is_template                 = var.is_template
  merge_commit_message        = var.allow_merge_commit ? "PR_BODY" : null
  merge_commit_title          = var.allow_merge_commit ? "PR_TITLE" : null
  name                        = var.name
  squash_merge_commit_message = var.allow_squash_merge ? "COMMIT_MESSAGES" : null
  squash_merge_commit_title   = var.allow_squash_merge ? "PR_TITLE" : null
  topics                      = var.topics
  visibility                  = var.visibility
  vulnerability_alerts        = var.vulnerability_alerts
  web_commit_signoff_required = var.web_commit_signoff_required
}

resource "github_repository_ruleset" "this" {
  count       = var.enable_default_ruleset ? 1 : 0
  enforcement = "active"
  name        = var.default_branch_name
  repository  = github_repository.this.name
  target      = "branch"

  bypass_actors {
    actor_id    = local.github_repository_role.admin
    actor_type  = "RepositoryRole"
    bypass_mode = "always"
  }

  conditions {
    ref_name {
      exclude = []
      include = [
        "~DEFAULT_BRANCH",
      ]
    }
  }

  # Available rules for rulesets:
  # https://docs.github.com/en/repositories/configuring-branches-and-merges-in-your-repository/managing-rulesets/available-rules-for-rulesets
  rules {
    creation                      = var.rules_creation
    deletion                      = var.rules_deletion
    non_fast_forward              = var.rules_non_fast_forward
    required_linear_history       = var.rules_required_linear_history
    required_signatures           = var.rules_required_signatures
    update                        = var.rules_update
    update_allows_fetch_and_merge = var.rules_update_allows_fetch_and_merge

    pull_request {
      dismiss_stale_reviews_on_push     = var.pr_dismiss_stale_reviews_on_push
      require_code_owner_review         = var.pr_require_code_owner_review
      require_last_push_approval        = var.pr_require_last_push_approval
      required_approving_review_count   = var.pr_required_approving_review_count
      required_review_thread_resolution = var.pr_required_review_thread_resolution
    }
  }
}

resource "github_repository_autolink_reference" "this" {
  count               = var.autolink_reference_prefix != "" && var.autolink_reference_url_template != "" ? 1 : 0
  repository          = github_repository.this.name
  key_prefix          = var.autolink_reference_prefix
  target_url_template = var.autolink_reference_url_template
}
