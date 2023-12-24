# frozen_string_literal: true

module Main
  module Middlewares
    module Sinatra
      class BodyParserMiddleware
        def initialize(app)
          @app = app
        end

        def call(env)
          dup._call(env)
        end

        def _call(env)
          request = ::Rack::Request.new(env)
          if request.content_type == "application/json"
            body = JSON.parse(request.body.read, symbolize_names: true)
            env["rack.request.form_hash"] = body
            request.body.rewind
          end
          status, headers, body = @app.call(env)
          [status, headers, body]
        end
      end
    end
  end
end
