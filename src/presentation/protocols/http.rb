# frozen_string_literal: true

module Presentation
  module Protocols
    module HttpResponse
      def self.included(base)
        base.extend ClassMethods
      end

      module ClassMethods
        def bad_request(error)
          raise NotImplementedError
        end

        def server_error
          raise NotImplementedError
        end

        def ok(data)
          raise NotImplementedError
        end
      end
    end
  end
end
