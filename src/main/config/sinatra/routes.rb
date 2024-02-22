# frozen_string_literal: true

require 'sinatra/base'
require_relative '../../routes/sinatra/signup_routes'

module Main
  module Config
    module SinatraRoutes
      class Routes < Sinatra::Base
        use Main::Routes::Sinatra::SignupRoutes
      end
    end
  end
end
