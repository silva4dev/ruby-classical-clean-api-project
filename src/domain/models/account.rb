# frozen_string_literal: true

module Domain
  module Models
    class AccountModel
      attr_reader :id, :name, :email, :password
    end

    def initialize
      @name = name
      @email = email
      @password = password
    end
  end
end
