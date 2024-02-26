# frozen_string_literal: true

require_relative '../../../domain/usecases/add_account'

class DbAddAccount
  include AddAccount

  def initialize(account_repository)
    @account_repository = account_repository
  end

  def add(account)
    'Add method not implemented yet'
  end
end
