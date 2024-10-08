# frozen_string_literal: true

class EmailValidator
  def is_valid?(email)
    regex = /\A[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Z|a-z]{2,}\z/
    !!(email =~ regex)
  end
end
