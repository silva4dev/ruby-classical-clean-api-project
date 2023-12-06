# frozen_string_literal: true

module Web
  module Protocols
    module Controller
      def call(http_request)
        raise NotImplementedError
      end
    end
  end
end
