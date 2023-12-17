# frozen_string_literal: true

module Main
  module Middlewares
    class BodyParserMiddleware
      def initialize(app)
        @app = app
      end

      def call(env)
        status, headers, body = @app.call(env)
        headers['Content-Type'] = 'application/json'
        [status, headers, body]
      end
    end
  end
end
