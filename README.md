# Terraform GitHub Repository

Creates a GitHub repository.

This module is very opinionated and possibly not suitable for other use cases.

It creates one or more GitHub repositories with a ruleset protecting the main branch.

## Usage

```hcl
module "repositories" {
  source = "terraform-github-repository"

  repositories = [
    {
      name = "test"
    },
    {
      name = "test2"
      repo_visibility = "public"
    }
  ]
}

```

<!-- BEGIN_TF_DOCS -->
***

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| repo_name | Name of repository. | `string` | n/a | yes |
| allow_auto_merge | value | `bool` | `false` | no |
| allow_merge_commit | value | `bool` | `false` | no |
| allow_rebase_merge | value | `bool` | `false` | no |
| allow_squash_merge | value | `bool` | `true` | no |
| allow_update_branch | value | `bool` | `true` | no |
| archived | value | `bool` | `false` | no |
| auto_init | value | `bool` | `false` | no |
| default_branch_name | Name of default branch. | `string` | `"main"` | no |
| delete_branch_on_merge | value | `bool` | `true` | no |
| has_discussions | value | `bool` | `false` | no |
| has_downloads | value | `bool` | `false` | no |
| has_issues | value | `bool` | `true` | no |
| has_projects | value | `bool` | `false` | no |
| has_wiki | value | `bool` | `false` | no |
| is_template | value | `bool` | `false` | no |
| repo_description | Description of the repository. Displayed in right-hand column on repo home page. | `string` | `""` | no |
| repo_visibility | Whether repo should be `public` or `private`. | `string` | `"private"` | no |
| vulnerability_alerts | value | `bool` | `true` | no |
| web_commit_signoff_required | value | `bool` | `false` | no |

## Outputs

| Name | Description |
|------|-------------|
| kms_key_arn | The ARN for the CMK KMS key used for CloudWatch encryption. |
| log_group_arns | The ARN for each Log Group |

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
| [github_branch.this](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/branch) | resource |
| [github_branch_default.this](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/branch_default) | resource |
| [github_repository.this](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/repository) | resource |
| [github_repository_ruleset.this](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/repository_ruleset) | resource |

***
<!-- END_TF_DOCS -->

### Developer Setup

- [Pre-Commit](https://pre-commit.com/)
- [TFenv](https://github.com/tfutils/tfenv)
- [Terraform-Docs](https://terraform-docs.io/)
- [TFLint](https://github.com/terraform-linters/tflint)
- [Trivy](https://trivy.dev/)

Install dependencies (macOS)

```shell
brew install pre-commit tfenv terraform-docs tflint trivy
tfenv install
pre-commit install --install-hooks
```
