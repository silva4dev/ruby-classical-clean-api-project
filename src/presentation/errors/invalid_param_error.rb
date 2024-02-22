# frozen_string_literal: true

module Presentation
  module Errors
    class InvalidParamError < StandardError
      def initialize(param_name)
        super("Invalid param: #{param_name}")
        @name = 'InvalidParamError'
      end
    end
  end
end
