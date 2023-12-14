# frozen_string_literal: true

require "sinatra/base"

module Main
  module Config
    class Middlewares < Sinatra::Base
      before do
        request.body.rewind
        content_type "application/json"
      end

      def to_hash(request)
        {
          query_params: (request.params && JSON.parse(request.params, symbolize_names: true)) || {},
          body: (request.body && JSON.parse(request.body.read, symbolize_names: true)) || {}
        }
      rescue JSON::ParserError
        {}
      end
    end
  end
end
