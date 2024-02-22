# frozen_string_literal: true

module Presentation
  module Errors
    class MissingParamError < StandardError
      def initialize(param_name)
        super("Missing param: #{param_name}")
        @name = 'MissingParamError'
      end
    end
  end
end
