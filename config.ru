# frozen_string_literal: true

#\ -p 3333 -o 0

require_relative "./src/main/app/sinatra/server"

run Main::App::Sinatra::Server
