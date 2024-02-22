# frozen_string_literal: true

require_relative '../helpers/mongo_helper'
require_relative '../../../../application/protocols/db/account/account_repository'

module Infrastructure
  module Db
    module MongoDb
      module Account
        class AccountMongoRepository
          include Helpers, Application::Protocols::Db::Account::AccountRepository

          def add(account_data)
            account_collection = MongoHelper.get_collection('accounts')
            result = account_collection.insert_one(account_data)
            MongoHelper.map(account_collection.find(_id: result.inserted_id).first)
          end
        end
      end
    end
  end
end
