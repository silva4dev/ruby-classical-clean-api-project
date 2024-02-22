# frozen_string_literal: true

# \ -p 3333 -o 0

require_relative 'src/main/config/sinatra/server'

run Main::Config::SinatraServer::ServerSetup
