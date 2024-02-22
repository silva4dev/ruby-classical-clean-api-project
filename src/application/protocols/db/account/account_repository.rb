# frozen_string_literal: true

module Application
  module Protocols
    module Db
      module Account
        module AccountRepository
          def add(account)
            raise NotImplementedError
          end
        end
      end
    end
  end
end
