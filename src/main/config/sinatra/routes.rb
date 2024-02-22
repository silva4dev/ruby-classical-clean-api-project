# frozen_string_literal: true

require_relative '../../routes/sinatra/signup_routes'
require 'sinatra/base'

module Main
  module Config
    class Routes < Sinatra::Base
      use Main::Routes::Sinatra::SignupRoutes
    end
  end
end
