# Be sure to restart your server when you modify this file.

# Avoid CORS issues when API is called from the frontend app.
# Handle Cross-Origin Resource Sharing (CORS) in order to accept cross-origin AJAX requests.

# Read more: https://github.com/cyu/rack-cors

# Now this will allow us to send request
Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do # who we are going to allow request from
    origins '*' # example.com should be replaced with your domain
    # we can us * or catch all which means catch every request of anytype with
    ##.. any headers from anyone and we will process it


    resource '*',
      headers: :any, # what kind of resources and headers and what kind of request we are going to allow within this application
      methods: [:get, :post, :put, :patch, :delete, :options, :head]
  end
end
