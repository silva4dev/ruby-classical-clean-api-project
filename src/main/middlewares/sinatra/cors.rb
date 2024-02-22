# frozen_string_literal: true

module Main
  module Middlewares
    module Sinatra
      class CorsMiddleware
        def initialize(app)
          @app = app
        end

        def call(env)
          status, headers, body = @app.call(env)
          headers['access-control-allow-origin'] = '*'
          headers['access-control-allow-headers'] = '*'
          headers['access-control-allow-methods'] = '*'
          [status, headers, body]
        end
      end
    end
  end
end
