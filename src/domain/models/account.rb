# frozen_string_literal: true

module Domain
  module Models
    class AccountModel
      attr_reader :id, :name, :email, :password

      def initialize(name, email, password)
        @name = name
        @email = email
        @password = password
      end
    end
  end
end
