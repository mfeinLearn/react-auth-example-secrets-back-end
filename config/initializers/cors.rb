# Be sure to restart your server when you modify this file.

# Avoid CORS issues when API is called from the frontend app.
# Handle Cross-Origin Resource Sharing (CORS) in order to accept cross-origin AJAX requests.

# Read more: https://github.com/cyu/rack-cors

Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins 'localhost:3000'


    resource '*',
      headers: :any, # what kind of resources and headers and what kind of request we are going to allow within this application
      methods: [:get, :post, :put, :patch, :delete, :options, :head],
      credentials: true # include sessions and cookies with our request as long they are coming from autherize domains
      ## in this case - localhost:3000
      ## If it is not an autherize domain we are not going to allow the request
  end
end
