# frozen_string_literal: true

require "json"

def adapt_route(controller)
  lambda do |request, response|
    http_request = {
      body: (request.body && JSON.parse(request.body.read, symbolize_names: true)) || {},
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
