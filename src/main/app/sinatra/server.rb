# frozen_string_literal: true

require_relative "../../config/sinatra/routes"

module Main
  module App
    module Sinatra
      class Server < Config::Routes
        configure do
          set :bind, "0.0.0.0"
          set :port, 3333
        end

        run! if $PROGRAM_NAME == __FILE__
      end
    end
  end
end
