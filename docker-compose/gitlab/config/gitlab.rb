external_url 'http://gitlab.example.com'
gitlab_rails['gitlab_shell_ssh_port'] = 2222
letsencrypt['enable'] = false
nginx['listen_port'] = 80
nginx['listen_https'] = false

postgresql['shared_buffers'] = "256MB"
postgresql['max_worker_processes'] = 2
puma['worker_timeout'] = 120
puma['worker_processes'] = 7
sidekiq['concurrency'] = 15

registry_external_url 'http://registry.example.com:5050'
gitlab_rails['registry_enabled'] = true

gitlab_rails['terraform_state_enabled'] = true

prometheus_monitoring['enable'] = false



