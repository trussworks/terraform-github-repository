resource "github_repository" "repository" {
  for_each = { for repo in var.repositories : repo.name => repo }

  allow_auto_merge            = each.value.allow_auto_merge
  allow_merge_commit          = each.value.allow_merge_commit
  allow_rebase_merge          = each.value.allow_rebase_merge
  allow_squash_merge          = each.value.allow_squash_merge
  allow_update_branch         = each.value.allow_update_branch
  archived                    = each.value.archived
  auto_init                   = each.value.auto_init
  delete_branch_on_merge      = each.value.delete_branch_on_merge
  description                 = each.value.repo_description
  has_discussions             = each.value.has_discussions
  has_downloads               = each.value.has_downloads
  has_issues                  = each.value.has_issues
  has_projects                = each.value.has_projects
  has_wiki                    = each.value.has_wiki
  is_template                 = each.value.is_template
  merge_commit_message        = "PR_BODY"
  merge_commit_title          = "PR_TITLE"
  name                        = each.value.name
  squash_merge_commit_message = "COMMIT_MESSAGES"
  squash_merge_commit_title   = "PR_TITLE"
  topics                      = []
  visibility                  = each.value.repo_visibility
  vulnerability_alerts        = each.value.vulnerability_alerts
  web_commit_signoff_required = each.value.web_commit_signoff_required
}

resource "github_repository_ruleset" "ruleset" {
  for_each    = { for repo in var.repositories : repo.name => repo }
  enforcement = "active"
  name        = var.default_branch_name
  repository  = github_repository.repository[each.key].name
  target      = "branch"

  # https://registry.terraform.io/providers/integrations/github/latest/docs/resources/repository_ruleset#bypass_actors
  # Org Admin = 1, maintain = 2, write = 4, admin = 5
  bypass_actors {
    actor_id    = 5
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

  rules {
    creation                      = false
    deletion                      = true
    non_fast_forward              = true
    required_linear_history       = true
    required_signatures           = true
    update                        = false
    update_allows_fetch_and_merge = false

    pull_request {
      dismiss_stale_reviews_on_push     = true
      require_code_owner_review         = false
      require_last_push_approval        = false
      required_approving_review_count   = 0
      required_review_thread_resolution = false
    }
  }
}
