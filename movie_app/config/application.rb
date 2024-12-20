require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module MovieApp
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 7.2

    # Enable full middleware stack for HTML views
    config.api_only = false

    # Insert CORS middleware to allow requests from React frontend
    config.middleware.insert_before 0, Rack::Cors do
      allow do
        origins "http://localhost:3000"
        resource "*",
                 headers: :any,
                 methods: [ :get, :post, :put, :patch, :delete, :options, :head ]
      end
    end

    # Other configurations (if needed) go here
  end
end
