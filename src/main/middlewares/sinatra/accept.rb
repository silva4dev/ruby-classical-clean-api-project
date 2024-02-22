# frozen_string_literal: true

module Main
  module Middlewares
    module Sinatra
      class AcceptMiddleware
        def initialize(app)
          @app = app
        end

        def call(env)
          request = ::Rack::Request.new(env)
          status, headers, body = @app.call(env)
          if request.env['HTTP_ACCEPT'] != 'application/json'
            response_body = {
              status_code: 406,
              body: 'Not Acceptable. Use Accept: application/json'
            }.to_json
            response = ::Rack::Response.new(response_body, 406, { 'Content-Type' => 'application/json' })
            return response.finish
          end
          [status, headers, body]
        end
      end
    end
  end
end
