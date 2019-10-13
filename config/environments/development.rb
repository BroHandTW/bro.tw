Rails.application.configure do
  # Settings specified here will take precedence over those in config/application.rb.

  config.action_cable.url = 'ws://localhost:3000/cable'
  config.action_cable.disable_request_forgery_protection = true

  # In the development environment your application's code is reloaded on
  # every request. This slows down response time but is perfect for development
  # since you don't have to restart the web server when you make code changes.
  config.cache_classes = false

  # Do not eager load code on boot.
  config.eager_load = false

  # Show full error reports.
  config.consider_all_requests_local = true

  config.cache_store = :redis_cache_store, { url: 'redis://127.0.0.1:6379/1', expires_in: 3600 }
  # config.cache_store = :redis_cache_store,
  #       namespace: 'myapp-cache', compress: true,
  #       redis: -> { Redis.new … }

  # Store uploaded files on the local file system (see config/storage.yml for options)
  config.active_storage.service = :local

  # Print deprecation notices to the Rails logger.
  config.active_support.deprecation = :log

  # Raise an error on page load if there are pending migrations.
  config.active_record.migration_error = :page_load

  # Highlight code that triggered database queries in logs.
  config.active_record.verbose_query_logs = true

  # Raises error for missing translations
  config.action_view.raise_on_missing_translations = true

  # Use an evented file watcher to asynchronously detect changes in source code,
  # routes, locales, etc. This feature depends on the listen gem.
  config.file_watcher = ActiveSupport::EventedFileUpdateChecker
end
