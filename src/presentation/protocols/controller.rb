# frozen_string_literal: true

module Presentation
  module Protocols
    module Controller
      def handle(http_request)
        raise NotImplementedError
      end
    end
  end
end
