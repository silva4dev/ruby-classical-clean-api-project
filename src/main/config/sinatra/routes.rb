# frozen_string_literal: true

require 'sinatra/base'
require 'sinatra/namespace'
require_relative '../../routes/sinatra/signup_routes'
require_relative '../../config/sinatra/middlewares'

module Main
  module Config
    module SinatraRoutes
      class RoutesSetup < Sinatra::Base
        register Sinatra::Namespace
        use Main::Config::SinatraMiddlewares::MiddlewaresSetup

        namespace '/api' do
          register Main::Routes::Sinatra::SignupRoutes
        end
      end
    end
  end
end
