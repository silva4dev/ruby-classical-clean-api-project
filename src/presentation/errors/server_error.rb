# frozen_string_literal: true

module Presentation
  module Errors
    class ServerError < StandardError
      def initialize()
        super("Internal server error")
        @name = 'ServerError'
      end
    end
  end
end
