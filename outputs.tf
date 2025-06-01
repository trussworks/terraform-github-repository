output "repository_name" {
  description = "The name of the repository or repositories"
  value       = { for repo in github_repository : github_repository[*].name => github_repository.name }
}
