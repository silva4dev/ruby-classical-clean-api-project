# frozen_string_literal: true

require "sinatra"

module Main
  module Config
    class Middlewares < Sinatra::Base
      before do
        request.body.rewind
        content_type "application/json"
      end

      def request_hash
        {
          query_params: request.params,
          body: (request.body && JSON.parse(request.body.read, symbolize_names: true)) || {}
        }
      rescue JSON::ParserError
        {}
      end
    end
  end
end
