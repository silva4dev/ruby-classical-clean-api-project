# frozen_string_literal: true

require_relative '../protocols/http'
require_relative '../errors/server_error'

module Presentation
  module Helpers
    class HttpHelper
      include Protocols::HttpResponse

      def self.bad_request(error)
        { status_code: 400, body: error }
      end

      def self.server_error
        { status_code: 500, body: Errors::ServerError.new }
      end

      def self.ok(data)
        { status_code: 200, body: data }
      end
    end
  end
end
