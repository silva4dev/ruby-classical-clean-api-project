# frozen_string_literal: true

require "sinatra/base"
require_relative "../routes/signup_routes"

module Main
  module Config
    class Routes < Sinatra::Base
      use Main::Routes::SignupRoutes
    end
  end
end
