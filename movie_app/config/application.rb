require_relative "boot"

require "rails/all"

Bundler.require(*Rails.groups)

# code to allow the backend to communicate with the frontend with the loaclhost:3000
module MovieApp
  class Application < Rails::Application
    config.load_defaults 7.2

    config.api_only = false

    config.middleware.insert_before 0, Rack::Cors do
      allow do
        origins "http://localhost:3000"
        resource "*", headers: :any, methods: [ :get, :post, :put, :patch, :delete, :options, :head ]
      end
    end
  end
end
