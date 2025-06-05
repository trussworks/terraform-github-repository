# Terraform GitHub Repository

Creates a GitHub repository with strong, opinionated branch protection for the default branch.

By default, this module:

- Blocks force pushes and branch deletions
- Requires a linear commit history and signed commits
- Optionally enforces pull request reviews (see variables)

If your use case requires custom or no branch protection, set `enable_default_ruleset = false` and use the [`github_repository_ruleset`](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/repository_ruleset) resource directly in your configuration.

## Usage

```hcl
module "repository" {
  source = "terraform-github-repository"
  name   = "example-repo"

  pr_require_code_owner_review       = true
  pr_required_approving_review_count = 1
}
```

**Note:** If you set `pr_require_code_owner_review = true`, you must add a `CODEOWNERS` file to your repository or PR merges will be blocked.

<!-- BEGIN_TF_DOCS -->
***

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| name | Name of the repository. | `string` | n/a | yes |
| allow_auto_merge | Whether auto-merge is allowed. | `bool` | `false` | no |
| allow_merge_commit | Whether merge commits are allowed. | `bool` | `false` | no |
| allow_rebase_merge | Whether rebase merges are allowed. | `bool` | `false` | no |
| allow_squash_merge | Whether squash merges are allowed. | `bool` | `true` | no |
| allow_update_branch | Whether branches can be updated automatically. | `bool` | `true` | no |
| archived | Whether the repository is archived. | `bool` | `false` | no |
| auto_init | Whether an initial commit is automatically produced in the repository. | `bool` | `false` | no |
| autolink_reference_prefix | This prefix appended by a number generates a link any time it is found in an issue, PR, or commit. Required if `autolink_reference_url_template` is set. | `string` | `""` | no |
| autolink_reference_url_template | The target URL template for the autolink reference. Use `<num>` as a placeholder for the number. Required if `autolink_reference_prefix` is set. | `string` | `""` | no |
| default_branch_name | Name of the default branch. | `string` | `"main"` | no |
| delete_branch_on_merge | Whether to delete branch on merge. | `bool` | `true` | no |
| description | Description of the repository. | `string` | `""` | no |
| enable_default_ruleset | Whether to create a secure default branch protection ruleset. | `bool` | `true` | no |
| has_discussions | Whether the repository has discussions enabled. | `bool` | `false` | no |
| has_downloads | Whether the repository has downloads enabled. | `bool` | `false` | no |
| has_issues | Whether the repository has issues enabled. | `bool` | `true` | no |
| has_projects | Whether the repository has projects enabled. | `bool` | `false` | no |
| has_wiki | Whether the repository has wiki enabled. | `bool` | `false` | no |
| is_template | Whether the repository is a template. | `bool` | `false` | no |
| pr_dismiss_stale_reviews_on_push | Whether to dismiss stale reviews on a PR when new commits are pushed. | `bool` | `true` | no |
| pr_require_code_owner_review | Whether to require code owner review on a PR before merging. | `bool` | `false` | no |
| pr_require_last_push_approval | Whether the most recent pusher to a PR must approve the PR. | `bool` | `false` | no |
| pr_required_approving_review_count | Number of required PR approving reviews. | `number` | `0` | no |
| pr_required_review_thread_resolution | Whether to require all review threads on a PR to be resolved before merging. | `bool` | `false` | no |
| rules_creation | If true, only allows users with bypass permission to create matching refs. | `bool` | `false` | no |
| rules_deletion | If true, only allows users with bypass permissions to delete matching refs. | `bool` | `true` | no |
| rules_non_fast_forward | If true, prevents users with push access from force pushing to branches. | `bool` | `true` | no |
| rules_required_linear_history | If true, prevents merge commits from being pushed to matching branches. In other words, any PRs merged into the branch must use a squash merge or a rebase merge. | `bool` | `true` | no |
| rules_required_signatures | If true, commits pushed to matching branches must have verified signatures. | `bool` | `true` | no |
| rules_update | If true, only allows users with bypass permission to update matching refs. | `bool` | `false` | no |
| rules_update_allows_fetch_and_merge | If true, the branch can pull changes from its upstream repository. This is only applicable to forked repositories. Requires `update` to be set to true. | `bool` | `false` | no |
| topics | A list of topics for the repository. | `list(string)` | `[]` | no |
| visibility | Repository visibility: private, public, or internal. | `string` | `"private"` | no |
| vulnerability_alerts | Whether to enable vulnerability alerts. | `bool` | `true` | no |
| web_commit_signoff_required | Whether contributor signoff is required on web commits. | `bool` | `false` | no |

## Outputs

| Name | Description |
|------|-------------|
| repository_id | Repository ID |
| repository_name | Repository name |
| repository_url | Repository URL |

## Providers

| Name | Version |
|------|---------|
| github | ~>6.6.0 |

## Requirements

| Name | Version |
|------|---------|
| terraform |  ~> 1.0 |
| github | ~>6.6.0 |

## Resources

| Name | Type |
|------|------|
| [github_repository.this](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/repository) | resource |
| [github_repository_autolink_reference.this](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/repository_autolink_reference) | resource |
| [github_repository_ruleset.this](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/repository_ruleset) | resource |

***
<!-- END_TF_DOCS -->

## Developer Setup

- [Pre-Commit](https://pre-commit.com/)
- [TFenv](https://github.com/tfutils/tfenv)
- [Terraform-Docs](https://terraform-docs.io/)
- [TFLint](https://github.com/terraform-linters/tflint)
- [Trivy](https://trivy.dev/)

### Install Dependencies

```shell
brew install pre-commit tfenv terraform-docs tflint trivy
tfenv install
pre-commit install --install-hooks
```
