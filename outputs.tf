output "repository_name" {
  description = "Repository name"
  value       = github_repository.repository.name
}

output "repository_url" {
  description = "Repository URL"
  value       = github_repository.repository.html_url
}

output "repository_id" {
  description = "Repository ID"
  value       = github_repository.repository.id
}
