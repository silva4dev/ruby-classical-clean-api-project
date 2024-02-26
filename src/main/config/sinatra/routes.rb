# frozen_string_literal: true

require 'sinatra/base'
require 'sinatra/namespace'
require_relative '../../routes/sinatra/signup_routes'
require_relative '../../config/sinatra/middlewares'

class RoutesSetup < Sinatra::Base
  register Sinatra::Namespace
  use MiddlewaresSetup

  namespace '/api' do
    register SignupRoutes
  end
end
