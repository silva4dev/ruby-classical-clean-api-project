# frozen_string_literal: true

require "json"

module Main
  module Adapters
    module Sinatra
      class SinatraRouteAdapter
        def self.adapt(controller)
          lambda do |request, response|
            http_request = {
              body: (body = request.body.read; body.empty? ? {} : JSON.parse(body, symbolize_names: true)),
              params: request.params,
              query: request.params,
              headers: request.env,
              response: response,
            }
            http_response = controller.handle(http_request)
            response.status = http_response[:status_code]
            response.body = http_response.to_json
            return response
          end
        end
      end
    end
  end
end
