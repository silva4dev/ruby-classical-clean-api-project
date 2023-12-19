# frozen_string_literal: true

module Utils
  class EmailValidatorAdapter
    def is_valid?(email)
      regex = /\A[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Z|a-z]{2,}\z/
      return !!(email =~ regex)
    end
  end
end
