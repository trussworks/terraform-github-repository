output "repository_name" {
  description = "Map of repository names"
  value       = { for key, repo in github_repository.repository : key => repo.name }
}

output "repository_urls" {
  description = "Map of repository URLs"
  value       = { for key, repo in github_repository.repository : key => repo.html_url }
}

output "repository_ids" {
  description = "Map of repository IDs"
  value       = { for key, repo in github_repository.repository : key => repo.id }
}
