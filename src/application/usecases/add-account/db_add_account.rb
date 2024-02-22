# frozen_string_literal: true

require_relative '../../../domain/usecases/add_account'

module Application
  module UseCases
    module AddAccount
      class DbAddAccount
        include Domain::UseCases::AddAccount

        def initialize(account_repository)
          @account_repository = account_repository
        end

        def add(account)
          'Add method not implemented yet'
        end
      end
    end
  end
end
