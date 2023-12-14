# frozen_string_literal: true

require_relative "./config/routes"

module Main
  class Server < Config::Routes
    configure do
      set :bind, "0.0.0.0"
      set :port, 3333
    end
  end
end

Main::Server.run! if $PROGRAM_NAME == __FILE__
