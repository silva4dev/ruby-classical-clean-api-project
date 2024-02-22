# frozen_string_literal: true

module Main
  module Middlewares
    module Sinatra
      class ContentTypeMiddleware
        def initialize(app)
          @app = app
        end

        def call(env)
          request = ::Rack::Request.new(env)
          status, headers, body = @app.call(env)
          if request.content_type != 'application/json'
            response_body = {
              status_code: 415,
              body: 'Unsupported Media Type. Use Content-Type: application/json'
            }.to_json
            response = ::Rack::Response.new(response_body, 415, { 'Content-Type' => 'application/json' })
            return response.finish
          end
          headers['Content-Type'] = 'application/json'
          [status, headers, body]
        end
      end
    end
  end
end
