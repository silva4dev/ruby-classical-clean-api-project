# frozen_string_literal: true

class InvalidParamError < StandardError
  def initialize(param_name)
    super("Invalid param: #{param_name}")
    @name = 'InvalidParamError'
  end
end
